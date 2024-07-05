/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [FIN_LANCAMENTO_RECEBER] 
                                                                                
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
using System.IO;
using System.Text;
using System.Threading;
using T2TiERPFenix.Models;
using T2TiERPFenix.NHibernate;
using T2TiERPFenix.Util;

namespace T2TiERPFenix.Services
{
    public class FinLancamentoReceberService
    {

        public IEnumerable<FinLancamentoReceber> ConsultarLista()
        {
            IList<FinLancamentoReceber> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<FinLancamentoReceber> DAL = new NHibernateDAL<FinLancamentoReceber>(Session);
                Resultado = DAL.Select(new FinLancamentoReceber());
            }
            return Resultado;
        }

        public IEnumerable<FinLancamentoReceber> ConsultarListaFiltro(Filtro filtro)
        {
            IList<FinLancamentoReceber> Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                var consultaSql = "from FinLancamentoReceber where " + filtro.Where;
                NHibernateDAL<FinLancamentoReceber> DAL = new NHibernateDAL<FinLancamentoReceber>(Session);
                Resultado = DAL.SelectListaSql<FinLancamentoReceber>(consultaSql);
            }
            return Resultado;
        }
		
        public FinLancamentoReceber ConsultarObjeto(int id)
        {
            FinLancamentoReceber Resultado = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<FinLancamentoReceber> DAL = new NHibernateDAL<FinLancamentoReceber>(Session);
                Resultado = DAL.SelectId<FinLancamentoReceber>(id);
            }
            return Resultado;
        }
		
        public void Inserir(FinLancamentoReceber objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<FinLancamentoReceber> DAL = new NHibernateDAL<FinLancamentoReceber>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Alterar(FinLancamentoReceber objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<FinLancamentoReceber> DAL = new NHibernateDAL<FinLancamentoReceber>(Session);
                DAL.SaveOrUpdate(objeto);
                Session.Flush();
            }
        }

        public void Excluir(FinLancamentoReceber objeto)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<FinLancamentoReceber> DAL = new NHibernateDAL<FinLancamentoReceber>(Session);
                DAL.Delete(objeto);
                Session.Flush();
            }
        }

        public string GerarBoleto(FinLancamentoReceber lancamento)
        {
            // primeiro passo - gerar o arquivo INI com os Titulos
            GerararquivoIni(lancamento);
            // segundo passo - limpar a lista de boletos
            GerarArquivoEntradaLimparBoletos();
            Thread.Sleep(100);
            // terceiro passo - criar o arquivo de entrada para o ACBRMonitor
            GerarArquivoEntradaGerarBoletos(lancamento);
            // quarto passo - Pegar o retorno e enviar para o controller
            return PegarRetornoSaida();
        }

		private void GerararquivoIni(FinLancamentoReceber lancamento)
		{
			IniFile arquivoIni = new IniFile("c:\\t2ti\\boletos\\ini\\" + lancamento.Id + ".ini");
			string IncrementoBloco;
			//  Pega a empresa
			Empresa empresa = new EmpresaService().ConsultarObjeto(1);
			// Pega a configuração do boleto
			FinConfiguracaoBoleto configuracaoBoleto = new FinConfiguracaoBoletoService().ConsultarObjeto(1);
			// Pega o cliente
			ViewPessoaCliente cliente = new ViewPessoaClienteService().ConsultarObjeto(lancamento.Cliente.Id);

			try
			{
                // *******************************************************************************************
                //   [Cedente]
                // *******************************************************************************************
                arquivoIni.IniWriteString("Cedente", "Nome", empresa.RazaoSocial);
                arquivoIni.IniWriteString("Cedente", "CNPJCPF", empresa.Cnpj);
                arquivoIni.IniWriteString("Cedente", "Logradouro", empresa.EnderecoPrincipal.Logradouro);
                arquivoIni.IniWriteString("Cedente", "Numero", empresa.EnderecoPrincipal.Numero);
                arquivoIni.IniWriteString("Cedente", "Bairro", empresa.EnderecoPrincipal.Bairro);
                arquivoIni.IniWriteString("Cedente", "Cidade", empresa.EnderecoPrincipal.Cidade);
                arquivoIni.IniWriteString("Cedente", "CEP", empresa.EnderecoPrincipal.Cep);
                arquivoIni.IniWriteString("Cedente", "Complemento", empresa.EnderecoPrincipal.Complemento);
                arquivoIni.IniWriteString("Cedente", "UF", empresa.EnderecoPrincipal.Uf);
                arquivoIni.IniWriteString("Cedente", "CodigoCedente", configuracaoBoleto.CodigoCedente);
                arquivoIni.IniWriteString("Cedente", "Convenio", configuracaoBoleto.CodigoConvenio);

                // *******************************************************************************************
                //   [Conta]
                // *******************************************************************************************
                arquivoIni.IniWriteString("Conta", "Agencia", configuracaoBoleto.BancoContaCaixa.BancoAgencia.Numero);
                arquivoIni.IniWriteString("Conta", "AgenciaDigito", configuracaoBoleto.BancoContaCaixa.BancoAgencia.Digito);
                arquivoIni.IniWriteString("Conta", "Conta", configuracaoBoleto.BancoContaCaixa.Numero);
                arquivoIni.IniWriteString("Conta", "ContaDigito", configuracaoBoleto.BancoContaCaixa.Numero);

                // *******************************************************************************************
                //   [Banco]
                // *******************************************************************************************
                arquivoIni.IniWriteString("Banco", "Numero", configuracaoBoleto.BancoContaCaixa.BancoAgencia.Banco.Codigo);
                arquivoIni.IniWriteString("Banco", "CNAB", configuracaoBoleto.LayoutRemessa);

                // *******************************************************************************************
                //   Títulos
                // *******************************************************************************************
                int i = 0;
                foreach (FinParcelaReceber parcela in lancamento.ListaFinParcelaReceber)
                {
                    if (parcela.EmitiuBoleto.Equals("S"))
                    {
                        i++;
                        //int tamanhoI = I.ToString().Length;
                        //IncrementoBloco = new String('0', 3 - tamanhoI) + Convert.ToString(I);
                        IncrementoBloco = Convert.ToString(i);

                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "NumeroDocumento", parcela.BoletoNossoNumero);
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "NossoNumero", parcela.BoletoNossoNumero);
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "Carteira", configuracaoBoleto.Carteira);
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "LocalPagamento", configuracaoBoleto.LocalPagamento);
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "Vencimento", parcela.DataVencimento.ToString());
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "DataDocumento", parcela.DataVencimento.ToString());
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "DataProcessamento", DateTime.Now.ToString());
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "Aceite", configuracaoBoleto.Aceite);
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "TotalParcelas", String.Format("{0:0.0,0}", lancamento.QuantidadeParcela));
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "ValorDesconto", String.Format("{0:0.0,0}", parcela.ValorDesconto));
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "DataDesconto", parcela.DescontoAte.ToString());
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "ValorDocumento", String.Format("{0:0.0,0}", parcela.Valor));
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "Parcela", parcela.NumeroParcela.ToString());
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "PercentualMulta", String.Format("{0:0.0,0}", parcela.TaxaMulta));
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "Instrucao1", configuracaoBoleto.Instrucao01);
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "Instrucao2", configuracaoBoleto.Instrucao02);

                        // Sacado
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "Sacado.NomeSacado", cliente.Nome);
                        arquivoIni.IniWriteString("Titulo" + IncrementoBloco, "Sacado.CNPJCPF", cliente.CpfCnpj);
                    }
                }

            }
            finally
			{
			}
		}

		private void GerarArquivoEntradaLimparBoletos()
		{
			try
			{
				// apaga o arquivo 'SAI.TXT'
				File.Delete("c:\\ACBrMonitor\\SAI.TXT");

				// cria o arquivo 'ENT.TXT'
				StreamWriter arquivoEntrada = new StreamWriter("c:\\ACBrMonitor\\ENT.TXT", true, Encoding.ASCII);
				arquivoEntrada.Write("BOLETO.LimparLista");
				arquivoEntrada.Close();
			}
			finally
			{
			}
		}

		private void GerarArquivoEntradaGerarBoletos(FinLancamentoReceber lancamento)
        {
            try
            {
                // apaga o arquivo 'SAI.TXT'
                File.Delete("c:\\ACBrMonitor\\SAI.TXT");

                // cria o arquivo 'ENT.TXT'
                StreamWriter arquivoEntrada = new StreamWriter("c:\\ACBrMonitor\\ENT.TXT", true, Encoding.ASCII);
                arquivoEntrada.Write("BOLETO.IncluirTitulos(\"c:\\t2ti\\boletos\\ini\\" + lancamento.Id + ".ini\", \"I\"");
                arquivoEntrada.Close();
            }
            finally
            {
            }
        }

        private string PegarRetornoSaida()
        {
            while (!File.Exists("C:\\ACBrMonitor\\sai.txt"))
            {
            }
            return "C:\\T2Ti\\Boletos\\PDF\\boleto.pdf";
        }


	}

}