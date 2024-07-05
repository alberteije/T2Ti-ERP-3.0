/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [MDFE_EMITENTE] 
                                                                                
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

@Entity({ name: 'MDFE_EMITENTE' })
export class MdfeEmitente { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'ID_MDFE_CABECALHO' })
	idMdfeCabecalho: number;

	@Column({ name: 'NOME' })
	nome: string;

	@Column({ name: 'FANTASIA' })
	fantasia: string;

	@Column({ name: 'CNPJ' })
	cnpj: string;

	@Column({ name: 'IE' })
	ie: number;

	@Column({ name: 'LOGRADOURO' })
	logradouro: string;

	@Column({ name: 'NUMERO' })
	numero: string;

	@Column({ name: 'COMPLEMENTO' })
	complemento: string;

	@Column({ name: 'BAIRRO' })
	bairro: string;

	@Column({ name: 'CODIGO_MUNICIPIO' })
	codigoMunicipio: string;

	@Column({ name: 'NOME_MUNICIPIO' })
	nomeMunicipio: string;

	@Column({ name: 'CEP' })
	cep: string;

	@Column({ name: 'UF' })
	uf: string;

	@Column({ name: 'TELEFONE' })
	telefone: string;

	@Column({ name: 'EMAIL' })
	email: string;


	/**
	* Relations
	*/

	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.idMdfeCabecalho = objetoJson['idMdfeCabecalho'];
			this.nome = objetoJson['nome'];
			this.fantasia = objetoJson['fantasia'];
			this.cnpj = objetoJson['cnpj'];
			this.ie = objetoJson['ie'];
			this.logradouro = objetoJson['logradouro'];
			this.numero = objetoJson['numero'];
			this.complemento = objetoJson['complemento'];
			this.bairro = objetoJson['bairro'];
			this.codigoMunicipio = objetoJson['codigoMunicipio'];
			this.nomeMunicipio = objetoJson['nomeMunicipio'];
			this.cep = objetoJson['cep'];
			this.uf = objetoJson['uf'];
			this.telefone = objetoJson['telefone'];
			this.email = objetoJson['email'];
			
			
		}
	}
}