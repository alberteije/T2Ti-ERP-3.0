/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_CABECALHO] 
                                                                                
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
    public class VendaCabecalho
    {	
		public int Id { get; set; }

		public System.Nullable<System.DateTime> DataVenda { get; set; }

		public System.Nullable<System.DateTime> DataSaida { get; set; }

		public string HoraSaida { get; set; }

		public int? NumeroFatura { get; set; }

		public string LocalEntrega { get; set; }

		public string LocalCobranca { get; set; }

		public System.Nullable<System.Decimal> ValorSubtotal { get; set; }

		public System.Nullable<System.Decimal> TaxaComissao { get; set; }

		public System.Nullable<System.Decimal> ValorComissao { get; set; }

		public System.Nullable<System.Decimal> TaxaDesconto { get; set; }

		public System.Nullable<System.Decimal> ValorDesconto { get; set; }

		public System.Nullable<System.Decimal> ValorTotal { get; set; }

		public string TipoFrete { get; set; }

		public string FormaPagamento { get; set; }

		public System.Nullable<System.Decimal> ValorFrete { get; set; }

		public System.Nullable<System.Decimal> ValorSeguro { get; set; }

		public string Observacao { get; set; }

		public string Situacao { get; set; }

		public string DiaFixoParcela { get; set; }

		public VendaOrcamentoCabecalho VendaOrcamentoCabecalho { get; set; }

		public VendaCondicoesPagamento VendaCondicoesPagamento { get; set; }

		public NotaFiscalTipo NotaFiscalTipo { get; set; }

		public Cliente Cliente { get; set; }

		public Transportadora Transportadora { get; set; }

		public Vendedor Vendedor { get; set; }

		private IList<VendaComissao> listaVendaComissao;
		public IList<VendaComissao> ListaVendaComissao
		{
			get
			{
				return listaVendaComissao;
			}
			set
			{
				if (value != null)
				{
					listaVendaComissao = value;
					foreach (VendaComissao vendaComissao in listaVendaComissao)
					{
						vendaComissao.VendaCabecalho = this;
					}
				}
			}
		}

		private IList<VendaDetalhe> listaVendaDetalhe;
		public IList<VendaDetalhe> ListaVendaDetalhe
		{
			get
			{
				return listaVendaDetalhe;
			}
			set
			{
				if (value != null)
				{
					listaVendaDetalhe = value;
					foreach (VendaDetalhe vendaDetalhe in listaVendaDetalhe)
					{
						vendaDetalhe.VendaCabecalho = this;
					}
				}
			}
		}

        private VendaFrete vendaFrete;
        public VendaFrete VendaFrete
        {
            get
            {
                return vendaFrete;
            }
            set
            {
                vendaFrete = value;
                if (value != null)
                {
                    vendaFrete.VendaCabecalho = this;
                }
            }
        }
    }
}
