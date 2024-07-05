/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [REQUISICAO_INTERNA_CABECALHO] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToMany, OneToOne, JoinColumn } from 'typeorm';
import { RequisicaoInternaDetalhe } from '../../entities-export';
import { Colaborador } from '../../entities-export';

@Entity({ name: 'REQUISICAO_INTERNA_CABECALHO' })
export class RequisicaoInternaCabecalho { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'DATA_REQUISICAO' })
	dataRequisicao: Date;

	@Column({ name: 'SITUACAO' })
	situacao: string;


	/**
	* Relations
	*/
    @OneToOne(() => Colaborador)
    @JoinColumn({ name: "ID_COLABORADOR" })
    colaborador: Colaborador;

    @OneToMany(() => RequisicaoInternaDetalhe, requisicaoInternaDetalhe => requisicaoInternaDetalhe.requisicaoInternaCabecalho, { cascade: true })
    listaRequisicaoInternaDetalhe: RequisicaoInternaDetalhe[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.dataRequisicao = objetoJson['dataRequisicao'];
			this.situacao = objetoJson['situacao'];
			
			if (objetoJson['colaborador'] != null) {
				this.colaborador = new Colaborador(objetoJson['colaborador']);
			}

			
			this.listaRequisicaoInternaDetalhe = [];
			let listaRequisicaoInternaDetalheJson = objetoJson['listaRequisicaoInternaDetalhe'];
			if (listaRequisicaoInternaDetalheJson != null) {
				for (let i = 0; i < listaRequisicaoInternaDetalheJson.length; i++) {
					let objeto = new RequisicaoInternaDetalhe(listaRequisicaoInternaDetalheJson[i]);
					this.listaRequisicaoInternaDetalhe.push(objeto);
				}
			}

		}
	}
}