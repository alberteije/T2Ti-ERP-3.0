/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FOLHA_PPP] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToMany, OneToOne, JoinColumn } from 'typeorm';
import { FolhaPppAtividade } from '../../entities-export';
import { FolhaPppCat } from '../../entities-export';
import { FolhaPppExameMedico } from '../../entities-export';
import { FolhaPppFatorRisco } from '../../entities-export';
import { Colaborador } from '../../entities-export';

@Entity({ name: 'FOLHA_PPP' })
export class FolhaPpp { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'OBSERVACAO' })
	observacao: string;


	/**
	* Relations
	*/
    @OneToOne(() => Colaborador)
    @JoinColumn({ name: "ID_COLABORADOR" })
    colaborador: Colaborador;

    @OneToMany(() => FolhaPppAtividade, folhaPppAtividade => folhaPppAtividade.folhaPpp, { cascade: true })
    listaFolhaPppAtividade: FolhaPppAtividade[];

    @OneToMany(() => FolhaPppCat, folhaPppCat => folhaPppCat.folhaPpp, { cascade: true })
    listaFolhaPppCat: FolhaPppCat[];

    @OneToMany(() => FolhaPppExameMedico, folhaPppExameMedico => folhaPppExameMedico.folhaPpp, { cascade: true })
    listaFolhaPppExameMedico: FolhaPppExameMedico[];

    @OneToMany(() => FolhaPppFatorRisco, folhaPppFatorRisco => folhaPppFatorRisco.folhaPpp, { cascade: true })
    listaFolhaPppFatorRisco: FolhaPppFatorRisco[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.observacao = objetoJson['observacao'];
			
			if (objetoJson['colaborador'] != null) {
				this.colaborador = new Colaborador(objetoJson['colaborador']);
			}

			
			this.listaFolhaPppAtividade = [];
			let listaFolhaPppAtividadeJson = objetoJson['listaFolhaPppAtividade'];
			if (listaFolhaPppAtividadeJson != null) {
				for (let i = 0; i < listaFolhaPppAtividadeJson.length; i++) {
					let objeto = new FolhaPppAtividade(listaFolhaPppAtividadeJson[i]);
					this.listaFolhaPppAtividade.push(objeto);
				}
			}

			this.listaFolhaPppCat = [];
			let listaFolhaPppCatJson = objetoJson['listaFolhaPppCat'];
			if (listaFolhaPppCatJson != null) {
				for (let i = 0; i < listaFolhaPppCatJson.length; i++) {
					let objeto = new FolhaPppCat(listaFolhaPppCatJson[i]);
					this.listaFolhaPppCat.push(objeto);
				}
			}

			this.listaFolhaPppExameMedico = [];
			let listaFolhaPppExameMedicoJson = objetoJson['listaFolhaPppExameMedico'];
			if (listaFolhaPppExameMedicoJson != null) {
				for (let i = 0; i < listaFolhaPppExameMedicoJson.length; i++) {
					let objeto = new FolhaPppExameMedico(listaFolhaPppExameMedicoJson[i]);
					this.listaFolhaPppExameMedico.push(objeto);
				}
			}

			this.listaFolhaPppFatorRisco = [];
			let listaFolhaPppFatorRiscoJson = objetoJson['listaFolhaPppFatorRisco'];
			if (listaFolhaPppFatorRiscoJson != null) {
				for (let i = 0; i < listaFolhaPppFatorRiscoJson.length; i++) {
					let objeto = new FolhaPppFatorRisco(listaFolhaPppFatorRiscoJson[i]);
					this.listaFolhaPppFatorRisco.push(objeto);
				}
			}

		}
	}
}