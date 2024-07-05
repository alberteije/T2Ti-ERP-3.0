/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_PEDIDO] 
                                                                                
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
import { CompraPedidoDetalhe } from '../../entities-export';
import { CompraTipoPedido } from '../../entities-export';
import { Fornecedor } from '../../entities-export';
import { Colaborador } from '../../entities-export';

@Entity({ name: 'COMPRA_PEDIDO' })
export class CompraPedido { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'DATA_PEDIDO' })
	dataPedido: Date;

	@Column({ name: 'DATA_PREVISTA_ENTREGA' })
	dataPrevistaEntrega: Date;

	@Column({ name: 'DATA_PREVISAO_PAGAMENTO' })
	dataPrevisaoPagamento: Date;

	@Column({ name: 'LOCAL_ENTREGA' })
	localEntrega: string;

	@Column({ name: 'LOCAL_COBRANCA' })
	localCobranca: string;

	@Column({ name: 'CONTATO' })
	contato: string;

	@Column({ name: 'VALOR_SUBTOTAL' })
	valorSubtotal: number;

	@Column({ name: 'TAXA_DESCONTO' })
	taxaDesconto: number;

	@Column({ name: 'VALOR_DESCONTO' })
	valorDesconto: number;

	@Column({ name: 'VALOR_TOTAL' })
	valorTotal: number;

	@Column({ name: 'TIPO_FRETE' })
	tipoFrete: string;

	@Column({ name: 'FORMA_PAGAMENTO' })
	formaPagamento: string;

	@Column({ name: 'BASE_CALCULO_ICMS' })
	baseCalculoIcms: number;

	@Column({ name: 'VALOR_ICMS' })
	valorIcms: number;

	@Column({ name: 'BASE_CALCULO_ICMS_ST' })
	baseCalculoIcmsSt: number;

	@Column({ name: 'VALOR_ICMS_ST' })
	valorIcmsSt: number;

	@Column({ name: 'VALOR_TOTAL_PRODUTOS' })
	valorTotalProdutos: number;

	@Column({ name: 'VALOR_FRETE' })
	valorFrete: number;

	@Column({ name: 'VALOR_SEGURO' })
	valorSeguro: number;

	@Column({ name: 'VALOR_OUTRAS_DESPESAS' })
	valorOutrasDespesas: number;

	@Column({ name: 'VALOR_IPI' })
	valorIpi: number;

	@Column({ name: 'VALOR_TOTAL_NF' })
	valorTotalNf: number;

	@Column({ name: 'QUANTIDADE_PARCELAS' })
	quantidadeParcelas: number;

	@Column({ name: 'DIA_PRIMEIRO_VENCIMENTO' })
	diaPrimeiroVencimento: string;

	@Column({ name: 'INTERVALO_ENTRE_PARCELAS' })
	intervaloEntreParcelas: number;

	@Column({ name: 'DIA_FIXO_PARCELA' })
	diaFixoParcela: string;

	@Column({ name: 'CODIGO_COTACAO' })
	codigoCotacao: string;


	/**
	* Relations
	*/
    @OneToOne(() => CompraTipoPedido)
    @JoinColumn({ name: "ID_COMPRA_TIPO_PEDIDO" })
    compraTipoPedido: CompraTipoPedido;

    @OneToOne(() => Fornecedor)
    @JoinColumn({ name: "ID_FORNECEDOR" })
    fornecedor: Fornecedor;

    @OneToOne(() => Colaborador)
    @JoinColumn({ name: "ID_COLABORADOR" })
    colaborador: Colaborador;

    @OneToMany(() => CompraPedidoDetalhe, compraPedidoDetalhe => compraPedidoDetalhe.compraPedido, { cascade: true })
    listaCompraPedidoDetalhe: CompraPedidoDetalhe[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.dataPedido = objetoJson['dataPedido'];
			this.dataPrevistaEntrega = objetoJson['dataPrevistaEntrega'];
			this.dataPrevisaoPagamento = objetoJson['dataPrevisaoPagamento'];
			this.localEntrega = objetoJson['localEntrega'];
			this.localCobranca = objetoJson['localCobranca'];
			this.contato = objetoJson['contato'];
			this.valorSubtotal = objetoJson['valorSubtotal'];
			this.taxaDesconto = objetoJson['taxaDesconto'];
			this.valorDesconto = objetoJson['valorDesconto'];
			this.valorTotal = objetoJson['valorTotal'];
			this.tipoFrete = objetoJson['tipoFrete'];
			this.formaPagamento = objetoJson['formaPagamento'];
			this.baseCalculoIcms = objetoJson['baseCalculoIcms'];
			this.valorIcms = objetoJson['valorIcms'];
			this.baseCalculoIcmsSt = objetoJson['baseCalculoIcmsSt'];
			this.valorIcmsSt = objetoJson['valorIcmsSt'];
			this.valorTotalProdutos = objetoJson['valorTotalProdutos'];
			this.valorFrete = objetoJson['valorFrete'];
			this.valorSeguro = objetoJson['valorSeguro'];
			this.valorOutrasDespesas = objetoJson['valorOutrasDespesas'];
			this.valorIpi = objetoJson['valorIpi'];
			this.valorTotalNf = objetoJson['valorTotalNf'];
			this.quantidadeParcelas = objetoJson['quantidadeParcelas'];
			this.diaPrimeiroVencimento = objetoJson['diaPrimeiroVencimento'];
			this.intervaloEntreParcelas = objetoJson['intervaloEntreParcelas'];
			this.diaFixoParcela = objetoJson['diaFixoParcela'];
			this.codigoCotacao = objetoJson['codigoCotacao'];
			
			if (objetoJson['compraTipoPedido'] != null) {
				this.compraTipoPedido = new CompraTipoPedido(objetoJson['compraTipoPedido']);
			}

			if (objetoJson['fornecedor'] != null) {
				this.fornecedor = new Fornecedor(objetoJson['fornecedor']);
			}

			if (objetoJson['colaborador'] != null) {
				this.colaborador = new Colaborador(objetoJson['colaborador']);
			}

			
			this.listaCompraPedidoDetalhe = [];
			let listaCompraPedidoDetalheJson = objetoJson['listaCompraPedidoDetalhe'];
			if (listaCompraPedidoDetalheJson != null) {
				for (let i = 0; i < listaCompraPedidoDetalheJson.length; i++) {
					let objeto = new CompraPedidoDetalhe(listaCompraPedidoDetalheJson[i]);
					this.listaCompraPedidoDetalhe.push(objeto);
				}
			}

		}
	}
}