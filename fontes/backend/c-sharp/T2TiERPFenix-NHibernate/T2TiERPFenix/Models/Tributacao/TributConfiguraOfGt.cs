/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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
    public class TributConfiguraOfGt
    {	
		public int Id { get; set; }

		private TributCofins tributCofins;
		public TributCofins TributCofins
		{
			get
			{
				return tributCofins;
			}
			set
			{
				tributCofins = value;
				if (value != null)
				{
					tributCofins.TributConfiguraOfGt = this;
				}
			}
		}

		private TributIpi tributIpi;
		public TributIpi TributIpi
		{
			get
			{
				return tributIpi;
			}
			set
			{
				tributIpi = value;
				if (value != null)
				{
					tributIpi.TributConfiguraOfGt = this;
				}
			}
		}

		private TributPis tributPis;
		public TributPis TributPis
		{
			get
			{
				return tributPis;
			}
			set
			{
				tributPis = value;
				if (value != null)
				{
					tributPis.TributConfiguraOfGt = this;
				}
			}
		}

		public TributGrupoTributario TributGrupoTributario { get; set; }

		public TributOperacaoFiscal TributOperacaoFiscal { get; set; }

		private IList<TributIcmsUf> listaTributIcmsUf;
		public IList<TributIcmsUf> ListaTributIcmsUf
		{
			get
			{
				return listaTributIcmsUf;
			}
			set
			{
				if (value != null)
				{
					listaTributIcmsUf = value;
					foreach (TributIcmsUf tributIcmsUf in listaTributIcmsUf)
					{
						tributIcmsUf.TributConfiguraOfGt = this;
					}
				}
			}
		}

    }
}
