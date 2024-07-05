import * as fs from "fs";
import * as lodash from "lodash";
import * as Mustache from 'mustache';
import { TabelaService } from '../../service/tabela.service';
import { CamposModel } from '../../model/campos.model';
import { ComentarioDerJsonModel } from '../../model/comentario.der.json.model';
import { DelphiModel } from './delphi.model';
import { DelphiController } from './delphi.controller';
import { DelphiService } from "./delphi.service";
import { DelphiWebModule } from "./delphi.webmodule";
import { GeradorBase } from "../../gerador/gerador.base";

export class GeradorDelphi extends GeradorBase {

    tabela: string;
    tabelaAgregada: string;
    dataPacket: CamposModel[];
    relacionamentos: ComentarioDerJsonModel[];
    listaTabelas = [];

    caminhoFontes = 'c:/t2ti/gerador.codigo/fontes/delphi/';
    arquivoTemplateModel = 'c:/t2ti/gerador.codigo/templates/delphi/Delphi.Model.mustache';
    arquivoTemplateController = 'c:/t2ti/gerador.codigo/templates/delphi/Delphi.Controller.mustache';
    arquivoTemplateService = 'c:/t2ti/gerador.codigo/templates/delphi/Delphi.Service.mustache';
    arquivoTemplateWebModule = 'c:/t2ti/gerador.codigo/templates/delphi/Delphi.WebModule.mustache';

    constructor() {
        super();
        this.relacionamentos = new Array;
    }

    async gerarArquivos(tabela: string, result: (retorno: any, erro: any) => void) {

        // nome da tabela
        this.tabela = tabela.toUpperCase();

        // criar diretórios
        let retorno = await super.criarDiretorio(this.caminhoFontes + this.tabela);
        if (retorno != true) {
            return result(null, retorno);
        }
        retorno = await super.criarDiretorio(this.caminhoFontes + '_CONTROLLER');
        if (retorno != true) {
            return result(null, retorno);
        }
        retorno = await super.criarDiretorio(this.caminhoFontes + '_SERVICE');
        if (retorno != true) {
            return result(null, retorno);
        }
        retorno = await super.criarDiretorio(this.caminhoFontes + '_MODEL');
        if (retorno != true) {
            return result(null, retorno);
        }

        // procura pelas tabelas agregadas para criar os relacionamentos de primeiro nível
        retorno = await this.gerarAgregadosPrimeiroNivel();
        if (retorno != true) {
            return result(null, retorno);
        }

        // gera os arquivos para a tabela principal
        retorno = await this.gerarArquivosTabelaPrincipal();
        if (retorno != true) {
            return result(null, retorno);
        }

        // retorna mensagem OK
        result({ mensagem: "Arquivos gerados com sucesso!" }, null);
    }

    /**
     * Encontra todas as tabelas agregadas a partir da chave estrangeira e gera os arquivos de modelo
     * Não procuraremos por tabelas de segundo nível, apenas as de primeiro nível vinculadas diretamente
     * à tabela principal que foi enviada pelo usuário
     */
    async gerarAgregadosPrimeiroNivel() {
        try {
            let lista = await TabelaService.consultarAgregados(this.tabela);
            for (let index = 0; index < lista.length; index++) {
                this.tabelaAgregada = lista[index].TABLE_NAME;

                // pega os campos para a tabela                
                let retorno = await this.pegarCampos(this.tabelaAgregada);
                if (retorno != true) {
                    return retorno;
                }

                // gera o Model
                await this.gerarModel(this.tabelaAgregada);
            }
            return true;
        } catch (erro) {
            return erro;
        }
    }

    /**
     * Gera arquivos para a tabela principal
     */
    async gerarArquivosTabelaPrincipal() {
        try {
            // pega os campos para a tabela
            let retorno = await this.pegarCampos(this.tabela);
            if (retorno != true) {
                return retorno;
            }
            // gera o Model
            await this.gerarModel(this.tabela);
            // gera o Controller
            await this.gerarController();
            // gera o Service
            await this.gerarService();

            return true;
        } catch (erro) {
            return erro;
        }
    }

    /**
     * Pega as colunas de determinada tabela e atribui ao datapacket (variável de classe)
     */
    async pegarCampos(tabela: string) {
        try {
            let lista = await TabelaService.pegarCampos(tabela);
            this.dataPacket = lista;

            // verifica se a tabela que está sendo utilizada neste momento é diferente da tabela principal
            // aqui geramos apenas os relacionamentos agregados onde a FK se encontra em uma outra tabela diferente da principal
            if (tabela != this.tabela) {
                // monta o nome do campo: Ex: ID_PESSOA
                let nomeCampoFK = 'ID_' + this.tabela.toUpperCase();

                // verifica se o campo FK contem algum comentário para inserir como relacionamento
                for (let i = 0; i < lista.length; i++) {
                    if (lista[i].Field == nomeCampoFK && lista[i].Comment != '') {
                        let objeto = new ComentarioDerJsonModel(tabela, lista[i].Comment);
                        // vamos inserir apenas os relacionamentos cujo Side não seja 'Local', pois esses serão encontrados e tratados no Model
                        if (objeto.side != 'Local') {
                            this.relacionamentos.push(objeto);
                        }
                    }
                }
            }

            return true;
        } catch (erro) {
            return erro;
        }

    }

    /**
     * Gera o Model - serve para a tabela principal e também para as tabelas agregadas
     */
    async gerarModel(tabela: string) {
        // só passa os relacionamentos se for a tabela principal
        if (tabela != this.tabela) {
            var modelJson = new DelphiModel(tabela, this.dataPacket, null);
        } else {
            var modelJson = new DelphiModel(tabela, this.dataPacket, this.relacionamentos);
        }
        let modelTemplate = fs.readFileSync(this.arquivoTemplateModel).toString();
        let modelGerado = Mustache.render(modelTemplate, modelJson);

        let nomeArquivo = lodash.camelCase(tabela);
        nomeArquivo = lodash.upperFirst(nomeArquivo);

        let retorno = super.gravarArquivo(this.caminhoFontes + '_MODEL/' + nomeArquivo + '.pas', modelGerado);
        retorno = super.gravarArquivo(this.caminhoFontes + this.tabela + '/' + nomeArquivo + '.pas', modelGerado);
        return retorno;
    }

    /**
     * Gera o Controller para a tabela principal
     */
    async gerarController() {
        let modelJson = new DelphiController(this.tabela);
        let modelTemplate = fs.readFileSync(this.arquivoTemplateController).toString();
        let modelGerado = Mustache.render(modelTemplate, modelJson);

        let nomeArquivo = lodash.camelCase(this.tabela) + 'Controller';
        nomeArquivo = lodash.upperFirst(nomeArquivo);

        let retorno = await super.gravarArquivo(this.caminhoFontes + '_CONTROLLER/' + nomeArquivo + '.pas', modelGerado);
        retorno = await super.gravarArquivo(this.caminhoFontes + this.tabela + '/' + nomeArquivo + '.pas', modelGerado);
        return retorno;
    }

    /**
     * Gera o Service para a tabela principal
     */
    async gerarService() {
        var modelJson = new DelphiService(this.tabela, this.dataPacket, this.relacionamentos);
        let modelTemplate = fs.readFileSync(this.arquivoTemplateService).toString();
        let modelGerado = Mustache.render(modelTemplate, modelJson);

        let nomeArquivo = lodash.camelCase(this.tabela) + 'Service';
        nomeArquivo = lodash.upperFirst(nomeArquivo);

        let retorno = await super.gravarArquivo(this.caminhoFontes + '_SERVICE/' + nomeArquivo + '.pas', modelGerado);
        retorno = await super.gravarArquivo(this.caminhoFontes + this.tabela + '/' + nomeArquivo + '.pas', modelGerado);
        return retorno;
    }

    /**
       * Gera arquivos a partir do nome das tabelas
       */
    async gerarArquivosLacoTabela(modulo: string, result: (retorno: any, erro: any) => void) {
        try {
            // pega a lista com o nome das tabelas
            let lista = await TabelaService.pegarTabelas();
            for (let index = 0; index < lista.length; index++) {
                this.listaTabelas.push(lista[index].nome);
            }

            // gera o arquivo com o conteúdo para todas e para os includes
            var modelJson = new DelphiWebModule(modulo, this.listaTabelas);
            let modelTemplate = fs.readFileSync(this.arquivoTemplateWebModule).toString();
            let modelGerado = Mustache.render(modelTemplate, modelJson);
            let nomeArquivo = "DelphiWebModule.txt";
            super.gravarArquivo(this.caminhoFontes + '/' + nomeArquivo, modelGerado);

            result({ mensagem: "Arquivos gerados com sucesso!" }, null);
        } catch (erro) {
            return result(null, erro);
        }

    }

}