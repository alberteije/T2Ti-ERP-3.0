/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FISCAL_NOTA_FISCAL_ENTRADA] 
                                                                                
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

namespace T2TiERPFenix.Models
{
    public class FiscalNotaFiscalEntrada
    {	
		public int Id { get; set; }

		public string Competencia { get; set; }

		public int? CfopEntrada { get; set; }

		public System.Nullable<System.Decimal> ValorRateioFrete { get; set; }

		public System.Nullable<System.Decimal> ValorCustoMedio { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsAntecipado { get; set; }

		public System.Nullable<System.Decimal> ValorBcIcmsAntecipado { get; set; }

		public System.Nullable<System.Decimal> ValorBcIcmsCreditado { get; set; }

		public System.Nullable<System.Decimal> ValorBcPisCreditado { get; set; }

		public System.Nullable<System.Decimal> ValorBcCofinsCreditado { get; set; }

		public System.Nullable<System.Decimal> ValorBcIpiCreditado { get; set; }

		public string CstCreditoIcms { get; set; }

		public string CstCreditoPis { get; set; }

		public string CstCreditoCofins { get; set; }

		public string CstCreditoIpi { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsCreditado { get; set; }

		public System.Nullable<System.Decimal> ValorPisCreditado { get; set; }

		public System.Nullable<System.Decimal> ValorCofinsCreditado { get; set; }

		public System.Nullable<System.Decimal> ValorIpiCreditado { get; set; }

		public int? QtdeParcelaCreditoPis { get; set; }

		public int? QtdeParcelaCreditoCofins { get; set; }

		public int? QtdeParcelaCreditoIcms { get; set; }

		public int? QtdeParcelaCreditoIpi { get; set; }

		public System.Nullable<System.Decimal> AliquotaCreditoIcms { get; set; }

		public System.Nullable<System.Decimal> AliquotaCreditoPis { get; set; }

		public System.Nullable<System.Decimal> AliquotaCreditoCofins { get; set; }

		public System.Nullable<System.Decimal> AliquotaCreditoIpi { get; set; }

		public NfeCabecalho NfeCabecalho { get; set; }

    }
}
