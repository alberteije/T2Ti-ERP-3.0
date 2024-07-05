/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMISSAO_OBJETIVO] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, ManyToOne, JoinColumn } from 'typeorm';
import { ComissaoPerfil } from '../../entities-export';
import { Produto } from '../../entities-export';

@Entity({ name: 'COMISSAO_OBJETIVO' })
export class ComissaoObjetivo { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'CODIGO' })
	codigo: string;

	@Column({ name: 'NOME' })
	nome: string;

	@Column({ name: 'DESCRICAO' })
	descricao: string;

	@Column({ name: 'FORMA_PAGAMENTO' })
	formaPagamento: string;

	@Column({ name: 'TAXA_PAGAMENTO' })
	taxaPagamento: number;

	@Column({ name: 'VALOR_PAGAMENTO' })
	valorPagamento: number;

	@Column({ name: 'VALOR_META' })
	valorMeta: number;

	@Column({ name: 'QUANTIDADE' })
	quantidade: number;


	/**
	* Relations
	*/
    @OneToOne(() => Produto)
    @JoinColumn({ name: "ID_PRODUTO" })
    produto: Produto;

    @ManyToOne(() => ComissaoPerfil, comissaoPerfil => comissaoPerfil.listaComissaoObjetivo)
    @JoinColumn({ name: "ID_COMISSAO_PERFIL" })
    comissaoPerfil: ComissaoPerfil;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.codigo = objetoJson['codigo'];
			this.nome = objetoJson['nome'];
			this.descricao = objetoJson['descricao'];
			this.formaPagamento = objetoJson['formaPagamento'];
			this.taxaPagamento = objetoJson['taxaPagamento'];
			this.valorPagamento = objetoJson['valorPagamento'];
			this.valorMeta = objetoJson['valorMeta'];
			this.quantidade = objetoJson['quantidade'];
			
			if (objetoJson['produto'] != null) {
				this.produto = new Produto(objetoJson['produto']);
			}

			
		}
	}
}