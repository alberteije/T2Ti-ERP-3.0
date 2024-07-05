/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [OS_ABERTURA] 
                                                                                
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
    public class OsAbertura
    {	
		public int Id { get; set; }

		public string Numero { get; set; }

		public System.Nullable<System.DateTime> DataInicio { get; set; }

		public string HoraInicio { get; set; }

		public System.Nullable<System.DateTime> DataPrevisao { get; set; }

		public string HoraPrevisao { get; set; }

		public System.Nullable<System.DateTime> DataFim { get; set; }

		public string HoraFim { get; set; }

		public string NomeContato { get; set; }

		public string FoneContato { get; set; }

		public string ObservacaoCliente { get; set; }

		public string ObservacaoAbertura { get; set; }

		public OsStatus OsStatus { get; set; }

		public Cliente Cliente { get; set; }

		public Colaborador Colaborador { get; set; }

		private IList<OsAberturaEquipamento> listaOsAberturaEquipamento;
		public IList<OsAberturaEquipamento> ListaOsAberturaEquipamento
		{
			get
			{
				return listaOsAberturaEquipamento;
			}
			set
			{
				if (value != null)
				{
					listaOsAberturaEquipamento = value;
					foreach (OsAberturaEquipamento osAberturaEquipamento in listaOsAberturaEquipamento)
					{
						osAberturaEquipamento.OsAbertura = this;
					}
				}
			}
		}

		private IList<OsEvolucao> listaOsEvolucao;
		public IList<OsEvolucao> ListaOsEvolucao
		{
			get
			{
				return listaOsEvolucao;
			}
			set
			{
				if (value != null)
				{
					listaOsEvolucao = value;
					foreach (OsEvolucao osEvolucao in listaOsEvolucao)
					{
						osEvolucao.OsAbertura = this;
					}
				}
			}
		}

		private IList<OsProdutoServico> listaOsProdutoServico;
		public IList<OsProdutoServico> ListaOsProdutoServico
		{
			get
			{
				return listaOsProdutoServico;
			}
			set
			{
				if (value != null)
				{
					listaOsProdutoServico = value;
					foreach (OsProdutoServico osProdutoServico in listaOsProdutoServico)
					{
						osProdutoServico.OsAbertura = this;
					}
				}
			}
		}

    }
}
