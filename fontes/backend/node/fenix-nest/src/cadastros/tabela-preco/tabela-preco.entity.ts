/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [TABELA_PRECO] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { TabelaPrecoProduto } from '../../entities-export';

@Entity({ name: 'TABELA_PRECO' })
export class TabelaPreco { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'NOME' })
	nome: string;

	@Column({ name: 'PRINCIPAL' })
	principal: string;

	@Column({ name: 'COEFICIENTE' })
	coeficiente: number;


	/**
	* Relations
	*/
    @OneToMany(() => TabelaPrecoProduto, tabelaPrecoProduto => tabelaPrecoProduto.tabelaPreco, { cascade: true })
    listaTabelaPrecoProduto: TabelaPrecoProduto[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.nome = objetoJson['nome'];
			this.principal = objetoJson['principal'];
			this.coeficiente = objetoJson['coeficiente'];
			
			
			this.listaTabelaPrecoProduto = [];
			let listaTabelaPrecoProdutoJson = objetoJson['listaTabelaPrecoProduto'];
			if (listaTabelaPrecoProdutoJson != null) {
				for (let i = 0; i < listaTabelaPrecoProdutoJson.length; i++) {
					let objeto = new TabelaPrecoProduto(listaTabelaPrecoProdutoJson[i]);
					this.listaTabelaPrecoProduto.push(objeto);
				}
			}

		}
	}
}