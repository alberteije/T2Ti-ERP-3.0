/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PATRIM_BEM] 
                                                                                
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
    public class PatrimBem
    {	
		public int Id { get; set; }

		public int? IdCentroResultado { get; set; }

		public int? IdPatrimTipoAquisicaoBem { get; set; }

		public int? IdPatrimEstadoConservacao { get; set; }

		public int? IdPatrimGrupoBem { get; set; }

		public int? IdFornecedor { get; set; }

		public int? IdColaborador { get; set; }

		public int? IdSetor { get; set; }

		public string NumeroNb { get; set; }

		public string Nome { get; set; }

		public string Descricao { get; set; }

		public string NumeroSerie { get; set; }

		public System.Nullable<System.DateTime> DataAquisicao { get; set; }

		public System.Nullable<System.DateTime> DataAceite { get; set; }

		public System.Nullable<System.DateTime> DataCadastro { get; set; }

		public System.Nullable<System.DateTime> DataContabilizado { get; set; }

		public System.Nullable<System.DateTime> DataVistoria { get; set; }

		public System.Nullable<System.DateTime> DataMarcacao { get; set; }

		public System.Nullable<System.DateTime> DataBaixa { get; set; }

		public System.Nullable<System.DateTime> VencimentoGarantia { get; set; }

		public string NumeroNotaFiscal { get; set; }

		public string ChaveNfe { get; set; }

		public System.Nullable<System.Decimal> ValorOriginal { get; set; }

		public System.Nullable<System.Decimal> ValorCompra { get; set; }

		public System.Nullable<System.Decimal> ValorAtualizado { get; set; }

		public System.Nullable<System.Decimal> ValorBaixa { get; set; }

		public string Deprecia { get; set; }

		public string MetodoDepreciacao { get; set; }

		public System.Nullable<System.DateTime> InicioDepreciacao { get; set; }

		public System.Nullable<System.DateTime> UltimaDepreciacao { get; set; }

		public string TipoDepreciacao { get; set; }

		public System.Nullable<System.Decimal> TaxaAnualDepreciacao { get; set; }

		public System.Nullable<System.Decimal> TaxaMensalDepreciacao { get; set; }

		public System.Nullable<System.Decimal> TaxaDepreciacaoAcelerada { get; set; }

		public System.Nullable<System.Decimal> TaxaDepreciacaoIncentivada { get; set; }

		public string Funcao { get; set; }

    }
}
