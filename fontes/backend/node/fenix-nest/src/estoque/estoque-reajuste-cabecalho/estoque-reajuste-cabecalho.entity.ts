/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
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
import { EstoqueReajusteDetalhe } from '../../entities-export';
import { Colaborador } from '../../entities-export';

@Entity({ name: 'ESTOQUE_REAJUSTE_CABECALHO' })
export class EstoqueReajusteCabecalho { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'DATA_REAJUSTE' })
	dataReajuste: Date;

	@Column({ name: 'TAXA' })
	taxa: number;

	@Column({ name: 'TIPO_REAJUSTE' })
	tipoReajuste: string;

	@Column({ name: 'JUSTIFICATIVA' })
	justificativa: string;


	/**
	* Relations
	*/
    @OneToOne(() => Colaborador)
    @JoinColumn({ name: "ID_COLABORADOR" })
    colaborador: Colaborador;

    @OneToMany(() => EstoqueReajusteDetalhe, estoqueReajusteDetalhe => estoqueReajusteDetalhe.estoqueReajusteCabecalho, { cascade: true })
    listaEstoqueReajusteDetalhe: EstoqueReajusteDetalhe[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.dataReajuste = objetoJson['dataReajuste'];
			this.taxa = objetoJson['taxa'];
			this.tipoReajuste = objetoJson['tipoReajuste'];
			this.justificativa = objetoJson['justificativa'];
			
			if (objetoJson['colaborador'] != null) {
				this.colaborador = new Colaborador(objetoJson['colaborador']);
			}

			
			this.listaEstoqueReajusteDetalhe = [];
			let listaEstoqueReajusteDetalheJson = objetoJson['listaEstoqueReajusteDetalhe'];
			if (listaEstoqueReajusteDetalheJson != null) {
				for (let i = 0; i < listaEstoqueReajusteDetalheJson.length; i++) {
					let objeto = new EstoqueReajusteDetalhe(listaEstoqueReajusteDetalheJson[i]);
					this.listaEstoqueReajusteDetalhe.push(objeto);
				}
			}

		}
	}
}