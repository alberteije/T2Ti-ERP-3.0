/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_CABECALHO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
    public class CteCabecalho
    {	
		public int Id { get; set; }

		public int? UfEmitente { get; set; }

		public string CodigoNumerico { get; set; }

		public int? Cfop { get; set; }

		public string NaturezaOperacao { get; set; }

		public string FormaPagamento { get; set; }

		public string Modelo { get; set; }

		public string Serie { get; set; }

		public string Numero { get; set; }

		public System.Nullable<System.DateTime> DataHoraEmissao { get; set; }

		public string FormatoImpressaoDacte { get; set; }

		public string TipoEmissao { get; set; }

		public string ChaveAcesso { get; set; }

		public string DigitoChaveAcesso { get; set; }

		public string Ambiente { get; set; }

		public string TipoCte { get; set; }

		public string ProcessoEmissao { get; set; }

		public string VersaoProcessoEmissao { get; set; }

		public string ChaveReferenciado { get; set; }

		public int? CodigoMunicipioEnvio { get; set; }

		public string NomeMunicipioEnvio { get; set; }

		public string UfEnvio { get; set; }

		public string Modal { get; set; }

		public string TipoServico { get; set; }

		public int? CodigoMunicipioIniPrestacao { get; set; }

		public string NomeMunicipioIniPrestacao { get; set; }

		public string UfIniPrestacao { get; set; }

		public int? CodigoMunicipioFimPrestacao { get; set; }

		public string NomeMunicipioFimPrestacao { get; set; }

		public string UfFimPrestacao { get; set; }

		public string Retira { get; set; }

		public string RetiraDetalhe { get; set; }

		public string Tomador { get; set; }

		public System.Nullable<System.DateTime> DataEntradaContingencia { get; set; }

		public string JustificativaContingencia { get; set; }

		public string CaracAdicionalTransporte { get; set; }

		public string CaracAdicionalServico { get; set; }

		public string FuncionarioEmissor { get; set; }

		public string FluxoOrigem { get; set; }

		public string EntregaTipoPeriodo { get; set; }

		public System.Nullable<System.DateTime> EntregaDataProgramada { get; set; }

		public System.Nullable<System.DateTime> EntregaDataInicial { get; set; }

		public System.Nullable<System.DateTime> EntregaDataFinal { get; set; }

		public string EntregaTipoHora { get; set; }

		public string EntregaHoraProgramada { get; set; }

		public string EntregaHoraInicial { get; set; }

		public string EntregaHoraFinal { get; set; }

		public string MunicipioOrigemCalculo { get; set; }

		public string MunicipioDestinoCalculo { get; set; }

		public string ObservacoesGerais { get; set; }

		public System.Nullable<System.Decimal> ValorTotalServico { get; set; }

		public System.Nullable<System.Decimal> ValorReceber { get; set; }

		public string Cst { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoIcms { get; set; }

		public System.Nullable<System.Decimal> AliquotaIcms { get; set; }

		public System.Nullable<System.Decimal> ValorIcms { get; set; }

		public System.Nullable<System.Decimal> PercentualReducaoBcIcms { get; set; }

		public System.Nullable<System.Decimal> ValorBcIcmsStRetido { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsStRetido { get; set; }

		public System.Nullable<System.Decimal> AliquotaIcmsStRetido { get; set; }

		public System.Nullable<System.Decimal> ValorCreditoPresumidoIcms { get; set; }

		public System.Nullable<System.Decimal> PercentualBcIcmsOutraUf { get; set; }

		public System.Nullable<System.Decimal> ValorBcIcmsOutraUf { get; set; }

		public System.Nullable<System.Decimal> AliquotaIcmsOutraUf { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsOutraUf { get; set; }

		public string SimplesNacionalIndicador { get; set; }

		public System.Nullable<System.Decimal> SimplesNacionalTotal { get; set; }

		public string InformacoesAddFisco { get; set; }

		public System.Nullable<System.Decimal> ValorTotalCarga { get; set; }

		public string ProdutoPredominante { get; set; }

		public string CargaOutrasCaracteristicas { get; set; }

		public int? ModalVersaoLayout { get; set; }

		public string ChaveCteSubstituido { get; set; }

		private CteDestinatario cteDestinatario;
		public CteDestinatario CteDestinatario
		{
			get
			{
				return cteDestinatario;
			}
			set
			{
				cteDestinatario = value;
				if (value != null)
				{
					cteDestinatario.CteCabecalho = this;
				}
			}
		}

		private CteLocalEntrega cteLocalEntrega;
		public CteLocalEntrega CteLocalEntrega
		{
			get
			{
				return cteLocalEntrega;
			}
			set
			{
				cteLocalEntrega = value;
				if (value != null)
				{
					cteLocalEntrega.CteCabecalho = this;
				}
			}
		}

		private CteRemetente cteRemetente;
		public CteRemetente CteRemetente
		{
			get
			{
				return cteRemetente;
			}
			set
			{
				cteRemetente = value;
				if (value != null)
				{
					cteRemetente.CteCabecalho = this;
				}
			}
		}

		private CteRodoviario cteRodoviario;
		public CteRodoviario CteRodoviario
		{
			get
			{
				return cteRodoviario;
			}
			set
			{
				cteRodoviario = value;
				if (value != null)
				{
					cteRodoviario.CteCabecalho = this;
				}
			}
		}

		private CteTomador cteTomador;
		public CteTomador CteTomador
		{
			get
			{
				return cteTomador;
			}
			set
			{
				cteTomador = value;
				if (value != null)
				{
					cteTomador.CteCabecalho = this;
				}
			}
		}

		private IList<CteCarga> listaCteCarga;
		public IList<CteCarga> ListaCteCarga
		{
			get
			{
				return listaCteCarga;
			}
			set
			{
				if (value != null)
				{
					listaCteCarga = value;
					foreach (CteCarga cteCarga in listaCteCarga)
					{
						cteCarga.CteCabecalho = this;
					}
				}
			}
		}

    }
}
