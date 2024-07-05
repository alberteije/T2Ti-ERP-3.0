/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_PPP] 
                                                                                
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
using System.Collections.Generic;

namespace T2TiERPFenix.Models
{
    public class FolhaPpp
    {	
		public int Id { get; set; }

		public string Observacao { get; set; }

		public Colaborador Colaborador { get; set; }

		private IList<FolhaPppAtividade> listaFolhaPppAtividade;
		public IList<FolhaPppAtividade> ListaFolhaPppAtividade
		{
			get
			{
				return listaFolhaPppAtividade;
			}
			set
			{
				if (value != null)
				{
					listaFolhaPppAtividade = value;
					foreach (FolhaPppAtividade folhaPppAtividade in listaFolhaPppAtividade)
					{
						folhaPppAtividade.FolhaPpp = this;
					}
				}
			}
		}

		private IList<FolhaPppCat> listaFolhaPppCat;
		public IList<FolhaPppCat> ListaFolhaPppCat
		{
			get
			{
				return listaFolhaPppCat;
			}
			set
			{
				if (value != null)
				{
					listaFolhaPppCat = value;
					foreach (FolhaPppCat folhaPppCat in listaFolhaPppCat)
					{
						folhaPppCat.FolhaPpp = this;
					}
				}
			}
		}

		private IList<FolhaPppExameMedico> listaFolhaPppExameMedico;
		public IList<FolhaPppExameMedico> ListaFolhaPppExameMedico
		{
			get
			{
				return listaFolhaPppExameMedico;
			}
			set
			{
				if (value != null)
				{
					listaFolhaPppExameMedico = value;
					foreach (FolhaPppExameMedico folhaPppExameMedico in listaFolhaPppExameMedico)
					{
						folhaPppExameMedico.FolhaPpp = this;
					}
				}
			}
		}

		private IList<FolhaPppFatorRisco> listaFolhaPppFatorRisco;
		public IList<FolhaPppFatorRisco> ListaFolhaPppFatorRisco
		{
			get
			{
				return listaFolhaPppFatorRisco;
			}
			set
			{
				if (value != null)
				{
					listaFolhaPppFatorRisco = value;
					foreach (FolhaPppFatorRisco folhaPppFatorRisco in listaFolhaPppFatorRisco)
					{
						folhaPppFatorRisco.FolhaPpp = this;
					}
				}
			}
		}

    }
}
