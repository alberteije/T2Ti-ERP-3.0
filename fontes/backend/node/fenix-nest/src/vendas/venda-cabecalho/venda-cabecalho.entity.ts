/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VENDA_CABECALHO] 
                                                                                
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
import { VendaComissao } from '../../entities-export';
import { VendaDetalhe } from '../../entities-export';
import { VendaOrcamentoCabecalho } from '../../entities-export';
import { VendaCondicoesPagamento } from '../../entities-export';
import { NotaFiscalTipo } from '../../entities-export';
import { Cliente } from '../../entities-export';
import { Transportadora } from '../../entities-export';
import { Vendedor } from '../../entities-export';

@Entity({ name: 'VENDA_CABECALHO' })
export class VendaCabecalho { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'DATA_VENDA' })
	dataVenda: Date;

	@Column({ name: 'DATA_SAIDA' })
	dataSaida: Date;

	@Column({ name: 'HORA_SAIDA' })
	horaSaida: string;

	@Column({ name: 'NUMERO_FATURA' })
	numeroFatura: number;

	@Column({ name: 'LOCAL_ENTREGA' })
	localEntrega: string;

	@Column({ name: 'LOCAL_COBRANCA' })
	localCobranca: string;

	@Column({ name: 'VALOR_SUBTOTAL' })
	valorSubtotal: number;

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

	@Column({ name: 'TIPO_FRETE' })
	tipoFrete: string;

	@Column({ name: 'FORMA_PAGAMENTO' })
	formaPagamento: string;

	@Column({ name: 'VALOR_FRETE' })
	valorFrete: number;

	@Column({ name: 'VALOR_SEGURO' })
	valorSeguro: number;

	@Column({ name: 'OBSERVACAO' })
	observacao: string;

	@Column({ name: 'SITUACAO' })
	situacao: string;

	@Column({ name: 'DIA_FIXO_PARCELA' })
	diaFixoParcela: string;


	/**
	* Relations
	*/
    @OneToOne(() => VendaOrcamentoCabecalho)
    @JoinColumn({ name: "ID_VENDA_ORCAMENTO_CABECALHO" })
    vendaOrcamentoCabecalho: VendaOrcamentoCabecalho;

    @OneToOne(() => VendaCondicoesPagamento)
    @JoinColumn({ name: "ID_VENDA_CONDICOES_PAGAMENTO" })
    vendaCondicoesPagamento: VendaCondicoesPagamento;

    @OneToOne(() => NotaFiscalTipo)
    @JoinColumn({ name: "ID_NOTA_FISCAL_TIPO" })
    notaFiscalTipo: NotaFiscalTipo;

    @OneToOne(() => Cliente)
    @JoinColumn({ name: "ID_CLIENTE" })
    cliente: Cliente;

    @OneToOne(() => Transportadora)
    @JoinColumn({ name: "ID_TRANSPORTADORA" })
    transportadora: Transportadora;

    @OneToOne(() => Vendedor)
    @JoinColumn({ name: "ID_VENDEDOR" })
    vendedor: Vendedor;

    @OneToMany(() => VendaComissao, vendaComissao => vendaComissao.vendaCabecalho, { cascade: true })
    listaVendaComissao: VendaComissao[];

    @OneToMany(() => VendaDetalhe, vendaDetalhe => vendaDetalhe.vendaCabecalho, { cascade: true })
    listaVendaDetalhe: VendaDetalhe[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.dataVenda = objetoJson['dataVenda'];
			this.dataSaida = objetoJson['dataSaida'];
			this.horaSaida = objetoJson['horaSaida'];
			this.numeroFatura = objetoJson['numeroFatura'];
			this.localEntrega = objetoJson['localEntrega'];
			this.localCobranca = objetoJson['localCobranca'];
			this.valorSubtotal = objetoJson['valorSubtotal'];
			this.taxaComissao = objetoJson['taxaComissao'];
			this.valorComissao = objetoJson['valorComissao'];
			this.taxaDesconto = objetoJson['taxaDesconto'];
			this.valorDesconto = objetoJson['valorDesconto'];
			this.valorTotal = objetoJson['valorTotal'];
			this.tipoFrete = objetoJson['tipoFrete'];
			this.formaPagamento = objetoJson['formaPagamento'];
			this.valorFrete = objetoJson['valorFrete'];
			this.valorSeguro = objetoJson['valorSeguro'];
			this.observacao = objetoJson['observacao'];
			this.situacao = objetoJson['situacao'];
			this.diaFixoParcela = objetoJson['diaFixoParcela'];
			
			if (objetoJson['vendaOrcamentoCabecalho'] != null) {
				this.vendaOrcamentoCabecalho = new VendaOrcamentoCabecalho(objetoJson['vendaOrcamentoCabecalho']);
			}

			if (objetoJson['vendaCondicoesPagamento'] != null) {
				this.vendaCondicoesPagamento = new VendaCondicoesPagamento(objetoJson['vendaCondicoesPagamento']);
			}

			if (objetoJson['notaFiscalTipo'] != null) {
				this.notaFiscalTipo = new NotaFiscalTipo(objetoJson['notaFiscalTipo']);
			}

			if (objetoJson['cliente'] != null) {
				this.cliente = new Cliente(objetoJson['cliente']);
			}

			if (objetoJson['transportadora'] != null) {
				this.transportadora = new Transportadora(objetoJson['transportadora']);
			}

			if (objetoJson['vendedor'] != null) {
				this.vendedor = new Vendedor(objetoJson['vendedor']);
			}

			
			this.listaVendaComissao = [];
			let listaVendaComissaoJson = objetoJson['listaVendaComissao'];
			if (listaVendaComissaoJson != null) {
				for (let i = 0; i < listaVendaComissaoJson.length; i++) {
					let objeto = new VendaComissao(listaVendaComissaoJson[i]);
					this.listaVendaComissao.push(objeto);
				}
			}

			this.listaVendaDetalhe = [];
			let listaVendaDetalheJson = objetoJson['listaVendaDetalhe'];
			if (listaVendaDetalheJson != null) {
				for (let i = 0; i < listaVendaDetalheJson.length; i++) {
					let objeto = new VendaDetalhe(listaVendaDetalheJson[i]);
					this.listaVendaDetalhe.push(objeto);
				}
			}

		}
	}
}