/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [BANCO_AGENCIA] 
                                                                                
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
import { Banco } from '../../entities-export';

@Entity({ name: 'BANCO_AGENCIA' })
export class BancoAgencia { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'NUMERO' })
	numero: string;

	@Column({ name: 'DIGITO' })
	digito: string;

	@Column({ name: 'NOME' })
	nome: string;

	@Column({ name: 'TELEFONE' })
	telefone: string;

	@Column({ name: 'CONTATO' })
	contato: string;

	@Column({ name: 'OBSERVACAO' })
	observacao: string;

	@Column({ name: 'GERENTE' })
	gerente: string;


	/**
	* Relations
	*/
    @OneToOne(() => Banco)
    @JoinColumn({ name: "ID_BANCO" })
    banco: Banco;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.numero = objetoJson['numero'];
			this.digito = objetoJson['digito'];
			this.nome = objetoJson['nome'];
			this.telefone = objetoJson['telefone'];
			this.contato = objetoJson['contato'];
			this.observacao = objetoJson['observacao'];
			this.gerente = objetoJson['gerente'];
			
			if (objetoJson['banco'] != null) {
				this.banco = new Banco(objetoJson['banco']);
			}

			
		}
	}
}