/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_COTACAO] 
                                                                                
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
import { CompraFornecedorCotacao } from '../../entities-export';
import { CompraRequisicao } from '../../entities-export';

@Entity({ name: 'COMPRA_COTACAO' })
export class CompraCotacao { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'DATA_COTACAO' })
	dataCotacao: Date;

	@Column({ name: 'DESCRICAO' })
	descricao: string;


	/**
	* Relations
	*/
    @OneToOne(() => CompraRequisicao)
    @JoinColumn({ name: "ID_COMPRA_REQUISICAO" })
    compraRequisicao: CompraRequisicao;

    @OneToMany(() => CompraFornecedorCotacao, compraFornecedorCotacao => compraFornecedorCotacao.compraCotacao, { cascade: true })
    listaCompraFornecedorCotacao: CompraFornecedorCotacao[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.dataCotacao = objetoJson['dataCotacao'];
			this.descricao = objetoJson['descricao'];
			
			if (objetoJson['compraRequisicao'] != null) {
				this.compraRequisicao = new CompraRequisicao(objetoJson['compraRequisicao']);
			}

			
			this.listaCompraFornecedorCotacao = [];
			let listaCompraFornecedorCotacaoJson = objetoJson['listaCompraFornecedorCotacao'];
			if (listaCompraFornecedorCotacaoJson != null) {
				for (let i = 0; i < listaCompraFornecedorCotacaoJson.length; i++) {
					let objeto = new CompraFornecedorCotacao(listaCompraFornecedorCotacaoJson[i]);
					this.listaCompraFornecedorCotacao.push(objeto);
				}
			}

		}
	}
}