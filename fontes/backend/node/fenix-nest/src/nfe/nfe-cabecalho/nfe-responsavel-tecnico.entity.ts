/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_RESPONSAVEL_TECNICO] 
                                                                                
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

@Entity({ name: 'NFE_RESPONSAVEL_TECNICO' })
export class NfeResponsavelTecnico { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'CNPJ' })
	cnpj: string;

	@Column({ name: 'CONTATO' })
	contato: string;

	@Column({ name: 'EMAIL' })
	email: string;

	@Column({ name: 'TELEFONE' })
	telefone: string;

	@Column({ name: 'IDENTIFICADOR_CSRT' })
	identificadorCsrt: string;

	@Column({ name: 'HASH_CSRT' })
	hashCsrt: string;


	/**
	* Relations
	*/
    @OneToOne(() => NfeCabecalho, nfeCabecalho => nfeCabecalho.nfeResponsavelTecnico)
    @JoinColumn({ name: "ID_NFE_CABECALHO" })
    nfeCabecalho: NfeCabecalho;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.cnpj = objetoJson['cnpj'];
			this.contato = objetoJson['contato'];
			this.email = objetoJson['email'];
			this.telefone = objetoJson['telefone'];
			this.identificadorCsrt = objetoJson['identificadorCsrt'];
			this.hashCsrt = objetoJson['hashCsrt'];
			
			
		}
	}
}