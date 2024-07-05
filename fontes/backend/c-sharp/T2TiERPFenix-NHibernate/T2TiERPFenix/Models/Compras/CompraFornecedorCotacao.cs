/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_FORNECEDOR_COTACAO] 
                                                                                
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
    public class CompraFornecedorCotacao
    {	
		public int Id { get; set; }

		public string Codigo { get; set; }

		public string PrazoEntrega { get; set; }

		public string VendaCondicoesPagamento { get; set; }

		public System.Nullable<System.Decimal> ValorSubtotal { get; set; }

		public System.Nullable<System.Decimal> TaxaDesconto { get; set; }

		public System.Nullable<System.Decimal> ValorDesconto { get; set; }

		public System.Nullable<System.Decimal> ValorTotal { get; set; }

		public CompraCotacao CompraCotacao { get; set; }

		public Fornecedor Fornecedor { get; set; }

		private IList<CompraCotacaoDetalhe> listaCompraCotacaoDetalhe;
		public IList<CompraCotacaoDetalhe> ListaCompraCotacaoDetalhe
		{
			get
			{
				return listaCompraCotacaoDetalhe;
			}
			set
			{
				if (value != null)
				{
					listaCompraCotacaoDetalhe = value;
					foreach (CompraCotacaoDetalhe compraCotacaoDetalhe in listaCompraCotacaoDetalhe)
					{
						compraCotacaoDetalhe.CompraFornecedorCotacao = this;
					}
				}
			}
		}

    }
}