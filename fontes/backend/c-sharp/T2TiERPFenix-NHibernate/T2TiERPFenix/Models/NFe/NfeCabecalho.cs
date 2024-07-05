/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CABECALHO] 
                                                                                
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
using System.Collections.Generic;

namespace T2TiERPFenix.Models
{
    public class NfeCabecalho
    {	
		public int Id { get; set; }

		public int? UfEmitente { get; set; }

		public string CodigoNumerico { get; set; }

		public string NaturezaOperacao { get; set; }

		public string CodigoModelo { get; set; }

		public string Serie { get; set; }

		public string Numero { get; set; }

		public System.Nullable<System.DateTime> DataHoraEmissao { get; set; }

		public System.Nullable<System.DateTime> DataHoraEntradaSaida { get; set; }

		public string TipoOperacao { get; set; }

		public string LocalDestino { get; set; }

		public int? CodigoMunicipio { get; set; }

		public string FormatoImpressaoDanfe { get; set; }

		public string TipoEmissao { get; set; }

		public string ChaveAcesso { get; set; }

		public string DigitoChaveAcesso { get; set; }

		public string Ambiente { get; set; }

		public string FinalidadeEmissao { get; set; }

		public string ConsumidorOperacao { get; set; }

		public string ConsumidorPresenca { get; set; }

		public string ProcessoEmissao { get; set; }

		public string VersaoProcessoEmissao { get; set; }

		public System.Nullable<System.DateTime> DataEntradaContingencia { get; set; }

		public string JustificativaContingencia { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoIcms { get; set; }

		public System.Nullable<System.Decimal> ValorIcms { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsDesonerado { get; set; }

		public System.Nullable<System.Decimal> TotalIcmsFcpUfDestino { get; set; }

		public System.Nullable<System.Decimal> TotalIcmsInterestadualUfDestino { get; set; }

		public System.Nullable<System.Decimal> TotalIcmsInterestadualUfRemetente { get; set; }

		public System.Nullable<System.Decimal> ValorTotalFcp { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoIcmsSt { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsSt { get; set; }

		public System.Nullable<System.Decimal> ValorTotalFcpSt { get; set; }

		public System.Nullable<System.Decimal> ValorTotalFcpStRetido { get; set; }

		public System.Nullable<System.Decimal> ValorTotalProdutos { get; set; }

		public System.Nullable<System.Decimal> ValorFrete { get; set; }

		public System.Nullable<System.Decimal> ValorSeguro { get; set; }

		public System.Nullable<System.Decimal> ValorDesconto { get; set; }

		public System.Nullable<System.Decimal> ValorImpostoImportacao { get; set; }

		public System.Nullable<System.Decimal> ValorIpi { get; set; }

		public System.Nullable<System.Decimal> ValorIpiDevolvido { get; set; }

		public System.Nullable<System.Decimal> ValorPis { get; set; }

		public System.Nullable<System.Decimal> ValorCofins { get; set; }

		public System.Nullable<System.Decimal> ValorDespesasAcessorias { get; set; }

		public System.Nullable<System.Decimal> ValorTotal { get; set; }

		public System.Nullable<System.Decimal> ValorTotalTributos { get; set; }

		public System.Nullable<System.Decimal> ValorServicos { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoIssqn { get; set; }

		public System.Nullable<System.Decimal> ValorIssqn { get; set; }

		public System.Nullable<System.Decimal> ValorPisIssqn { get; set; }

		public System.Nullable<System.Decimal> ValorCofinsIssqn { get; set; }

		public System.Nullable<System.DateTime> DataPrestacaoServico { get; set; }

		public System.Nullable<System.Decimal> ValorDeducaoIssqn { get; set; }

		public System.Nullable<System.Decimal> OutrasRetencoesIssqn { get; set; }

		public System.Nullable<System.Decimal> DescontoIncondicionadoIssqn { get; set; }

		public System.Nullable<System.Decimal> DescontoCondicionadoIssqn { get; set; }

		public System.Nullable<System.Decimal> TotalRetencaoIssqn { get; set; }

		public string RegimeEspecialTributacao { get; set; }

		public System.Nullable<System.Decimal> ValorRetidoPis { get; set; }

		public System.Nullable<System.Decimal> ValorRetidoCofins { get; set; }

		public System.Nullable<System.Decimal> ValorRetidoCsll { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoIrrf { get; set; }

		public System.Nullable<System.Decimal> ValorRetidoIrrf { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoPrevidencia { get; set; }

		public System.Nullable<System.Decimal> ValorRetidoPrevidencia { get; set; }

		public string InformacoesAddFisco { get; set; }

		public string InformacoesAddContribuinte { get; set; }

		public string ComexUfEmbarque { get; set; }

		public string ComexLocalEmbarque { get; set; }

		public string ComexLocalDespacho { get; set; }

		public string CompraNotaEmpenho { get; set; }

		public string CompraPedido { get; set; }

		public string CompraContrato { get; set; }

		public string Qrcode { get; set; }

		public string UrlChave { get; set; }

		public string StatusNota { get; set; }

		private NfeCana nfeCana;
		public NfeCana NfeCana
		{
			get
			{
				return nfeCana;
			}
			set
			{
				nfeCana = value;
				if (value != null)
				{
					nfeCana.NfeCabecalho = this;
				}
			}
		}

		private NfeDestinatario nfeDestinatario;
		public NfeDestinatario NfeDestinatario
		{
			get
			{
				return nfeDestinatario;
			}
			set
			{
				nfeDestinatario = value;
				if (value != null)
				{
					nfeDestinatario.NfeCabecalho = this;
				}
			}
		}

		private NfeEmitente nfeEmitente;
		public NfeEmitente NfeEmitente
		{
			get
			{
				return nfeEmitente;
			}
			set
			{
				nfeEmitente = value;
				if (value != null)
				{
					nfeEmitente.NfeCabecalho = this;
				}
			}
		}

		private NfeFatura nfeFatura;
		public NfeFatura NfeFatura
		{
			get
			{
				return nfeFatura;
			}
			set
			{
				nfeFatura = value;
				if (value != null)
				{
					nfeFatura.NfeCabecalho = this;
				}
			}
		}

		private NfeInformacaoPagamento nfeInformacaoPagamento;
		public NfeInformacaoPagamento NfeInformacaoPagamento
		{
			get
			{
				return nfeInformacaoPagamento;
			}
			set
			{
				nfeInformacaoPagamento = value;
				if (value != null)
				{
					nfeInformacaoPagamento.NfeCabecalho = this;
				}
			}
		}

		private NfeLocalEntrega nfeLocalEntrega;
		public NfeLocalEntrega NfeLocalEntrega
		{
			get
			{
				return nfeLocalEntrega;
			}
			set
			{
				nfeLocalEntrega = value;
				if (value != null)
				{
					nfeLocalEntrega.NfeCabecalho = this;
				}
			}
		}

		private NfeLocalRetirada nfeLocalRetirada;
		public NfeLocalRetirada NfeLocalRetirada
		{
			get
			{
				return nfeLocalRetirada;
			}
			set
			{
				nfeLocalRetirada = value;
				if (value != null)
				{
					nfeLocalRetirada.NfeCabecalho = this;
				}
			}
		}

		private NfeResponsavelTecnico nfeResponsavelTecnico;
		public NfeResponsavelTecnico NfeResponsavelTecnico
		{
			get
			{
				return nfeResponsavelTecnico;
			}
			set
			{
				nfeResponsavelTecnico = value;
				if (value != null)
				{
					nfeResponsavelTecnico.NfeCabecalho = this;
				}
			}
		}

		private NfeTransporte nfeTransporte;
		public NfeTransporte NfeTransporte
		{
			get
			{
				return nfeTransporte;
			}
			set
			{
				nfeTransporte = value;
				if (value != null)
				{
					nfeTransporte.NfeCabecalho = this;
				}
			}
		}

		public Vendedor Vendedor { get; set; }

		public Fornecedor Fornecedor { get; set; }

		public Cliente Cliente { get; set; }

		public TributOperacaoFiscal TributOperacaoFiscal { get; set; }

		public VendaCabecalho VendaCabecalho { get; set; }

		private IList<NfeAcessoXml> listaNfeAcessoXml;
		public IList<NfeAcessoXml> ListaNfeAcessoXml
		{
			get
			{
				return listaNfeAcessoXml;
			}
			set
			{
				if (value != null)
				{
					listaNfeAcessoXml = value;
					foreach (NfeAcessoXml nfeAcessoXml in listaNfeAcessoXml)
					{
						nfeAcessoXml.NfeCabecalho = this;
					}
				}
			}
		}

		private IList<NfeCteReferenciado> listaNfeCteReferenciado;
		public IList<NfeCteReferenciado> ListaNfeCteReferenciado
		{
			get
			{
				return listaNfeCteReferenciado;
			}
			set
			{
				if (value != null)
				{
					listaNfeCteReferenciado = value;
					foreach (NfeCteReferenciado nfeCteReferenciado in listaNfeCteReferenciado)
					{
						nfeCteReferenciado.NfeCabecalho = this;
					}
				}
			}
		}

		private IList<NfeCupomFiscalReferenciado> listaNfeCupomFiscalReferenciado;
		public IList<NfeCupomFiscalReferenciado> ListaNfeCupomFiscalReferenciado
		{
			get
			{
				return listaNfeCupomFiscalReferenciado;
			}
			set
			{
				if (value != null)
				{
					listaNfeCupomFiscalReferenciado = value;
					foreach (NfeCupomFiscalReferenciado nfeCupomFiscalReferenciado in listaNfeCupomFiscalReferenciado)
					{
						nfeCupomFiscalReferenciado.NfeCabecalho = this;
					}
				}
			}
		}

		private IList<NfeDetalhe> listaNfeDetalhe;
		public IList<NfeDetalhe> ListaNfeDetalhe
		{
			get
			{
				return listaNfeDetalhe;
			}
			set
			{
				if (value != null)
				{
					listaNfeDetalhe = value;
					foreach (NfeDetalhe nfeDetalhe in listaNfeDetalhe)
					{
						nfeDetalhe.NfeCabecalho = this;
					}
				}
			}
		}

		private IList<NfeNfReferenciada> listaNfeNfReferenciada;
		public IList<NfeNfReferenciada> ListaNfeNfReferenciada
		{
			get
			{
				return listaNfeNfReferenciada;
			}
			set
			{
				if (value != null)
				{
					listaNfeNfReferenciada = value;
					foreach (NfeNfReferenciada nfeNfReferenciada in listaNfeNfReferenciada)
					{
						nfeNfReferenciada.NfeCabecalho = this;
					}
				}
			}
		}

		private IList<NfeProcessoReferenciado> listaNfeProcessoReferenciado;
		public IList<NfeProcessoReferenciado> ListaNfeProcessoReferenciado
		{
			get
			{
				return listaNfeProcessoReferenciado;
			}
			set
			{
				if (value != null)
				{
					listaNfeProcessoReferenciado = value;
					foreach (NfeProcessoReferenciado nfeProcessoReferenciado in listaNfeProcessoReferenciado)
					{
						nfeProcessoReferenciado.NfeCabecalho = this;
					}
				}
			}
		}

		private IList<NfeProdRuralReferenciada> listaNfeProdRuralReferenciada;
		public IList<NfeProdRuralReferenciada> ListaNfeProdRuralReferenciada
		{
			get
			{
				return listaNfeProdRuralReferenciada;
			}
			set
			{
				if (value != null)
				{
					listaNfeProdRuralReferenciada = value;
					foreach (NfeProdRuralReferenciada nfeProdRuralReferenciada in listaNfeProdRuralReferenciada)
					{
						nfeProdRuralReferenciada.NfeCabecalho = this;
					}
				}
			}
		}

		private IList<NfeReferenciada> listaNfeReferenciada;
		public IList<NfeReferenciada> ListaNfeReferenciada
		{
			get
			{
				return listaNfeReferenciada;
			}
			set
			{
				if (value != null)
				{
					listaNfeReferenciada = value;
					foreach (NfeReferenciada nfeReferenciada in listaNfeReferenciada)
					{
						nfeReferenciada.NfeCabecalho = this;
					}
				}
			}
		}

    }
}
