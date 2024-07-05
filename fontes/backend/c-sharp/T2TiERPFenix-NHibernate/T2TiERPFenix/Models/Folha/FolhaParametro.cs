/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_PARAMETRO] 
                                                                                
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
    public class FolhaParametro
    {	
		public int Id { get; set; }

		public string Competencia { get; set; }

		public string ContribuiPis { get; set; }

		public System.Nullable<System.Decimal> AliquotaPis { get; set; }

		public string DiscriminarDsr { get; set; }

		public string DiaPagamento { get; set; }

		public string CalculoProporcionalidade { get; set; }

		public string DescontarFaltas13 { get; set; }

		public string PagarAdicionais13 { get; set; }

		public string PagarEstagiarios13 { get; set; }

		public string MesAdiantamento13 { get; set; }

		public System.Nullable<System.Decimal> PercentualAdiantam13 { get; set; }

		public string FeriasDescontarFaltas { get; set; }

		public string FeriasPagarAdicionais { get; set; }

		public string FeriasAdiantar13 { get; set; }

		public string FeriasPagarEstagiarios { get; set; }

		public string FeriasCalcJustaCausa { get; set; }

		public string FeriasMovimentoMensal { get; set; }

    }
}
