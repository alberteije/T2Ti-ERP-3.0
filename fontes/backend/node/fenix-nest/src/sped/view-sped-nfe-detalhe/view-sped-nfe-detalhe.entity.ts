/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_SPED_NFE_DETALHE] 
                                                                                
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
import { NfeCabecalho } from '../../entities-export';
import { Produto } from '../../entities-export';
import { TributOperacaoFiscal } from '../../entities-export';
import { ProdutoUnidade } from '../../entities-export';

@Entity({ name: 'VIEW_SPED_NFE_DETALHE' })
export class ViewSpedNfeDetalhe { 

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

	@Column({ name: 'CST_COFINS' })
	cstCofins: string;

	@Column({ name: 'QUANTIDADE_VENDIDA_COFINS' })
	quantidadeVendidaCofins: number;

	@Column({ name: 'BASE_CALCULO_COFINS' })
	baseCalculoCofins: number;

	@Column({ name: 'ALIQUOTA_COFINS_PERCENTUAL' })
	aliquotaCofinsPercentual: number;

	@Column({ name: 'ALIQUOTA_COFINS_REAIS' })
	aliquotaCofinsReais: number;

	@Column({ name: 'VALOR_COFINS' })
	valorCofins: number;

	@Column({ name: 'ORIGEM_MERCADORIA' })
	origemMercadoria: string;

	@Column({ name: 'CST_ICMS' })
	cstIcms: string;

	@Column({ name: 'CSOSN' })
	csosn: string;

	@Column({ name: 'MODALIDADE_BC_ICMS' })
	modalidadeBcIcms: string;

	@Column({ name: 'PERCENTUAL_REDUCAO_BC_ICMS' })
	percentualReducaoBcIcms: number;

	@Column({ name: 'VALOR_BC_ICMS' })
	valorBcIcms: number;

	@Column({ name: 'ALIQUOTA_ICMS' })
	aliquotaIcms: number;

	@Column({ name: 'VALOR_ICMS' })
	valorIcms: number;

	@Column({ name: 'MOTIVO_DESONERACAO_ICMS' })
	motivoDesoneracaoIcms: string;

	@Column({ name: 'MODALIDADE_BC_ICMS_ST' })
	modalidadeBcIcmsSt: string;

	@Column({ name: 'PERCENTUAL_MVA_ICMS_ST' })
	percentualMvaIcmsSt: number;

	@Column({ name: 'PERCENTUAL_REDUCAO_BC_ICMS_ST' })
	percentualReducaoBcIcmsSt: number;

	@Column({ name: 'VALOR_BASE_CALCULO_ICMS_ST' })
	valorBaseCalculoIcmsSt: number;

	@Column({ name: 'ALIQUOTA_ICMS_ST' })
	aliquotaIcmsSt: number;

	@Column({ name: 'VALOR_ICMS_ST' })
	valorIcmsSt: number;

	@Column({ name: 'VALOR_BC_ICMS_ST_RETIDO' })
	valorBcIcmsStRetido: number;

	@Column({ name: 'VALOR_ICMS_ST_RETIDO' })
	valorIcmsStRetido: number;

	@Column({ name: 'VALOR_BC_ICMS_ST_DESTINO' })
	valorBcIcmsStDestino: number;

	@Column({ name: 'VALOR_ICMS_ST_DESTINO' })
	valorIcmsStDestino: number;

	@Column({ name: 'ALIQUOTA_CREDITO_ICMS_SN' })
	aliquotaCreditoIcmsSn: number;

	@Column({ name: 'VALOR_CREDITO_ICMS_SN' })
	valorCreditoIcmsSn: number;

	@Column({ name: 'PERCENTUAL_BC_OPERACAO_PROPRIA' })
	percentualBcOperacaoPropria: number;

	@Column({ name: 'UF_ST' })
	ufSt: string;

	@Column({ name: 'VALOR_BC_II' })
	valorBcIi: number;

	@Column({ name: 'VALOR_DESPESAS_ADUANEIRAS' })
	valorDespesasAduaneiras: number;

	@Column({ name: 'VALOR_IMPOSTO_IMPORTACAO' })
	valorImpostoImportacao: number;

	@Column({ name: 'VALOR_IOF' })
	valorIof: number;

	@Column({ name: 'CNPJ_PRODUTOR' })
	cnpjProdutor: string;

	@Column({ name: 'CODIGO_SELO_IPI' })
	codigoSeloIpi: string;

	@Column({ name: 'QUANTIDADE_SELO_IPI' })
	quantidadeSeloIpi: number;

	@Column({ name: 'ENQUADRAMENTO_LEGAL_IPI' })
	enquadramentoLegalIpi: string;

	@Column({ name: 'CST_IPI' })
	cstIpi: string;

	@Column({ name: 'VALOR_BASE_CALCULO_IPI' })
	valorBaseCalculoIpi: number;

	@Column({ name: 'ALIQUOTA_IPI' })
	aliquotaIpi: number;

	@Column({ name: 'QUANTIDADE_UNIDADE_TRIBUTAVEL' })
	quantidadeUnidadeTributavel: number;

	@Column({ name: 'VALOR_UNIDADE_TRIBUTAVEL' })
	valorUnidadeTributavel: number;

	@Column({ name: 'VALOR_IPI' })
	valorIpi: number;

	@Column({ name: 'BASE_CALCULO_ISSQN' })
	baseCalculoIssqn: number;

	@Column({ name: 'ALIQUOTA_ISSQN' })
	aliquotaIssqn: number;

	@Column({ name: 'VALOR_ISSQN' })
	valorIssqn: number;

	@Column({ name: 'MUNICIPIO_ISSQN' })
	municipioIssqn: number;

	@Column({ name: 'ITEM_LISTA_SERVICOS' })
	itemListaServicos: number;

	@Column({ name: 'CST_PIS' })
	cstPis: string;

	@Column({ name: 'QUANTIDADE_VENDIDA_PIS' })
	quantidadeVendidaPis: number;

	@Column({ name: 'VALOR_BASE_CALCULO_PIS' })
	valorBaseCalculoPis: number;

	@Column({ name: 'ALIQUOTA_PIS_PERCENTUAL' })
	aliquotaPisPercentual: number;

	@Column({ name: 'ALIQUOTA_PIS_REAIS' })
	aliquotaPisReais: number;

	@Column({ name: 'VALOR_PIS' })
	valorPis: number;


	/**
	* Relations
	*/
    @OneToOne(() => Produto)
    @JoinColumn({ name: "ID_PRODUTO" })
    produto: Produto;

    @OneToOne(() => TributOperacaoFiscal)
    @JoinColumn({ name: "ID_TRIBUT_OPERACAO_FISCAL" })
    tributOperacaoFiscal: TributOperacaoFiscal;

    @OneToOne(() => ProdutoUnidade)
    @JoinColumn({ name: "ID_PRODUTO_UNIDADE" })
    produtoUnidade: ProdutoUnidade;

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
			this.cstCofins = objetoJson['cstCofins'];
			this.quantidadeVendidaCofins = objetoJson['quantidadeVendidaCofins'];
			this.baseCalculoCofins = objetoJson['baseCalculoCofins'];
			this.aliquotaCofinsPercentual = objetoJson['aliquotaCofinsPercentual'];
			this.aliquotaCofinsReais = objetoJson['aliquotaCofinsReais'];
			this.valorCofins = objetoJson['valorCofins'];
			this.origemMercadoria = objetoJson['origemMercadoria'];
			this.cstIcms = objetoJson['cstIcms'];
			this.csosn = objetoJson['csosn'];
			this.modalidadeBcIcms = objetoJson['modalidadeBcIcms'];
			this.percentualReducaoBcIcms = objetoJson['percentualReducaoBcIcms'];
			this.valorBcIcms = objetoJson['valorBcIcms'];
			this.aliquotaIcms = objetoJson['aliquotaIcms'];
			this.valorIcms = objetoJson['valorIcms'];
			this.motivoDesoneracaoIcms = objetoJson['motivoDesoneracaoIcms'];
			this.modalidadeBcIcmsSt = objetoJson['modalidadeBcIcmsSt'];
			this.percentualMvaIcmsSt = objetoJson['percentualMvaIcmsSt'];
			this.percentualReducaoBcIcmsSt = objetoJson['percentualReducaoBcIcmsSt'];
			this.valorBaseCalculoIcmsSt = objetoJson['valorBaseCalculoIcmsSt'];
			this.aliquotaIcmsSt = objetoJson['aliquotaIcmsSt'];
			this.valorIcmsSt = objetoJson['valorIcmsSt'];
			this.valorBcIcmsStRetido = objetoJson['valorBcIcmsStRetido'];
			this.valorIcmsStRetido = objetoJson['valorIcmsStRetido'];
			this.valorBcIcmsStDestino = objetoJson['valorBcIcmsStDestino'];
			this.valorIcmsStDestino = objetoJson['valorIcmsStDestino'];
			this.aliquotaCreditoIcmsSn = objetoJson['aliquotaCreditoIcmsSn'];
			this.valorCreditoIcmsSn = objetoJson['valorCreditoIcmsSn'];
			this.percentualBcOperacaoPropria = objetoJson['percentualBcOperacaoPropria'];
			this.ufSt = objetoJson['ufSt'];
			this.valorBcIi = objetoJson['valorBcIi'];
			this.valorDespesasAduaneiras = objetoJson['valorDespesasAduaneiras'];
			this.valorImpostoImportacao = objetoJson['valorImpostoImportacao'];
			this.valorIof = objetoJson['valorIof'];
			this.cnpjProdutor = objetoJson['cnpjProdutor'];
			this.codigoSeloIpi = objetoJson['codigoSeloIpi'];
			this.quantidadeSeloIpi = objetoJson['quantidadeSeloIpi'];
			this.enquadramentoLegalIpi = objetoJson['enquadramentoLegalIpi'];
			this.cstIpi = objetoJson['cstIpi'];
			this.valorBaseCalculoIpi = objetoJson['valorBaseCalculoIpi'];
			this.aliquotaIpi = objetoJson['aliquotaIpi'];
			this.quantidadeUnidadeTributavel = objetoJson['quantidadeUnidadeTributavel'];
			this.valorUnidadeTributavel = objetoJson['valorUnidadeTributavel'];
			this.valorIpi = objetoJson['valorIpi'];
			this.baseCalculoIssqn = objetoJson['baseCalculoIssqn'];
			this.aliquotaIssqn = objetoJson['aliquotaIssqn'];
			this.valorIssqn = objetoJson['valorIssqn'];
			this.municipioIssqn = objetoJson['municipioIssqn'];
			this.itemListaServicos = objetoJson['itemListaServicos'];
			this.cstPis = objetoJson['cstPis'];
			this.quantidadeVendidaPis = objetoJson['quantidadeVendidaPis'];
			this.valorBaseCalculoPis = objetoJson['valorBaseCalculoPis'];
			this.aliquotaPisPercentual = objetoJson['aliquotaPisPercentual'];
			this.aliquotaPisReais = objetoJson['aliquotaPisReais'];
			this.valorPis = objetoJson['valorPis'];
			
			if (objetoJson['produto'] != null) {
				this.produto = new Produto(objetoJson['produto']);
			}

			if (objetoJson['tributOperacaoFiscal'] != null) {
				this.tributOperacaoFiscal = new TributOperacaoFiscal(objetoJson['tributOperacaoFiscal']);
			}

			if (objetoJson['produtoUnidade'] != null) {
				this.produtoUnidade = new ProdutoUnidade(objetoJson['produtoUnidade']);
			}

			
		}
	}
}