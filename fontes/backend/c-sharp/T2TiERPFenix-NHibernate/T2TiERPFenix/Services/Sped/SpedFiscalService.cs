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
using NHibernate;
using System;
using System.Collections.Generic;
using T2Ti.Lib.Sped.Fiscal;
using T2TiERPFenix.Models;
using T2TiERPFenix.NHibernate;
using T2TiERPFenix.Util;

namespace T2TiERPFenix.Services
{
	public class SpedFiscalService
	{
		private string VersaoLeiaute, FinalidadeArquivo, Inventario, PerfilApresentacao;
		private int IdEmpresa, IdContador;
		private string DataInicial, DataFinal;
		private ISession Session;
		private T2TiSpedFiscal spedT2Ti;

		string consultaSql = "";

		public string GerarSpedFiscal(string filter)
		{
			string[] conteudoFiltro = filter.Split("|");  
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

			DataInicial = conteudoFiltro[0];
			DataFinal = conteudoFiltro[1];
			VersaoLeiaute = conteudoFiltro[2];
			FinalidadeArquivo = conteudoFiltro[3];
			PerfilApresentacao = conteudoFiltro[4];
			IdEmpresa = Convert.ToInt32(conteudoFiltro[5]);
			Inventario = conteudoFiltro[6];
			IdContador = Convert.ToInt32(conteudoFiltro[7]);

			spedT2Ti = new T2TiSpedFiscal();

			using (Session = NHibernateHelper.GetSessionFactory().OpenSession())
			{
				GerarBloco0();
				GerarBlocoC();

				// BLOCO D: DOCUMENTOS FISCAIS II - SERVIÇOS (ICMS).
				// Bloco de registros dos dados relativos à emissão ou ao recebimento de documentos fiscais que acobertam as prestações de serviços de comunicação, transporte intermunicipal e interestadual.
				//{ Não Implementado }

				GerarBlocoE();

				// BLOCO G – CONTROLE DO CRÉDITO DE ICMS DO ATIVO PERMANENTE CIAP
				//{ Não Implementado }

				if (Inventario != "0")
					GerarBlocoH();

				GerarBloco1();
			}

			string nomeArquivo = "C:\\T2Ti\\Sped\\EFD\\sped-fiscal-c.txt";
			spedT2Ti.geraArquivoTxt(nomeArquivo);
			return nomeArquivo;
		}


		#region BLOCO 0: ABERTURA, IDENTIFICAÇÃO E REFERÊNCIAS
		public void GerarBloco0()
		{
			Empresa Empresa = new EmpresaService().ConsultarObjeto(IdEmpresa);

			Contador Contador = new NHibernateDAL<Contador>(Session).SelectId<Contador>(IdContador);

			//consultaSql = "from NfeCabecalho nfe WHERE nfe.DataHoraEmissao BETWEEN " + Biblioteca.QuotedStr(DataInicial) + " and " + Biblioteca.QuotedStr(DataFinal) + ")";
			//IList<NfeCabecalho> ListaNfeCabecalho = new NHibernateDAL<NfeCabecalho>(Session).SelectListaSql<NfeCabecalho>(consultaSql);
			IList<NfeCabecalho> ListaNfeCabecalho = new NHibernateDAL<NfeCabecalho>(Session).Select(new NfeCabecalho());

			List<ProdutoUnidade> ListaProdutoUnidade = new List<ProdutoUnidade>();

			IList<TributOperacaoFiscal> ListaOperacaoFiscal = new NHibernateDAL<TributOperacaoFiscal>(Session).Select(new TributOperacaoFiscal());

			// REGISTRO 0000: ABERTURA DO ARQUIVO DIGITAL E IDENTIFICAÇÃO DA
			// ENTIDADE
			spedT2Ti.bloco0.registro0000.dtIni = Convert.ToDateTime(DataInicial);
			spedT2Ti.bloco0.registro0000.dtFin = Convert.ToDateTime(DataFinal);
			spedT2Ti.bloco0.registro0000.codVer = VersaoLeiaute;
			spedT2Ti.bloco0.registro0000.codFin = FinalidadeArquivo;
			spedT2Ti.bloco0.registro0000.indPerfil = PerfilApresentacao;
			spedT2Ti.bloco0.registro0000.nome = Empresa.RazaoSocial;
			spedT2Ti.bloco0.registro0000.cnpj = Empresa.Cnpj;
			spedT2Ti.bloco0.registro0000.cpf = "";
			spedT2Ti.bloco0.registro0000.ie = Empresa.InscricaoEstadual;
			spedT2Ti.bloco0.registro0000.codMun = Empresa.CodigoIbgeCidade.ToString();
			spedT2Ti.bloco0.registro0000.im = Empresa.InscricaoMunicipal;
			//TODO: spedT2Ti.bloco0.registro0000.Suframa = Empresa.Suframa;
			spedT2Ti.bloco0.registro0000.indAtiv = "1";
			spedT2Ti.bloco0.registro0000.uf = Empresa.EnderecoPrincipal.Uf;

			// REGISTRO 0001: ABERTURA DO BLOCO 0
			spedT2Ti.bloco0.registro0001.indMov = 0;


			// REGISTRO 0005: DADOS COMPLEMENTARES DA ENTIDADE
			spedT2Ti.bloco0.registro0005.fantasia = Empresa.NomeFantasia;
			spedT2Ti.bloco0.registro0005.cep = Empresa.EnderecoPrincipal.Cep;
			spedT2Ti.bloco0.registro0005.endereco = Empresa.EnderecoPrincipal.Logradouro;
			spedT2Ti.bloco0.registro0005.num = Empresa.EnderecoPrincipal.Numero;
			spedT2Ti.bloco0.registro0005.compl = Empresa.EnderecoPrincipal.Complemento;
			spedT2Ti.bloco0.registro0005.bairro = Empresa.EnderecoPrincipal.Bairro;
			//TODO: spedT2Ti.bloco0.registro0005.fone = Empresa.EnderecoPrincipal.Fone;
			//TODO: spedT2Ti.bloco0.registro0005.fax = Empresa.EnderecoPrincipal.Fone;
			spedT2Ti.bloco0.registro0005.email = Empresa.Email;


			// REGISTRO 0015: DADOS DO CONTRIBUINTE SUBSTITUTO
			// Implementado a critério do Participante do T2Ti ERP
			// REGISTRO 0100: DADOS DO CONTABILISTA
			// TODO
			spedT2Ti.bloco0.registro0100.nome = "contador.Nome = )";
			spedT2Ti.bloco0.registro0100.cpf = "contador.Cpf = )";
			spedT2Ti.bloco0.registro0100.crc = Contador.CrcInscricao;
			spedT2Ti.bloco0.registro0100.cep = "contador.Cep = )";
			spedT2Ti.bloco0.registro0100.endereco = "contador.Logradouro = )";
			spedT2Ti.bloco0.registro0100.num = "contador.Numero = )";
			spedT2Ti.bloco0.registro0100.compl = "contador.Complemento = )";
			spedT2Ti.bloco0.registro0100.bairro = "contador.Bairro = )";
			spedT2Ti.bloco0.registro0100.fone = "contador.Fone = )";
			spedT2Ti.bloco0.registro0100.fax = "contador.Fax = )";
			spedT2Ti.bloco0.registro0100.email = "contador.Email = )";
			spedT2Ti.bloco0.registro0100.codMun = 123;

			// REGISTRO 0150: TABELA DE CADASTRO DO PARTICIPANTE
			/*
             * Deverão ser informados somente os participantes que tiveram
             * movimentação no período de referência da EFD, não sendo necessário
             * informar os CNPJs e CPFs citados nos registros C350 e C460
             * [adquirentes nas operações acobertadas com nota fiscal de venda a
             * consumidor ou cupom fiscal]
             */
			Registro0150 registro0150;
			NfeEmitente Emitente;
			NfeDestinatario Destinatario;
			foreach (NfeCabecalho c in ListaNfeCabecalho)
			{
				registro0150 = new Registro0150();
				Emitente = c.NfeEmitente;

				if (Emitente != null)
				{
					registro0150.codPart = "F" + Emitente.NfeCabecalho.Fornecedor.Id;
					registro0150.nome = Emitente.Nome;
					registro0150.codPais = "01058";
					registro0150.cpf = Emitente.Cpf;
					registro0150.cnpj = Emitente.Cnpj;
					registro0150.codMun = Emitente.CodigoMunicipio.Value;
					// TODO: registro0150.suframa = Convert.ToString(Emitente.Suframa);
					registro0150.endereco = Emitente.Logradouro;
					registro0150.num = Emitente.Numero;
					registro0150.compl = Emitente.Complemento;
					registro0150.bairro = Emitente.Bairro;
				}

				spedT2Ti.bloco0.IListaRegistro0150.Add(registro0150);

				registro0150 = new Registro0150();
				Destinatario = c.NfeDestinatario;

				if (Destinatario != null)
				{
					registro0150.codPart = "C" + Destinatario.NfeCabecalho.Cliente.Id;
					registro0150.nome = Destinatario.Nome;
					registro0150.codPais = "01058";
					registro0150.cpf = Destinatario.Cpf;
					registro0150.cnpj = Destinatario.Cnpj;
					registro0150.codMun = Destinatario.CodigoMunicipio.Value;
					//registro0150.suframa = Destinatario.Suframa.Value.ToString();
					registro0150.endereco = Destinatario.Logradouro;
					registro0150.num = Destinatario.Numero;
					registro0150.compl = Destinatario.Complemento;
					registro0150.bairro = Destinatario.Bairro;
				}

				spedT2Ti.bloco0.IListaRegistro0150.Add(registro0150);

				// REGISTRO 0175: ALTERAÇÃO DA TABELA DE CADASTRO DE PARTICIPANTE
				// Pegar os dados de PESSOA_ALTERACAO para gerar o registro 0175

				// registro 0200
				foreach (NfeDetalhe nfeDetalhe in c.ListaNfeDetalhe)
				{
					Registro0200 registro0200 = new Registro0200();
					Produto produto = new Produto();//nfeDetalhe.Produto;

					registro0200.codItem = produto.Id.ToString();
					registro0200.descrItem = produto.Descricao;
					registro0200.codBarra = produto.Gtin;
					// TEM QUE PREENCHER PARA INFORMAR NO 0205
					registro0200.codAntItem = "";
					registro0200.unidInv = produto.ProdutoUnidade.Id.ToString();
					// TODO: registro0200.tipoItem = produto.TipoItemSped;
					registro0200.codNcm = produto.CodigoNcm;
					// TODO: registro0200.exIpi = produto.ExTipi;
					registro0200.codGen = Biblioteca.Right(produto.CodigoNcm, 2);
					// TODO: registro0200.codLst = produto.CodigoLst;
					// TODO: registro0200.aliqIcms = produto.AliquotaIcmsPaf;

					//if (!listaProdutoUnidade.contains(produto.ProdutoUnidade()))
					//{
					//    listaProdutoUnidade.add(produto.ProdutoUnidade;
					//}

					// REGISTRO 0205: ALTERAÇÃO DO ITEM
					/* TODO
                    List<ProdutoAlteracaoItem> listaProdutoAlteracaoItem = alteracaoItemDao.Beans(ProdutoAlteracaoItem.class, "produto", produto, "dataInicial", dataInicio, dataFim);
                    Registro0205 registro0205;
                    for (ProdutoAlteracaoItem produtoAlteracaoItem : listaProdutoAlteracaoItem) {
                        registro0205 = new Registro0205();

                        registro0205.descrAntItem = produtoAlteracaoItem.Nome;
                        registro0205.dtIni = produtoAlteracaoItem.DataInicial;
                        registro0205.dtFin = produtoAlteracaoItem.DataFinal;
                        registro0205.codAntItem = produtoAlteracaoItem.Codigo;

                        registro0200.Registro0205List().add(registro0205);
                    }
                    */

					// REGISTRO 0206: CÓDIGO DE PRODUTO CONFORME TABELA PUBLICADA
					// PELA ANP (COMBUSTÍVEIS)
					// Implementado a critério do Participante do T2Ti ERP
					// REGISTRO 0210: CONSUMO ESPECÍFICO PADRONIZADO
					// Implementado a critério do Participante do T2Ti ERP
					// REGISTRO 0220: FATORES DE CONVERSÃO DE UNIDADES
					/* TODO
                    UnidadeConversao unidadeConversao = produto.UnidadeConversao();
                    if (unidadeConversao != null) {
                        Registro0220 registro0220 = new Registro0220();
                        registro0220.unidConv = unidadeConversao.Produto.UnidadeProduto.Id.ToString();
                        registro0220.fatConv = unidadeConversao.FatorConversao;

                        registro0200.Registro0220List().add(registro0220);
                    }
                    */
				}
			}

			// REGISTRO 0190: IDENTIFICAÇÃO DAS UNIDADES DE MEDIDA
			Registro0190 registro0190;
			foreach (ProdutoUnidade unidade in ListaProdutoUnidade)
			{
				registro0190 = new Registro0190();

				registro0190.unid = unidade.Id.ToString();
				registro0190.descr = unidade.Sigla;

				spedT2Ti.bloco0.IListaRegistro0190.Add(registro0190);
			}

			// REGISTRO 0300: CADASTRO DE BENS OU COMPONENTES DO ATIVO IMOBILIZADO
			// REGISTRO 0305: INFORMAÇÃO SOBRE A UTILIZAÇÃO DO BEM
			// Implementado a critério do Participante do T2Ti ERP - versão 1.0 não
			// possui controle CIAP
			// REGISTRO 0400: TABELA DE NATUREZA DA OPERAÇÃO/PRESTAÇÃO
			Registro0400 registro0400;
			foreach (TributOperacaoFiscal operacaoFiscal in ListaOperacaoFiscal)
			{
				registro0400 = new Registro0400();

				registro0400.codNat = operacaoFiscal.Id.ToString();
				registro0400.descrNat = operacaoFiscal.DescricaoNaNf;
			}

			// REGISTRO 0450: TABELA DE INFORMAÇÃO COMPLEMENTAR DO DOCUMENTO FISCAL
			// Implementado a critério do Participante do T2Ti ERP
			// REGISTRO 0460: TABELA DE OBSERVAÇÕES DO LANÇAMENTO FISCAL
			// Implementado a critério do Participante do T2Ti ERP
			// REGISTRO 0500: PLANO DE CONTAS CONTÁBEIS
			// Implementado a critério do Participante do T2Ti ERP
			// REGISTRO 0600: CENTRO DE CUSTOS
			// Implementado a critério do Participante do T2Ti ERP		

		}
		#endregion

		#region BLOCO C: DOCUMENTOS FISCAIS I - MERCADORIAS (ICMS/IPI)
		public void GerarBlocoC()
		{
			IList<NfeCabecalho> ListaNfeCabecalho = new NHibernateDAL<NfeCabecalho>(Session).Select(new NfeCabecalho());

			// TODO: List<EcfNotaFiscalCabecalho> listaNf2Cabecalho = nf2Dao.Beans(EcfNotaFiscalCabecalho.class, "dataEmissao", dataInicio, dataFim);

			// TODO: List<EcfNotaFiscalCabecalho> listaNf2Cancelada = nf2Dao.Beans(EcfNotaFiscalCabecalho.class, "cancelada", "S", "dataEmissao", dataInicio, dataFim);

			// PERFIL A
			if (PerfilApresentacao.Equals("A"))
			{
				// REGISTRO C100: NOTA FISCAL (CÓDIGO 01), NOTA FISCAL AVULSA
				// (CÓDIGO 1B), NOTA FISCAL DE PRODUTOR (CÓDIGO 04), NF-e (CÓDIGO
				// 55) e NFC-e (CÓDIGO 65)
				RegistroC100 registroC100;
				foreach (NfeCabecalho nfe in ListaNfeCabecalho)
				{
					registroC100 = new RegistroC100();

					registroC100.indOper = nfe.TipoOperacao;
					registroC100.indEmit = "0"; // 0 - Emissao Propria
					if (nfe.Cliente != null)
					{
						registroC100.codPart = "C" + nfe.Cliente.Id.ToString();
					}
					else if (nfe.Fornecedor != null)
					{
						registroC100.codPart = "F" + nfe.Fornecedor.Id.ToString();
					}
					registroC100.codMod = nfe.CodigoModelo;

					/*
					 * 4.1.2- Tabela Situação do Documento Código Descrição 00
					 * Documento regular 01 Documento regular extemporâneo 02
					 * Documento cancelado 03 Documento cancelado extemporâneo 04
					 * NFe denegada 05 Nfe – Numeração inutilizada 06 Documento
					 * Fiscal Complementar 07 Documento Fiscal Complementar
					 * extemporâneo. 08 Documento Fiscal emitido com base em Regime
					 * Especial ou Norma Específica
					 */
					if (nfe.StatusNota.Equals("5"))
					{
						registroC100.codSit = "00";
					}
					else if (nfe.StatusNota.Equals("6"))
					{
						registroC100.codSit = "02";
					}
					registroC100.ser = nfe.Serie;
					registroC100.numDoc = nfe.Numero;
					registroC100.chvNfe = nfe.ChaveAcesso;
					registroC100.dtDoc = nfe.DataHoraEmissao;
					registroC100.dtES = nfe.DataHoraEntradaSaida;
					registroC100.vlDoc = nfe.ValorTotal;
					// TODO: registroC100.indPgto = Convert.ToString(nfe.IndicadorFormaPagamento);
					registroC100.vlDesc = nfe.ValorDesconto;
					registroC100.vlAbatNt = 0;
					registroC100.vlMerc = nfe.ValorTotalProdutos;

					NfeTransporte transporte = nfe.NfeTransporte;
					if (transporte != null)
					{
						registroC100.indFrt = transporte.ModalidadeFrete;
					}

					registroC100.vlFrt = nfe.ValorFrete;
					registroC100.vlSeg = nfe.ValorSeguro;
					registroC100.vlOutDa = nfe.ValorDespesasAcessorias;
					registroC100.vlBcIcms = nfe.BaseCalculoIcms;
					registroC100.vlIcms = nfe.ValorIcms;
					registroC100.vlBcIcmsSt = nfe.BaseCalculoIcmsSt;
					registroC100.vlIcmsSt = nfe.ValorIcmsSt;
					registroC100.vlIpi = nfe.ValorIpi;
					registroC100.vlPis = nfe.ValorPis;
					registroC100.vlPisSt = 0;
					registroC100.vlCofins = nfe.ValorCofins;
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
					RegistroC114 registroC114;
					foreach (NfeCupomFiscalReferenciado cupomFiscal in nfe.ListaNfeCupomFiscalReferenciado)
					{
						registroC114 = new RegistroC114();

						registroC114.codMod = cupomFiscal.ModeloDocumentoFiscal;
						registroC114.ecfFab = cupomFiscal.NumeroSerieEcf;
						registroC114.ecfCx = cupomFiscal.NumeroCaixa.ToString();
						registroC114.numDoc = cupomFiscal.Coo.ToString();
						registroC114.dtDoc = cupomFiscal.DataEmissaoCupom;

						spedT2Ti.blocoC.IListaRegistroC114.Add(registroC114);
					}

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
					RegistroC170 registroC170;
					foreach (NfeDetalhe nfeDetalhe in nfe.ListaNfeDetalhe)
					{
						registroC170 = new RegistroC170();

						registroC170.numItem = nfeDetalhe.NumeroItem.ToString();
						registroC170.codItem = nfeDetalhe.Gtin;
						registroC170.descrCompl = nfeDetalhe.NomeProduto;
						registroC170.qtd = nfeDetalhe.QuantidadeComercial;
						registroC170.unid = "";// nfeDetalhe.Produto.ProdutoUnidade.Id.ToString();
						registroC170.vlItem = nfeDetalhe.ValorTotal;
						registroC170.vlDesc = nfeDetalhe.ValorDesconto;
						registroC170.indMov = 0;
						registroC170.cstIcms = nfeDetalhe.NfeDetalheImpostoIcms.CstIcms;
						registroC170.cfop = nfeDetalhe.Cfop.ToString();
						registroC170.codNat = nfeDetalhe.NfeCabecalho.TributOperacaoFiscal.Id.ToString();
						registroC170.vlBcIcms = nfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcms;
						registroC170.aliqIcms = nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms;
						registroC170.vlIcms = nfeDetalhe.NfeDetalheImpostoIcms.ValorIcms;
						registroC170.vlBcIcmsSt = nfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt;
						registroC170.aliqSt = nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt;
						registroC170.vlIcmsSt = nfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt;
						registroC170.indApur = 0;
						registroC170.cstIpi = nfeDetalhe.NfeDetalheImpostoIpi.CstIpi;
						//TODO: registroC170.codEnq = nfeDetalhe.NfeDetalheImpostoIpi.EnquadramentoIpi;
						registroC170.vlBcIpi = nfeDetalhe.NfeDetalheImpostoIpi.ValorBaseCalculoIpi;
						registroC170.aliqIpi = nfeDetalhe.NfeDetalheImpostoIpi.AliquotaIpi;
						registroC170.vlIpi = nfeDetalhe.NfeDetalheImpostoIpi.ValorIpi;
						registroC170.cstPis = nfeDetalhe.NfeDetalheImpostoIpi.CstIpi;
						registroC170.vlBcPis = nfeDetalhe.NfeDetalheImpostoPis.ValorBaseCalculoPis;
						registroC170.aliqPisPerc = nfeDetalhe.NfeDetalheImpostoPis.AliquotaPisPercentual;
						registroC170.quantBcPis = nfeDetalhe.NfeDetalheImpostoPis.QuantidadeVendida;
						registroC170.aliqPisR = nfeDetalhe.NfeDetalheImpostoPis.AliquotaPisReais;
						registroC170.vlPis = nfeDetalhe.NfeDetalheImpostoPis.ValorPis;
						registroC170.cstCofins = nfeDetalhe.NfeDetalheImpostoCofins.CstCofins;
						registroC170.vlBcCofins = nfeDetalhe.NfeDetalheImpostoCofins.BaseCalculoCofins;
						registroC170.aliqCofinsPerc = nfeDetalhe.NfeDetalheImpostoCofins.AliquotaCofinsPercentual;
						registroC170.quantBcCofins = nfeDetalhe.NfeDetalheImpostoCofins.QuantidadeVendida;
						registroC170.aliqCofinsR = nfeDetalhe.NfeDetalheImpostoCofins.AliquotaCofinsReais;
						registroC170.vlCofins = nfeDetalhe.NfeDetalheImpostoCofins.ValorCofins;
						registroC170.codCta = "";

						registroC100.registroC170IList.Add(registroC170);
					}

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

					//this.filtroLocal = "SELECT * FROM view_sped_c190 WHERE ID=" + nfe.Id();
					IList<ViewSpedC190> ListaNfeAnalitico = new NHibernateDAL<ViewSpedC190>(Session).Select(new ViewSpedC190());

					RegistroC190 registroC190;
					foreach (ViewSpedC190 spedC190 in ListaNfeAnalitico)
					{
						registroC190 = new RegistroC190();

						registroC190.cstIcms = spedC190.CstIcms;
						registroC190.cfop = spedC190.Cfop.ToString();
						registroC190.aliqIcms = spedC190.AliquotaIcms;
						registroC190.vlOpr = spedC190.SomaValorOperacao;
						registroC190.vlBcIcms = spedC190.SomaBaseCalculoIcms;
						registroC190.vlIcms = spedC190.SomaValorIcms;
						registroC190.vlBcIcmsSt = spedC190.SomaBaseCalculoIcmsSt;
						registroC190.vlIcmsSt = spedC190.SomaValorIcmsSt;
						registroC190.vlRedBc = spedC190.SomaVlRedBc;
						registroC190.vlIpi = spedC190.SomaValorIpi;
						registroC190.codObs = "";

						registroC100.registroC190IList.Add(registroC190);
					}

					// REGISTRO C195: OBSERVAÇOES DO LANÇAMENTO FISCAL (CÓDIGO 01,
					// 1B E 55)
					// Implementado a critério do Participante do T2Ti ERP
					// REGISTRO C197: OUTRAS OBRIGAÇÕES TRIBUTÁRIAS, AJUSTES E
					// INFORMAÇÕES DE VALORES PROVENIENTES DE DOCUMENTO FISCAL.
					// Implementado a critério do Participante do T2Ti ERP
				}

				// REGISTRO C350: NOTA FISCAL DE VENDA A CONSUMIDOR (CÓDIGO 02)
				/* TODO
				RegistroC350 registroC350;
				for (EcfNotaFiscalCabecalho notaFiscal : listaNf2Cabecalho) {
					registroC350 = new RegistroC350();

					registroC350.ser = notaFiscal.Serie;
					registroC350.subSer = notaFiscal.Subserie;
					registroC350.numDoc = notaFiscal.Numero;
					registroC350.dtDoc = notaFiscal.DataEmissao;
					registroC350.cnpjCpf = notaFiscal.CpfCnpjCliente;
					registroC350.vlMerc = notaFiscal.TotalProdutos;
					registroC350.vlDoc = notaFiscal.TotalNf;
					registroC350.vlDesc = notaFiscal.Desconto;
					registroC350.vlPis = notaFiscal.Pis;
					registroC350.vlCofins = notaFiscal.Cofins;
					registroC350.codCta = "";

					spedT2Ti.blocoC().ListaRegistroC350().add(registroC350);

					// REGISTRO C370: ITENS DO DOCUMENTO (CÓDIGO 02)
					List<ViewSpedC370Id> listaC370 = viewC370Dao.Beans(ViewSpedC370Id.class, "viewC370.idNfCabecalho", notaFiscal.Id;
					RegistroC370 registroC370;
					;
					for (ViewSpedC370Id s : listaC370) {
						registroC370 = new RegistroC370();
						ViewSpedC370 viewC370 = s.ViewC370();

						registroC370.numItem = viewC370.Item.ToString();
						registroC370.codItem = viewC370.IdProduto.ToString();
						registroC370.qtd = viewC370.Quantidade;
						registroC370.unid = viewC370.IdUnidadeProduto.ToString();
						registroC370.vlItem = viewC370.ValorTotal;
						registroC370.vlDesc = viewC370.Desconto;

						registroC350.RegistroC370List().add(registroC370);
					}

					// REGISTRO C390: REGISTRO ANALÍTICO DAS NOTAS FISCAIS DE VENDA
					// A CONSUMIDOR (CÓDIGO 02)
					List<ViewSpedC390Id> listaC390 = viewC390Dao.Beans(ViewSpedC390Id.class, "viewC390.dataEmissao", dataInicio, dataFim);
					RegistroC390 registroC390;
					for (ViewSpedC390Id s : listaC390) {
						registroC390 = new RegistroC390();
						ViewSpedC390 viewC390 = s.ViewC390();

						registroC390.cstIcms = viewC390.Cst;
						registroC390.cfop = viewC390.Cfop.ToString();
						registroC390.aliqIcms = viewC390.TaxaIcms;
						registroC390.vlOpr = viewC390.SomaItem;
						registroC390.vlBcIcms = viewC390.SomaBaseIcms;
						registroC390.vlIcms = viewC390.SomaIcms;
						registroC390.vlRedBc = viewC390.SomaIcmsOutras;

						registroC350.RegistroC390List().add(registroC390);
					}
				}
				*/
			}

			// PERFIL B
			if (PerfilApresentacao.Equals("B"))
			{
				/* TODO
				// REGISTRO C300: RESUMO DIÁRIO DAS NOTAS FISCAIS DE VENDA A
				// CONSUMIDOR (CÓDIGO 02)
				List<ViewSpedC300Id> listaC300 = viewC300Dao.Beans(ViewSpedC300Id.class, "viewC300.dataEmissao", dataInicio, dataFim);
				RegistroC300 registroC300;
				RegistroC310 registroC310;
				for (ViewSpedC300Id c300 : listaC300) {
					ViewSpedC300 viewC300 = c300.ViewSpedC300();

					registroC300 = new RegistroC300();

					registroC300.codMod = "02";
					registroC300.ser = viewC300.Serie;
					registroC300.sub = viewC300.Subserie;

					List<EcfNotaFiscalCabecalho> listaEcfNotaFiscal = ecfNotaFiscalCabecalhoDao.Beans(dataInicio, dataFim, viewC300.Serie(), viewC300.Subserie;
					if (!listaEcfNotaFiscal.isEmpty()) {
						registroC300.numDocIni(listaEcfNotaFiscal[0].Numero;
						registroC300.numDocFin(listaEcfNotaFiscal.(listaEcfNotaFiscal.size() - 1).Numero;
					}

					registroC300.dtDoc = viewC300.DataEmissao;
					registroC300.vlDoc = viewC300.SomaTotalNf;
					registroC300.vlPis = viewC300.SomaPis;
					registroC300.vlCofins = viewC300.SomaCofins;

					// REGISTRO C310: DOCUMENTOS CANCELADOS DE NOTAS FISCAIS DE
					// VENDA A CONSUMIDOR (CÓDIGO 02).
					for (int j = 0; j < listaNf2Cancelada.size(); j++) {
						registroC310 = new RegistroC310();

						registroC310.numDocCanc(listaNf2Cancelada.(j).Numero;

						registroC300.RegistroC310List().add(registroC310);
					}

					// REGISTRO C320: REGISTRO ANALÍTICO DO RESUMO DIÁRIO DAS NOTAS
					// FISCAIS DE VENDA A CONSUMIDOR (CÓDIGO 02). ---> igual ao C390
					List<ViewSpedC390Id> listaC390 = viewC390Dao.Beans(ViewSpedC390Id.class, "viewC390.dataEmissao", dataInicio, dataFim);
					RegistroC320 registroC320;
					for (ViewSpedC390Id c390 : listaC390) {
						registroC320 = new RegistroC320();
						ViewSpedC390 viewC390 = c390.ViewC390();

						registroC320.cstIcms = viewC390.Cst;
						registroC320.cfop = viewC390.Cfop.ToString();
						registroC320.aliqIcms = viewC390.TaxaIcms;
						registroC320.vlOpr = viewC390.SomaItem;
						registroC320.vlBcIcms = viewC390.SomaBaseIcms;
						registroC320.vlIcms = viewC390.SomaIcms;
						registroC320.vlRedBc = viewC390.SomaIcmsOutras;

						// REGISTRO C321: ITENS DO RESUMO DIÁRIO DOS DOCUMENTOS
						// (CÓDIGO 02).
						List<ViewSpedC321Id> listaC321 = viewC321Dao.Beans(ViewSpedC321Id.class, "viewC321.dataEmissao", dataInicio, dataFim);
						RegistroC321 registroC321;
						for (ViewSpedC321Id c321 : listaC321) {
							registroC321 = new RegistroC321();
							ViewSpedC321 spedC321 = c321.ViewC321();

							registroC321.codItem = spedC321.IdProduto.ToString();
							registroC321.qtd = spedC321.SomaQuantidade;
							registroC321.unid = spedC321.DescricaoUnidade;
							registroC321.vlItem = spedC321.SomaItem;
							registroC321.vlDesc = spedC321.SomaDesconto;
							registroC321.vlBcIcms = spedC321.SomaBaseIcms;
							registroC321.vlIcms = spedC321.SomaIcms;
							registroC321.vlPis = spedC321.SomaPis;
							registroC321.vlCofins = spedC321.SomaCofins;

							registroC320.RegistroC321List().add(registroC321);
						}

						registroC300.RegistroC320List().add(registroC320);
					}

					spedT2Ti.blocoC().ListaRegistroC300().add(registroC300);
				}
				*/
			}// if (perfil.equals("B")) {

			/* TODO
			// Ambos os Perfis
			// REGISTRO C400: EQUIPAMENTO ECF (CÓDIGO 02, 2D e 60).
			List<EcfImpressora> listaEcf = ecfImpressoraDao.Beans(EcfImpressora.class);
			RegistroC400 registroC400;
			for (EcfImpressora ecf : listaEcf) {
				registroC400 = new RegistroC400();

				registroC400.codMod = ecf.ModeloDocumentoFiscal;
				registroC400.ecfMod = ecf.Modelo;
				registroC400.ecfFab = ecf.Serie;
				registroC400.ecfCx = ecf.Numero.ToString();

				// REGISTRO C405: REDUÇÃO Z (CÓDIGO 02, 2D e 60).
				// verifica se existe movimento no periodo para aquele ECF
				List<EcfR02> listaR02 = ecfR02Dao.Beans(EcfR02.class, "idImpressora", ecf.Id(), "dataEmissao", dataInicio, dataFim);
				RegistroC405 registroC405;
				for (EcfR02 r02 : listaR02) {
					registroC405 = new RegistroC405();

					registroC405.dtDoc = r02.DataMovimento;
					registroC405.cro = r02.Cro;
					registroC405.crz = r02.Crz;
					registroC405.numCooFin = r02.Coo;
					registroC405.gtFin = r02.GrandeTotal;
					registroC405.vlBrt = r02.VendaBruta;

					// REGISTRO C410: PIS E COFINS TOTALIZADOS NO DIA (CÓDIGO 02 e
					// 2D).
					// Implementado a critério do Participante do T2Ti ERP
					// REGISTRO C420: REGISTRO DOS TOTALIZADORES PARCIAIS DA REDUÇÃO
					// Z (COD 02, 2D e 60).
					List<EcfR03> listaR03 = ecfR03Dao.Beans(EcfR03.class, "idR02", r02.Id;
					RegistroC420 registroC420;
					for (EcfR03 r03 : listaR03) {
						registroC420 = new RegistroC420();

						if (r03.TotalizadorParcial().length() == 8) {
							registroC420.codTotPar(r03.TotalizadorParcial().substring(1));
						} else {
							registroC420.codTotPar(r03.TotalizadorParcial;
						}
						registroC420.vlrAcumTot(r03.ValorAcumulado;
						if (r03.TotalizadorParcial().length() == 7) {
							registroC420.nrTot(Integer.valueOf(r03.TotalizadorParcial().substring(0, 2)));
						} else {
							registroC420.nrTot(0);
						}

						if (perfil.equals("B")) {
							// REGISTRO C425: RESUMO DE ITENS DO MOVIMENTO DIÁRIO
							// (CÓDIGO 02 e 2D).
							List<ViewSpedC425Id> listaC425 = viewC425Dao.Beans(dataInicio, dataFim, "%CAN%", "%S%";
							RegistroC425 registroC425;
							for (ViewSpedC425Id c425 : listaC425) {
								registroC425 = new RegistroC425();
								ViewSpedC425 viewC425 = c425.ViewC425();

								registroC425.codItem = viewC425.IdEcfProduto.ToString();
								registroC425.unid = viewC425.DescricaoUnidade;
								registroC425.qtd = viewC425.SomaQuantidade;
								registroC425.vlItem = viewC425.SomaItem;
								registroC425.vlPis = viewC425.SomaPis;
								registroC425.vlCofins = viewC425.SomaCofins;

								registroC420.Registroc425List().add(registroC425);
							}
						}

						registroC405.RegistroC420List().add(registroC420);
					}

					// se tiver o perfil A, gera o C460 com C470
					if (perfil.equals("A")) {
						// REGISTRO C460: DOCUMENTO FISCAL EMITIDO POR ECF (CÓDIGO
						// 02, 2D e 60).
						List<EcfVendaCabecalho> listaR04 = ecfVendaCabecalhoDao.Beans(EcfVendaCabecalho.class, "dataVenda", dataInicio, dataFim);
						RegistroC460 registroC460;
						for (EcfVendaCabecalho r04 : listaR04) {
							registroC460 = new RegistroC460();

							registroC460.codMod("2D";
							if (r04.StatusVenda().equals("C")) {
								registroC460.codSit("02";
							} else {
								registroC460.codSit = "00";
								registroC460.dtDoc = r04.DataVenda;
								registroC460.vlDoc = r04.ValorFinal;
								registroC460.vlPis = r04.Pis;
								registroC460.vlCofins = r04.Cofins;
								registroC460.cpfCnpj = r04.CpfCnpjCliente;
								registroC460.nomAdq = r04.NomeCliente;

								// REGISTRO C465: COMPLEMENTO DO CUPOM FISCAL
								// ELETRÔNICO EMITIDO POR ECF – CF-e-ECF (CÓDIGO
								// 60).
								// Implementado a critério do Participante do T2Ti
								// ERP }
								// REGISTRO C470: ITENS DO DOCUMENTO FISCAL EMITIDO
								// POR ECF (CÓDIGO 02 e 2D).
								List<EcfVendaDetalhe> listaR05 = ecfVendaDetalheDao.Beans(EcfVendaDetalhe.class, "idEcfVendaCabecalho", r04.Id;
								RegistroC470 registroC470;
								for (EcfVendaDetalhe r05 : listaR05) {
									registroC470 = new RegistroC470();

									registroC470.codItem = r05.IdEcfProduto.ToString();
									registroC470.qtd = r05.Quantidade;
									registroC470.qtdCanc = 0;

									Produto produto = produtoDao.Bean(r05.IdEcfProduto(), Produto.class);

									registroC470.unid = produto.UnidadeProduto.Id.ToString();
									registroC470.vlItem = r05.TotalItem;
									registroC470.cstIcms = r05.Cst;
									registroC470.cfop = r05.Cfop.ToString();
									registroC470.aliqIcms = r05.TaxaIcms;
									registroC470.vlPis = r05.Pis;
									registroC470.vlCofins = r05.Cofins;

									registroC460.RegistroC470List().add(registroC470);
								}
							}
							registroC460.numDoc(r04.Coo().toString;

							registroC405.RegistroC460List().add(registroC460);
						}
					}

					// REGISTRO C490: REGISTRO ANALÍTICO DO MOVIMENTO DIÁRIO (CÓDIGO
					// 02, 2D e 60).
					List<ViewSpedC490Id> listaC490 = viewC490Dao.Beans(ViewSpedC490Id.class, "viewC490.dataVenda", dataInicio, dataFim);
					RegistroC490 registroC490;
					for (ViewSpedC490Id c490 : listaC490) {
						registroC490 = new RegistroC490();
						ViewSpedC490 viewC490 = c490.ViewC490();

						registroC490.cstIcms = viewC490.Cst;
						registroC490.cfop = viewC490.Cfop.ToString();
						registroC490.aliqIcms = viewC490.TaxaIcms;
						registroC490.vlOpr = viewC490.SomaItem;
						registroC490.vlBcIcms = viewC490.SomaBaseIcms;
						registroC490.vlIcms = viewC490.SomaIcms;

						registroC405.RegistroC490List().add(registroC490);
					}

					// REGISTRO C495: RESUMO MENSAL DE ITENS DO ECF POR
					// ESTABELECIMENTO (CÓDIGO 02 e 2D).
					// Implementado a critério do Participante do T2Ti ERP
					registroC400.RegistroC405List().add(registroC405);
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

				spedT2Ti.blocoC().ListaRegistroC400().add(registroC400);
			}
			*/
		}
		#endregion

		#region BLOCO E: APURAÇÃO DO ICMS E DO IPI
		public void GerarBlocoE()
		{
			// REGISTRO E001: ABERTURA DO BLOCO E
			spedT2Ti.blocoE.registroE001.indMov = 0;

			// REGISTRO E100: PERÍODO DA APURAÇÃO DO ICMS.
			RegistroE100 registroE100 = new RegistroE100();
			registroE100.dtIni = Convert.ToDateTime(DataInicial);
			registroE100.dtFin = Convert.ToDateTime(DataFinal);
			spedT2Ti.blocoE.IListaRegistroE100.Add(registroE100);

			// REGISTRO E110: APURAÇÃO DO ICMS – OPERAÇÕES PRÓPRIAS.
			/* TODO
			List<FiscalApuracaoIcms> listaE110 = apuracaoIcmsDao.Beans(FiscalApuracaoIcms.class, "competencia", Biblioteca.mesAno(dataInicio));
			FiscalApuracaoIcms v;
			RegistroE110 registroE110;
			if (!listaE110.isEmpty()) {
				registroE110 = new RegistroE110();
				v = listaE110.(0);

				registroE110.vlTotDebitos = v.ValorTotalDebito;
				registroE110.vlAjDebitos = v.ValorAjusteDebito;
				registroE110.vlTotAjDebitos = v.ValorTotalAjusteDebito;
				registroE110.vlEstornosCred = v.ValorEstornoCredito;
				registroE110.vlTotCreditos = v.ValorTotalCredito;
				registroE110.vlAjCreditos = v.ValorAjusteCredito;
				registroE110.vlTotAjCreditos = v.ValorTotalAjusteCredito;
				registroE110.vlEstornosDeb = v.ValorEstornoDebito;
				registroE110.vlSldCredorAnt = v.ValorSaldoCredorAnterior;
				registroE110.vlSldApurado = v.ValorSaldoApurado;
				registroE110.vlTotDed = v.ValorTotalDeducao;
				registroE110.vlIcmsRecolher = v.ValorIcmsRecolher;
				registroE110.vlSldCredorTransportar = v.ValorSaldoCredorTransp;
				registroE110.debEsp = v.ValorDebitoEspecial;

				// registro E116
				RegistroE116 registroE116 = new RegistroE116();
				registroE116.codOr = "000";
				registroE116.vlOr = v.ValorIcmsRecolher;
				registroE116.dtVcto = dataFim);
				registroE116.codRec = "1";
				registroE116.numProc = "";
				registroE116.indProc = "";
				registroE116.proc = "";
				registroE116.txtCompl = "";
				registroE116.mesRef = "";

				registroE110.RegistroE116List().add(registroE116);

				registroE100.registroE110(registroE110);
			}
			*/
		}
		#endregion

		#region BLOCO H: INVENTÁRIO FÍSICO
		public void GerarBlocoH()
		{
			spedT2Ti.blocoH.registroH001.indMov = 0;// com dados

			IList<Produto> ListaProduto = new NHibernateDAL<Produto>(Session).Select(new Produto());

			decimal? totalGeral = 0;
			for (int i = 0; i < ListaProduto.Count; i++)
			{
				totalGeral = totalGeral + (ListaProduto[i].ValorCompra * ListaProduto[i].QuantidadeEstoque);
			}

			// REGISTRO H005: TOTAIS DO INVENTÁRIO
			RegistroH005 registroH005 = new RegistroH005();
			registroH005.dtInv = Convert.ToDateTime(DataFinal);
			registroH005.vlInv = totalGeral;
			registroH005.motInv = "0" + Inventario;
			spedT2Ti.blocoH.IListaRegistroH005.Add(registroH005);

			RegistroH010 registroH010;
			for (int i = 0; i < ListaProduto.Count; i++)
			{
				registroH010 = new RegistroH010();

				registroH010.codItem = ListaProduto[i].Id.ToString();
				registroH010.unid = ListaProduto[i].ProdutoUnidade.Id.ToString();
				registroH010.qtd = ListaProduto[i].QuantidadeEstoque;
				registroH010.vlUnit = ListaProduto[i].ValorCompra;
				registroH010.vlItem = ListaProduto[i].QuantidadeEstoque * ListaProduto[i].ValorCompra;
				registroH010.indProp = "0";

				registroH005.registroH010IList.Add(registroH010);
			}

			// REGISTRO H020: Informação complementar do Inventário.
			// Implementado a critério do Participante do T2Ti ERP }
		}
		#endregion

		#region BLOCO 1: OUTRAS INFORMAÇÕES
		public void GerarBloco1()
		{
			spedT2Ti.bloco1.registro1001.indMov = 0;// com dados

			Registro1010 registro1010 = new Registro1010();
			registro1010.indExp = "N";
			registro1010.indCcrf = "N";
			registro1010.indComb = "N";
			registro1010.indUsina = "N";
			registro1010.indVa = "N";
			registro1010.indEe = "N";
			registro1010.indCart = "N";
			registro1010.indForm = "N";
			registro1010.indAer = "N";

			spedT2Ti.bloco1.IListaRegistro1010.Add(registro1010);
		}
		#endregion


	}

}