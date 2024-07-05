/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_HISTORICO_SALARIAL] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, JoinColumn } from 'typeorm';
import { Colaborador } from '../../entities-export';

@Entity({ name: 'FOLHA_HISTORICO_SALARIAL' })
export class FolhaHistoricoSalarial { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'COMPETENCIA' })
	competencia: string;

	@Column({ name: 'SALARIO_ATUAL' })
	salarioAtual: number;

	@Column({ name: 'PERCENTUAL_AUMENTO' })
	percentualAumento: number;

	@Column({ name: 'SALARIO_NOVO' })
	salarioNovo: number;

	@Column({ name: 'VALIDO_A_PARTIR' })
	validoAPartir: string;

	@Column({ name: 'MOTIVO' })
	motivo: string;


	/**
	* Relations
	*/
    @OneToOne(() => Colaborador)
    @JoinColumn({ name: "ID_COLABORADOR" })
    colaborador: Colaborador;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.competencia = objetoJson['competencia'];
			this.salarioAtual = objetoJson['salarioAtual'];
			this.percentualAumento = objetoJson['percentualAumento'];
			this.salarioNovo = objetoJson['salarioNovo'];
			this.validoAPartir = objetoJson['validoAPartir'];
			this.motivo = objetoJson['motivo'];
			
			if (objetoJson['colaborador'] != null) {
				this.colaborador = new Colaborador(objetoJson['colaborador']);
			}

			
		}
	}
}