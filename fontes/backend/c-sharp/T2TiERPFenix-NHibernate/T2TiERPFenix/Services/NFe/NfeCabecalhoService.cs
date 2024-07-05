/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [NFE_CABECALHO] 
                                                                                
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
using Microsoft.EntityFrameworkCore.Internal;
using NHibernate;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using T2TiERPFenix.Models;
using T2TiERPFenix.NHibernate;
using T2TiERPFenix.Util;

namespace T2TiERPFenix.Services
{
	public class NfeCabecalhoService
	{
        private string CaminhoComCnpj = "C:\\ACBrMonitor\\10793118000178\\";
        public IEnumerable<NfeCabecalho> ConsultarLista()
		{
			IList<NfeCabecalho> Resultado = null;
			using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
			{
				NHibernateDAL<NfeCabecalho> DAL = new NHibernateDAL<NfeCabecalho>(Session);
				Resultado = DAL.Select(new NfeCabecalho());
			}
			return Resultado;
		}

		public IEnumerable<NfeCabecalho> ConsultarListaFiltro(Filtro filtro)
		{
			IList<NfeCabecalho> Resultado = null;
			using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
			{
				var consultaSql = "from NfeCabecalho where " + filtro.Where;
				NHibernateDAL<NfeCabecalho> DAL = new NHibernateDAL<NfeCabecalho>(Session);
				Resultado = DAL.SelectListaSql<NfeCabecalho>(consultaSql);
			}
			return Resultado;
		}

		public NfeCabecalho ConsultarObjeto(int id)
		{
			NfeCabecalho Resultado = null;
			using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
			{
				NHibernateDAL<NfeCabecalho> DAL = new NHibernateDAL<NfeCabecalho>(Session);
				Resultado = DAL.SelectId<NfeCabecalho>(id);
			}
			return Resultado;
		}

		public void Inserir(NfeCabecalho objeto)
		{
			using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
			{
                CalcularTotais(objeto);

                NfeNumero nfeNumero = new NfeNumeroService().ConsultarObjeto(1);
				objeto.Numero = String.Format("{0:000000000}", nfeNumero.Numero);
				string codigoNumerico = String.Format("{0:0000000}", nfeNumero.Numero);
				codigoNumerico = "9" + codigoNumerico;
				objeto.CodigoNumerico = codigoNumerico;
				objeto.Serie = nfeNumero.Serie;
                objeto.VersaoProcessoEmissao = "100";

				nfeNumero.Numero++;
                NHibernateDAL<NfeNumero> NumeroDAL = new NHibernateDAL<NfeNumero>(Session);
				NumeroDAL.SaveOrUpdate(nfeNumero);

                NHibernateDAL<NfeCabecalho> DAL = new NHibernateDAL<NfeCabecalho>(Session);
				DAL.SaveOrUpdate(objeto);

				ControleEstoqueService controleEstoqueService = new ControleEstoqueService();
				for (int i = 0; i < objeto.ListaNfeDetalhe.Count; i++)
				{
					if (objeto.TipoOperacao == "0")
                    {// entrada
						controleEstoqueService.AtualizarEstoque(objeto.ListaNfeDetalhe[i].Produto, objeto.ListaNfeDetalhe[i].Produto.QuantidadeEstoque.Value, "I");
                    } else
					{
                        controleEstoqueService.AtualizarEstoque(objeto.ListaNfeDetalhe[i].Produto, objeto.ListaNfeDetalhe[i].Produto.QuantidadeEstoque.Value, "D");
                    }
                }

                Session.Flush();
			}
		}

		public void Alterar(NfeCabecalho objeto)
		{
			using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
			{
				NHibernateDAL<NfeCabecalho> DAL = new NHibernateDAL<NfeCabecalho>(Session);
				DAL.SaveOrUpdate(objeto);
				Session.Flush();
			}
		}

		public void Excluir(NfeCabecalho objeto)
		{
			using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
			{
				NHibernateDAL<NfeCabecalho> DAL = new NHibernateDAL<NfeCabecalho>(Session);
				DAL.Delete(objeto);
				Session.Flush();
			}
		}

		public void CalcularTotais(NfeCabecalho pNfeCabecalho)
		{
			decimal? TotalProdutos, ValorFrete, ValorSeguro, ValorOutrasDespesas, Desconto, BaseCalculoIcms, ValorIcms, BaseCalculoIcmsSt, ValorIcmsSt, ValorIpi, ValorPis, ValorCofins, ValorNotaFiscal;
			decimal? TotalServicos, BaseCalculoIssqn, ValorIssqn, ValorPisIssqn, ValorCofinsIssqn;
			//
			TotalProdutos = 0;
			ValorFrete = 0;
			ValorSeguro = 0;
			ValorOutrasDespesas = 0;
			Desconto = 0;
			BaseCalculoIcms = 0;
			ValorIcms = 0;
			BaseCalculoIcmsSt = 0;
			ValorIcmsSt = 0;
			ValorIpi = 0;
			ValorPis = 0;
			ValorCofins = 0;
			// 
			TotalServicos = 0;
			BaseCalculoIssqn = 0;
			ValorIssqn = 0;
			ValorPisIssqn = 0;
			ValorCofinsIssqn = 0;

			//  Pega a empresa
			Empresa Empresa = new EmpresaService().ConsultarObjeto(1); // É possível pegar os dados da NfeEmitente, dependendo da estratégia definida pelo desenvolvedor

			try
			{
				//  Se houver CFOP cadastrado na Operação Fiscal, a nota é de serviços
				if (pNfeCabecalho.TributOperacaoFiscal.Cfop > 0)
				{
					foreach (NfeDetalhe nfeDetalhe in pNfeCabecalho.ListaNfeDetalhe)
					{
						TotalServicos += nfeDetalhe.ValorTotal;
						ValorFrete += nfeDetalhe.ValorFrete;
						ValorSeguro += nfeDetalhe.ValorSeguro;
						ValorOutrasDespesas += nfeDetalhe.ValorOutrasDespesas;
						Desconto += nfeDetalhe.ValorDesconto;
						BaseCalculoIssqn += nfeDetalhe.NfeDetalheImpostoIssqn.BaseCalculoIssqn;
						ValorIssqn += nfeDetalhe.NfeDetalheImpostoIssqn.ValorIssqn;
						ValorPisIssqn += nfeDetalhe.NfeDetalheImpostoPis.ValorPis;
						ValorCofinsIssqn = ValorCofinsIssqn + ValorPisIssqn + nfeDetalhe.NfeDetalheImpostoCofins.ValorCofins;
					}
					// 
					ValorNotaFiscal = TotalServicos + ValorPis + ValorCofins + ValorOutrasDespesas - Desconto;
					pNfeCabecalho.ValorServicos = TotalServicos;
				}
				else
				{
					CalculoNFe calculoNFe = new CalculoNFe();
					if (Empresa.Crt != "")
						calculoNFe.CrtEmissor = Convert.ToInt32(Empresa.Crt);
					calculoNFe.UFemissor = Empresa.CodigoIbgeUf;
					if (pNfeCabecalho.NfeDestinatario.Cnpj != "")
						calculoNFe.TipoCliente = "J";
					else
						calculoNFe.TipoCliente = "F";
					calculoNFe.UFCliente = pNfeCabecalho.NfeDestinatario.Uf;

					foreach (NfeDetalhe nfeDetalhe in pNfeCabecalho.ListaNfeDetalhe)
					{
						ProcessarCalculosNoItem(calculoNFe, nfeDetalhe);

						TotalProdutos += nfeDetalhe.ValorTotal;
						ValorFrete += nfeDetalhe.ValorFrete;
						ValorSeguro += nfeDetalhe.ValorSeguro;
						ValorOutrasDespesas += nfeDetalhe.ValorOutrasDespesas;
						Desconto += nfeDetalhe.ValorDesconto;
						BaseCalculoIcms += nfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcms;
						ValorIcms += nfeDetalhe.NfeDetalheImpostoIcms.ValorIcms;
						BaseCalculoIcmsSt += nfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt;
						ValorIcmsSt += nfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt;
						ValorIpi += nfeDetalhe.NfeDetalheImpostoIpi.ValorIpi;
						ValorPis += nfeDetalhe.NfeDetalheImpostoPis.ValorPis;
						ValorCofins += nfeDetalhe.NfeDetalheImpostoCofins.ValorCofins;
					}
					// 
				}
					ValorNotaFiscal = TotalProdutos.GetValueOrDefault(0) + 
										ValorIcmsSt.GetValueOrDefault(0) + 
										ValorPis.GetValueOrDefault(0) + 
										ValorCofins.GetValueOrDefault(0) + 
										ValorIpi.GetValueOrDefault(0) + 
										ValorOutrasDespesas.GetValueOrDefault(0) - 
										Desconto.GetValueOrDefault(0);

				pNfeCabecalho.ValorTotalProdutos = TotalProdutos;
				pNfeCabecalho.ValorFrete = ValorFrete;
				pNfeCabecalho.ValorSeguro = ValorSeguro;
				pNfeCabecalho.ValorDespesasAcessorias = ValorOutrasDespesas;
				pNfeCabecalho.ValorDesconto = Desconto;
				pNfeCabecalho.BaseCalculoIcms = BaseCalculoIcms;
				pNfeCabecalho.ValorIcms = ValorIcms;
				pNfeCabecalho.BaseCalculoIcmsSt = BaseCalculoIcmsSt;
				pNfeCabecalho.ValorIcmsSt = ValorIcmsSt;
				pNfeCabecalho.ValorIpi = ValorIpi;
				pNfeCabecalho.ValorPis = ValorPis;
				pNfeCabecalho.ValorCofins = ValorCofins;
				// 
				pNfeCabecalho.BaseCalculoIssqn = BaseCalculoIssqn;
				pNfeCabecalho.ValorIssqn = ValorIssqn;
				pNfeCabecalho.ValorPisIssqn = ValorPisIssqn;
				pNfeCabecalho.ValorCofinsIssqn = ValorCofinsIssqn;
				// 
				pNfeCabecalho.ValorTotal = ValorNotaFiscal;
			}
			finally
			{
			}
		}

		private void ProcessarCalculosNoItem(CalculoNFe calculoNFe, NfeDetalhe pNfeDetalhe)
		{

			try
			{
				calculoNFe.ValorBrutoProdutos = pNfeDetalhe.ValorBrutoProduto;
				calculoNFe.ValorFrete = pNfeDetalhe.ValorFrete;
				calculoNFe.ValorSeguro = pNfeDetalhe.ValorSeguro;
				calculoNFe.ValorOutrasDespesas = pNfeDetalhe.ValorOutrasDespesas;
				calculoNFe.ValorDesconto = pNfeDetalhe.ValorDesconto;
				calculoNFe.CstIcms = pNfeDetalhe.NfeDetalheImpostoIcms.CstIcms;
				calculoNFe.Csosn = pNfeDetalhe.NfeDetalheImpostoIcms.Csosn;
				calculoNFe.ModalidadeBcIcms = pNfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms;
				calculoNFe.TaxaReducaoBcIcms = pNfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcms;
				calculoNFe.AliquotaIcms = pNfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms;
				calculoNFe.AliquotaIcmsInter = pNfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms;
				calculoNFe.ModalidadeBcIcmsSt = pNfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt;
				calculoNFe.PercentualMvaIcmsSt = pNfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt;
				calculoNFe.ReducaoBcIcmsSt = pNfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt;
				calculoNFe.AliquotaIcmsSt = pNfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt;
				calculoNFe.AliquotaCreditoIcmsSn = pNfeDetalhe.NfeDetalheImpostoIcms.AliquotaCreditoIcmsSn;
				calculoNFe.CstIpi = pNfeDetalhe.NfeDetalheImpostoIpi.CstIpi;
				calculoNFe.AliquotaIpi = pNfeDetalhe.NfeDetalheImpostoIpi.AliquotaIpi;
				calculoNFe.CstPis = pNfeDetalhe.NfeDetalheImpostoPis.CstPis;
				calculoNFe.AliquotaPis = pNfeDetalhe.NfeDetalheImpostoPis.AliquotaPisPercentual;
				calculoNFe.AliquotaPisReais = pNfeDetalhe.NfeDetalheImpostoPis.AliquotaPisReais;
				calculoNFe.CstCofins = pNfeDetalhe.NfeDetalheImpostoCofins.CstCofins;
				calculoNFe.AliquotaCofins = pNfeDetalhe.NfeDetalheImpostoCofins.AliquotaCofinsPercentual;
				calculoNFe.AliquotaCofinsReais = pNfeDetalhe.NfeDetalheImpostoCofins.AliquotaCofinsReais;

				calculoNFe = NFeCalculoService.Calcular(calculoNFe);

				//  Valores ICMS 
				pNfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcms = calculoNFe.BaseCalculoIcms;
				pNfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt = calculoNFe.ReducaoBcIcmsSt;
				pNfeDetalhe.NfeDetalheImpostoIcms.ValorIcms = calculoNFe.ValorIcms;
				//  valores de ICMS ST
				pNfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt = calculoNFe.BaseCalculoIcmsSt;
				pNfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt = calculoNFe.ValorIcmsSt;
				//  credito de icmssn
				pNfeDetalhe.NfeDetalheImpostoIcms.ValorCreditoIcmsSn = calculoNFe.ValorCreditoIcmsSn;

				//  Valores IPI 
				pNfeDetalhe.NfeDetalheImpostoIpi.ValorBaseCalculoIpi = calculoNFe.BaseCalculoIpi;
				pNfeDetalhe.NfeDetalheImpostoIpi.ValorIpi = calculoNFe.ValorIpi;

				//  Valores PIS 
				pNfeDetalhe.NfeDetalheImpostoPis.ValorBaseCalculoPis = calculoNFe.BaseCalculoPis;
				pNfeDetalhe.NfeDetalheImpostoPis.ValorPis = calculoNFe.ValorPis;

				//  Valores COFINS 
				pNfeDetalhe.NfeDetalheImpostoCofins.BaseCalculoCofins = calculoNFe.BaseCalculoCofins;
				pNfeDetalhe.NfeDetalheImpostoCofins.ValorCofins = calculoNFe.ValorCofins;
			}
			finally
			{
			}
		}

		public string TransmitirNFe(NfeCabecalho pNfeCabecalho)
		{
            //  primeiro passo - gerar o arquivo INI com a NF-e
            string CaminhoArquivoIni = GerarArquivoIniNFe(pNfeCabecalho);            
			// chama o método para criar a nota
            CriarNFe(CaminhoArquivoIni);
            // pega o caminho do XML criado
            string caminhoArquivoXml = PegarRetornoSaida("ARQUIVO-XML");
			if (caminhoArquivoXml.Contains("ERRO"))
			{
                return caminhoArquivoXml;
            }
            
			// chama o método para criar e enviar a nota
            EnviarNFe(caminhoArquivoXml);
            string retorno = PegarRetornoSaida("Envio");
            if (!retorno.Contains("ERRO"))
            {
                // chama o método para gerar o PDF
                ImprimirDanfe(caminhoArquivoXml);
                // captura o retorno do arquivo SAI
                retorno = PegarRetornoSaida("ARQUIVO-PDF");

                // se chegou aqui, atualiza a chave de acesso e o status da nota
                pNfeCabecalho.StatusNota = "4";
                string chave = string.Join("", retorno.Reverse().ToArray());
                chave = chave.Substring(chave.IndexOf("-") + 1, 44);
                chave = string.Join("", chave.Reverse().ToArray());
                pNfeCabecalho.ChaveAcesso = chave;
                pNfeCabecalho.DigitoChaveAcesso = chave.Substring(chave.Length - 1);
                Alterar(pNfeCabecalho);
            }
            return retorno;
		}

        public string GerarPdfDanfe(string chave)
        {
            // pega o caminho do arquivo XML da nota em contingência
            string caminhoArquivoXml = CaminhoComCnpj + "LOG_NFe\\" + chave + "-nfe.xml";
            // chama o método para gerar o PDF
            ImprimirDanfe(caminhoArquivoXml);
            // captura o retorno do arquivo SAI
            return PegarRetornoSaida("ARQUIVO-PDF");
        }

		public void CriarNFe(string caminhoArquivoIniNfce)
        {
            ApagarArquivoSaida();
            GerarArquivoEntrada("NFE.CriarNFe(" + caminhoArquivoIniNfce + ")");
            AguardarArquivoSaida();
        }
        
		public void EnviarNFe(string caminhoArquivoXml)
        {
            ApagarArquivoSaida();
            GerarArquivoEntrada("NFE.EnviarNFe(" + caminhoArquivoXml + ", 001, , , , 1, , )");
            AguardarArquivoSaida();
        }

        public void ImprimirDanfe(string caminhoArquivoXml)
        {
            ApagarArquivoSaida();
            GerarArquivoEntrada("NFE.ImprimirDanfePDF(" + caminhoArquivoXml + ", , , 1,)");
            AguardarArquivoSaida();
        }

        private void GerarArquivoEntrada(string comando)
        {
            StreamWriter arquivoEntrada = new StreamWriter(CaminhoComCnpj + "ent.txt", true, Encoding.ASCII);
            arquivoEntrada.Write(comando);
            arquivoEntrada.Close();
        }

        private string PegarRetornoSaida(string operacao)
        {
            string retorno = "";
            IniFile arquivoSaida = new IniFile(CaminhoComCnpj, "sai.txt");

            // carrega o conteúdo completo do arquivo
            string arquivoCompleto = System.IO.File.ReadAllText(CaminhoComCnpj + "sai.txt");

            string codigoStatus = arquivoSaida.IniReadString(operacao, "CStat", "");
            string motivo = arquivoSaida.IniReadString(operacao, "XMotivo", "");

            string caminhoArquivoXml = "";

            if (operacao.Equals("ARQUIVO-XML"))
            {
                caminhoArquivoXml = arquivoCompleto;
                caminhoArquivoXml = caminhoArquivoXml.Replace("OK: ", "").Trim();
                return caminhoArquivoXml;
            }
            else if (operacao.Equals("ARQUIVO-PDF"))
            {
                retorno = arquivoCompleto;
                retorno = retorno.Replace("OK: Arquivo criado em: ", "").Trim();
                return retorno;
            }
            else if (operacao.Equals("Envio"))
            {
                retorno = motivo;
            }
            else if (operacao.Equals("Cancelamento"))
            {
                retorno = motivo;
            }
            else if (operacao.Equals("Consulta"))
            {
                retorno = motivo;
            }
            else if (operacao.Equals("Inutilizacao"))
            {
                return arquivoCompleto;
            }

            List<string> listaStatus = new List<string> { "", "100", "102", "135" }; // se o status não for um dos que estiverem nessa lista, vamos retornar um erro.

            if (!listaStatus.Contains(codigoStatus))
            {
                return "[ERRO] - [" + codigoStatus + "] " + motivo;
            }

            return retorno;
        }

        private bool ApagarArquivoSaida()
        {
            File.Delete(CaminhoComCnpj + "sai.txt");
            return true;
        }

        private bool AguardarArquivoSaida()
        {
            int tempoEspera = 0;
            while (!File.Exists(CaminhoComCnpj + "sai.txt"))
            {
                Thread.Sleep(1000);
                tempoEspera++;

                if (tempoEspera > 30)
                {
                    return false;
                }
            }
            return true;
        }

        private string GerarArquivoIniNFe(NfeCabecalho pNfeCabecalho)
		{
			string CaminhoArquivo = "c:\\t2ti\\nfe\\ini\\" + pNfeCabecalho.Numero + ".ini";

            IniFile NFeIni = new IniFile("c:\\t2ti\\nfe\\ini\\", pNfeCabecalho.Numero + ".ini");
			string IncrementoBloco;
			//  Pega a empresa
			Empresa Empresa = new EmpresaService().ConsultarObjeto(1); //  É possível pegar os dados da NfeEmitente, dependendo da estratégia definida pelo desenvolvedor

			try
			{
				// *******************************************************************************************
				//   [infNFe]
				// *******************************************************************************************
				NFeIni.IniWriteString("infNFe", "versao", "4.00");

				// *******************************************************************************************
				//   [Identificacao]
				// *******************************************************************************************
				NFeIni.IniWriteString("Identificacao", "cNF", pNfeCabecalho.CodigoNumerico);
				NFeIni.IniWriteString("Identificacao", "natOp", pNfeCabecalho.NaturezaOperacao);
				NFeIni.IniWriteString("Identificacao", "mod", "55");
				NFeIni.IniWriteString("Identificacao", "serie", "001");
				NFeIni.IniWriteString("Identificacao", "nNF", pNfeCabecalho.Numero);
				NFeIni.IniWriteString("Identificacao", "dhEmi", pNfeCabecalho.DataHoraEmissao.ToString());
				NFeIni.IniWriteString("Identificacao", "dhSaiEnt", "");
				NFeIni.IniWriteString("Identificacao", "tpNF", pNfeCabecalho.TipoOperacao);    // 0=Entrada; 1=Saída
				NFeIni.IniWriteString("Identificacao", "idDest", pNfeCabecalho.LocalDestino);  //  1=Operação interna; 2=Operação interestadual; 3=Operação com exterior.
				NFeIni.IniWriteString("Identificacao", "tpImp", pNfeCabecalho.FormatoImpressaoDanfe);
				NFeIni.IniWriteString("Identificacao", "tpEmis", pNfeCabecalho.TipoEmissao);
				NFeIni.IniWriteString("Identificacao", "finNFe", pNfeCabecalho.FinalidadeEmissao);
				NFeIni.IniWriteString("Identificacao", "indFinal", pNfeCabecalho.ConsumidorOperacao); // 0=Normal; 1=Consumidor final;
				NFeIni.IniWriteString("Identificacao", "indPres", pNfeCabecalho.ConsumidorPresenca);
				NFeIni.IniWriteString("Identificacao", "procEmi", pNfeCabecalho.ProcessoEmissao);
				NFeIni.IniWriteString("Identificacao", "verProc", pNfeCabecalho.VersaoProcessoEmissao);
				NFeIni.IniWriteString("Identificacao", "dhCont", "");
				NFeIni.IniWriteString("Identificacao", "xJust", "");
				NFeIni.IniWriteString("Identificacao", "tpAmb", "2"); //  altera para '1' quando em produção ou trazer de tabela ADM

				// *******************************************************************************************
				//   [Emitente]
				// *******************************************************************************************
				NFeIni.IniWriteString("Emitente", "CNPJCPF", Empresa.Cnpj);
				NFeIni.IniWriteString("Emitente", "xNome", Empresa.RazaoSocial);
				NFeIni.IniWriteString("Emitente", "xFant", Empresa.NomeFantasia);
				NFeIni.IniWriteString("Emitente", "IE", Empresa.InscricaoEstadual);
				NFeIni.IniWriteString("Emitente", "IEST", "");
				NFeIni.IniWriteString("Emitente", "IM", Empresa.InscricaoMunicipal);
				NFeIni.IniWriteString("Emitente", "CNAE", Empresa.CodigoCnaePrincipal);
				NFeIni.IniWriteString("Emitente", "CRT", Empresa.Crt);
				NFeIni.IniWriteString("Emitente", "xLgr", Empresa.EnderecoPrincipal.Logradouro);
				NFeIni.IniWriteString("Emitente", "nro", Empresa.EnderecoPrincipal.Numero);
				NFeIni.IniWriteString("Emitente", "xCpl", Empresa.EnderecoPrincipal.Complemento);
				NFeIni.IniWriteString("Emitente", "xBairro", Empresa.EnderecoPrincipal.Bairro);
				NFeIni.IniWriteString("Emitente", "cMun", Empresa.CodigoIbgeCidade.ToString());
				NFeIni.IniWriteString("Emitente", "xMun", Empresa.EnderecoPrincipal.Cidade);
				NFeIni.IniWriteString("Emitente", "UF", Empresa.EnderecoPrincipal.Uf);
				NFeIni.IniWriteString("Emitente", "CEP", Empresa.EnderecoPrincipal.Cep);
				NFeIni.IniWriteString("Emitente", "cPais", "1058");
				NFeIni.IniWriteString("Emitente", "xPais", "BRASIL");
				NFeIni.IniWriteString("Emitente", "Fone", "");
				NFeIni.IniWriteString("Emitente", "cUF", Empresa.CodigoIbgeUf.ToString());
				NFeIni.IniWriteString("Emitente", "cMunFG", "");

				// *******************************************************************************************
				//   [Destinatario]
				// *******************************************************************************************
				if (pNfeCabecalho.NfeDestinatario.Cnpj != "")
					NFeIni.IniWriteString("Destinatario", "CNPJCPF", pNfeCabecalho.NfeDestinatario.Cnpj);
				else
					NFeIni.IniWriteString("Destinatario", "CNPJCPF", pNfeCabecalho.NfeDestinatario.Cpf);
				NFeIni.IniWriteString("Destinatario", "xNome", pNfeCabecalho.NfeDestinatario.Nome);
				NFeIni.IniWriteString("Destinatario", "indIEDest", pNfeCabecalho.NfeDestinatario.IndicadorIe);
				NFeIni.IniWriteString("Destinatario", "IE", pNfeCabecalho.NfeDestinatario.InscricaoEstadual);
				NFeIni.IniWriteString("Destinatario", "email", pNfeCabecalho.NfeDestinatario.Email);
				NFeIni.IniWriteString("Destinatario", "xLgr", pNfeCabecalho.NfeDestinatario.Logradouro);
				NFeIni.IniWriteString("Destinatario", "nro", pNfeCabecalho.NfeDestinatario.Numero);
				NFeIni.IniWriteString("Destinatario", "xCpl", pNfeCabecalho.NfeDestinatario.Complemento);
				NFeIni.IniWriteString("Destinatario", "xBairro", pNfeCabecalho.NfeDestinatario.Bairro);
				NFeIni.IniWriteString("Destinatario", "cMun", pNfeCabecalho.NfeDestinatario.CodigoMunicipio.ToString());
				NFeIni.IniWriteString("Destinatario", "xMun", pNfeCabecalho.NfeDestinatario.NomeMunicipio);
				NFeIni.IniWriteString("Destinatario", "UF", pNfeCabecalho.NfeDestinatario.Uf);
				NFeIni.IniWriteString("Destinatario", "CEP", pNfeCabecalho.NfeDestinatario.Cep);
				NFeIni.IniWriteString("Destinatario", "cPais", pNfeCabecalho.NfeDestinatario.CodigoPais.ToString());
				NFeIni.IniWriteString("Destinatario", "xPais", pNfeCabecalho.NfeDestinatario.NomePais);
				NFeIni.IniWriteString("Destinatario", "Fone", "");

				// *******************************************************************************************
				//   Detalhes - Produtos e Impostos
				// *******************************************************************************************
				int I = 0;
				foreach (NfeDetalhe nfeDetalhe in pNfeCabecalho.ListaNfeDetalhe)
				{
					I++;
					int tamanhoI = I.ToString().Length;
					IncrementoBloco = new String('0', 3 - tamanhoI) + Convert.ToString(I);  

					// / [Produto]
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "cProd", nfeDetalhe.Gtin);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "cEAN", nfeDetalhe.Gtin);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "xProd", nfeDetalhe.NomeProduto);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "ncm", nfeDetalhe.Ncm);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "CEST", nfeDetalhe.Cest);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "EXTIPI", "");// nfeDetalhe.Extipi.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "CFOP", nfeDetalhe.Cfop.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "uCom", nfeDetalhe.UnidadeComercial);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "qCom", nfeDetalhe.QuantidadeComercial.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "vUnCom", nfeDetalhe.ValorUnitarioComercial.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "vProd", nfeDetalhe.ValorTotal.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "cEANTrib", nfeDetalhe.GtinUnidadeTributavel);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "uTrib", nfeDetalhe.UnidadeTributavel);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "qTrib", nfeDetalhe.QuantidadeTributavel.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "vUnTrib", nfeDetalhe.ValorUnitarioTributavel.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "vFrete", nfeDetalhe.ValorFrete.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "vSeg", nfeDetalhe.ValorSeguro.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "vDesc", nfeDetalhe.ValorDesconto.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "vOutro", nfeDetalhe.ValorOutrasDespesas.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "indTot", nfeDetalhe.EntraTotal);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "xPed", pNfeCabecalho.CompraPedido);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "nItemPed", nfeDetalhe.ItemPedidoCompra.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "nFCI", nfeDetalhe.NumeroFci);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "nRECOPI", nfeDetalhe.NumeroRecopi);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "pDevol", nfeDetalhe.PercentualDevolvido.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "vIPIDevol", nfeDetalhe.ValorIpiDevolvido.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "vTotTrib", nfeDetalhe.ValorTotalTributos.ToString());
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "infAdProd", nfeDetalhe.InformacoesAdicionais);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "indEscala", nfeDetalhe.IndicadorEscalaRelevante);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "CNPJFab", nfeDetalhe.CnpjFabricante);
					NFeIni.IniWriteString("Produto" + IncrementoBloco, "cBenef", nfeDetalhe.CodigoBeneficioFiscal);

					//  Detalhes -- Impostos 
					//  Se houver CFOP cadastrado na Operação Fiscal, a nota é de serviços
					if (pNfeCabecalho.TributOperacaoFiscal.Cfop > 0)
					{
						// / [ISSQN]
						NFeIni.IniWriteString("ISSQN" + IncrementoBloco, "vBC", nfeDetalhe.NfeDetalheImpostoIssqn.BaseCalculoIssqn.ToString());
						NFeIni.IniWriteString("ISSQN" + IncrementoBloco, "vAliq", nfeDetalhe.NfeDetalheImpostoIssqn.AliquotaIssqn.ToString());
						NFeIni.IniWriteString("ISSQN" + IncrementoBloco, "vISSQN", nfeDetalhe.NfeDetalheImpostoIssqn.ValorIssqn.ToString());
						NFeIni.IniWriteString("ISSQN" + IncrementoBloco, "cMunFG", nfeDetalhe.NfeDetalheImpostoIssqn.MunicipioIssqn.ToString());
						NFeIni.IniWriteString("ISSQN" + IncrementoBloco, "cListServ", nfeDetalhe.NfeDetalheImpostoIssqn.ItemListaServicos.ToString());
					}
					else
					{
						// / [ICMS]
						if (Empresa.Crt == "1")  // 1-Simples Nacional
						{
							NFeIni.IniWriteString("ICMS" + IncrementoBloco, "CSOSN", nfeDetalhe.NfeDetalheImpostoIcms.Csosn);

							//  csosn 101
							if (nfeDetalhe.NfeDetalheImpostoIcms.Csosn == "101")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pCredSN", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaCreditoIcmsSn.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vCredICMSSN", nfeDetalhe.NfeDetalheImpostoIcms.ValorCreditoIcmsSn.ToString());
							}

							//  csosn 102, 103, 300, 400
							else if ((nfeDetalhe.NfeDetalheImpostoIcms.Csosn == "102")
								 || (nfeDetalhe.NfeDetalheImpostoIcms.Csosn == "103")
								 || (nfeDetalhe.NfeDetalheImpostoIcms.Csosn == "300")
								 || (nfeDetalhe.NfeDetalheImpostoIcms.Csosn == "400"))
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
							}

							//  csosn 201
							else if (nfeDetalhe.NfeDetalheImpostoIcms.Csosn == "201")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pCredSN", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaCreditoIcmsSn.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vCredICMSSN", nfeDetalhe.NfeDetalheImpostoIcms.ValorCreditoIcmsSn.ToString());
							}

							//  csosn 202, 203
							else if ((nfeDetalhe.NfeDetalheImpostoIcms.Csosn == "202")
								 || (nfeDetalhe.NfeDetalheImpostoIcms.Csosn == "203"))
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString());
							}

							//  csosn 500
							else if (nfeDetalhe.NfeDetalheImpostoIcms.Csosn == "500")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBCSTRet", nfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcmsStRetido.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMSSTRet", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsStRetido.ToString());
							}

							//  csosn 900
							else if (nfeDetalhe.NfeDetalheImpostoIcms.Csosn == "900")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pRedBC", nfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pCredSN", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaCreditoIcmsSn.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vCredICMSSN", nfeDetalhe.NfeDetalheImpostoIcms.ValorCreditoIcmsSn.ToString());
							}
						}

						else
						{
							NFeIni.IniWriteString("ICMS" + IncrementoBloco, "CST", nfeDetalhe.NfeDetalheImpostoIcms.CstIcms);

							//  00 Tributada integralmente
							if (nfeDetalhe.NfeDetalheImpostoIcms.CstIcms == "00")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString());
							}

							//  10 Tributada e com cobranca do ICMS por ST
							else if (nfeDetalhe.NfeDetalheImpostoIcms.CstIcms == "10")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString());
							}

							//  20 Tributada com reducao de base de calculo
							else if (nfeDetalhe.NfeDetalheImpostoIcms.CstIcms == "20")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pRedBC", nfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString());
							}

							//  30 Isenta ou nao tributada e com cobranca do ICMS por ST
							else if (nfeDetalhe.NfeDetalheImpostoIcms.CstIcms == "30")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString());
							}

							//  40 Isenta
							else if (nfeDetalhe.NfeDetalheImpostoIcms.CstIcms == "40")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "motDesICMS", nfeDetalhe.NfeDetalheImpostoIcms.MotivoDesoneracaoIcms);
							}

							//  41 Nao tributada
							else if (nfeDetalhe.NfeDetalheImpostoIcms.CstIcms == "41")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "motDesICMS", nfeDetalhe.NfeDetalheImpostoIcms.MotivoDesoneracaoIcms);
							}

							//  50 Suspencao
							else if (nfeDetalhe.NfeDetalheImpostoIcms.CstIcms == "50")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "motDesICMS", nfeDetalhe.NfeDetalheImpostoIcms.MotivoDesoneracaoIcms);
							}

							//  51 Diferimento preenchimento do ICMS depende da UF
							else if (nfeDetalhe.NfeDetalheImpostoIcms.CstIcms == "51")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pRedBC", nfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString());
							}

							//  60 ICMS cobrado anteriormente por ST
							else if (nfeDetalhe.NfeDetalheImpostoIcms.CstIcms == "60")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBCSTRet", nfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcmsStRetido.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMSSTRet", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsStRetido.ToString());
							}

							//  70 ICMS com reducao de base de calculo e cobranca de ICMS por ST
							else if (nfeDetalhe.NfeDetalheImpostoIcms.CstIcms == "70")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pRedBC", nfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString());
							}

							//  90 Outros
							else if (nfeDetalhe.NfeDetalheImpostoIcms.CstIcms == "90")
							{
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "orig", nfeDetalhe.NfeDetalheImpostoIcms.OrigemMercadoria);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBC", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcms);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBC", nfeDetalhe.NfeDetalheImpostoIcms.ValorBcIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pRedBC", nfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMS", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMS", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcms.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "modBCST", nfeDetalhe.NfeDetalheImpostoIcms.ModalidadeBcIcmsSt);
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pMVAST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualMvaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pRedBCST", nfeDetalhe.NfeDetalheImpostoIcms.PercentualReducaoBcIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vBCST", nfeDetalhe.NfeDetalheImpostoIcms.ValorBaseCalculoIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "pICMSST", nfeDetalhe.NfeDetalheImpostoIcms.AliquotaIcmsSt.ToString());
								NFeIni.IniWriteString("ICMS" + IncrementoBloco, "vICMSST", nfeDetalhe.NfeDetalheImpostoIcms.ValorIcmsSt.ToString());
							}
							/*
							  Cabe a cada participante implementar o seguinte:
							  ICMSPart partilha do ICMS entre a UF de Origem e UF de Destino..
							  ICMSST Repasse de ICMS ST retido anteriormente em ope. interestadual...
							*/
						}

						// / [IPI]
						NFeIni.IniWriteString("IPI" + IncrementoBloco, "CST", nfeDetalhe.NfeDetalheImpostoIpi.CstIpi);
						NFeIni.IniWriteString("IPI" + IncrementoBloco, "vBC", nfeDetalhe.NfeDetalheImpostoIpi.ValorBaseCalculoIpi.ToString());
						NFeIni.IniWriteString("IPI" + IncrementoBloco, "pIPI", nfeDetalhe.NfeDetalheImpostoIpi.AliquotaIpi.ToString());
						NFeIni.IniWriteString("IPI" + IncrementoBloco, "vIPI", nfeDetalhe.NfeDetalheImpostoIpi.ValorIpi.ToString());

						// / [PIS]
						NFeIni.IniWriteString("PIS" + IncrementoBloco, "CST", nfeDetalhe.NfeDetalheImpostoPis.CstPis);
						NFeIni.IniWriteString("PIS" + IncrementoBloco, "vBC", nfeDetalhe.NfeDetalheImpostoPis.ValorBaseCalculoPis.ToString());
						if (nfeDetalhe.NfeDetalheImpostoPis.CstPis == "01")
							NFeIni.IniWriteString("PIS" + IncrementoBloco, "pPIS", nfeDetalhe.NfeDetalheImpostoPis.AliquotaPisPercentual.ToString());
						else if (nfeDetalhe.NfeDetalheImpostoPis.CstPis == "02")
							NFeIni.IniWriteString("PIS" + IncrementoBloco, "pPIS", nfeDetalhe.NfeDetalheImpostoPis.AliquotaPisReais.ToString());
						NFeIni.IniWriteString("PIS" + IncrementoBloco, "vPIS", nfeDetalhe.NfeDetalheImpostoPis.ValorPis.ToString());

						// / [COFINS]
						NFeIni.IniWriteString("COFINS" + IncrementoBloco, "CST", nfeDetalhe.NfeDetalheImpostoCofins.CstCofins);
						NFeIni.IniWriteString("COFINS" + IncrementoBloco, "vBC", nfeDetalhe.NfeDetalheImpostoCofins.BaseCalculoCofins.ToString());
						if (nfeDetalhe.NfeDetalheImpostoCofins.CstCofins == "01")
							NFeIni.IniWriteString("COFINS" + IncrementoBloco, "pCOFINS", nfeDetalhe.NfeDetalheImpostoCofins.AliquotaCofinsPercentual.ToString());
						else if (nfeDetalhe.NfeDetalheImpostoCofins.CstCofins == "02")
							NFeIni.IniWriteString("COFINS" + IncrementoBloco, "pCOFINS", nfeDetalhe.NfeDetalheImpostoCofins.AliquotaCofinsReais.ToString());
						NFeIni.IniWriteString("COFINS" + IncrementoBloco, "vCOFINS", nfeDetalhe.NfeDetalheImpostoCofins.ValorCofins.ToString());

						// / [II]
						//if (!nfeDetalhe.NfeDetalheImpostoIi.Equals(null))
						//{
						//	NFeIni.IniWriteString("II" + IncrementoBloco, "vBC", nfeDetalhe.NfeDetalheImpostoIi.ValorBcIi.ToString());
						//	NFeIni.IniWriteString("II" + IncrementoBloco, "vDespAdu", nfeDetalhe.NfeDetalheImpostoIi.ValorDespesasAduaneiras.ToString());
						//	NFeIni.IniWriteString("II" + IncrementoBloco, "vII", nfeDetalhe.NfeDetalheImpostoIi.ValorImpostoImportacao.ToString());
						//	NFeIni.IniWriteString("II" + IncrementoBloco, "vIOF", nfeDetalhe.NfeDetalheImpostoIi.ValorIof.ToString());
						//}

					}
				}

				// *******************************************************************************************
				//   [Total]
				// *******************************************************************************************
				NFeIni.IniWriteString("Total", "vNF", pNfeCabecalho.ValorTotal.ToString());
				NFeIni.IniWriteString("Total", "vBC", pNfeCabecalho.BaseCalculoIcms.ToString());
				NFeIni.IniWriteString("Total", "vICMS", pNfeCabecalho.ValorIcms.ToString());
				NFeIni.IniWriteString("Total", "vBCST", pNfeCabecalho.BaseCalculoIcmsSt.ToString());
				NFeIni.IniWriteString("Total", "vST", pNfeCabecalho.ValorIcmsSt.ToString());
				NFeIni.IniWriteString("Total", "vProd", pNfeCabecalho.ValorTotalProdutos.ToString());
				NFeIni.IniWriteString("Total", "vFrete", pNfeCabecalho.ValorFrete.ToString());
				NFeIni.IniWriteString("Total", "vSeg", pNfeCabecalho.ValorSeguro.ToString());
				NFeIni.IniWriteString("Total", "vDesc", pNfeCabecalho.ValorDesconto.ToString());
				NFeIni.IniWriteString("Total", "vII", pNfeCabecalho.ValorImpostoImportacao.ToString());
				NFeIni.IniWriteString("Total", "vIPI", pNfeCabecalho.ValorIpi.ToString());
				NFeIni.IniWriteString("Total", "vPIS", pNfeCabecalho.ValorPis.ToString());
				NFeIni.IniWriteString("Total", "vCOFINS", pNfeCabecalho.ValorCofins.ToString());
				NFeIni.IniWriteString("Total", "vOutro", pNfeCabecalho.ValorDespesasAcessorias.ToString());
				NFeIni.IniWriteString("Total", "vNF", pNfeCabecalho.ValorTotal.ToString());

				// *******************************************************************************************
				//   [ISSQNtot]
				// *******************************************************************************************
				NFeIni.IniWriteString("ISSQNtot", "vServ", pNfeCabecalho.ValorServicos.ToString());
				NFeIni.IniWriteString("ISSQNtot", "vBC", pNfeCabecalho.BaseCalculoIssqn.ToString());
				NFeIni.IniWriteString("ISSQNtot", "vISS", pNfeCabecalho.ValorIssqn.ToString());
				NFeIni.IniWriteString("ISSQNtot", "vPIS", pNfeCabecalho.ValorPisIssqn.ToString());
				NFeIni.IniWriteString("ISSQNtot", "vCOFINS", pNfeCabecalho.ValorCofinsIssqn.ToString());

				// *******************************************************************************************
				//   [retTrib]
				// *******************************************************************************************
				NFeIni.IniWriteString("retTrib", "vRetPIS", pNfeCabecalho.ValorRetidoPis.ToString());
				NFeIni.IniWriteString("retTrib", "vRetCOFINS", pNfeCabecalho.ValorRetidoCofins.ToString());
				NFeIni.IniWriteString("retTrib", "vRetCSLL", pNfeCabecalho.ValorRetidoCsll.ToString());
				NFeIni.IniWriteString("retTrib", "vBCIRRF", pNfeCabecalho.BaseCalculoIrrf.ToString());
				NFeIni.IniWriteString("retTrib", "vIRRF", pNfeCabecalho.ValorRetidoIrrf.ToString());
				NFeIni.IniWriteString("retTrib", "vBCRetPrev", pNfeCabecalho.BaseCalculoPrevidencia.ToString());
				NFeIni.IniWriteString("retTrib", "vRetPrev", pNfeCabecalho.ValorRetidoPrevidencia.ToString());

				// *******************************************************************************************
				//   [PAG]
				// *******************************************************************************************
				NFeIni.IniWriteString("PAG001", "tpag", "01");
				NFeIni.IniWriteString("PAG001", "vPag", pNfeCabecalho.ValorTotal.ToString());
				NFeIni.IniWriteString("PAG001", "indPag", "0");
				NFeIni.IniWriteString("PAG001", "vTroco", "0");

				// *******************************************************************************************
				//   [DadosAdicionais]
				// *******************************************************************************************
				NFeIni.IniWriteString("DadosAdicionais", "infAdFisco", "");
				NFeIni.IniWriteString("DadosAdicionais", "infCpl", "");

				return CaminhoArquivo;


            }
			finally
			{
			}
		}


	}

}