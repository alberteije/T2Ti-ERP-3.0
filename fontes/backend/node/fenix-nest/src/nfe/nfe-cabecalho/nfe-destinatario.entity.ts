/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DESTINATARIO] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, JoinColumn } from 'typeorm';
import { NfeCabecalho } from '../../entities-export';

@Entity({ name: 'NFE_DESTINATARIO' })
export class NfeDestinatario { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'CNPJ' })
	cnpj: string;

	@Column({ name: 'CPF' })
	cpf: string;

	@Column({ name: 'ESTRANGEIRO_IDENTIFICACAO' })
	estrangeiroIdentificacao: string;

	@Column({ name: 'NOME' })
	nome: string;

	@Column({ name: 'LOGRADOURO' })
	logradouro: string;

	@Column({ name: 'NUMERO' })
	numero: string;

	@Column({ name: 'COMPLEMENTO' })
	complemento: string;

	@Column({ name: 'BAIRRO' })
	bairro: string;

	@Column({ name: 'CODIGO_MUNICIPIO' })
	codigoMunicipio: number;

	@Column({ name: 'NOME_MUNICIPIO' })
	nomeMunicipio: string;

	@Column({ name: 'UF' })
	uf: string;

	@Column({ name: 'CEP' })
	cep: string;

	@Column({ name: 'CODIGO_PAIS' })
	codigoPais: number;

	@Column({ name: 'NOME_PAIS' })
	nomePais: string;

	@Column({ name: 'TELEFONE' })
	telefone: string;

	@Column({ name: 'INDICADOR_IE' })
	indicadorIe: string;

	@Column({ name: 'INSCRICAO_ESTADUAL' })
	inscricaoEstadual: string;

	@Column({ name: 'SUFRAMA' })
	suframa: number;

	@Column({ name: 'INSCRICAO_MUNICIPAL' })
	inscricaoMunicipal: string;

	@Column({ name: 'EMAIL' })
	email: string;


	/**
	* Relations
	*/
    @OneToOne(() => NfeCabecalho, nfeCabecalho => nfeCabecalho.nfeDestinatario)
    @JoinColumn({ name: "ID_NFE_CABECALHO" })
    nfeCabecalho: NfeCabecalho;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.cnpj = objetoJson['cnpj'];
			this.cpf = objetoJson['cpf'];
			this.estrangeiroIdentificacao = objetoJson['estrangeiroIdentificacao'];
			this.nome = objetoJson['nome'];
			this.logradouro = objetoJson['logradouro'];
			this.numero = objetoJson['numero'];
			this.complemento = objetoJson['complemento'];
			this.bairro = objetoJson['bairro'];
			this.codigoMunicipio = objetoJson['codigoMunicipio'];
			this.nomeMunicipio = objetoJson['nomeMunicipio'];
			this.uf = objetoJson['uf'];
			this.cep = objetoJson['cep'];
			this.codigoPais = objetoJson['codigoPais'];
			this.nomePais = objetoJson['nomePais'];
			this.telefone = objetoJson['telefone'];
			this.indicadorIe = objetoJson['indicadorIe'];
			this.inscricaoEstadual = objetoJson['inscricaoEstadual'];
			this.suframa = objetoJson['suframa'];
			this.inscricaoMunicipal = objetoJson['inscricaoMunicipal'];
			this.email = objetoJson['email'];
			
			
		}
	}
}