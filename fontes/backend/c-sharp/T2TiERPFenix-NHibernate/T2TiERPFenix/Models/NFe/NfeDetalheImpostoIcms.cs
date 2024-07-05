/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS] 
                                                                                
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

namespace T2TiERPFenix.Models
{
    public class NfeDetalheImpostoIcms
    {	
		public int Id { get; set; }

		public string OrigemMercadoria { get; set; }

		public string CstIcms { get; set; }

		public string Csosn { get; set; }

		public string ModalidadeBcIcms { get; set; }

		public System.Nullable<System.Decimal> PercentualReducaoBcIcms { get; set; }

		public System.Nullable<System.Decimal> ValorBcIcms { get; set; }

		public System.Nullable<System.Decimal> AliquotaIcms { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsOperacao { get; set; }

		public System.Nullable<System.Decimal> PercentualDiferimento { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsDiferido { get; set; }

		public System.Nullable<System.Decimal> ValorIcms { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoFcp { get; set; }

		public System.Nullable<System.Decimal> PercentualFcp { get; set; }

		public System.Nullable<System.Decimal> ValorFcp { get; set; }

		public string ModalidadeBcIcmsSt { get; set; }

		public System.Nullable<System.Decimal> PercentualMvaIcmsSt { get; set; }

		public System.Nullable<System.Decimal> PercentualReducaoBcIcmsSt { get; set; }

		public System.Nullable<System.Decimal> ValorBaseCalculoIcmsSt { get; set; }

		public System.Nullable<System.Decimal> AliquotaIcmsSt { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsSt { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoFcpSt { get; set; }

		public System.Nullable<System.Decimal> PercentualFcpSt { get; set; }

		public System.Nullable<System.Decimal> ValorFcpSt { get; set; }

		public string UfSt { get; set; }

		public System.Nullable<System.Decimal> PercentualBcOperacaoPropria { get; set; }

		public System.Nullable<System.Decimal> ValorBcIcmsStRetido { get; set; }

		public System.Nullable<System.Decimal> AliquotaSuportadaConsumidor { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsSubstituto { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsStRetido { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoFcpStRetido { get; set; }

		public System.Nullable<System.Decimal> PercentualFcpStRetido { get; set; }

		public System.Nullable<System.Decimal> ValorFcpStRetido { get; set; }

		public string MotivoDesoneracaoIcms { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsDesonerado { get; set; }

		public System.Nullable<System.Decimal> AliquotaCreditoIcmsSn { get; set; }

		public System.Nullable<System.Decimal> ValorCreditoIcmsSn { get; set; }

		public System.Nullable<System.Decimal> ValorBcIcmsStDestino { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsStDestino { get; set; }

		public System.Nullable<System.Decimal> PercentualReducaoBcEfetivo { get; set; }

		public System.Nullable<System.Decimal> ValorBcEfetivo { get; set; }

		public System.Nullable<System.Decimal> AliquotaIcmsEfetivo { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsEfetivo { get; set; }

		public NfeDetalhe NfeDetalhe { get; set; }

    }
}
