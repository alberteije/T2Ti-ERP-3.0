/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado ao Sped Fiscal - EFD
                                                                                
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

import { Empresa } from '../../entities-export';
import { Contador } from '../../entities-export';
import { EmpresaEndereco } from '../../entities-export';
import { NfeCabecalho } from '../../entities-export';
import { NfeEmitente } from '../../entities-export';
import { NfeDestinatario } from '../../entities-export';
import { Produto } from '../../entities-export';
import { ProdutoUnidade } from '../../entities-export';
import { TributOperacaoFiscal } from '../../entities-export';
import { T2TiSpedFiscal } from '../../lib/sped/t2ti-sped-fiscal';
import { Registro0150 } from '../../lib/sped/fiscal/bloco-0/registro-0150';
import { Registro0190 } from '../../lib/sped/fiscal/bloco-0/registro-0190';
import { Registro0200 } from '../../lib/sped/fiscal/bloco-0/registro-0200';
import { Registro0400 } from '../../lib/sped/fiscal/bloco-0/registro-0400';
import { Registro1010 } from '../../lib/sped/fiscal/bloco-1/registro-1010';
import { RegistroC100 } from '../../lib/sped/fiscal/bloco-c/registro-C100';
import { RegistroC114 } from '../../lib/sped/fiscal/bloco-c/registro-C114';
import { RegistroC170 } from '../../lib/sped/fiscal/bloco-c/registro-C170';
import { RegistroC190 } from '../../lib/sped/fiscal/bloco-c/registro-C190';
import { RegistroE100 } from '../../lib/sped/fiscal/bloco-e/registro-E100';
import { RegistroH005 } from '../../lib/sped/fiscal/bloco-h/registro-H005';
import { RegistroH010 } from '../../lib/sped/fiscal/bloco-h/registro-H010';

@Injectable()
export class SpedFiscalService {

	constructor() { }

	dataInicial: Date;
	dataFinal: Date;
	versaoLeiaute: string;
	finalidadeArquivo: string;
	perfilApresentacao: string;
	idEmpresa: number;
	inventario: number;
	idContador: number;
	spedT2Ti: T2TiSpedFiscal;

	async gerarSpedFiscal(filter: string) {
		let conteudoFiltro: any[] = filter.split('|');
        /*
        0 - Periodo Inicial
        1 - Periodo Final
        2 - Versao Leiaute
        3 - Finalidade Arquivo
        4 - Perfil
        5 - IdEmpresa
        6 - Inventario
        7 - IdContador
        */
		this.dataInicial = conteudoFiltro[0];
		this.dataFinal = conteudoFiltro[1];
		this.versaoLeiaute = conteudoFiltro[2];
		this.finalidadeArquivo = conteudoFiltro[3];
		this.perfilApresentacao = conteudoFiltro[4];
		this.idEmpresa = conteudoFiltro[5];
		this.inventario = conteudoFiltro[6];
		this.idContador = conteudoFiltro[7];

		this.spedT2Ti = new T2TiSpedFiscal();

		await this.gerarBloco0();
		await this.gerarBlocoC();
		// BLOCO D: DOCUMENTOS FISCAIS II - SERVIÇOS (ICMS).
		// Bloco de registros dos dados relativos à emissão ou ao recebimento de
		// documentos fiscais que acobertam as prestações de serviços de
		// comunicação, transporte intermunicipal e interestadual.
		// Implementado a critério do Participante do T2Ti ERP
		await this.gerarBlocoE();
		// BLOCO G – CONTROLE DO CRÉDITO DE ICMS DO ATIVO PERMANENTE CIAP
		// Implementado a critério do Participante do T2Ti ERP
		if (this.inventario > 0) {
			await this.gerarBlocoH();
		}
		await this.gerarBloco1();

		let nomeArquivo = "C:\\T2Ti\\Sped\\EFD\\sped-fiscal-node.txt";
		this.spedT2Ti.geraArquivoTxt(nomeArquivo);
		return nomeArquivo;
	}

	//BLOCO 0: ABERTURA, IDENTIFICAÇÃO E REFERÊNCIAS
	async gerarBloco0() {
		//const connection = getConnection();

		let empresa: Empresa;
		empresa = new Empresa({});
		//empresa = await this.dataSource.manager.findOne(Empresa, 1);

		let contador: Contador;
		// contador = await this.dataSource.manager.findOne(Contador, 1);

//		empresa.setEnderecoPrincipal(await this.dataSource.manager.findOne(EmpresaEndereco, 1));
		empresa.setEnderecoPrincipal(new EmpresaEndereco({}));

		let listaNfeCabecalho: NfeCabecalho[];
		listaNfeCabecalho = [];
		// listaNfeCabecalho = await this.dataSource.manager.find(NfeCabecalho);

		let listaOperacaoFiscal: TributOperacaoFiscal[];
		listaOperacaoFiscal = [];
		// listaOperacaoFiscal = await this.dataSource.manager.find(TributOperacaoFiscal);

		let listaProdutoUnidade: ProdutoUnidade[];
		listaProdutoUnidade = [];

		// REGISTRO 0000: ABERTURA DO ARQUIVO DIGITAL E IDENTIFICAÇÃO DA ENTIDADE
		this.spedT2Ti.bloco0.registro0000.dtIni = new Date(this.dataInicial);
		this.spedT2Ti.bloco0.registro0000.dtFin = new Date(this.dataFinal);
		this.spedT2Ti.bloco0.registro0000.codVer = this.versaoLeiaute;
		this.spedT2Ti.bloco0.registro0000.codFin = this.finalidadeArquivo;
		this.spedT2Ti.bloco0.registro0000.indPerfil = this.perfilApresentacao;
		this.spedT2Ti.bloco0.registro0000.nome = empresa.razaoSocial;
		this.spedT2Ti.bloco0.registro0000.cnpj = empresa.cnpj;
		this.spedT2Ti.bloco0.registro0000.cpf = "";
		this.spedT2Ti.bloco0.registro0000.ie = empresa.inscricaoEstadual;
		this.spedT2Ti.bloco0.registro0000.codMun = 'empresa.codigoIbgeCidade.toString()';
		this.spedT2Ti.bloco0.registro0000.im = empresa.inscricaoMunicipal;
		//TODO: this.spedT2Ti.bloco0.registro0000.suframa = empresa.suframa;
		this.spedT2Ti.bloco0.registro0000.indAtiv = "1";
		this.spedT2Ti.bloco0.registro0000.uf = empresa.enderecoPrincipal.uf;

		// REGISTRO 0001: ABERTURA DO BLOCO 0
		this.spedT2Ti.bloco0.registro0001.indMov = 0;

		// REGISTRO 0005: DADOS COMPLEMENTARES DA ENTIDADE
		this.spedT2Ti.bloco0.registro0005.fantasia = empresa.nomeFantasia;
		this.spedT2Ti.bloco0.registro0005.cep = 'empresa.enderecoPrincipal.cep';
		this.spedT2Ti.bloco0.registro0005.endereco = 'empresa.enderecoPrincipal.logradouro';
		this.spedT2Ti.bloco0.registro0005.num = 'empresa.enderecoPrincipal.numero';
		this.spedT2Ti.bloco0.registro0005.compl = 'empresa.enderecoPrincipal.complemento';
		this.spedT2Ti.bloco0.registro0005.bairro = 'empresa.enderecoPrincipal.bairro';
		//TODO: this.spedT2Ti.bloco0.registro0005.fone = empresa.enderecoPrincipal.fone;
		//TODO: this.spedT2Ti.bloco0.registro0005.fax = empresa.enderecoPrincipal.fone;
		this.spedT2Ti.bloco0.registro0005.email = empresa.email;

		// REGISTRO 0015: DADOS DO CONTRIBUINTE SUBSTITUTO
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO 0100: DADOS DO CONTABILISTA
		// TODO
		this.spedT2Ti.bloco0.registro0100.nome = "contador.nome";
		this.spedT2Ti.bloco0.registro0100.cpf = "contador.cpf";
		this.spedT2Ti.bloco0.registro0100.crc = 'contador.crcInscricao';
		this.spedT2Ti.bloco0.registro0100.cep = "contador.cep";
		this.spedT2Ti.bloco0.registro0100.endereco = "contador.logradouro";
		this.spedT2Ti.bloco0.registro0100.num = "contador.numero";
		this.spedT2Ti.bloco0.registro0100.compl = "contador.complemento";
		this.spedT2Ti.bloco0.registro0100.bairro = "contador.bairro";
		this.spedT2Ti.bloco0.registro0100.fone = "contador.fone";
		this.spedT2Ti.bloco0.registro0100.fax = "contador.fax";
		this.spedT2Ti.bloco0.registro0100.email = "contador.email";
		this.spedT2Ti.bloco0.registro0100.codMun = 123;
				
		// REGISTRO 0150: TABELA DE CADASTRO DO PARTICIPANTE
		/*
			* Deverão ser informados somente os participantes que tiveram
			* movimentação no período de referência da EFD, não sendo necessário
			* informar os CNPJs e CPFs citados nos registros C350 e C460
			* [adquirentes nas operações acobertadas com nota fiscal de venda a
			* consumidor ou cupom fiscal]
			*/
		let registro0150: Registro0150;
		let emitente: NfeEmitente;
		let destinatario: NfeDestinatario;
		listaNfeCabecalho.forEach(c => {
			registro0150 = new Registro0150();
			emitente = c.nfeEmitente;

			if (emitente != null)
			{
				registro0150.codPart = "F" + emitente.nfeCabecalho.fornecedor.id;
				registro0150.nome = emitente.nome;
				registro0150.codPais = "01058";
				registro0150.cpf = emitente.cpf;
				registro0150.cnpj = emitente.cnpj;
				registro0150.codMun = emitente.codigoMunicipio;
				// TODO: registro0150.suframa = Convert.toString(emitente.suframa);
				registro0150.endereco = emitente.logradouro;
				registro0150.num = emitente.numero;
				registro0150.compl = emitente.complemento;
				registro0150.bairro = emitente.bairro;
			}

			this.spedT2Ti.bloco0.listaRegistro0150.push(registro0150);

			registro0150 = new Registro0150();
			destinatario = c.nfeDestinatario;

			if (destinatario != null)
			{
				registro0150.codPart = "C" + destinatario.nfeCabecalho.cliente.id;
				registro0150.nome = destinatario.nome;
				registro0150.codPais = "01058";
				registro0150.cpf = destinatario.cpf;
				registro0150.cnpj = destinatario.cnpj;
				registro0150.codMun = destinatario.codigoMunicipio;
				//registro0150.suframa = destinatario.suframa.value.toString();
				registro0150.endereco = destinatario.logradouro;
				registro0150.num = destinatario.numero;
				registro0150.compl = destinatario.complemento;
				registro0150.bairro = destinatario.bairro;
			}

			this.spedT2Ti.bloco0.listaRegistro0150.push(registro0150);

			// REGISTRO 0175: ALTERAÇÃO DA TABELA DE CADASTRO DE PARTICIPANTE
			// Pegar os dados de PESSOA_ALTERACAO para gerar o registro 0175

			// registro 0200
			c.listaNfeDetalhe.forEach(nfeDetalhe => {
				let registro0200 = new Registro0200();
				let produto = nfeDetalhe.produto;

				registro0200.codItem = produto.id.toString();
				registro0200.descrItem = produto.descricao;
				registro0200.codBarra = produto.gtin;
				// TEM QUE PREENCHER PARA INFORMAR NO 0205
				registro0200.codAntItem = "";
				registro0200.unidInv = produto.produtoUnidade.id.toString();
				// TODO: registro0200.tipoItem = produto.tipoItemSped;
				registro0200.codNcm = produto.codigoNcm;
				// TODO: registro0200.exIpi = produto.exTipi;
				registro0200.codGen = produto.codigoNcm.substring(0, 2);
				// TODO: registro0200.codLst = produto.codigoLst;
				// TODO: registro0200.aliqIcms = produto.aliquotaIcmsPaf;

				//if (!listaProdutoUnidade.contains(produto.produtoUnidade()))
				//{
				//    listaProdutoUnidade.push(produto.produtoUnidade;
				//}

				// REGISTRO 0205: ALTERAÇÃO DO ITEM
				/* TODO
				List<ProdutoAlteracaoItem> listaProdutoAlteracaoItem = alteracaoItemDao.beans(ProdutoAlteracaoItem.class, "produto", produto, "dataInicial", dataInicio, dataFim);
				Registro0205 registro0205;
				for (ProdutoAlteracaoItem produtoAlteracaoItem : listaProdutoAlteracaoItem) {
					registro0205 = new Registro0205();

					registro0205.descrAntItem = produtoAlteracaoItem.nome;
					registro0205.dtIni = produtoAlteracaoItem.dataInicial;
					registro0205.dtFin = produtoAlteracaoItem.dataFinal;
					registro0205.codAntItem = produtoAlteracaoItem.codigo;

					registro0200.registro0205List().push(registro0205);
				}
				*/

				// REGISTRO 0206: CÓDIGO DE PRODUTO CONFORME TABELA PUBLICADA
				// PELA ANP (COMBUSTÍVEIS)
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO 0210: CONSUMO ESPECÍFICO PADRONIZADO
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO 0220: FATORES DE CONVERSÃO DE UNIDADES
				/* TODO
				UnidadeConversao unidadeConversao = produto.unidadeConversao();
				if (unidadeConversao != null) {
					Registro0220 registro0220 = new Registro0220();
					registro0220.unidConv = unidadeConversao.produto.unidadeProduto.id.toString();
					registro0220.fatConv = unidadeConversao.fatorConversao;

					registro0200.registro0220List().push(registro0220);
				}
				*/
			});
		});

		// REGISTRO 0190: IDENTIFICAÇÃO DAS UNIDADES DE MEDIDA
		listaProdutoUnidade.forEach(unidade => {
			let registro0190 = new Registro0190();

			registro0190.unid = unidade.id.toString();
			registro0190.descr = unidade.sigla;

			this.spedT2Ti.bloco0.listaRegistro0190.push(registro0190);
		});

		// REGISTRO 0300: CADASTRO DE BENS OU COMPONENTES DO ATIVO IMOBILIZADO
		// REGISTRO 0305: INFORMAÇÃO SOBRE A UTILIZAÇÃO DO BEM
		// Implementado a critério do Participante do T2Ti ERP - versão 1.0 não
		// possui controle CIAP
		// REGISTRO 0400: TABELA DE NATUREZA DA OPERAÇÃO/PRESTAÇÃO
		listaOperacaoFiscal.forEach(operacaoFiscal => {
			let registro0400 = new Registro0400();

			registro0400.codNat = operacaoFiscal.id.toString();
			registro0400.descrNat = operacaoFiscal.descricaoNaNf;
		});

		// REGISTRO 0450: TABELA DE INFORMAÇÃO COMPLEMENTAR DO DOCUMENTO FISCAL
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO 0460: TABELA DE OBSERVAÇÕES DO LANÇAMENTO FISCAL
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO 0500: PLANO DE CONTAS CONTÁBEIS
		// Implementado a critério do Participante do T2Ti ERP
		// REGISTRO 0600: CENTRO DE CUSTOS
		// Implementado a critério do Participante do T2Ti ERP		

	}

	//BLOCO C: DOCUMENTOS FISCAIS I - MERCADORIAS (ICMS/IPI)
	async gerarBlocoC() {
		let listaNfeCabecalho: NfeCabecalho[];
		listaNfeCabecalho = [];
		// listaNfeCabecalho = await this.dataSource.manager.find(NfeCabecalho);

		// TODO: List<EcfNotaFiscalCabecalho> listaNf2Cabecalho = nf2Dao.beans(EcfNotaFiscalCabecalho.class, "dataEmissao", dataInicio, dataFim);

		// TODO: List<EcfNotaFiscalCabecalho> listaNf2Cancelada = nf2Dao.beans(EcfNotaFiscalCabecalho.class, "cancelada", "S", "dataEmissao", dataInicio, dataFim);

		// PERFIL A
		if (this.perfilApresentacao == "A")
		{
			// REGISTRO C100: NOTA FISCAL (CÓDIGO 01), NOTA FISCAL AVULSA
			// (CÓDIGO 1B), NOTA FISCAL DE PRODUTOR (CÓDIGO 04), NF-e (CÓDIGO
			// 55) e NFC-e (CÓDIGO 65)
			listaNfeCabecalho.forEach(nfe => {
				let registroC100 = new RegistroC100();

				registroC100.indOper = nfe.tipoOperacao;
				registroC100.indEmit = "0"; // 0 - Emissao Propria
				if (nfe.cliente != null)
				{
					registroC100.codPart = "C" + nfe.cliente.id.toString();
				}
				else if (nfe.fornecedor != null)
				{
					registroC100.codPart = "F" + nfe.fornecedor.id.toString();
				}
				registroC100.codMod = nfe.codigoModelo;

				/*
				 * 4.1.2- Tabela Situação do Documento Código Descrição 00
				 * Documento regular 01 Documento regular extemporâneo 02
				 * Documento cancelado 03 Documento cancelado extemporâneo 04
				 * NFe denegada 05 Nfe – Numeração inutilizada 06 Documento
				 * Fiscal Complementar 07 Documento Fiscal Complementar
				 * extemporâneo. 08 Documento Fiscal emitido com base em Regime
				 * Especial ou Norma Específica
				 */
				if (nfe.statusNota == "5")
				{
					registroC100.codSit = "00";
				}
				else if (nfe.statusNota == "6")
				{
					registroC100.codSit = "02";
				}
				registroC100.ser = nfe.serie;
				registroC100.numDoc = nfe.numero;
				registroC100.chvNfe = nfe.chaveAcesso;
				registroC100.dtDoc = nfe.dataHoraEmissao;
				registroC100.dtES = nfe.dataHoraEntradaSaida;
				registroC100.vlDoc = nfe.valorTotal;
				// TODO: registroC100.indPgto = Convert.toString(nfe.indicadorFormaPagamento);
				registroC100.vlDesc = nfe.valorDesconto;
				registroC100.vlAbatNt = 0;
				registroC100.vlMerc = nfe.valorTotalProdutos;

				let transporte = nfe.nfeTransporte;
				if (transporte != null)
				{
					registroC100.indFrt = transporte.modalidadeFrete;
				}

				registroC100.vlFrt = nfe.valorFrete;
				registroC100.vlSeg = nfe.valorSeguro;
				registroC100.vlOutDa = nfe.valorDespesasAcessorias;
				registroC100.vlBcIcms = nfe.baseCalculoIcms;
				registroC100.vlIcms = nfe.valorIcms;
				registroC100.vlBcIcmsSt = nfe.baseCalculoIcmsSt;
				registroC100.vlIcmsSt = nfe.valorIcmsSt;
				registroC100.vlIpi = nfe.valorIpi;
				registroC100.vlPis = nfe.valorPis;
				registroC100.vlPisSt = 0;
				registroC100.vlCofins = nfe.valorCofins;
				registroC100.vlCofinsSt = 0;

				// REGISTRO C105: OPERAÇÕES COM ICMS ST RECOLHIDO PARA UF
				// DIVERSA DO DESTINATÁRIO DO DOCUMENTO FISCAL (CÓDIGO 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C110: INFORMAÇÃO COMPLEMENTAR DA NOTA FISCAL (CÓDIGO
				// 01, 1B, 04 e 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C111: PROCESSO REFERENCIADO
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C112: DOCUMENTO DE ARRECADAÇÃO REFERENCIADO.
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C113: DOCUMENTO FISCAL REFERENCIADO.
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C114: CUPOM FISCAL REFERENCIADO
				nfe.listaNfeCupomFiscalReferenciado.forEach(cupomFiscal => {
					let registroC114 = new RegistroC114();

					registroC114.codMod = cupomFiscal.modeloDocumentoFiscal;
					registroC114.ecfFab = cupomFiscal.numeroSerieEcf;
					registroC114.ecfCx = cupomFiscal.numeroCaixa.toString();
					registroC114.numDoc = cupomFiscal.coo.toString();
					registroC114.dtDoc = cupomFiscal.dataEmissaoCupom;

					this.spedT2Ti.blocoC.listaRegistroC114.push(registroC114);
				});

				// REGISTRO C115: LOCAL DA COLETA E/OU ENTREGA (CÓDIGO 01, 1B E
				// 04).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C116: CUPOM FISCAL ELETRÔNICO REFERENCIADO
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C120: COMPLEMENTO DE DOCUMENTO - OPERAÇÕES DE
				// IMPORTAÇÃO (CÓDIGOS 01 e 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C130: ISSQN, IRRF E PREVIDÊNCIA SOCIAL.
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C140: FATURA (CÓDIGO 01)
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C141: VENCIMENTO DA FATURA (CÓDIGO 01).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C160: VOLUMES TRANSPORTADOS (CÓDIGO 01 E 04) -
				// EXCETO COMBUSTÍVEIS.
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C165: OPERAÇÕES COM COMBUSTÍVEIS (CÓDIGO 01).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C170: ITENS DO DOCUMENTO (CÓDIGO 01, 1B, 04 e 55).
				nfe.listaNfeDetalhe.forEach(nfeDetalhe => {
					let registroC170 = new RegistroC170();

					registroC170.numItem = nfeDetalhe.numeroItem.toString();
					registroC170.codItem = nfeDetalhe.gtin;
					registroC170.descrCompl = nfeDetalhe.nomeProduto;
					registroC170.qtd = nfeDetalhe.quantidadeComercial;
					registroC170.unid = nfeDetalhe.produto.produtoUnidade.id.toString();
					registroC170.vlItem = nfeDetalhe.valorTotal;
					registroC170.vlDesc = nfeDetalhe.valorDesconto;
					registroC170.indMov = 0;
					registroC170.cstIcms = nfeDetalhe.nfeDetalheImpostoIcms.cstIcms;
					registroC170.cfop = nfeDetalhe.cfop.toString();
					registroC170.codNat = nfeDetalhe.nfeCabecalho.tributOperacaoFiscal.id.toString();
					registroC170.vlBcIcms = nfeDetalhe.nfeDetalheImpostoIcms.valorBcIcms;
					registroC170.aliqIcms = nfeDetalhe.nfeDetalheImpostoIcms.aliquotaIcms;
					registroC170.vlIcms = nfeDetalhe.nfeDetalheImpostoIcms.valorIcms;
					registroC170.vlBcIcmsSt = nfeDetalhe.nfeDetalheImpostoIcms.valorBaseCalculoIcmsSt;
					registroC170.aliqSt = nfeDetalhe.nfeDetalheImpostoIcms.aliquotaIcmsSt;
					registroC170.vlIcmsSt = nfeDetalhe.nfeDetalheImpostoIcms.valorIcmsSt;
					registroC170.indApur = 0;
					registroC170.cstIpi = nfeDetalhe.nfeDetalheImpostoIpi.cstIpi;
					//TODO: registroC170.codEnq = nfeDetalhe.nfeDetalheImpostoIpi.enquadramentoIpi;
					registroC170.vlBcIpi = nfeDetalhe.nfeDetalheImpostoIpi.valorBaseCalculoIpi;
					registroC170.aliqIpi = nfeDetalhe.nfeDetalheImpostoIpi.aliquotaIpi;
					registroC170.vlIpi = nfeDetalhe.nfeDetalheImpostoIpi.valorIpi;
					registroC170.cstPis = nfeDetalhe.nfeDetalheImpostoIpi.cstIpi;
					registroC170.vlBcPis = nfeDetalhe.nfeDetalheImpostoPis.valorBaseCalculoPis;
					registroC170.aliqPisPerc = nfeDetalhe.nfeDetalheImpostoPis.aliquotaPisPercentual;
					registroC170.quantBcPis = nfeDetalhe.nfeDetalheImpostoPis.quantidadeVendida;
					registroC170.aliqPisR = nfeDetalhe.nfeDetalheImpostoPis.aliquotaPisReais;
					registroC170.vlPis = nfeDetalhe.nfeDetalheImpostoPis.valorPis;
					registroC170.cstCofins = nfeDetalhe.nfeDetalheImpostoCofins.cstCofins;
					registroC170.vlBcCofins = nfeDetalhe.nfeDetalheImpostoCofins.baseCalculoCofins;
					registroC170.aliqCofinsPerc = nfeDetalhe.nfeDetalheImpostoCofins.aliquotaCofinsPercentual;
					registroC170.quantBcCofins = nfeDetalhe.nfeDetalheImpostoCofins.quantidadeVendida;
					registroC170.aliqCofinsR = nfeDetalhe.nfeDetalheImpostoCofins.aliquotaCofinsReais;
					registroC170.vlCofins = nfeDetalhe.nfeDetalheImpostoCofins.valorCofins;
					registroC170.codCta = "";

					registroC100.registroC170List.push(registroC170);
				});

				// REGISTRO C171: ARMAZENAMENTO DE COMBUSTIVEIS (código 01, 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C172: OPERAÇÕES COM ISSQN (CÓDIGO 01)
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C173: OPERAÇÕES COM MEDICAMENTOS (CÓDIGO 01 e 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C174: OPERAÇÕES COM ARMAS DE FOGO (CÓDIGO 01).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C175: OPERAÇÕES COM VEÍCULOS NOVOS (CÓDIGO 01 e 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C176: RESSARCIMENTO DE ICMS EM OPERAÇÕES COM
				// SUBSTITUIÇÃO TRIBUTÁRIA (CÓDIGO 01, 55).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C177: OPERAÇÕES COM PRODUTOS SUJEITOS A SELO DE
				// CONTROLE IPI.
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C178: OPERAÇÕES COM PRODUTOS SUJEITOS À TRIBUTAÇÀO
				// DE IPI POR UNIDADE OU QUANTIDADE DE PRODUTO.
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C179: INFORMAÇÕES COMPLEMENTARES ST (CÓDIGO 01).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C190: REGISTRO ANALÍTICO DO DOCUMENTO (CÓDIGO 01,
				// 1B, 04 ,55 e 65).

				//this.filtroLocal = "SELECT * FROM view_sped_c190 WHERE ID=" + nfe.id();
				//IList<ViewSpedC190> ListaNfeAnalitico = new NHibernateDAL<ViewSpedC190>(Session).select(new ViewSpedC190());
				let listaNfeAnalitico = [];

				listaNfeAnalitico.forEach(spedC190 => {
					let registroC190 = new RegistroC190();

					registroC190.cstIcms = spedC190.cstIcms;
					registroC190.cfop = spedC190.cfop.toString();
					registroC190.aliqIcms = spedC190.aliquotaIcms;
					registroC190.vlOpr = spedC190.somaValorOperacao;
					registroC190.vlBcIcms = spedC190.somaBaseCalculoIcms;
					registroC190.vlIcms = spedC190.somaValorIcms;
					registroC190.vlBcIcmsSt = spedC190.somaBaseCalculoIcmsSt;
					registroC190.vlIcmsSt = spedC190.somaValorIcmsSt;
					registroC190.vlRedBc = spedC190.somaVlRedBc;
					registroC190.vlIpi = spedC190.somaValorIpi;
					registroC190.codObs = "";

					registroC100.registroC190List.push(registroC190);
				});

				// REGISTRO C195: OBSERVAÇOES DO LANÇAMENTO FISCAL (CÓDIGO 01,
				// 1B E 55)
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C197: OUTRAS OBRIGAÇÕES TRIBUTÁRIAS, AJUSTES E
				// INFORMAÇÕES DE VALORES PROVENIENTES DE DOCUMENTO FISCAL.
				// Implementado a critério do Participante do T2Ti ERP
			});

			// REGISTRO C350: NOTA FISCAL DE VENDA A CONSUMIDOR (CÓDIGO 02)
			/* TODO
			RegistroC350 registroC350;
			for (EcfNotaFiscalCabecalho notaFiscal : listaNf2Cabecalho) {
				registroC350 = new RegistroC350();

				registroC350.ser = notaFiscal.serie;
				registroC350.subSer = notaFiscal.subserie;
				registroC350.numDoc = notaFiscal.numero;
				registroC350.dtDoc = notaFiscal.dataEmissao;
				registroC350.cnpjCpf = notaFiscal.cpfCnpjCliente;
				registroC350.vlMerc = notaFiscal.totalProdutos;
				registroC350.vlDoc = notaFiscal.totalNf;
				registroC350.vlDesc = notaFiscal.desconto;
				registroC350.vlPis = notaFiscal.pis;
				registroC350.vlCofins = notaFiscal.cofins;
				registroC350.codCta = "";

				this.spedT2Ti.blocoC().listaRegistroC350().push(registroC350);

				// REGISTRO C370: ITENS DO DOCUMENTO (CÓDIGO 02)
				List<ViewSpedC370Id> listaC370 = viewC370Dao.beans(ViewSpedC370Id.class, "viewC370.idNfCabecalho", notaFiscal.id;
				RegistroC370 registroC370;
				;
				for (ViewSpedC370Id s : listaC370) {
					registroC370 = new RegistroC370();
					ViewSpedC370 viewC370 = s.viewC370();

					registroC370.numItem = viewC370.item.toString();
					registroC370.codItem = viewC370.idProduto.toString();
					registroC370.qtd = viewC370.quantidade;
					registroC370.unid = viewC370.idUnidadeProduto.toString();
					registroC370.vlItem = viewC370.valorTotal;
					registroC370.vlDesc = viewC370.desconto;

					registroC350.registroC370List().push(registroC370);
				}

				// REGISTRO C390: REGISTRO ANALÍTICO DAS NOTAS FISCAIS DE VENDA
				// A CONSUMIDOR (CÓDIGO 02)
				List<ViewSpedC390Id> listaC390 = viewC390Dao.beans(ViewSpedC390Id.class, "viewC390.dataEmissao", dataInicio, dataFim);
				RegistroC390 registroC390;
				for (ViewSpedC390Id s : listaC390) {
					registroC390 = new RegistroC390();
					ViewSpedC390 viewC390 = s.viewC390();

					registroC390.cstIcms = viewC390.cst;
					registroC390.cfop = viewC390.cfop.toString();
					registroC390.aliqIcms = viewC390.taxaIcms;
					registroC390.vlOpr = viewC390.somaItem;
					registroC390.vlBcIcms = viewC390.somaBaseIcms;
					registroC390.vlIcms = viewC390.somaIcms;
					registroC390.vlRedBc = viewC390.somaIcmsOutras;

					registroC350.registroC390List().push(registroC390);
				}
			}
			*/
		}

		// PERFIL B
		if (this.perfilApresentacao == "B")
		{
			/* TODO
			// REGISTRO C300: RESUMO DIÁRIO DAS NOTAS FISCAIS DE VENDA A
			// CONSUMIDOR (CÓDIGO 02)
			List<ViewSpedC300Id> listaC300 = viewC300Dao.beans(ViewSpedC300Id.class, "viewC300.dataEmissao", dataInicio, dataFim);
			RegistroC300 registroC300;
			RegistroC310 registroC310;
			for (ViewSpedC300Id c300 : listaC300) {
				ViewSpedC300 viewC300 = c300.viewSpedC300();

				registroC300 = new RegistroC300();

				registroC300.codMod = "02";
				registroC300.ser = viewC300.serie;
				registroC300.sub = viewC300.subserie;

				List<EcfNotaFiscalCabecalho> listaEcfNotaFiscal = ecfNotaFiscalCabecalhoDao.beans(dataInicio, dataFim, viewC300.serie(), viewC300.subserie;
				if (!listaEcfNotaFiscal.isEmpty()) {
					registroC300.numDocIni(listaEcfNotaFiscal[0].numero;
					registroC300.numDocFin(listaEcfNotaFiscal.(listaEcfNotaFiscal.size() - 1).numero;
				}

				registroC300.dtDoc = viewC300.dataEmissao;
				registroC300.vlDoc = viewC300.somaTotalNf;
				registroC300.vlPis = viewC300.somaPis;
				registroC300.vlCofins = viewC300.somaCofins;

				// REGISTRO C310: DOCUMENTOS CANCELADOS DE NOTAS FISCAIS DE
				// VENDA A CONSUMIDOR (CÓDIGO 02).
				for (int j = 0; j < listaNf2Cancelada.size(); j++) {
					registroC310 = new RegistroC310();

					registroC310.numDocCanc(listaNf2Cancelada.(j).numero;

					registroC300.registroC310List().push(registroC310);
				}

				// REGISTRO C320: REGISTRO ANALÍTICO DO RESUMO DIÁRIO DAS NOTAS
				// FISCAIS DE VENDA A CONSUMIDOR (CÓDIGO 02). ---> igual ao C390
				List<ViewSpedC390Id> listaC390 = viewC390Dao.beans(ViewSpedC390Id.class, "viewC390.dataEmissao", dataInicio, dataFim);
				RegistroC320 registroC320;
				for (ViewSpedC390Id c390 : listaC390) {
					registroC320 = new RegistroC320();
					ViewSpedC390 viewC390 = c390.viewC390();

					registroC320.cstIcms = viewC390.cst;
					registroC320.cfop = viewC390.cfop.toString();
					registroC320.aliqIcms = viewC390.taxaIcms;
					registroC320.vlOpr = viewC390.somaItem;
					registroC320.vlBcIcms = viewC390.somaBaseIcms;
					registroC320.vlIcms = viewC390.somaIcms;
					registroC320.vlRedBc = viewC390.somaIcmsOutras;

					// REGISTRO C321: ITENS DO RESUMO DIÁRIO DOS DOCUMENTOS
					// (CÓDIGO 02).
					List<ViewSpedC321Id> listaC321 = viewC321Dao.beans(ViewSpedC321Id.class, "viewC321.dataEmissao", dataInicio, dataFim);
					RegistroC321 registroC321;
					for (ViewSpedC321Id c321 : listaC321) {
						registroC321 = new RegistroC321();
						ViewSpedC321 spedC321 = c321.viewC321();

						registroC321.codItem = spedC321.idProduto.toString();
						registroC321.qtd = spedC321.somaQuantidade;
						registroC321.unid = spedC321.descricaoUnidade;
						registroC321.vlItem = spedC321.somaItem;
						registroC321.vlDesc = spedC321.somaDesconto;
						registroC321.vlBcIcms = spedC321.somaBaseIcms;
						registroC321.vlIcms = spedC321.somaIcms;
						registroC321.vlPis = spedC321.somaPis;
						registroC321.vlCofins = spedC321.somaCofins;

						registroC320.registroC321List().push(registroC321);
					}

					registroC300.registroC320List().push(registroC320);
				}

				this.spedT2Ti.blocoC().listaRegistroC300().push(registroC300);
			}
			*/
		}// if (perfil.equals("B")) {

		/* TODO
		// Ambos os Perfis
		// REGISTRO C400: EQUIPAMENTO ECF (CÓDIGO 02, 2D e 60).
		List<EcfImpressora> listaEcf = ecfImpressoraDao.beans(EcfImpressora.class);
		RegistroC400 registroC400;
		for (EcfImpressora ecf : listaEcf) {
			registroC400 = new RegistroC400();

			registroC400.codMod = ecf.modeloDocumentoFiscal;
			registroC400.ecfMod = ecf.modelo;
			registroC400.ecfFab = ecf.serie;
			registroC400.ecfCx = ecf.numero.toString();

			// REGISTRO C405: REDUÇÃO Z (CÓDIGO 02, 2D e 60).
			// verifica se existe movimento no periodo para aquele ECF
			List<EcfR02> listaR02 = ecfR02Dao.beans(EcfR02.class, "idImpressora", ecf.id(), "dataEmissao", dataInicio, dataFim);
			RegistroC405 registroC405;
			for (EcfR02 r02 : listaR02) {
				registroC405 = new RegistroC405();

				registroC405.dtDoc = r02.dataMovimento;
				registroC405.cro = r02.cro;
				registroC405.crz = r02.crz;
				registroC405.numCooFin = r02.coo;
				registroC405.gtFin = r02.grandeTotal;
				registroC405.vlBrt = r02.vendaBruta;

				// REGISTRO C410: PIS E COFINS TOTALIZADOS NO DIA (CÓDIGO 02 e
				// 2D).
				// Implementado a critério do Participante do T2Ti ERP
				// REGISTRO C420: REGISTRO DOS TOTALIZADORES PARCIAIS DA REDUÇÃO
				// Z (COD 02, 2D e 60).
				List<EcfR03> listaR03 = ecfR03Dao.beans(EcfR03.class, "idR02", r02.id;
				RegistroC420 registroC420;
				for (EcfR03 r03 : listaR03) {
					registroC420 = new RegistroC420();

					if (r03.totalizadorParcial().length() == 8) {
						registroC420.codTotPar(r03.totalizadorParcial().substring(1));
					} else {
						registroC420.codTotPar(r03.totalizadorParcial;
					}
					registroC420.vlrAcumTot(r03.valorAcumulado;
					if (r03.totalizadorParcial().length() == 7) {
						registroC420.nrTot(Integer.valueOf(r03.totalizadorParcial().substring(0, 2)));
					} else {
						registroC420.nrTot(0);
					}

					if (perfil.equals("B")) {
						// REGISTRO C425: RESUMO DE ITENS DO MOVIMENTO DIÁRIO
						// (CÓDIGO 02 e 2D).
						List<ViewSpedC425Id> listaC425 = viewC425Dao.beans(dataInicio, dataFim, "%CAN%", "%S%";
						RegistroC425 registroC425;
						for (ViewSpedC425Id c425 : listaC425) {
							registroC425 = new RegistroC425();
							ViewSpedC425 viewC425 = c425.viewC425();

							registroC425.codItem = viewC425.idEcfProduto.toString();
							registroC425.unid = viewC425.descricaoUnidade;
							registroC425.qtd = viewC425.somaQuantidade;
							registroC425.vlItem = viewC425.somaItem;
							registroC425.vlPis = viewC425.somaPis;
							registroC425.vlCofins = viewC425.somaCofins;

							registroC420.registroc425List().push(registroC425);
						}
					}

					registroC405.registroC420List().push(registroC420);
				}

				// se tiver o perfil A, gera o C460 com C470
				if (perfil.equals("A")) {
					// REGISTRO C460: DOCUMENTO FISCAL EMITIDO POR ECF (CÓDIGO
					// 02, 2D e 60).
					List<EcfVendaCabecalho> listaR04 = ecfVendaCabecalhoDao.beans(EcfVendaCabecalho.class, "dataVenda", dataInicio, dataFim);
					RegistroC460 registroC460;
					for (EcfVendaCabecalho r04 : listaR04) {
						registroC460 = new RegistroC460();

						registroC460.codMod("2D";
						if (r04.statusVenda().equals("C")) {
							registroC460.codSit("02";
						} else {
							registroC460.codSit = "00";
							registroC460.dtDoc = r04.dataVenda;
							registroC460.vlDoc = r04.valorFinal;
							registroC460.vlPis = r04.pis;
							registroC460.vlCofins = r04.cofins;
							registroC460.cpfCnpj = r04.cpfCnpjCliente;
							registroC460.nomAdq = r04.nomeCliente;

							// REGISTRO C465: COMPLEMENTO DO CUPOM FISCAL
							// ELETRÔNICO EMITIDO POR ECF – CF-e-ECF (CÓDIGO
							// 60).
							// Implementado a critério do Participante do T2Ti
							// ERP }
							// REGISTRO C470: ITENS DO DOCUMENTO FISCAL EMITIDO
							// POR ECF (CÓDIGO 02 e 2D).
							List<EcfVendaDetalhe> listaR05 = ecfVendaDetalheDao.beans(EcfVendaDetalhe.class, "idEcfVendaCabecalho", r04.id;
							RegistroC470 registroC470;
							for (EcfVendaDetalhe r05 : listaR05) {
								registroC470 = new RegistroC470();

								registroC470.codItem = r05.idEcfProduto.toString();
								registroC470.qtd = r05.quantidade;
								registroC470.qtdCanc = 0;

								Produto produto = produtoDao.bean(r05.idEcfProduto(), Produto.class);

								registroC470.unid = produto.unidadeProduto.id.toString();
								registroC470.vlItem = r05.totalItem;
								registroC470.cstIcms = r05.cst;
								registroC470.cfop = r05.cfop.toString();
								registroC470.aliqIcms = r05.taxaIcms;
								registroC470.vlPis = r05.pis;
								registroC470.vlCofins = r05.cofins;

								registroC460.registroC470List().push(registroC470);
							}
						}
						registroC460.numDoc(r04.coo().toString;

						registroC405.registroC460List().push(registroC460);
					}
				}

				// REGISTRO C490: REGISTRO ANALÍTICO DO MOVIMENTO DIÁRIO (CÓDIGO
				// 02, 2D e 60).
				List<ViewSpedC490Id> listaC490 = viewC490Dao.beans(ViewSpedC490Id.class, "viewC490.dataVenda", dataInicio, dataFim);
				RegistroC490 registroC490;
				for (ViewSpedC490Id c490 : listaC490) {
					registroC490 = new RegistroC490();
					ViewSpedC490 viewC490 = c490.viewC490();

					registroC490.cstIcms = viewC490.cst;
					registroC490.cfop = viewC490.cfop.toString();
					registroC490.aliqIcms = viewC490.taxaIcms;
					registroC490.vlOpr = viewC490.somaItem;
					registroC490.vlBcIcms = viewC490.somaBaseIcms;
					registroC490.vlIcms = viewC490.somaIcms;

					registroC405.registroC490List().push(registroC490);
				}

				// REGISTRO C495: RESUMO MENSAL DE ITENS DO ECF POR
				// ESTABELECIMENTO (CÓDIGO 02 e 2D).
				// Implementado a critério do Participante do T2Ti ERP
				registroC400.registroC405List().push(registroC405);
			}

			// REGISTRO C500: NOTA FISCAL/CONTA DE ENERGIA ELÉTRICA (CÓDIGO 06),
			// NOTA FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E
			// NOTA FISCAL CONSUMO FORNECIMENTO DE GÁS (CÓDIGO 28).
			// REGISTRO C510: ITENS DO DOCUMENTO NOTA FISCAL/CONTA ENERGIA
			// ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO D'ÁGUA
			// CANALIZADA (CÓDIGO 29) E NOTA FISCAL/CONTA DE FORNECIMENTO DE GÁS
			// (CÓDIGO 28).
			// REGISTRO C590: REGISTRO ANALÍTICO DO DOCUMENTO - NOTA
			// FISCAL/CONTA DE ENERGIA ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA
			// DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL
			// CONSUMO FORNECIMENTO DE GÁS (CÓDIGO 28).
			// REGISTRO C600: CONSOLIDAÇÃO DIÁRIA DE NOTAS FISCAIS/CONTAS DE
			// ENERGIA ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA DE FORNECIMENTO
			// D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL/CONTA DE FORNECIMENTO
			// DE GÁS (CÓDIGO 28) (EMPRESAS NÃO OBRIGADAS AO CONVÊNIO ICMS
			// 115/03).
			// REGISTRO C601: DOCUMENTOS CANCELADOS - CONSOLIDAÇÃO DIÁRIA DE
			// NOTAS FISCAIS/CONTAS DE ENERGIA ELÉTRICA (CÓDIGO 06), NOTA
			// FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA
			// FISCAL/CONTA DE FORNECIMENTO DE GÁS (CÓDIGO 28)
			// REGISTRO C610: ITENS DO DOCUMENTO CONSOLIDADO (CÓDIGO 06), NOTA
			// FISCAL/CONTA DE FORNECIMENTO D'ÁGUA CANALIZADA (CÓDIGO 29) E NOTA
			// FISCAL/CONTA DE FORNECIMENTO DE GÁS (CÓDIGO 28) (EMPRESAS NÃO
			// OBRIGADAS AO CONVÊNIO ICMS 115/03).
			// REGISTRO C690: REGISTRO ANALÍTICO DOS DOCUMENTOS (NOTAS
			// FISCAIS/CONTAS DE ENERGIA ELÉTRICA (CÓDIGO 06), NOTA FISCAL/CONTA
			// DE FORNECIMENTO D’ÁGUA CANALIZADA (CÓDIGO 29) E NOTA FISCAL/CONTA
			// DE FORNECIMENTO DE GÁS (CÓDIGO 28)
			// REGISTRO C700: CONSOLIDAÇÃO DOS DOCUMENTOS NF/CONTA ENERGIA
			// ELÉTRICA (CÓD 06), EMITIDAS EM VIA ÚNICA (EMPRESAS OBRIGADAS À
			// ENTREGA DO ARQUIVO PREVISTO NO CONVÊNIO ICMS 115/03) E NOTA
			// FISCAL/CONTA DE FORNECIMENTO DE GÁS CANALIZADO (CÓDIGO 28)
			// REGISTRO C790: REGISTRO ANALÍTICO DOS DOCUMENTOS (CÓDIGOS 06 e
			// 28).
			// REGISTRO C791: REGISTRO DE INFORMAÇÕES DE ST POR UF (COD 06)
			// Implementados a critério do Participante do T2Ti ERP

			// REGISTRO C800: CUPOM FISCAL ELETRÔNICO (CÓDIGO 59)
			// REGISTRO C850: REGISTRO ANALÍTICO DO CF-E (CODIGO 59)
			// REGISTRO C860: IDENTIFICAÇÃO DO EQUIPAMENTO SAT-CF-E
			// REGISTRO C890: RESUMO DIÁRIO DO CF-E (CÓDIGO 59) POR EQUIPAMENTO
			// SATCF-E
			// SERÃO IMPLEMENTADOS QUANDO O SAT FOR CONSTRUIDO

			this.spedT2Ti.blocoC().listaRegistroC400().push(registroC400);
		}
		*/
	}

	//BLOCO E: APURAÇÃO DO ICMS E DO IPI
	async gerarBlocoE() {
		// REGISTRO E001: ABERTURA DO BLOCO E
		this.spedT2Ti.blocoE.registroE001.indMov = 0;

		// REGISTRO E100: PERÍODO DA APURAÇÃO DO ICMS.
		let registroE100 = new RegistroE100();
		registroE100.dtIni = new Date(this.dataFinal);
		registroE100.dtFin = new Date(this.dataFinal);
		this.spedT2Ti.blocoE.listaRegistroE100.push(registroE100);

		// REGISTRO E110: APURAÇÃO DO ICMS – OPERAÇÕES PRÓPRIAS.
		/* TODO
		List<FiscalApuracaoIcms> listaE110 = apuracaoIcmsDao.beans(FiscalApuracaoIcms.class, "competencia", Biblioteca.mesAno(dataInicio));
		FiscalApuracaoIcms v;
		RegistroE110 registroE110;
		if (!listaE110.isEmpty()) {
			registroE110 = new RegistroE110();
			v = listaE110.(0);

			registroE110.vlTotDebitos = v.valorTotalDebito;
			registroE110.vlAjDebitos = v.valorAjusteDebito;
			registroE110.vlTotAjDebitos = v.valorTotalAjusteDebito;
			registroE110.vlEstornosCred = v.valorEstornoCredito;
			registroE110.vlTotCreditos = v.valorTotalCredito;
			registroE110.vlAjCreditos = v.valorAjusteCredito;
			registroE110.vlTotAjCreditos = v.valorTotalAjusteCredito;
			registroE110.vlEstornosDeb = v.valorEstornoDebito;
			registroE110.vlSldCredorAnt = v.valorSaldoCredorAnterior;
			registroE110.vlSldApurado = v.valorSaldoApurado;
			registroE110.vlTotDed = v.valorTotalDeducao;
			registroE110.vlIcmsRecolher = v.valorIcmsRecolher;
			registroE110.vlSldCredorTransportar = v.valorSaldoCredorTransp;
			registroE110.debEsp = v.valorDebitoEspecial;

			// registro E116
			RegistroE116 registroE116 = new RegistroE116();
			registroE116.codOr = "000";
			registroE116.vlOr = v.valorIcmsRecolher;
			registroE116.dtVcto = dataFim);
			registroE116.codRec = "1";
			registroE116.numProc = "";
			registroE116.indProc = "";
			registroE116.proc = "";
			registroE116.txtCompl = "";
			registroE116.mesRef = "";

			registroE110.registroE116List().push(registroE116);

			registroE100.registroE110(registroE110);
		}
		*/
	}

	//BLOCO H: INVENTÁRIO FÍSICO
	async gerarBlocoH() {
		//const connection = getConnection();

		this.spedT2Ti.blocoH.registroH001.indMov = 0;// com dados

		let listaProduto: Produto[]; 
		listaProduto = [];// await this.dataSource.manager.find(Produto);

		let totalGeral = 0;
		for (let i = 0; i < listaProduto.length; i++) {
			totalGeral = totalGeral + (listaProduto[i].valorCompra * listaProduto[i].quantidadeEstoque);
		}

		// REGISTRO H005: TOTAIS DO INVENTÁRIO
		let registroH005 = new RegistroH005();
		registroH005.dtInv = new Date(this.dataFinal);
		registroH005.vlInv = totalGeral;
		registroH005.motInv = "0" + this.inventario;
		this.spedT2Ti.blocoH.listaRegistroH005.push(registroH005);

		for (let i = 0; i < listaProduto.length; i++) {
			let registroH010 = new RegistroH010();

			registroH010.codItem = listaProduto[i].id.toString();
			registroH010.unid = listaProduto[i].produtoUnidade.id.toString();
			registroH010.qtd = listaProduto[i].quantidadeEstoque;
			registroH010.vlUnit = listaProduto[i].valorCompra;
			registroH010.vlItem = listaProduto[i].quantidadeEstoque * listaProduto[i].valorCompra;
			registroH010.indProp = "0";

			registroH005.registroH010List.push(registroH010);
		}

		// REGISTRO H020: Informação complementar do Inventário.
		// Implementado a critério do Participante do T2Ti ERP }
	}

	//BLOCO 1: OUTRAS INFORMAÇÕES
	async gerarBloco1() {
		this.spedT2Ti.bloco1.registro1001.indMov = 0;// com dados

		let registro1010 = new Registro1010();
		registro1010.indExp = "N";
		registro1010.indCcrf = "N";
		registro1010.indComb = "N";
		registro1010.indUsina = "N";
		registro1010.indVa = "N";
		registro1010.indEe = "N";
		registro1010.indCart = "N";
		registro1010.indForm = "N";
		registro1010.indAer = "N";

		this.spedT2Ti.bloco1.listaRegistro1010.push(registro1010);
	}

}