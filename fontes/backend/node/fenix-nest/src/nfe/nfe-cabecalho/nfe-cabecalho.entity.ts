/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CABECALHO] 
                                                                                
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
import { NfeAcessoXml } from '../../entities-export';
import { NfeCana } from '../../entities-export';
import { NfeCteReferenciado } from '../../entities-export';
import { NfeCupomFiscalReferenciado } from '../../entities-export';
import { NfeDestinatario } from '../../entities-export';
import { NfeDetalhe } from '../../entities-export';
import { NfeEmitente } from '../../entities-export';
import { NfeFatura } from '../../entities-export';
import { NfeInformacaoPagamento } from '../../entities-export';
import { NfeLocalEntrega } from '../../entities-export';
import { NfeLocalRetirada } from '../../entities-export';
import { NfeNfReferenciada } from '../../entities-export';
import { NfeProcessoReferenciado } from '../../entities-export';
import { NfeProdRuralReferenciada } from '../../entities-export';
import { NfeReferenciada } from '../../entities-export';
import { NfeResponsavelTecnico } from '../../entities-export';
import { NfeTransporte } from '../../entities-export';
import { Vendedor } from '../../entities-export';
import { Fornecedor } from '../../entities-export';
import { Cliente } from '../../entities-export';
import { TributOperacaoFiscal } from '../../entities-export';
import { VendaCabecalho } from '../../entities-export';

@Entity({ name: 'NFE_CABECALHO' })
export class NfeCabecalho { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'UF_EMITENTE' })
	ufEmitente: number;

	@Column({ name: 'CODIGO_NUMERICO' })
	codigoNumerico: string;

	@Column({ name: 'NATUREZA_OPERACAO' })
	naturezaOperacao: string;

	@Column({ name: 'CODIGO_MODELO' })
	codigoModelo: string;

	@Column({ name: 'SERIE' })
	serie: string;

	@Column({ name: 'NUMERO' })
	numero: string;

	@Column({ name: 'DATA_HORA_EMISSAO' })
	dataHoraEmissao: Date;

	@Column({ name: 'DATA_HORA_ENTRADA_SAIDA' })
	dataHoraEntradaSaida: Date;

	@Column({ name: 'TIPO_OPERACAO' })
	tipoOperacao: string;

	@Column({ name: 'LOCAL_DESTINO' })
	localDestino: string;

	@Column({ name: 'CODIGO_MUNICIPIO' })
	codigoMunicipio: number;

	@Column({ name: 'FORMATO_IMPRESSAO_DANFE' })
	formatoImpressaoDanfe: string;

	@Column({ name: 'TIPO_EMISSAO' })
	tipoEmissao: string;

	@Column({ name: 'CHAVE_ACESSO' })
	chaveAcesso: string;

	@Column({ name: 'DIGITO_CHAVE_ACESSO' })
	digitoChaveAcesso: string;

	@Column({ name: 'AMBIENTE' })
	ambiente: string;

	@Column({ name: 'FINALIDADE_EMISSAO' })
	finalidadeEmissao: string;

	@Column({ name: 'CONSUMIDOR_OPERACAO' })
	consumidorOperacao: string;

	@Column({ name: 'CONSUMIDOR_PRESENCA' })
	consumidorPresenca: string;

	@Column({ name: 'PROCESSO_EMISSAO' })
	processoEmissao: string;

	@Column({ name: 'VERSAO_PROCESSO_EMISSAO' })
	versaoProcessoEmissao: string;

	@Column({ name: 'DATA_ENTRADA_CONTINGENCIA' })
	dataEntradaContingencia: Date;

	@Column({ name: 'JUSTIFICATIVA_CONTINGENCIA' })
	justificativaContingencia: string;

	@Column({ name: 'BASE_CALCULO_ICMS' })
	baseCalculoIcms: number;

	@Column({ name: 'VALOR_ICMS' })
	valorIcms: number;

	@Column({ name: 'VALOR_ICMS_DESONERADO' })
	valorIcmsDesonerado: number;

	@Column({ name: 'TOTAL_ICMS_FCP_UF_DESTINO' })
	totalIcmsFcpUfDestino: number;

	@Column({ name: 'TOTAL_ICMS_INTERESTADUAL_UF_DESTINO' })
	totalIcmsInterestadualUfDestino: number;

	@Column({ name: 'TOTAL_ICMS_INTERESTADUAL_UF_REMETENTE' })
	totalIcmsInterestadualUfRemetente: number;

	@Column({ name: 'VALOR_TOTAL_FCP' })
	valorTotalFcp: number;

	@Column({ name: 'BASE_CALCULO_ICMS_ST' })
	baseCalculoIcmsSt: number;

	@Column({ name: 'VALOR_ICMS_ST' })
	valorIcmsSt: number;

	@Column({ name: 'VALOR_TOTAL_FCP_ST' })
	valorTotalFcpSt: number;

	@Column({ name: 'VALOR_TOTAL_FCP_ST_RETIDO' })
	valorTotalFcpStRetido: number;

	@Column({ name: 'VALOR_TOTAL_PRODUTOS' })
	valorTotalProdutos: number;

	@Column({ name: 'VALOR_FRETE' })
	valorFrete: number;

	@Column({ name: 'VALOR_SEGURO' })
	valorSeguro: number;

	@Column({ name: 'VALOR_DESCONTO' })
	valorDesconto: number;

	@Column({ name: 'VALOR_IMPOSTO_IMPORTACAO' })
	valorImpostoImportacao: number;

	@Column({ name: 'VALOR_IPI' })
	valorIpi: number;

	@Column({ name: 'VALOR_IPI_DEVOLVIDO' })
	valorIpiDevolvido: number;

	@Column({ name: 'VALOR_PIS' })
	valorPis: number;

	@Column({ name: 'VALOR_COFINS' })
	valorCofins: number;

	@Column({ name: 'VALOR_DESPESAS_ACESSORIAS' })
	valorDespesasAcessorias: number;

	@Column({ name: 'VALOR_TOTAL' })
	valorTotal: number;

	@Column({ name: 'VALOR_TOTAL_TRIBUTOS' })
	valorTotalTributos: number;

	@Column({ name: 'VALOR_SERVICOS' })
	valorServicos: number;

	@Column({ name: 'BASE_CALCULO_ISSQN' })
	baseCalculoIssqn: number;

	@Column({ name: 'VALOR_ISSQN' })
	valorIssqn: number;

	@Column({ name: 'VALOR_PIS_ISSQN' })
	valorPisIssqn: number;

	@Column({ name: 'VALOR_COFINS_ISSQN' })
	valorCofinsIssqn: number;

	@Column({ name: 'DATA_PRESTACAO_SERVICO' })
	dataPrestacaoServico: Date;

	@Column({ name: 'VALOR_DEDUCAO_ISSQN' })
	valorDeducaoIssqn: number;

	@Column({ name: 'OUTRAS_RETENCOES_ISSQN' })
	outrasRetencoesIssqn: number;

	@Column({ name: 'DESCONTO_INCONDICIONADO_ISSQN' })
	descontoIncondicionadoIssqn: number;

	@Column({ name: 'DESCONTO_CONDICIONADO_ISSQN' })
	descontoCondicionadoIssqn: number;

	@Column({ name: 'TOTAL_RETENCAO_ISSQN' })
	totalRetencaoIssqn: number;

	@Column({ name: 'REGIME_ESPECIAL_TRIBUTACAO' })
	regimeEspecialTributacao: string;

	@Column({ name: 'VALOR_RETIDO_PIS' })
	valorRetidoPis: number;

	@Column({ name: 'VALOR_RETIDO_COFINS' })
	valorRetidoCofins: number;

	@Column({ name: 'VALOR_RETIDO_CSLL' })
	valorRetidoCsll: number;

	@Column({ name: 'BASE_CALCULO_IRRF' })
	baseCalculoIrrf: number;

	@Column({ name: 'VALOR_RETIDO_IRRF' })
	valorRetidoIrrf: number;

	@Column({ name: 'BASE_CALCULO_PREVIDENCIA' })
	baseCalculoPrevidencia: number;

	@Column({ name: 'VALOR_RETIDO_PREVIDENCIA' })
	valorRetidoPrevidencia: number;

	@Column({ name: 'INFORMACOES_ADD_FISCO' })
	informacoesAddFisco: string;

	@Column({ name: 'INFORMACOES_ADD_CONTRIBUINTE' })
	informacoesAddContribuinte: string;

	@Column({ name: 'COMEX_UF_EMBARQUE' })
	comexUfEmbarque: string;

	@Column({ name: 'COMEX_LOCAL_EMBARQUE' })
	comexLocalEmbarque: string;

	@Column({ name: 'COMEX_LOCAL_DESPACHO' })
	comexLocalDespacho: string;

	@Column({ name: 'COMPRA_NOTA_EMPENHO' })
	compraNotaEmpenho: string;

	@Column({ name: 'COMPRA_PEDIDO' })
	compraPedido: string;

	@Column({ name: 'COMPRA_CONTRATO' })
	compraContrato: string;

	@Column({ name: 'QRCODE' })
	qrcode: string;

	@Column({ name: 'URL_CHAVE' })
	urlChave: string;

	@Column({ name: 'STATUS_NOTA' })
	statusNota: string;


	/**
	* Relations
	*/
    @OneToOne(() => NfeCana, nfeCana => nfeCana.nfeCabecalho, { cascade: true })
    nfeCana: NfeCana;

    @OneToOne(() => NfeDestinatario, nfeDestinatario => nfeDestinatario.nfeCabecalho, { cascade: true })
    nfeDestinatario: NfeDestinatario;

    @OneToOne(() => NfeEmitente, nfeEmitente => nfeEmitente.nfeCabecalho, { cascade: true })
    nfeEmitente: NfeEmitente;

    @OneToOne(() => NfeFatura, nfeFatura => nfeFatura.nfeCabecalho, { cascade: true })
    nfeFatura: NfeFatura;

    @OneToOne(() => NfeInformacaoPagamento, nfeInformacaoPagamento => nfeInformacaoPagamento.nfeCabecalho, { cascade: true })
    nfeInformacaoPagamento: NfeInformacaoPagamento;

    @OneToOne(() => NfeLocalEntrega, nfeLocalEntrega => nfeLocalEntrega.nfeCabecalho, { cascade: true })
    nfeLocalEntrega: NfeLocalEntrega;

    @OneToOne(() => NfeLocalRetirada, nfeLocalRetirada => nfeLocalRetirada.nfeCabecalho, { cascade: true })
    nfeLocalRetirada: NfeLocalRetirada;

    @OneToOne(() => NfeResponsavelTecnico, nfeResponsavelTecnico => nfeResponsavelTecnico.nfeCabecalho, { cascade: true })
    nfeResponsavelTecnico: NfeResponsavelTecnico;

    @OneToOne(() => NfeTransporte, nfeTransporte => nfeTransporte.nfeCabecalho, { cascade: true })
    nfeTransporte: NfeTransporte;

    @OneToOne(() => Vendedor)
    @JoinColumn({ name: "ID_VENDEDOR" })
    vendedor: Vendedor;

    @OneToOne(() => Fornecedor)
    @JoinColumn({ name: "ID_FORNECEDOR" })
    fornecedor: Fornecedor;

    @OneToOne(() => Cliente)
    @JoinColumn({ name: "ID_CLIENTE" })
    cliente: Cliente;

    @OneToOne(() => TributOperacaoFiscal)
    @JoinColumn({ name: "ID_TRIBUT_OPERACAO_FISCAL" })
    tributOperacaoFiscal: TributOperacaoFiscal;

    @OneToOne(() => VendaCabecalho)
    @JoinColumn({ name: "ID_VENDA_CABECALHO" })
    vendaCabecalho: VendaCabecalho;

    @OneToMany(() => NfeAcessoXml, nfeAcessoXml => nfeAcessoXml.nfeCabecalho, { cascade: true })
    listaNfeAcessoXml: NfeAcessoXml[];

    @OneToMany(() => NfeCteReferenciado, nfeCteReferenciado => nfeCteReferenciado.nfeCabecalho, { cascade: true })
    listaNfeCteReferenciado: NfeCteReferenciado[];

    @OneToMany(() => NfeCupomFiscalReferenciado, nfeCupomFiscalReferenciado => nfeCupomFiscalReferenciado.nfeCabecalho, { cascade: true })
    listaNfeCupomFiscalReferenciado: NfeCupomFiscalReferenciado[];

    @OneToMany(() => NfeDetalhe, nfeDetalhe => nfeDetalhe.nfeCabecalho, { cascade: true })
    listaNfeDetalhe: NfeDetalhe[];

    @OneToMany(() => NfeNfReferenciada, nfeNfReferenciada => nfeNfReferenciada.nfeCabecalho, { cascade: true })
    listaNfeNfReferenciada: NfeNfReferenciada[];

    @OneToMany(() => NfeProcessoReferenciado, nfeProcessoReferenciado => nfeProcessoReferenciado.nfeCabecalho, { cascade: true })
    listaNfeProcessoReferenciado: NfeProcessoReferenciado[];

    @OneToMany(() => NfeProdRuralReferenciada, nfeProdRuralReferenciada => nfeProdRuralReferenciada.nfeCabecalho, { cascade: true })
    listaNfeProdRuralReferenciada: NfeProdRuralReferenciada[];

    @OneToMany(() => NfeReferenciada, nfeReferenciada => nfeReferenciada.nfeCabecalho, { cascade: true })
    listaNfeReferenciada: NfeReferenciada[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.ufEmitente = objetoJson['ufEmitente'];
			this.codigoNumerico = objetoJson['codigoNumerico'];
			this.naturezaOperacao = objetoJson['naturezaOperacao'];
			this.codigoModelo = objetoJson['codigoModelo'];
			this.serie = objetoJson['serie'];
			this.numero = objetoJson['numero'];
			this.dataHoraEmissao = objetoJson['dataHoraEmissao'];
			this.dataHoraEntradaSaida = objetoJson['dataHoraEntradaSaida'];
			this.tipoOperacao = objetoJson['tipoOperacao'];
			this.localDestino = objetoJson['localDestino'];
			this.codigoMunicipio = objetoJson['codigoMunicipio'];
			this.formatoImpressaoDanfe = objetoJson['formatoImpressaoDanfe'];
			this.tipoEmissao = objetoJson['tipoEmissao'];
			this.chaveAcesso = objetoJson['chaveAcesso'];
			this.digitoChaveAcesso = objetoJson['digitoChaveAcesso'];
			this.ambiente = objetoJson['ambiente'];
			this.finalidadeEmissao = objetoJson['finalidadeEmissao'];
			this.consumidorOperacao = objetoJson['consumidorOperacao'];
			this.consumidorPresenca = objetoJson['consumidorPresenca'];
			this.processoEmissao = objetoJson['processoEmissao'];
			this.versaoProcessoEmissao = objetoJson['versaoProcessoEmissao'];
			this.dataEntradaContingencia = objetoJson['dataEntradaContingencia'];
			this.justificativaContingencia = objetoJson['justificativaContingencia'];
			this.baseCalculoIcms = objetoJson['baseCalculoIcms'];
			this.valorIcms = objetoJson['valorIcms'];
			this.valorIcmsDesonerado = objetoJson['valorIcmsDesonerado'];
			this.totalIcmsFcpUfDestino = objetoJson['totalIcmsFcpUfDestino'];
			this.totalIcmsInterestadualUfDestino = objetoJson['totalIcmsInterestadualUfDestino'];
			this.totalIcmsInterestadualUfRemetente = objetoJson['totalIcmsInterestadualUfRemetente'];
			this.valorTotalFcp = objetoJson['valorTotalFcp'];
			this.baseCalculoIcmsSt = objetoJson['baseCalculoIcmsSt'];
			this.valorIcmsSt = objetoJson['valorIcmsSt'];
			this.valorTotalFcpSt = objetoJson['valorTotalFcpSt'];
			this.valorTotalFcpStRetido = objetoJson['valorTotalFcpStRetido'];
			this.valorTotalProdutos = objetoJson['valorTotalProdutos'];
			this.valorFrete = objetoJson['valorFrete'];
			this.valorSeguro = objetoJson['valorSeguro'];
			this.valorDesconto = objetoJson['valorDesconto'];
			this.valorImpostoImportacao = objetoJson['valorImpostoImportacao'];
			this.valorIpi = objetoJson['valorIpi'];
			this.valorIpiDevolvido = objetoJson['valorIpiDevolvido'];
			this.valorPis = objetoJson['valorPis'];
			this.valorCofins = objetoJson['valorCofins'];
			this.valorDespesasAcessorias = objetoJson['valorDespesasAcessorias'];
			this.valorTotal = objetoJson['valorTotal'];
			this.valorTotalTributos = objetoJson['valorTotalTributos'];
			this.valorServicos = objetoJson['valorServicos'];
			this.baseCalculoIssqn = objetoJson['baseCalculoIssqn'];
			this.valorIssqn = objetoJson['valorIssqn'];
			this.valorPisIssqn = objetoJson['valorPisIssqn'];
			this.valorCofinsIssqn = objetoJson['valorCofinsIssqn'];
			this.dataPrestacaoServico = objetoJson['dataPrestacaoServico'];
			this.valorDeducaoIssqn = objetoJson['valorDeducaoIssqn'];
			this.outrasRetencoesIssqn = objetoJson['outrasRetencoesIssqn'];
			this.descontoIncondicionadoIssqn = objetoJson['descontoIncondicionadoIssqn'];
			this.descontoCondicionadoIssqn = objetoJson['descontoCondicionadoIssqn'];
			this.totalRetencaoIssqn = objetoJson['totalRetencaoIssqn'];
			this.regimeEspecialTributacao = objetoJson['regimeEspecialTributacao'];
			this.valorRetidoPis = objetoJson['valorRetidoPis'];
			this.valorRetidoCofins = objetoJson['valorRetidoCofins'];
			this.valorRetidoCsll = objetoJson['valorRetidoCsll'];
			this.baseCalculoIrrf = objetoJson['baseCalculoIrrf'];
			this.valorRetidoIrrf = objetoJson['valorRetidoIrrf'];
			this.baseCalculoPrevidencia = objetoJson['baseCalculoPrevidencia'];
			this.valorRetidoPrevidencia = objetoJson['valorRetidoPrevidencia'];
			this.informacoesAddFisco = objetoJson['informacoesAddFisco'];
			this.informacoesAddContribuinte = objetoJson['informacoesAddContribuinte'];
			this.comexUfEmbarque = objetoJson['comexUfEmbarque'];
			this.comexLocalEmbarque = objetoJson['comexLocalEmbarque'];
			this.comexLocalDespacho = objetoJson['comexLocalDespacho'];
			this.compraNotaEmpenho = objetoJson['compraNotaEmpenho'];
			this.compraPedido = objetoJson['compraPedido'];
			this.compraContrato = objetoJson['compraContrato'];
			this.qrcode = objetoJson['qrcode'];
			this.urlChave = objetoJson['urlChave'];
			this.statusNota = objetoJson['statusNota'];
			
			if (objetoJson['nfeCana'] != null) {
				this.nfeCana = new NfeCana(objetoJson['nfeCana']);
			}

			if (objetoJson['nfeDestinatario'] != null) {
				this.nfeDestinatario = new NfeDestinatario(objetoJson['nfeDestinatario']);
			}

			if (objetoJson['nfeEmitente'] != null) {
				this.nfeEmitente = new NfeEmitente(objetoJson['nfeEmitente']);
			}

			if (objetoJson['nfeFatura'] != null) {
				this.nfeFatura = new NfeFatura(objetoJson['nfeFatura']);
			}

			if (objetoJson['nfeInformacaoPagamento'] != null) {
				this.nfeInformacaoPagamento = new NfeInformacaoPagamento(objetoJson['nfeInformacaoPagamento']);
			}

			if (objetoJson['nfeLocalEntrega'] != null) {
				this.nfeLocalEntrega = new NfeLocalEntrega(objetoJson['nfeLocalEntrega']);
			}

			if (objetoJson['nfeLocalRetirada'] != null) {
				this.nfeLocalRetirada = new NfeLocalRetirada(objetoJson['nfeLocalRetirada']);
			}

			if (objetoJson['nfeResponsavelTecnico'] != null) {
				this.nfeResponsavelTecnico = new NfeResponsavelTecnico(objetoJson['nfeResponsavelTecnico']);
			}

			if (objetoJson['nfeTransporte'] != null) {
				this.nfeTransporte = new NfeTransporte(objetoJson['nfeTransporte']);
			}

			if (objetoJson['vendedor'] != null) {
				this.vendedor = new Vendedor(objetoJson['vendedor']);
			}

			if (objetoJson['fornecedor'] != null) {
				this.fornecedor = new Fornecedor(objetoJson['fornecedor']);
			}

			if (objetoJson['cliente'] != null) {
				this.cliente = new Cliente(objetoJson['cliente']);
			}

			if (objetoJson['tributOperacaoFiscal'] != null) {
				this.tributOperacaoFiscal = new TributOperacaoFiscal(objetoJson['tributOperacaoFiscal']);
			}

			if (objetoJson['vendaCabecalho'] != null) {
				this.vendaCabecalho = new VendaCabecalho(objetoJson['vendaCabecalho']);
			}

			
			this.listaNfeAcessoXml = [];
			let listaNfeAcessoXmlJson = objetoJson['listaNfeAcessoXml'];
			if (listaNfeAcessoXmlJson != null) {
				for (let i = 0; i < listaNfeAcessoXmlJson.length; i++) {
					let objeto = new NfeAcessoXml(listaNfeAcessoXmlJson[i]);
					this.listaNfeAcessoXml.push(objeto);
				}
			}

			this.listaNfeCteReferenciado = [];
			let listaNfeCteReferenciadoJson = objetoJson['listaNfeCteReferenciado'];
			if (listaNfeCteReferenciadoJson != null) {
				for (let i = 0; i < listaNfeCteReferenciadoJson.length; i++) {
					let objeto = new NfeCteReferenciado(listaNfeCteReferenciadoJson[i]);
					this.listaNfeCteReferenciado.push(objeto);
				}
			}

			this.listaNfeCupomFiscalReferenciado = [];
			let listaNfeCupomFiscalReferenciadoJson = objetoJson['listaNfeCupomFiscalReferenciado'];
			if (listaNfeCupomFiscalReferenciadoJson != null) {
				for (let i = 0; i < listaNfeCupomFiscalReferenciadoJson.length; i++) {
					let objeto = new NfeCupomFiscalReferenciado(listaNfeCupomFiscalReferenciadoJson[i]);
					this.listaNfeCupomFiscalReferenciado.push(objeto);
				}
			}

			this.listaNfeDetalhe = [];
			let listaNfeDetalheJson = objetoJson['listaNfeDetalhe'];
			if (listaNfeDetalheJson != null) {
				for (let i = 0; i < listaNfeDetalheJson.length; i++) {
					let objeto = new NfeDetalhe(listaNfeDetalheJson[i]);
					this.listaNfeDetalhe.push(objeto);
				}
			}

			this.listaNfeNfReferenciada = [];
			let listaNfeNfReferenciadaJson = objetoJson['listaNfeNfReferenciada'];
			if (listaNfeNfReferenciadaJson != null) {
				for (let i = 0; i < listaNfeNfReferenciadaJson.length; i++) {
					let objeto = new NfeNfReferenciada(listaNfeNfReferenciadaJson[i]);
					this.listaNfeNfReferenciada.push(objeto);
				}
			}

			this.listaNfeProcessoReferenciado = [];
			let listaNfeProcessoReferenciadoJson = objetoJson['listaNfeProcessoReferenciado'];
			if (listaNfeProcessoReferenciadoJson != null) {
				for (let i = 0; i < listaNfeProcessoReferenciadoJson.length; i++) {
					let objeto = new NfeProcessoReferenciado(listaNfeProcessoReferenciadoJson[i]);
					this.listaNfeProcessoReferenciado.push(objeto);
				}
			}

			this.listaNfeProdRuralReferenciada = [];
			let listaNfeProdRuralReferenciadaJson = objetoJson['listaNfeProdRuralReferenciada'];
			if (listaNfeProdRuralReferenciadaJson != null) {
				for (let i = 0; i < listaNfeProdRuralReferenciadaJson.length; i++) {
					let objeto = new NfeProdRuralReferenciada(listaNfeProdRuralReferenciadaJson[i]);
					this.listaNfeProdRuralReferenciada.push(objeto);
				}
			}

			this.listaNfeReferenciada = [];
			let listaNfeReferenciadaJson = objetoJson['listaNfeReferenciada'];
			if (listaNfeReferenciadaJson != null) {
				for (let i = 0; i < listaNfeReferenciadaJson.length; i++) {
					let objeto = new NfeReferenciada(listaNfeReferenciadaJson[i]);
					this.listaNfeReferenciada.push(objeto);
				}
			}

		}
	}

	zerarNulos() {
		this.baseCalculoIcms = this.baseCalculoIcms == null ? 0 : this.baseCalculoIcms;
		this.valorIcms = this.valorIcms == null ? 0 : this.valorIcms;
		this.valorIcmsDesonerado = this.valorIcmsDesonerado == null ? 0 : this.valorIcmsDesonerado;
		this.totalIcmsFcpUfDestino = this.totalIcmsFcpUfDestino == null ? 0 : this.totalIcmsFcpUfDestino;
		this.totalIcmsInterestadualUfDestino = this.totalIcmsInterestadualUfDestino == null ? 0 : this.totalIcmsInterestadualUfDestino;
		this.totalIcmsInterestadualUfRemetente = this.totalIcmsInterestadualUfRemetente == null ? 0 : this.totalIcmsInterestadualUfRemetente;
		this.valorTotalFcp = this.valorTotalFcp == null ? 0 : this.valorTotalFcp;
		this.baseCalculoIcmsSt = this.baseCalculoIcmsSt == null ? 0 : this.baseCalculoIcmsSt;
		this.valorIcmsSt = this.valorIcmsSt == null ? 0 : this.valorIcmsSt;
		this.valorTotalFcpSt = this.valorTotalFcpSt == null ? 0 : this.valorTotalFcpSt;
		this.valorTotalFcpStRetido = this.valorTotalFcpStRetido == null ? 0 : this.valorTotalFcpStRetido;
		this.valorTotalProdutos = this.valorTotalProdutos == null ? 0 : this.valorTotalProdutos;
		this.valorFrete = this.valorFrete == null ? 0 : this.valorFrete;
		this.valorSeguro = this.valorSeguro == null ? 0 : this.valorSeguro;
		this.valorDesconto = this.valorDesconto == null ? 0 : this.valorDesconto;
		this.valorImpostoImportacao = this.valorImpostoImportacao == null ? 0 : this.valorImpostoImportacao;
		this.valorIpi = this.valorIpi == null ? 0 : this.valorIpi;
		this.valorIpiDevolvido = this.valorIpiDevolvido == null ? 0 : this.valorIpiDevolvido;
		this.valorPis = this.valorPis == null ? 0 : this.valorPis;
		this.valorCofins = this.valorCofins == null ? 0 : this.valorCofins;
		this.valorDespesasAcessorias = this.valorDespesasAcessorias == null ? 0 : this.valorDespesasAcessorias;
		this.valorTotal = this.valorTotal == null ? 0 : this.valorTotal;
		this.valorTotalTributos = this.valorTotalTributos == null ? 0 : this.valorTotalTributos;
		this.valorServicos = this.valorServicos == null ? 0 : this.valorServicos;
		this.baseCalculoIssqn = this.baseCalculoIssqn == null ? 0 : this.baseCalculoIssqn;
		this.valorIssqn = this.valorIssqn == null ? 0 : this.valorIssqn;
		this.valorPisIssqn = this.valorPisIssqn == null ? 0 : this.valorPisIssqn;
		this.valorCofinsIssqn = this.valorCofinsIssqn == null ? 0 : this.valorCofinsIssqn;
		this.valorDeducaoIssqn = this.valorDeducaoIssqn == null ? 0 : this.valorDeducaoIssqn;
		this.outrasRetencoesIssqn = this.outrasRetencoesIssqn == null ? 0 : this.outrasRetencoesIssqn;
		this.descontoIncondicionadoIssqn = this.descontoIncondicionadoIssqn == null ? 0 : this.descontoIncondicionadoIssqn;
		this.descontoCondicionadoIssqn = this.descontoCondicionadoIssqn == null ? 0 : this.descontoCondicionadoIssqn;
		this.totalRetencaoIssqn = this.totalRetencaoIssqn == null ? 0 : this.totalRetencaoIssqn;
		this.valorRetidoPis = this.valorRetidoPis == null ? 0 : this.valorRetidoPis;
		this.valorRetidoCofins = this.valorRetidoCofins == null ? 0 : this.valorRetidoCofins;
		this.valorRetidoCsll = this.valorRetidoCsll == null ? 0 : this.valorRetidoCsll;
		this.baseCalculoIrrf = this.baseCalculoIrrf == null ? 0 : this.baseCalculoIrrf;
		this.valorRetidoIrrf = this.valorRetidoIrrf == null ? 0 : this.valorRetidoIrrf;
		this.baseCalculoPrevidencia = this.baseCalculoPrevidencia == null ? 0 : this.baseCalculoPrevidencia;
		this.valorRetidoPrevidencia = this.valorRetidoPrevidencia == null ? 0 : this.valorRetidoPrevidencia;
	}
}