/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [FIN_CHEQUE_RECEBIDO] 
                                                                                
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
    public class FinChequeRecebido
    {	
		public int Id { get; set; }

		public string Cpf { get; set; }

		public string Cnpj { get; set; }

		public string Nome { get; set; }

		public string CodigoBanco { get; set; }

		public string CodigoAgencia { get; set; }

		public string Conta { get; set; }

		public int? Numero { get; set; }

		public System.Nullable<System.DateTime> DataEmissao { get; set; }

		public System.Nullable<System.DateTime> BomPara { get; set; }

		public System.Nullable<System.DateTime> DataCompensacao { get; set; }

		public System.Nullable<System.Decimal> Valor { get; set; }

		public System.Nullable<System.DateTime> CustodiaData { get; set; }

		public System.Nullable<System.Decimal> CustodiaTarifa { get; set; }

		public System.Nullable<System.Decimal> CustodiaComissao { get; set; }

		public System.Nullable<System.DateTime> DescontoData { get; set; }

		public System.Nullable<System.Decimal> DescontoTarifa { get; set; }

		public System.Nullable<System.Decimal> DescontoComissao { get; set; }

		public System.Nullable<System.Decimal> ValorRecebido { get; set; }

		public Pessoa Pessoa { get; set; }

    }
}
