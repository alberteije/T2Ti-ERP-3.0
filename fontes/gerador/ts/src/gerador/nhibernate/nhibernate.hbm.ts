import * as lodash from "lodash";
import { CamposModel } from '../../model/campos.model';
import { ComentarioDerJsonModel } from '../../model/comentario.der.json.model';

/// classe base que ajuda a gerar o model do CSharp usando o mustache
export class NHibernateHBM {

    table: string; // armazena o nome da tabela
    class: string; // armazena o nome da classe
    atribut = []; // armazena os Atributos da classe
    atributObj = []; // armazena os objetos - relacionamentos OneToOne
    atributList = []; // armazena as listas - relacionamentos OneToMany

    relacionamentosDetalhe: ComentarioDerJsonModel[]; // armazena relacionamentos de uma tabela Detalhe que serão encontrado aqui no Model

    constructor(tabela: string, dataPacket: CamposModel[], relacionamentos: ComentarioDerJsonModel[]) {
        // nome da classe
        this.class = lodash.camelCase(tabela);
        this.class = lodash.upperFirst(this.class);

        // nome da tabela
        this.table = tabela.toUpperCase();

        // atributos e gettersSetters
        for (let i = 0; i < dataPacket.length; i++) {
            // define o nome do campo
            let nomeCampo = dataPacket[i].Field;

            let nomeCampoTabela = nomeCampo.toUpperCase();
            let nomeCampoAtributo = lodash.camelCase(nomeCampo);
            let nomeCampoGetSet = lodash.upperFirst(nomeCampoAtributo);

            if (nomeCampoTabela.includes('ID_') && dataPacket[i].Comment != '') {
                let objeto = new ComentarioDerJsonModel('', dataPacket[i].Comment);
                objeto.tabela = lodash.replace(nomeCampoTabela, 'ID_', '');
                if (this.relacionamentosDetalhe == null) {
                    this.relacionamentosDetalhe = new Array;
                }
                this.relacionamentosDetalhe.push(objeto);
            } else {
                if (nomeCampoTabela != 'ID') {
                    this.atribut.push('<property name="' + nomeCampoGetSet + '" column="' + nomeCampoTabela + '" />');
                }
            }
        }

        // relacionamentos agregados ao Mestre
        if (relacionamentos != null) {
            this.tratarRelacionamentos(relacionamentos);
        }

        // relacionamentos agregados ao Detalhe
        if (this.relacionamentosDetalhe != null) {
            this.tratarRelacionamentos(this.relacionamentosDetalhe);
        }

    }

    tratarRelacionamentos(relacionamentos: ComentarioDerJsonModel[]) {
        for (let i = 0; i < relacionamentos.length; i++) {

            let relacionamento = relacionamentos[i];

            let nomeTabelaRelacionamento = relacionamento.tabela;
            let nomeCampoAtributo = lodash.camelCase(nomeTabelaRelacionamento);
            let nomeCampoGetSet = lodash.upperFirst(nomeCampoAtributo);
            let classeMestreGetSet = lodash.upperFirst(relacionamento.classeMestre);

            // verifica a cardinalidade para definir o nome do Field
            if (relacionamento.cardinalidade == '@OneToOne') {
                if (relacionamento.classeMestre == "") {//se for vazio, o relacionamento foi encontrado na classe de detalhe e deve ser mapeado como tal
                    if (relacionamento.side == 'Local') {
                        this.atributObj.push('<many-to-one name="' + nomeCampoGetSet + '" class="' + nomeCampoGetSet + '" column="ID_' + relacionamento.tabela + '" />');
                    } else {
                        this.atributObj.push('<many-to-one name="' + nomeCampoGetSet + '" class="' + nomeCampoGetSet + '" column="ID_' + relacionamento.tabela + '" unique="true" />');
                    }
                } else {
                    if (relacionamento.side == 'Local') {
                        this.atributObj.push('<one-to-one name="' + nomeCampoGetSet + '" class="' + nomeCampoGetSet + '" cascade="all"/>');
                    } else {
                        this.atributObj.push('<one-to-one name="' + nomeCampoGetSet + '" class="' + nomeCampoGetSet + '" property-ref="' + classeMestreGetSet + '" cascade="all"/>');
                    }
                }
            } else if (relacionamento.cardinalidade == '@OneToMany') {
                if (relacionamento.classeMestre == "") {//se for vazio, o relacionamento foi encontrado na classe de detalhe e deve ser mapeado como tal
                    this.atributList.push('<many-to-one name="' + nomeCampoGetSet + '" class="' + nomeCampoGetSet + '" column="ID_' + relacionamento.tabela + '" />');
                } else {
                    this.atributList.push('<bag name="Lista' + nomeCampoGetSet + '" table="' + nomeTabelaRelacionamento + '" cascade="all-delete-orphan" inverse="true">');
                    this.atributList.push('  <key column="ID_' + this.table + '"/>');
                    this.atributList.push('  <one-to-many class="' + nomeCampoGetSet + '"/>');
                    this.atributList.push('</bag>');    
                }
            }
        }
    }

}