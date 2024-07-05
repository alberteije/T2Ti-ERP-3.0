/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_PESSOA_COLABORADOR] 
                                                                                
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
    public class ViewPessoaColaborador
    {	
		public int Id { get; set; }

		public string Nome { get; set; }

		public string Tipo { get; set; }

		public string Email { get; set; }

		public string Site { get; set; }

		public string CpfCnpj { get; set; }

		public string RgIe { get; set; }

		public string Matricula { get; set; }

		public System.Nullable<System.DateTime> DataCadastro { get; set; }

		public System.Nullable<System.DateTime> DataAdmissao { get; set; }

		public System.Nullable<System.DateTime> DataDemissao { get; set; }

		public string CtpsNumero { get; set; }

		public string CtpsSerie { get; set; }

		public System.Nullable<System.DateTime> CtpsDataExpedicao { get; set; }

		public string CtpsUf { get; set; }

		public string Observacao { get; set; }

		public string Logradouro { get; set; }

		public string Numero { get; set; }

		public string Complemento { get; set; }

		public string Bairro { get; set; }

		public string Cidade { get; set; }

		public string Cep { get; set; }

		public int? MunicipioIbge { get; set; }

		public string Uf { get; set; }

		public int? IdPessoa { get; set; }

		public int? IdCargo { get; set; }

		public int? IdSetor { get; set; }

    }
}
