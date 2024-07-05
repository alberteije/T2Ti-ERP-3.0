/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [PESSOA] 
                                                                                
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
    public class Pessoa
    {	
		public int Id { get; set; }

		public string Nome { get; set; }

		public string Tipo { get; set; }

		public string Site { get; set; }

		public string Email { get; set; }

		public string EhCliente { get; set; }

		public string EhFornecedor { get; set; }

		public string EhTransportadora { get; set; }

		public string EhColaborador { get; set; }

		public string EhContador { get; set; }

		private Cliente cliente;
		public Cliente Cliente
		{
			get
			{
				return cliente;
			}
			set
			{
				cliente = value;
				if (value != null)
				{
					cliente.Pessoa = this;
				}
			}
		}

		private Colaborador colaborador;
		public Colaborador Colaborador
		{
			get
			{
				return colaborador;
			}
			set
			{
				colaborador = value;
				if (value != null)
				{
					colaborador.Pessoa = this;
				}
			}
		}

		private Contador contador;
		public Contador Contador
		{
			get
			{
				return contador;
			}
			set
			{
				contador = value;
				if (value != null)
				{
					contador.Pessoa = this;
				}
			}
		}

		private Fornecedor fornecedor;
		public Fornecedor Fornecedor
		{
			get
			{
				return fornecedor;
			}
			set
			{
				fornecedor = value;
				if (value != null)
				{
					fornecedor.Pessoa = this;
				}
			}
		}

		private PessoaFisica pessoaFisica;
		public PessoaFisica PessoaFisica
		{
			get
			{
				return pessoaFisica;
			}
			set
			{
				pessoaFisica = value;
				if (value != null)
				{
					pessoaFisica.Pessoa = this;
				}
			}
		}

		private PessoaJuridica pessoaJuridica;
		public PessoaJuridica PessoaJuridica
		{
			get
			{
				return pessoaJuridica;
			}
			set
			{
				pessoaJuridica = value;
				if (value != null)
				{
					pessoaJuridica.Pessoa = this;
				}
			}
		}

		private Transportadora transportadora;
		public Transportadora Transportadora
		{
			get
			{
				return transportadora;
			}
			set
			{
				transportadora = value;
				if (value != null)
				{
					transportadora.Pessoa = this;
				}
			}
		}

		private IList<PessoaContato> listaPessoaContato;
		public IList<PessoaContato> ListaPessoaContato
		{
			get
			{
				return listaPessoaContato;
			}
			set
			{
				if (value != null)
				{
					listaPessoaContato = value;
					foreach (PessoaContato pessoaContato in listaPessoaContato)
					{
						pessoaContato.Pessoa = this;
					}
				}
			}
		}

		private IList<PessoaEndereco> listaPessoaEndereco;
		public IList<PessoaEndereco> ListaPessoaEndereco
		{
			get
			{
				return listaPessoaEndereco;
			}
			set
			{
				if (value != null)
				{
					listaPessoaEndereco = value;
					foreach (PessoaEndereco pessoaEndereco in listaPessoaEndereco)
					{
						pessoaEndereco.Pessoa = this;
					}
				}
			}
		}

		private IList<PessoaTelefone> listaPessoaTelefone;
		public IList<PessoaTelefone> ListaPessoaTelefone
		{
			get
			{
				return listaPessoaTelefone;
			}
			set
			{
				if (value != null)
				{
					listaPessoaTelefone = value;
					foreach (PessoaTelefone pessoaTelefone in listaPessoaTelefone)
					{
						pessoaTelefone.Pessoa = this;
					}
				}
			}
		}

    }
}
