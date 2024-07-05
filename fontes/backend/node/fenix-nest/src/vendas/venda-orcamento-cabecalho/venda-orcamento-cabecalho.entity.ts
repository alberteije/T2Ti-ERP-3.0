/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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
import { VendaOrcamentoDetalhe } from '../../entities-export';
import { VendaCondicoesPagamento } from '../../entities-export';
import { Vendedor } from '../../entities-export';
import { Cliente } from '../../entities-export';
import { Transportadora } from '../../entities-export';

@Entity({ name: 'VENDA_ORCAMENTO_CABECALHO' })
export class VendaOrcamentoCabecalho { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'CODIGO' })
	codigo: string;

	@Column({ name: 'DATA_CADASTRO' })
	dataCadastro: Date;

	@Column({ name: 'DATA_ENTREGA' })
	dataEntrega: Date;

	@Column({ name: 'VALIDADE' })
	validade: Date;

	@Column({ name: 'TIPO_FRETE' })
	tipoFrete: string;

	@Column({ name: 'VALOR_SUBTOTAL' })
	valorSubtotal: number;

	@Column({ name: 'VALOR_FRETE' })
	valorFrete: number;

	@Column({ name: 'TAXA_COMISSAO' })
	taxaComissao: number;

	@Column({ name: 'VALOR_COMISSAO' })
	valorComissao: number;

	@Column({ name: 'TAXA_DESCONTO' })
	taxaDesconto: number;

	@Column({ name: 'VALOR_DESCONTO' })
	valorDesconto: number;

	@Column({ name: 'VALOR_TOTAL' })
	valorTotal: number;

	@Column({ name: 'OBSERVACAO' })
	observacao: string;


	/**
	* Relations
	*/
    @OneToOne(() => VendaCondicoesPagamento)
    @JoinColumn({ name: "ID_VENDA_CONDICOES_PAGAMENTO" })
    vendaCondicoesPagamento: VendaCondicoesPagamento;

    @OneToOne(() => Vendedor)
    @JoinColumn({ name: "ID_VENDEDOR" })
    vendedor: Vendedor;

    @OneToOne(() => Cliente)
    @JoinColumn({ name: "ID_CLIENTE" })
    cliente: Cliente;

    @OneToOne(() => Transportadora)
    @JoinColumn({ name: "ID_TRANSPORTADORA" })
    transportadora: Transportadora;

    @OneToMany(() => VendaOrcamentoDetalhe, vendaOrcamentoDetalhe => vendaOrcamentoDetalhe.vendaOrcamentoCabecalho, { cascade: true })
    listaVendaOrcamentoDetalhe: VendaOrcamentoDetalhe[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.codigo = objetoJson['codigo'];
			this.dataCadastro = objetoJson['dataCadastro'];
			this.dataEntrega = objetoJson['dataEntrega'];
			this.validade = objetoJson['validade'];
			this.tipoFrete = objetoJson['tipoFrete'];
			this.valorSubtotal = objetoJson['valorSubtotal'];
			this.valorFrete = objetoJson['valorFrete'];
			this.taxaComissao = objetoJson['taxaComissao'];
			this.valorComissao = objetoJson['valorComissao'];
			this.taxaDesconto = objetoJson['taxaDesconto'];
			this.valorDesconto = objetoJson['valorDesconto'];
			this.valorTotal = objetoJson['valorTotal'];
			this.observacao = objetoJson['observacao'];
			
			if (objetoJson['vendaCondicoesPagamento'] != null) {
				this.vendaCondicoesPagamento = new VendaCondicoesPagamento(objetoJson['vendaCondicoesPagamento']);
			}

			if (objetoJson['vendedor'] != null) {
				this.vendedor = new Vendedor(objetoJson['vendedor']);
			}

			if (objetoJson['cliente'] != null) {
				this.cliente = new Cliente(objetoJson['cliente']);
			}

			if (objetoJson['transportadora'] != null) {
				this.transportadora = new Transportadora(objetoJson['transportadora']);
			}

			
			this.listaVendaOrcamentoDetalhe = [];
			let listaVendaOrcamentoDetalheJson = objetoJson['listaVendaOrcamentoDetalhe'];
			if (listaVendaOrcamentoDetalheJson != null) {
				for (let i = 0; i < listaVendaOrcamentoDetalheJson.length; i++) {
					let objeto = new VendaOrcamentoDetalhe(listaVendaOrcamentoDetalheJson[i]);
					this.listaVendaOrcamentoDetalhe.push(objeto);
				}
			}

		}
	}
}