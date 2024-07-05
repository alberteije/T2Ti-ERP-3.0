/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [SINDICATO] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'SINDICATO' })
export class Sindicato { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'NOME' })
	nome: string;

	@Column({ name: 'CODIGO_BANCO' })
	codigoBanco: number;

	@Column({ name: 'CODIGO_AGENCIA' })
	codigoAgencia: number;

	@Column({ name: 'CONTA_BANCO' })
	contaBanco: string;

	@Column({ name: 'CODIGO_CEDENTE' })
	codigoCedente: string;

	@Column({ name: 'LOGRADOURO' })
	logradouro: string;

	@Column({ name: 'NUMERO' })
	numero: string;

	@Column({ name: 'BAIRRO' })
	bairro: string;

	@Column({ name: 'MUNICIPIO_IBGE' })
	municipioIbge: number;

	@Column({ name: 'UF' })
	uf: string;

	@Column({ name: 'FONE1' })
	fone1: string;

	@Column({ name: 'FONE2' })
	fone2: string;

	@Column({ name: 'EMAIL' })
	email: string;

	@Column({ name: 'TIPO_SINDICATO' })
	tipoSindicato: string;

	@Column({ name: 'DATA_BASE' })
	dataBase: Date;

	@Column({ name: 'PISO_SALARIAL' })
	pisoSalarial: number;

	@Column({ name: 'CNPJ' })
	cnpj: string;

	@Column({ name: 'CLASSIFICACAO_CONTABIL_CONTA' })
	classificacaoContabilConta: string;


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
			this.codigoBanco = objetoJson['codigoBanco'];
			this.codigoAgencia = objetoJson['codigoAgencia'];
			this.contaBanco = objetoJson['contaBanco'];
			this.codigoCedente = objetoJson['codigoCedente'];
			this.logradouro = objetoJson['logradouro'];
			this.numero = objetoJson['numero'];
			this.bairro = objetoJson['bairro'];
			this.municipioIbge = objetoJson['municipioIbge'];
			this.uf = objetoJson['uf'];
			this.fone1 = objetoJson['fone1'];
			this.fone2 = objetoJson['fone2'];
			this.email = objetoJson['email'];
			this.tipoSindicato = objetoJson['tipoSindicato'];
			this.dataBase = objetoJson['dataBase'];
			this.pisoSalarial = objetoJson['pisoSalarial'];
			this.cnpj = objetoJson['cnpj'];
			this.classificacaoContabilConta = objetoJson['classificacaoContabilConta'];
			
			
		}
	}
}