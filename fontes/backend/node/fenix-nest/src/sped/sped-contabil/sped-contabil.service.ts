/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado ao Sped Contabil - ECD
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { getConnection } from 'typeorm';

import { Empresa } from '../../entities-export';
import { T2TiSpedContabil } from '../../lib/sped/t2ti-sped-contabil';

@Injectable()
export class SpedContabilService {

	constructor() { }

	dataInicial: Date;
	dataFinal: Date;
	versaoLeiaute: string;
	formaEscrituracao: string;
	spedT2Ti: T2TiSpedContabil;

	async gerarSpedContabil(filter: string) {
		let conteudoFiltro: any[] = filter.split('|');
        /*
		  0 - Periodo Inicial
		  1 - Periodo Final
		  2 - Forma de Escrituração
		  3 - Layout da Versão
        */
		this.dataInicial = conteudoFiltro[0];
		this.dataFinal = conteudoFiltro[1];
		this.formaEscrituracao = conteudoFiltro[2];
		this.versaoLeiaute = conteudoFiltro[3];

		this.spedT2Ti = new T2TiSpedContabil();

		await this.gerarBloco0();
		await this.gerarBlocoI();
		await this.gerarBlocoJ();

		let nomeArquivo = "C:\\T2Ti\\Sped\\ECD\\sped-contabil-node.txt";
		this.spedT2Ti.geraArquivoTxt(nomeArquivo);
		return nomeArquivo;
	}

	//BLOCO 0: ABERTURA, IDENTIFICAÇÃO E REFERÊNCIAS
	async gerarBloco0() {
		//const connection = getConnection();

		let empresa: Empresa;
		//empresa = await this.dataSource.manager.findOne(Empresa, 1);
		empresa = new Empresa({});

		// REGISTRO 0000: ABERTURA DO ARQUIVO DIGITAL E IDENTIFICAÇÃO DO EMPRESÁRIO OU DA SOCIEDADE EMPRESÁRIA
		this.spedT2Ti.bloco0.registro0000.dtIni = new Date(this.dataInicial);
		this.spedT2Ti.bloco0.registro0000.dtFin = new Date(this.dataFinal);
		this.spedT2Ti.bloco0.registro0000.nome = empresa.razaoSocial;
		this.spedT2Ti.bloco0.registro0000.cnpj = empresa.cnpj;
		this.spedT2Ti.bloco0.registro0000.ie = empresa.inscricaoEstadual;
		this.spedT2Ti.bloco0.registro0000.codMun = empresa.codigoIbgeCidade;
		this.spedT2Ti.bloco0.registro0000.im = empresa.inscricaoMunicipal;
		this.spedT2Ti.bloco0.registro0000.uf = 'empresa.enderecoPrincipal.uf';

		// REGISTRO 0001: ABERTURA DO BLOCO 0
		// bloco com dados informados = 0 | sem dados inf = 1
		this.spedT2Ti.bloco0.registro0001.indDad = 0;


		// REGISTRO 0007: OUTRAS INSCRIÇÕES CADASTRAIS DA PESSOA JURÍDICA
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO 0020: ESCRITURAÇÃO CONTÁBIL DESCENTRALIZADA
		// Implementado a critério do Participante do T2Ti ERP - Para o treinamento a escrituração será centralizada
		// REGISTRO 0150: TABELA DE CADASTRO DO PARTICIPANTE
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO 0180: IDENTIFICAÇÃO DO RELACIONAMENTO COM O PARTICIPANTE
		// Implementado a critério do Participante do T2Ti ERP
	}

	//Bloco I - Lançamentos Contábeis
	async gerarBlocoI() {
		// REGISTRO I001: ABERTURA DO BLOCO I
		this.spedT2Ti.blocoI.registroI001.indDad = 0;

		// REGISTRO I010: IDENTIFICAÇÃO DA ESCRITURAÇÃO CONTÁBIL
		this.spedT2Ti.blocoI.registroI010.indEsc = this.formaEscrituracao;
		this.spedT2Ti.blocoI.registroI010.codVerLc = this.versaoLeiaute;

		// REGISTRO I012: LIVROS AUXILIARES AO DIÁRIO
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO I015: IDENTIFICAÇÃO DAS CONTAS DA ESCRITURAÇÃO RESUMIDA A QUE SE REFERE A ESCRITURAÇÃO AUXILIAR
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO I020: CAMPOS ADICIONAIS
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO I030: TERMO DE ABERTURA
		/* TODO
		filtros.clear();
		filtros.push(new Filtro(Filtro.aND, "formaEscrituracao", Filtro.iGUAL, formaEscrituracao));
		filtros.push(new Filtro(Filtro.aND, "competencia", Filtro.iGUAL, Biblioteca.mesAno(dataInicial)));
		ContabilLivro contabilLivro = contabilLivroDao.getBean(ContabilLivro.class, filtros);

		if (contabilLivro != null) {
			filtros.clear();
			filtros.push(new Filtro(Filtro.aND, "contabilLivro", Filtro.iGUAL, contabilLivro));
			filtros.push(new Filtro(Filtro.aND, "aberturaEncerramento", Filtro.iGUAL, "A"));
			ContabilTermo contabilTermo = contabilTermoDao.getBean(ContabilTermo.class, filtros);
			if (contabilTermo == null) {
				throw new Exception("Termo de Abertura não encontrado");
			}

			filtros.clear();
			filtros.push(new Filtro(Filtro.aND, "empresa", Filtro.iGUAL, empresa));
			RegistroCartorio registroCartorio = registroCartorioDao.getBean(RegistroCartorio.class, filtros);
			if (registroCartorio == null) {
				throw new Exception("Registro em Cartório não encontrado");
			}

			this.spedT2Ti.getBlocoI().getRegistroI030().setNumOrd(contabilTermo.getNumeroRegistro());
			this.spedT2Ti.getBlocoI().getRegistroI030().setNatLivr(contabilLivro.getDescricao());
			this.spedT2Ti.getBlocoI().getRegistroI030().setNome(empresa.getRazaoSocial());
			this.spedT2Ti.getBlocoI().getRegistroI030().setNire(registroCartorio.getNire());
			this.spedT2Ti.getBlocoI().getRegistroI030().setCnpj(empresa.getCnpj());
			this.spedT2Ti.getBlocoI().getRegistroI030().setDtArq(registroCartorio.getDataRegistro());
			this.spedT2Ti.getBlocoI().getRegistroI030().setDescMun(endereco.getCidade());
		}

		// REGISTRO I050: PLANO DE CONTAS
		filtros.clear();
		filtros.push(new Filtro(Filtro.aND, "empresa", Filtro.iGUAL, empresa));
		PlanoConta planoConta = planoContaDao.getBean(PlanoConta.class, filtros);

		List<ContabilConta> listaContabilConta = new ArrayList<>();
		if (planoConta != null) {
			filtros.clear();
			filtros.push(new Filtro(Filtro.aND, "planoConta", Filtro.iGUAL, planoConta));
			listaContabilConta = dao.getBeans(ContabilConta.class, filtros);

			RegistroI050 registroI050;
			for (int i = 0; i < listaContabilConta.size(); i++) {
				registroI050 = new RegistroI050();
				registroI050.setDtAlt(listaContabilConta.get(i).getDataInclusao());
				registroI050.setCodNat(listaContabilConta.get(i).getCodigoEfd());
				registroI050.setIndCta(listaContabilConta.get(i).getTipo());
				String classificacao[] = listaContabilConta.get(i).getClassificacao().split(".");
				registroI050.setNivel(String.valueOf(classificacao.length));
				registroI050.setCodCta(listaContabilConta.get(i).getClassificacao());
				registroI050.setCodCtaSup("");
				registroI050.setCta(listaContabilConta.get(i).getDescricao());

				// REGISTRO I051: PLANO DE CONTAS REFERENCIAL

				// Observação: A partir da versão 3.x e alterações posteriores do PVA do Sped Contábil, não haverá o plano de
				// contas referencial da RFB . Portanto, para as empresas que utilizavam esse plano, não será necessário o preenchimento
				// do registro I051.

				// Fonte: Manual de Orientação da ECD

				//registroI050.getRegistroi051List().push(registroI051);
				this.spedT2Ti.getBlocoI().getListaRegistroI050().push(registroI050);
			}

		}*/

		// REGISTRO I052: INDICAÇÃO DOS CÓDIGOS DE AGLUTINAÇÃO
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO I075: TABELA DE HISTÓRICO PADRONIZADO
		/* TODO
		filtros.clear();
		filtros.push(new Filtro(Filtro.aND, "empresa", Filtro.iGUAL, empresa));
		List<ContabilHistorico> contabilHistorico = contabilHistoricoDao.getBeans(ContabilHistorico.class, filtros);
		RegistroI075 registroI075;
		for (int i = 0; i < contabilHistorico.size(); i++) {
			registroI075 = new RegistroI075();

			registroI075.setCodHist(contabilHistorico.get(i).getId().toString());
			registroI075.setDescrHist(contabilHistorico.get(i).getDescricao());

			this.spedT2Ti.getBlocoI().getListaRegistroI075().push(registroI075);
		}

		// REGISTRO I100: CENTRO DE CUSTOS
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO I150: SALDOS PERIÓDICOS – IDENTIFICAÇÃO DO PERÍODO
		RegistroI150 registroI150 = new RegistroI150();
		registroI150.setDtIni(dataInicial);
		registroI150.setDtFin(dataFinal);

		// REGISTRO I151: Hash dos Arquivos que Contêm as Fichas de Lançamento Utilizadas no Período
		// Implementado a critério do Participante do T2Ti ERP
		BigDecimal creditos;
		BigDecimal debitos;
		BigDecimal saldo;
		ViewSpedI155VoId i155Credito;
		ViewSpedI155VoId i155Debito;
		for (int i = 0; i < listaContabilConta.size(); i++) {
			// REGISTRO I155: DETALHE DOS SALDOS PERIÓDICOS
			//busca o saldo anterior
			filtros.clear();
			filtros.push(new Filtro(Filtro.aND, "viewSpedI155VO.mesAno", Filtro.iGUAL, Biblioteca.mesAno(Biblioteca.mesAnterior(dataInicial))));
			filtros.push(new Filtro(Filtro.aND, "viewSpedI155VO.idContabilConta", Filtro.iGUAL, listaContabilConta.get(i).getId()));
			filtros.push(new Filtro(Filtro.aND, "viewSpedI155VO.tipo", Filtro.iGUAL, "C"));
			i155Credito = viewSpedI155VoIdDao.getBean(ViewSpedI155VoId.class, filtros);
			if (i155Credito != null) {
				creditos = i155Credito.getViewSpedI155VO().getSomaValor();
			} else {
				creditos = BigDecimal.zERO;
			}

			filtros.clear();
			filtros.push(new Filtro(Filtro.aND, "viewSpedI155VO.mesAno", Filtro.iGUAL, Biblioteca.mesAno(Biblioteca.mesAnterior(dataInicial))));
			filtros.push(new Filtro(Filtro.aND, "viewSpedI155VO.idContabilConta", Filtro.iGUAL, listaContabilConta.get(i).getId()));
			filtros.push(new Filtro(Filtro.aND, "viewSpedI155VO.tipo", Filtro.iGUAL, "D"));
			i155Debito = viewSpedI155VoIdDao.getBean(ViewSpedI155VoId.class, filtros);
			if (i155Debito != null) {
				debitos = i155Credito.getViewSpedI155VO().getSomaValor();
			} else {
				debitos = BigDecimal.zERO;
			}

			saldo = creditos.subtract(debitos);

			RegistroI155 registroI155 = new RegistroI155();
			registroI155.setCodCta(listaContabilConta.get(i).getClassificacao());
			registroI155.setCodCcus("");
			registroI155.setVlSldIni(saldo);
			if (saldo.compareTo(BigDecimal.zERO) == -1) {
				registroI155.setIndDcIni("D");
			} else {
				registroI155.setIndDcIni("C");
			}

			//busca o saldo atual
			filtros.clear();
			filtros.push(new Filtro(Filtro.aND, "viewSpedI155VO.mesAno", Filtro.iGUAL, Biblioteca.mesAno(dataInicial)));
			filtros.push(new Filtro(Filtro.aND, "viewSpedI155VO.idContabilConta", Filtro.iGUAL, listaContabilConta.get(i).getId()));
			filtros.push(new Filtro(Filtro.aND, "viewSpedI155VO.tipo", Filtro.iGUAL, "C"));
			i155Credito = viewSpedI155VoIdDao.getBean(ViewSpedI155VoId.class, filtros);
			if (i155Credito != null) {
				creditos = i155Credito.getViewSpedI155VO().getSomaValor();
			} else {
				creditos = BigDecimal.zERO;
			}

			filtros.clear();
			filtros.push(new Filtro(Filtro.aND, "viewSpedI155VO.mesAno", Filtro.iGUAL, Biblioteca.mesAno(dataInicial)));
			filtros.push(new Filtro(Filtro.aND, "viewSpedI155VO.idContabilConta", Filtro.iGUAL, listaContabilConta.get(i).getId()));
			filtros.push(new Filtro(Filtro.aND, "viewSpedI155VO.tipo", Filtro.iGUAL, "D"));
			i155Debito = viewSpedI155VoIdDao.getBean(ViewSpedI155VoId.class, filtros);
			if (i155Debito != null) {
				debitos = i155Credito.getViewSpedI155VO().getSomaValor();
			} else {
				debitos = BigDecimal.zERO;
			}

			saldo = creditos.subtract(debitos);

			registroI155.setVlDeb(debitos);
			registroI155.setVlCred(creditos);
			registroI155.setVlSldFin(saldo);
			if (saldo.compareTo(BigDecimal.zERO) == -1) {
				registroI155.setIndDcFin("D");
			} else {
				registroI155.setIndDcFin("C");
			}

			registroI150.getRegistroi155List().push(registroI155);

			// REGISTRO I157: TRANSFERÊNCIA DE SALDOS DE PLANO DE CONTAS ANTERIOR
			// Implementado a critério do Participante do T2Ti ERP
		}
		this.spedT2Ti.getBlocoI().getListaRegistroI150().push(registroI150);

		// REGISTRO I200: LANÇAMENTO CONTÁBIL
		filtros.clear();
		filtros.push(new Filtro(Filtro.aND, "dataLancamento", Filtro.mAIOR_OU_IGUAL, dataInicial));
		filtros.push(new Filtro(Filtro.aND, "dataLancamento", Filtro.mENOR_OU_IGUAL, dataFinal));
		List<ContabilLancamentoCabecalho> listaLancamentoCabecalho = contabilLancamentoCabecalhoDao.getBeans(ContabilLancamentoCabecalho.class, filtros);
		RegistroI200 registroI200;
		RegistroI250 registroI250;
		for (int i = 0; i < listaLancamentoCabecalho.size(); i++) {
			registroI200 = new RegistroI200();
			registroI200.setNumLcto(String.valueOf(listaLancamentoCabecalho.get(i).getId()));
			registroI200.setDtLcto(listaLancamentoCabecalho.get(i).getDataLancamento());
			registroI200.setVlLcto(listaLancamentoCabecalho.get(i).getValor());
			registroI200.setIndLcto("N");

			filtros.clear();
			filtros.push(new Filtro(Filtro.aND, "contabilLancamentoCabecalho", Filtro.iGUAL, listaLancamentoCabecalho.get(i)));
			List<ContabilLancamentoDetalhe> lancamentoDetalhe = contabilLancamentoDetalheDao.getBeans(ContabilLancamentoDetalhe.class, filtros);
			for (int j = 0; j < lancamentoDetalhe.size(); j++) {
				registroI250 = new RegistroI250();
				registroI250.setCodCta(lancamentoDetalhe.get(j).getContabilConta().getClassificacao());
				//registroI250.setCodCcus("");
				registroI250.setVlDc(lancamentoDetalhe.get(j).getValor());
				registroI250.setIndDc(lancamentoDetalhe.get(j).getTipo());
				//registroI250.setNumArq("");
				registroI250.setCodHistPad(String.valueOf(lancamentoDetalhe.get(j).getContabilHistorico().getId()));
				registroI250.setHist(lancamentoDetalhe.get(j).getHistorico());
				//registroI250.setCodPart("");

				registroI200.getRegistroi250List().push(registroI250);
			}

			this.spedT2Ti.getBlocoI().getListaRegistroI200().push(registroI200);
		}
		*/
		// REGISTRO I300: BALANCETES DIÁRIOS – IDENTIFICAÇÃO DA DATA
		// REGISTRO I310: DETALHES DO BALANCETE DIÁRIO
		// Implementados a critério do Participante do T2Ti ERP
		// REGISTRO I350: SALDOS DAS CONTAS DE RESULTADO ANTES DO ENCERRAMENTO – IDENTIFICAÇÃO DA DATA
		// REGISTRO I355: DETALHES DOS SALDOS DAS CONTAS DE RESULTADO ANTES DO ENCERRAMENTO
		// Implementados a critério do Participante do T2Ti ERP
		// REGISTRO I500: PARÂMETROS DE IMPRESSÃO E VISUALIZAÇÃO DO LIVRO RAZÃO AUXILIAR COM LEIAUTE PARAMETRIZÁVEL
		// REGISTRO I510: DEFINIÇÃO DE CAMPOS DO LIVRO RAZÃO AUXILIAR COM LEIAUTE PARAMETRIZÁVEL
		// REGISTRO I550: DETALHES DO LIVRO AUXILIAR COM LEIAUTE PARAMETRIZÁVEL
		// REGISTRO I555: TOTAIS NO LIVRO AUXILIAR COM LEIAUTE PARAMETRIZÁVEL
		// Implementados a critério do Participante do T2Ti ERP
	}

    //Bloco J - Demonstrações Contábeis
	async gerarBlocoJ() {
		// REGISTRO J001: ABERTURA DO BLOCO J
		// this.spedT2Ti.blocoJ.registroJ001.indDad = 0;

		// REGISTRO J005: DEMONSTRAÇÕES CONTÁBEIS
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO J100: BALANÇO PATRIMONIAL
		// Implementado a critério do Participante do T2Ti ERP
		//REGISTRO J150: DEMONSTRAÇÃO DO RESULTADO DO EXERCÍCIO
		//Implementado a critério do Participante do T2Ti ERP
		// REGISTRO J200: TABELA DE HISTÓRICO DE FATOS CONTÁBEIS QUE MODIFICAM A CONTA LUCROS ACUMULADOS OU A CONTA PREJUÍZOS ACUMULADOS OU TODO O PATRIMÔNIO LÍQUIDO
		// REGISTRO J210: DLPA – DEMONSTRAÇÃO DE LUCROS OU PREJUÍZOS ACUMULADOS/DMPL – DEMONSTRAÇÃO DE MUTAÇÕES DO PATRIMÔNIO LÍQUIDO
		// REGISTRO J215: FATO CONTÁBIL QUE ALTERA A CONTA LUCROS ACUMULADOS OU A CONTA PREJUÍZOS ACUMULADOS OU TODO O PATRIMÔNIO LÍQUIDO
		// Implementados a critério do Participante do T2Ti ERP
		// REGISTRO J310: DEMONSTRAÇÃO DO FLUXO DE CAIXA
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO J410: DEMONSTRAÇÃO DO VALOR ADICIONADO
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO J800: OUTRAS INFORMAÇÕES
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO J900: TERMO DE ENCERRAMENTO
		/* TODO
		filtros.clear();
		filtros.push(new Filtro(Filtro.aND, "formaEscrituracao", Filtro.iGUAL, formaEscrituracao));
		filtros.push(new Filtro(Filtro.aND, "competencia", Filtro.iGUAL, Biblioteca.mesAno(dataInicial)));
		ContabilLivro contabilLivro = contabilLivroDao.getBean(ContabilLivro.class, filtros);
		if (contabilLivro != null) {
			filtros.clear();
			filtros.push(new Filtro(Filtro.aND, "contabilLivro", Filtro.iGUAL, contabilLivro));
			filtros.push(new Filtro(Filtro.aND, "aberturaEncerramento", Filtro.iGUAL, "E"));
			ContabilTermo contabilTermo = contabilTermoDao.getBean(ContabilTermo.class, filtros);
			if (contabilTermo == null) {
				throw new Exception("Termo de Encerramento não encontrado");
			}

			this.spedT2Ti.getBlocoJ().getRegistroJ900().setNumOrd(contabilTermo.getNumeroRegistro());
			this.spedT2Ti.getBlocoJ().getRegistroJ900().setNatLivro(contabilLivro.getDescricao());
			this.spedT2Ti.getBlocoJ().getRegistroJ900().setNome(empresa.getRazaoSocial());
			this.spedT2Ti.getBlocoJ().getRegistroJ900().setDtIniEscr(contabilTermo.getEscrituracaoInicio());
			this.spedT2Ti.getBlocoJ().getRegistroJ900().setDtFinEscr(contabilTermo.getEscrituracaoFim());

			// REGISTRO J930: IDENTIFICAÇÃO DOS SIGNATÁRIOS DA ESCRITURAÇÃO
			List<Contador> contadores  = contadorDao.getBeans(Contador.class);
			RegistroJ930 registroJ930;
			for (int i = 0; i < contadores.size(); i++) {
				registroJ930 = new RegistroJ930();
				registroJ930.setIdentNom(contadores.get(i).getNome());
				registroJ930.setIdentCpf(contadores.get(i).getCpf());
				registroJ930.setIdentQualif("CONTADOR");
				registroJ930.setCodAssin("900");
				registroJ930.setIndCrc(contadores.get(i).getInscricaoCrc());

				this.spedT2Ti.getBlocoJ().getListaRegistroJ930().push(registroJ930);
			}
		}
		*/
	}

}