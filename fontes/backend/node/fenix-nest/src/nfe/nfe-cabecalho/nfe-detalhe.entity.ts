/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToMany, OneToOne, ManyToOne, JoinColumn } from 'typeorm';
import { NfeDeclaracaoImportacao } from '../../entities-export';
import { NfeDetEspecificoArmamento } from '../../entities-export';
import { NfeDetEspecificoCombustivel } from '../../entities-export';
import { NfeDetEspecificoMedicamento } from '../../entities-export';
import { NfeDetEspecificoVeiculo } from '../../entities-export';
import { NfeDetalheImpostoCofins } from '../../entities-export';
import { NfeDetalheImpostoCofinsSt } from '../../entities-export';
import { NfeDetalheImpostoIcms } from '../../entities-export';
import { NfeDetalheImpostoIcmsUfdest } from '../../entities-export';
import { NfeDetalheImpostoIi } from '../../entities-export';
import { NfeDetalheImpostoIpi } from '../../entities-export';
import { NfeDetalheImpostoIssqn } from '../../entities-export';
import { NfeDetalheImpostoPis } from '../../entities-export';
import { NfeDetalheImpostoPisSt } from '../../entities-export';
import { NfeExportacao } from '../../entities-export';
import { NfeItemRastreado } from '../../entities-export';
import { NfeCabecalho } from '../../entities-export';
import { Produto } from '../../entities-export';

@Entity({ name: 'NFE_DETALHE' })
export class NfeDetalhe { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'NUMERO_ITEM' })
	numeroItem: number;

	@Column({ name: 'CODIGO_PRODUTO' })
	codigoProduto: string;

	@Column({ name: 'GTIN' })
	gtin: string;

	@Column({ name: 'NOME_PRODUTO' })
	nomeProduto: string;

	@Column({ name: 'NCM' })
	ncm: string;

	@Column({ name: 'NVE' })
	nve: string;

	@Column({ name: 'CEST' })
	cest: string;

	@Column({ name: 'INDICADOR_ESCALA_RELEVANTE' })
	indicadorEscalaRelevante: string;

	@Column({ name: 'CNPJ_FABRICANTE' })
	cnpjFabricante: string;

	@Column({ name: 'CODIGO_BENEFICIO_FISCAL' })
	codigoBeneficioFiscal: string;

	@Column({ name: 'EX_TIPI' })
	exTipi: number;

	@Column({ name: 'CFOP' })
	cfop: number;

	@Column({ name: 'UNIDADE_COMERCIAL' })
	unidadeComercial: string;

	@Column({ name: 'QUANTIDADE_COMERCIAL' })
	quantidadeComercial: number;

	@Column({ name: 'NUMERO_PEDIDO_COMPRA' })
	numeroPedidoCompra: string;

	@Column({ name: 'ITEM_PEDIDO_COMPRA' })
	itemPedidoCompra: number;

	@Column({ name: 'NUMERO_FCI' })
	numeroFci: string;

	@Column({ name: 'NUMERO_RECOPI' })
	numeroRecopi: string;

	@Column({ name: 'VALOR_UNITARIO_COMERCIAL' })
	valorUnitarioComercial: number;

	@Column({ name: 'VALOR_BRUTO_PRODUTO' })
	valorBrutoProduto: number;

	@Column({ name: 'GTIN_UNIDADE_TRIBUTAVEL' })
	gtinUnidadeTributavel: string;

	@Column({ name: 'UNIDADE_TRIBUTAVEL' })
	unidadeTributavel: string;

	@Column({ name: 'QUANTIDADE_TRIBUTAVEL' })
	quantidadeTributavel: number;

	@Column({ name: 'VALOR_UNITARIO_TRIBUTAVEL' })
	valorUnitarioTributavel: number;

	@Column({ name: 'VALOR_FRETE' })
	valorFrete: number;

	@Column({ name: 'VALOR_SEGURO' })
	valorSeguro: number;

	@Column({ name: 'VALOR_DESCONTO' })
	valorDesconto: number;

	@Column({ name: 'VALOR_OUTRAS_DESPESAS' })
	valorOutrasDespesas: number;

	@Column({ name: 'ENTRA_TOTAL' })
	entraTotal: string;

	@Column({ name: 'VALOR_TOTAL_TRIBUTOS' })
	valorTotalTributos: number;

	@Column({ name: 'PERCENTUAL_DEVOLVIDO' })
	percentualDevolvido: number;

	@Column({ name: 'VALOR_IPI_DEVOLVIDO' })
	valorIpiDevolvido: number;

	@Column({ name: 'INFORMACOES_ADICIONAIS' })
	informacoesAdicionais: string;

	@Column({ name: 'VALOR_SUBTOTAL' })
	valorSubtotal: number;

	@Column({ name: 'VALOR_TOTAL' })
	valorTotal: number;


	/**
	* Relations
	*/
    @OneToOne(() => NfeDetEspecificoCombustivel, nfeDetEspecificoCombustivel => nfeDetEspecificoCombustivel.nfeDetalhe, { cascade: true })
    nfeDetEspecificoCombustivel: NfeDetEspecificoCombustivel;

    @OneToOne(() => NfeDetEspecificoMedicamento, nfeDetEspecificoMedicamento => nfeDetEspecificoMedicamento.nfeDetalhe, { cascade: true })
    nfeDetEspecificoMedicamento: NfeDetEspecificoMedicamento;

    @OneToOne(() => NfeDetEspecificoVeiculo, nfeDetEspecificoVeiculo => nfeDetEspecificoVeiculo.nfeDetalhe, { cascade: true })
    nfeDetEspecificoVeiculo: NfeDetEspecificoVeiculo;

    @OneToOne(() => NfeDetalheImpostoCofins, nfeDetalheImpostoCofins => nfeDetalheImpostoCofins.nfeDetalhe, { cascade: true })
    nfeDetalheImpostoCofins: NfeDetalheImpostoCofins;

    @OneToOne(() => NfeDetalheImpostoCofinsSt, nfeDetalheImpostoCofinsSt => nfeDetalheImpostoCofinsSt.nfeDetalhe, { cascade: true })
    nfeDetalheImpostoCofinsSt: NfeDetalheImpostoCofinsSt;

    @OneToOne(() => NfeDetalheImpostoIcms, nfeDetalheImpostoIcms => nfeDetalheImpostoIcms.nfeDetalhe, { cascade: true })
    nfeDetalheImpostoIcms: NfeDetalheImpostoIcms;

    @OneToOne(() => NfeDetalheImpostoIcmsUfdest, nfeDetalheImpostoIcmsUfdest => nfeDetalheImpostoIcmsUfdest.nfeDetalhe, { cascade: true })
    nfeDetalheImpostoIcmsUfdest: NfeDetalheImpostoIcmsUfdest;

    @OneToOne(() => NfeDetalheImpostoIi, nfeDetalheImpostoIi => nfeDetalheImpostoIi.nfeDetalhe, { cascade: true })
    nfeDetalheImpostoIi: NfeDetalheImpostoIi;

    @OneToOne(() => NfeDetalheImpostoIpi, nfeDetalheImpostoIpi => nfeDetalheImpostoIpi.nfeDetalhe, { cascade: true })
    nfeDetalheImpostoIpi: NfeDetalheImpostoIpi;

    @OneToOne(() => NfeDetalheImpostoIssqn, nfeDetalheImpostoIssqn => nfeDetalheImpostoIssqn.nfeDetalhe, { cascade: true })
    nfeDetalheImpostoIssqn: NfeDetalheImpostoIssqn;

    @OneToOne(() => NfeDetalheImpostoPis, nfeDetalheImpostoPis => nfeDetalheImpostoPis.nfeDetalhe, { cascade: true })
    nfeDetalheImpostoPis: NfeDetalheImpostoPis;

    @OneToOne(() => NfeDetalheImpostoPisSt, nfeDetalheImpostoPisSt => nfeDetalheImpostoPisSt.nfeDetalhe, { cascade: true })
    nfeDetalheImpostoPisSt: NfeDetalheImpostoPisSt;

    // @OneToOne(type => Produto, {cascade: true, nullable: true} )
    // @JoinColumn({ name: "ID_PRODUTO" })
    produto: Produto;

    @OneToMany(() => NfeDeclaracaoImportacao, nfeDeclaracaoImportacao => nfeDeclaracaoImportacao.nfeDetalhe, { cascade: true })
    listaNfeDeclaracaoImportacao: NfeDeclaracaoImportacao[];

    @OneToMany(() => NfeDetEspecificoArmamento, nfeDetEspecificoArmamento => nfeDetEspecificoArmamento.nfeDetalhe, { cascade: true })
    listaNfeDetEspecificoArmamento: NfeDetEspecificoArmamento[];

    @OneToMany(() => NfeExportacao, nfeExportacao => nfeExportacao.nfeDetalhe, { cascade: true })
    listaNfeExportacao: NfeExportacao[];

    @OneToMany(() => NfeItemRastreado, nfeItemRastreado => nfeItemRastreado.nfeDetalhe, { cascade: true })
    listaNfeItemRastreado: NfeItemRastreado[];

    @ManyToOne(() => NfeCabecalho, nfeCabecalho => nfeCabecalho.listaNfeDetalhe)
    @JoinColumn({ name: "ID_NFE_CABECALHO" })
    nfeCabecalho: NfeCabecalho;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.numeroItem = objetoJson['numeroItem'];
			this.codigoProduto = objetoJson['codigoProduto'];
			this.gtin = objetoJson['gtin'];
			this.nomeProduto = objetoJson['nomeProduto'];
			this.ncm = objetoJson['ncm'];
			this.nve = objetoJson['nve'];
			this.cest = objetoJson['cest'];
			this.indicadorEscalaRelevante = objetoJson['indicadorEscalaRelevante'];
			this.cnpjFabricante = objetoJson['cnpjFabricante'];
			this.codigoBeneficioFiscal = objetoJson['codigoBeneficioFiscal'];
			this.exTipi = objetoJson['exTipi'];
			this.cfop = objetoJson['cfop'];
			this.unidadeComercial = objetoJson['unidadeComercial'];
			this.quantidadeComercial = objetoJson['quantidadeComercial'];
			this.numeroPedidoCompra = objetoJson['numeroPedidoCompra'];
			this.itemPedidoCompra = objetoJson['itemPedidoCompra'];
			this.numeroFci = objetoJson['numeroFci'];
			this.numeroRecopi = objetoJson['numeroRecopi'];
			this.valorUnitarioComercial = objetoJson['valorUnitarioComercial'];
			this.valorBrutoProduto = objetoJson['valorBrutoProduto'];
			this.gtinUnidadeTributavel = objetoJson['gtinUnidadeTributavel'];
			this.unidadeTributavel = objetoJson['unidadeTributavel'];
			this.quantidadeTributavel = objetoJson['quantidadeTributavel'];
			this.valorUnitarioTributavel = objetoJson['valorUnitarioTributavel'];
			this.valorFrete = objetoJson['valorFrete'];
			this.valorSeguro = objetoJson['valorSeguro'];
			this.valorDesconto = objetoJson['valorDesconto'];
			this.valorOutrasDespesas = objetoJson['valorOutrasDespesas'];
			this.entraTotal = objetoJson['entraTotal'];
			this.valorTotalTributos = objetoJson['valorTotalTributos'];
			this.percentualDevolvido = objetoJson['percentualDevolvido'];
			this.valorIpiDevolvido = objetoJson['valorIpiDevolvido'];
			this.informacoesAdicionais = objetoJson['informacoesAdicionais'];
			this.valorSubtotal = objetoJson['valorSubtotal'];
			this.valorTotal = objetoJson['valorTotal'];
			
			if (objetoJson['nfeDetEspecificoCombustivel'] != null) {
				this.nfeDetEspecificoCombustivel = new NfeDetEspecificoCombustivel(objetoJson['nfeDetEspecificoCombustivel']);
			}

			if (objetoJson['nfeDetEspecificoMedicamento'] != null) {
				this.nfeDetEspecificoMedicamento = new NfeDetEspecificoMedicamento(objetoJson['nfeDetEspecificoMedicamento']);
			}

			if (objetoJson['nfeDetEspecificoVeiculo'] != null) {
				this.nfeDetEspecificoVeiculo = new NfeDetEspecificoVeiculo(objetoJson['nfeDetEspecificoVeiculo']);
			}

			if (objetoJson['nfeDetalheImpostoCofins'] != null) {
				this.nfeDetalheImpostoCofins = new NfeDetalheImpostoCofins(objetoJson['nfeDetalheImpostoCofins']);
			}

			if (objetoJson['nfeDetalheImpostoCofinsSt'] != null) {
				this.nfeDetalheImpostoCofinsSt = new NfeDetalheImpostoCofinsSt(objetoJson['nfeDetalheImpostoCofinsSt']);
			}

			if (objetoJson['nfeDetalheImpostoIcms'] != null) {
				this.nfeDetalheImpostoIcms = new NfeDetalheImpostoIcms(objetoJson['nfeDetalheImpostoIcms']);
			}

			if (objetoJson['nfeDetalheImpostoIcmsUfdest'] != null) {
				this.nfeDetalheImpostoIcmsUfdest = new NfeDetalheImpostoIcmsUfdest(objetoJson['nfeDetalheImpostoIcmsUfdest']);
			}

			if (objetoJson['nfeDetalheImpostoIi'] != null) {
				this.nfeDetalheImpostoIi = new NfeDetalheImpostoIi(objetoJson['nfeDetalheImpostoIi']);
			}

			if (objetoJson['nfeDetalheImpostoIpi'] != null) {
				this.nfeDetalheImpostoIpi = new NfeDetalheImpostoIpi(objetoJson['nfeDetalheImpostoIpi']);
			}

			if (objetoJson['nfeDetalheImpostoIssqn'] != null) {
				this.nfeDetalheImpostoIssqn = new NfeDetalheImpostoIssqn(objetoJson['nfeDetalheImpostoIssqn']);
			}

			if (objetoJson['nfeDetalheImpostoPis'] != null) {
				this.nfeDetalheImpostoPis = new NfeDetalheImpostoPis(objetoJson['nfeDetalheImpostoPis']);
			}

			if (objetoJson['nfeDetalheImpostoPisSt'] != null) {
				this.nfeDetalheImpostoPisSt = new NfeDetalheImpostoPisSt(objetoJson['nfeDetalheImpostoPisSt']);
			}

			if (objetoJson['produto'] != null) {
				this.produto = new Produto(objetoJson['produto']);
			}

			
			this.listaNfeDeclaracaoImportacao = [];
			let listaNfeDeclaracaoImportacaoJson = objetoJson['listaNfeDeclaracaoImportacao'];
			if (listaNfeDeclaracaoImportacaoJson != null) {
				for (let i = 0; i < listaNfeDeclaracaoImportacaoJson.length; i++) {
					let objeto = new NfeDeclaracaoImportacao(listaNfeDeclaracaoImportacaoJson[i]);
					this.listaNfeDeclaracaoImportacao.push(objeto);
				}
			}

			this.listaNfeDetEspecificoArmamento = [];
			let listaNfeDetEspecificoArmamentoJson = objetoJson['listaNfeDetEspecificoArmamento'];
			if (listaNfeDetEspecificoArmamentoJson != null) {
				for (let i = 0; i < listaNfeDetEspecificoArmamentoJson.length; i++) {
					let objeto = new NfeDetEspecificoArmamento(listaNfeDetEspecificoArmamentoJson[i]);
					this.listaNfeDetEspecificoArmamento.push(objeto);
				}
			}

			this.listaNfeExportacao = [];
			let listaNfeExportacaoJson = objetoJson['listaNfeExportacao'];
			if (listaNfeExportacaoJson != null) {
				for (let i = 0; i < listaNfeExportacaoJson.length; i++) {
					let objeto = new NfeExportacao(listaNfeExportacaoJson[i]);
					this.listaNfeExportacao.push(objeto);
				}
			}

			this.listaNfeItemRastreado = [];
			let listaNfeItemRastreadoJson = objetoJson['listaNfeItemRastreado'];
			if (listaNfeItemRastreadoJson != null) {
				for (let i = 0; i < listaNfeItemRastreadoJson.length; i++) {
					let objeto = new NfeItemRastreado(listaNfeItemRastreadoJson[i]);
					this.listaNfeItemRastreado.push(objeto);
				}
			}

		}
	}

	zerarNulos() {
		this.quantidadeComercial = this.quantidadeComercial == null ? 0 : this.quantidadeComercial;
		this.valorUnitarioComercial = this.valorUnitarioComercial == null ? 0 : this.valorUnitarioComercial;
		this.valorBrutoProduto = this.valorBrutoProduto == null ? 0 : this.valorBrutoProduto;
		this.quantidadeTributavel = this.quantidadeTributavel == null ? 0 : this.quantidadeTributavel;
		this.valorUnitarioTributavel = this.valorUnitarioTributavel == null ? 0 : this.valorUnitarioTributavel;
		this.valorFrete = this.valorFrete == null ? 0 : this.valorFrete;
		this.valorSeguro = this.valorSeguro == null ? 0 : this.valorSeguro;
		this.valorDesconto = this.valorDesconto == null ? 0 : this.valorDesconto;
		this.valorOutrasDespesas = this.valorOutrasDespesas == null ? 0 : this.valorOutrasDespesas;
		this.valorTotalTributos = this.valorTotalTributos == null ? 0 : this.valorTotalTributos;
		this.percentualDevolvido = this.percentualDevolvido == null ? 0 : this.percentualDevolvido;
		this.valorIpiDevolvido = this.valorIpiDevolvido == null ? 0 : this.valorIpiDevolvido;
		this.valorSubtotal = this.valorSubtotal == null ? 0 : this.valorSubtotal;
		this.valorTotal = this.valorTotal == null ? 0 : this.valorTotal;
	}


}