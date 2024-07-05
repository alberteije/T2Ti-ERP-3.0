/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [FIN_CONFIGURACAO_BOLETO] 
                                                                                
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
    public class FinConfiguracaoBoleto
    {	
		public int Id { get; set; }

		public string Instrucao01 { get; set; }

		public string Instrucao02 { get; set; }

		public string CaminhoArquivoRemessa { get; set; }

		public string CaminhoArquivoRetorno { get; set; }

		public string CaminhoArquivoLogotipo { get; set; }

		public string CaminhoArquivoPdf { get; set; }

		public string Mensagem { get; set; }

		public string LocalPagamento { get; set; }

		public string LayoutRemessa { get; set; }

		public string Aceite { get; set; }

		public string Especie { get; set; }

		public string Carteira { get; set; }

		public string CodigoConvenio { get; set; }

		public string CodigoCedente { get; set; }

		public System.Nullable<System.Decimal> TaxaMulta { get; set; }

		public System.Nullable<System.Decimal> TaxaJuro { get; set; }

		public int? DiasProtesto { get; set; }

		public string NossoNumeroAnterior { get; set; }

		public BancoContaCaixa BancoContaCaixa { get; set; }

    }
}
