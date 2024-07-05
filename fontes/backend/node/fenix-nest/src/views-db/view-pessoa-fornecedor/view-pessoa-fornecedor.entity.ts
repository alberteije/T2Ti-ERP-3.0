/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VIEW_PESSOA_FORNECEDOR] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'VIEW_PESSOA_FORNECEDOR' })
export class ViewPessoaFornecedor { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'NOME' })
	nome: string;

	@Column({ name: 'TIPO' })
	tipo: string;

	@Column({ name: 'EMAIL' })
	email: string;

	@Column({ name: 'SITE' })
	site: string;

	@Column({ name: 'CPF_CNPJ' })
	cpfCnpj: string;

	@Column({ name: 'RG_IE' })
	rgIe: string;

	@Column({ name: 'DESDE' })
	desde: Date;

	@Column({ name: 'DATA_CADASTRO' })
	dataCadastro: Date;

	@Column({ name: 'OBSERVACAO' })
	observacao: string;

	@Column({ name: 'LOGRADOURO' })
	logradouro: string;

	@Column({ name: 'NUMERO' })
	numero: string;

	@Column({ name: 'COMPLEMENTO' })
	complemento: string;

	@Column({ name: 'BAIRRO' })
	bairro: string;

	@Column({ name: 'CIDADE' })
	cidade: string;

	@Column({ name: 'CEP' })
	cep: string;

	@Column({ name: 'MUNICIPIO_IBGE' })
	municipioIbge: number;

	@Column({ name: 'UF' })
	uf: string;

	@Column({ name: 'ID_PESSOA' })
	idPessoa: number;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.nome = objetoJson['nome'];
			this.tipo = objetoJson['tipo'];
			this.email = objetoJson['email'];
			this.site = objetoJson['site'];
			this.cpfCnpj = objetoJson['cpfCnpj'];
			this.rgIe = objetoJson['rgIe'];
			this.desde = objetoJson['desde'];
			this.dataCadastro = objetoJson['dataCadastro'];
			this.observacao = objetoJson['observacao'];
			this.logradouro = objetoJson['logradouro'];
			this.numero = objetoJson['numero'];
			this.complemento = objetoJson['complemento'];
			this.bairro = objetoJson['bairro'];
			this.cidade = objetoJson['cidade'];
			this.cep = objetoJson['cep'];
			this.municipioIbge = objetoJson['municipioIbge'];
			this.uf = objetoJson['uf'];
			this.idPessoa = objetoJson['idPessoa'];
			
			
		}
	}
}