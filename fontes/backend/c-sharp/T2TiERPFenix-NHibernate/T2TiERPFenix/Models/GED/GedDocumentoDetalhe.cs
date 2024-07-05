/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [GED_DOCUMENTO_DETALHE] 
                                                                                
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
    public class GedDocumentoDetalhe
    {	
		public int Id { get; set; }

		public string Nome { get; set; }

		public string Descricao { get; set; }

		public string PalavrasChave { get; set; }

		public string PodeExcluir { get; set; }

		public string PodeAlterar { get; set; }

		public string Assinado { get; set; }

		public System.Nullable<System.DateTime> DataFimVigencia { get; set; }

		public System.Nullable<System.DateTime> DataExclusao { get; set; }

		public GedDocumentoCabecalho GedDocumentoCabecalho { get; set; }

		public GedTipoDocumento GedTipoDocumento { get; set; }

		private IList<GedVersaoDocumento> listaGedVersaoDocumento;
		public IList<GedVersaoDocumento> ListaGedVersaoDocumento
		{
			get
			{
				return listaGedVersaoDocumento;
			}
			set
			{
				if (value != null)
				{
					listaGedVersaoDocumento = value;
					foreach (GedVersaoDocumento gedVersaoDocumento in listaGedVersaoDocumento)
					{
						gedVersaoDocumento.GedDocumentoDetalhe = this;
					}
				}
			}
		}

    }
}
