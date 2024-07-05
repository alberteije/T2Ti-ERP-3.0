/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_CABECALHO] 
                                                                                
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
import { Entity, Column, PrimaryGeneratedColumn, OneToMany, OneToOne } from 'typeorm';
import { CteCarga } from '../../entities-export';
import { CteDestinatario } from '../../entities-export';
import { CteLocalEntrega } from '../../entities-export';
import { CteRemetente } from '../../entities-export';
import { CteRodoviario } from '../../entities-export';
import { CteTomador } from '../../entities-export';

@Entity({ name: 'CTE_CABECALHO' })
export class CteCabecalho { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'UF_EMITENTE' })
	ufEmitente: number;

	@Column({ name: 'CODIGO_NUMERICO' })
	codigoNumerico: string;

	@Column({ name: 'CFOP' })
	cfop: number;

	@Column({ name: 'NATUREZA_OPERACAO' })
	naturezaOperacao: string;

	@Column({ name: 'FORMA_PAGAMENTO' })
	formaPagamento: string;

	@Column({ name: 'MODELO' })
	modelo: string;

	@Column({ name: 'SERIE' })
	serie: string;

	@Column({ name: 'NUMERO' })
	numero: string;

	@Column({ name: 'DATA_HORA_EMISSAO' })
	dataHoraEmissao: Date;

	@Column({ name: 'FORMATO_IMPRESSAO_DACTE' })
	formatoImpressaoDacte: string;

	@Column({ name: 'TIPO_EMISSAO' })
	tipoEmissao: string;

	@Column({ name: 'CHAVE_ACESSO' })
	chaveAcesso: string;

	@Column({ name: 'DIGITO_CHAVE_ACESSO' })
	digitoChaveAcesso: string;

	@Column({ name: 'AMBIENTE' })
	ambiente: string;

	@Column({ name: 'TIPO_CTE' })
	tipoCte: string;

	@Column({ name: 'PROCESSO_EMISSAO' })
	processoEmissao: string;

	@Column({ name: 'VERSAO_PROCESSO_EMISSAO' })
	versaoProcessoEmissao: string;

	@Column({ name: 'CHAVE_REFERENCIADO' })
	chaveReferenciado: string;

	@Column({ name: 'CODIGO_MUNICIPIO_ENVIO' })
	codigoMunicipioEnvio: number;

	@Column({ name: 'NOME_MUNICIPIO_ENVIO' })
	nomeMunicipioEnvio: string;

	@Column({ name: 'UF_ENVIO' })
	ufEnvio: string;

	@Column({ name: 'MODAL' })
	modal: string;

	@Column({ name: 'TIPO_SERVICO' })
	tipoServico: string;

	@Column({ name: 'CODIGO_MUNICIPIO_INI_PRESTACAO' })
	codigoMunicipioIniPrestacao: number;

	@Column({ name: 'NOME_MUNICIPIO_INI_PRESTACAO' })
	nomeMunicipioIniPrestacao: string;

	@Column({ name: 'UF_INI_PRESTACAO' })
	ufIniPrestacao: string;

	@Column({ name: 'CODIGO_MUNICIPIO_FIM_PRESTACAO' })
	codigoMunicipioFimPrestacao: number;

	@Column({ name: 'NOME_MUNICIPIO_FIM_PRESTACAO' })
	nomeMunicipioFimPrestacao: string;

	@Column({ name: 'UF_FIM_PRESTACAO' })
	ufFimPrestacao: string;

	@Column({ name: 'RETIRA' })
	retira: string;

	@Column({ name: 'RETIRA_DETALHE' })
	retiraDetalhe: string;

	@Column({ name: 'TOMADOR' })
	tomador: string;

	@Column({ name: 'DATA_ENTRADA_CONTINGENCIA' })
	dataEntradaContingencia: Date;

	@Column({ name: 'JUSTIFICATIVA_CONTINGENCIA' })
	justificativaContingencia: string;

	@Column({ name: 'CARAC_ADICIONAL_TRANSPORTE' })
	caracAdicionalTransporte: string;

	@Column({ name: 'CARAC_ADICIONAL_SERVICO' })
	caracAdicionalServico: string;

	@Column({ name: 'FUNCIONARIO_EMISSOR' })
	funcionarioEmissor: string;

	@Column({ name: 'FLUXO_ORIGEM' })
	fluxoOrigem: string;

	@Column({ name: 'ENTREGA_TIPO_PERIODO' })
	entregaTipoPeriodo: string;

	@Column({ name: 'ENTREGA_DATA_PROGRAMADA' })
	entregaDataProgramada: Date;

	@Column({ name: 'ENTREGA_DATA_INICIAL' })
	entregaDataInicial: Date;

	@Column({ name: 'ENTREGA_DATA_FINAL' })
	entregaDataFinal: Date;

	@Column({ name: 'ENTREGA_TIPO_HORA' })
	entregaTipoHora: string;

	@Column({ name: 'ENTREGA_HORA_PROGRAMADA' })
	entregaHoraProgramada: string;

	@Column({ name: 'ENTREGA_HORA_INICIAL' })
	entregaHoraInicial: string;

	@Column({ name: 'ENTREGA_HORA_FINAL' })
	entregaHoraFinal: string;

	@Column({ name: 'MUNICIPIO_ORIGEM_CALCULO' })
	municipioOrigemCalculo: string;

	@Column({ name: 'MUNICIPIO_DESTINO_CALCULO' })
	municipioDestinoCalculo: string;

	@Column({ name: 'OBSERVACOES_GERAIS' })
	observacoesGerais: string;

	@Column({ name: 'VALOR_TOTAL_SERVICO' })
	valorTotalServico: number;

	@Column({ name: 'VALOR_RECEBER' })
	valorReceber: number;

	@Column({ name: 'CST' })
	cst: string;

	@Column({ name: 'BASE_CALCULO_ICMS' })
	baseCalculoIcms: number;

	@Column({ name: 'ALIQUOTA_ICMS' })
	aliquotaIcms: number;

	@Column({ name: 'VALOR_ICMS' })
	valorIcms: number;

	@Column({ name: 'PERCENTUAL_REDUCAO_BC_ICMS' })
	percentualReducaoBcIcms: number;

	@Column({ name: 'VALOR_BC_ICMS_ST_RETIDO' })
	valorBcIcmsStRetido: number;

	@Column({ name: 'VALOR_ICMS_ST_RETIDO' })
	valorIcmsStRetido: number;

	@Column({ name: 'ALIQUOTA_ICMS_ST_RETIDO' })
	aliquotaIcmsStRetido: number;

	@Column({ name: 'VALOR_CREDITO_PRESUMIDO_ICMS' })
	valorCreditoPresumidoIcms: number;

	@Column({ name: 'PERCENTUAL_BC_ICMS_OUTRA_UF' })
	percentualBcIcmsOutraUf: number;

	@Column({ name: 'VALOR_BC_ICMS_OUTRA_UF' })
	valorBcIcmsOutraUf: number;

	@Column({ name: 'ALIQUOTA_ICMS_OUTRA_UF' })
	aliquotaIcmsOutraUf: number;

	@Column({ name: 'VALOR_ICMS_OUTRA_UF' })
	valorIcmsOutraUf: number;

	@Column({ name: 'SIMPLES_NACIONAL_INDICADOR' })
	simplesNacionalIndicador: string;

	@Column({ name: 'SIMPLES_NACIONAL_TOTAL' })
	simplesNacionalTotal: number;

	@Column({ name: 'INFORMACOES_ADD_FISCO' })
	informacoesAddFisco: string;

	@Column({ name: 'VALOR_TOTAL_CARGA' })
	valorTotalCarga: number;

	@Column({ name: 'PRODUTO_PREDOMINANTE' })
	produtoPredominante: string;

	@Column({ name: 'CARGA_OUTRAS_CARACTERISTICAS' })
	cargaOutrasCaracteristicas: string;

	@Column({ name: 'MODAL_VERSAO_LAYOUT' })
	modalVersaoLayout: number;

	@Column({ name: 'CHAVE_CTE_SUBSTITUIDO' })
	chaveCteSubstituido: string;


	/**
	* Relations
	*/
    @OneToOne(() => CteDestinatario, cteDestinatario => cteDestinatario.cteCabecalho, { cascade: true })
    cteDestinatario: CteDestinatario;

    @OneToOne(() => CteLocalEntrega, cteLocalEntrega => cteLocalEntrega.cteCabecalho, { cascade: true })
    cteLocalEntrega: CteLocalEntrega;

    @OneToOne(() => CteRemetente, cteRemetente => cteRemetente.cteCabecalho, { cascade: true })
    cteRemetente: CteRemetente;

    @OneToOne(() => CteRodoviario, cteRodoviario => cteRodoviario.cteCabecalho, { cascade: true })
    cteRodoviario: CteRodoviario;

    @OneToOne(() => CteTomador, cteTomador => cteTomador.cteCabecalho, { cascade: true })
    cteTomador: CteTomador;

    @OneToMany(() => CteCarga, cteCarga => cteCarga.cteCabecalho, { cascade: true })
    listaCteCarga: CteCarga[];


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.ufEmitente = objetoJson['ufEmitente'];
			this.codigoNumerico = objetoJson['codigoNumerico'];
			this.cfop = objetoJson['cfop'];
			this.naturezaOperacao = objetoJson['naturezaOperacao'];
			this.formaPagamento = objetoJson['formaPagamento'];
			this.modelo = objetoJson['modelo'];
			this.serie = objetoJson['serie'];
			this.numero = objetoJson['numero'];
			this.dataHoraEmissao = objetoJson['dataHoraEmissao'];
			this.formatoImpressaoDacte = objetoJson['formatoImpressaoDacte'];
			this.tipoEmissao = objetoJson['tipoEmissao'];
			this.chaveAcesso = objetoJson['chaveAcesso'];
			this.digitoChaveAcesso = objetoJson['digitoChaveAcesso'];
			this.ambiente = objetoJson['ambiente'];
			this.tipoCte = objetoJson['tipoCte'];
			this.processoEmissao = objetoJson['processoEmissao'];
			this.versaoProcessoEmissao = objetoJson['versaoProcessoEmissao'];
			this.chaveReferenciado = objetoJson['chaveReferenciado'];
			this.codigoMunicipioEnvio = objetoJson['codigoMunicipioEnvio'];
			this.nomeMunicipioEnvio = objetoJson['nomeMunicipioEnvio'];
			this.ufEnvio = objetoJson['ufEnvio'];
			this.modal = objetoJson['modal'];
			this.tipoServico = objetoJson['tipoServico'];
			this.codigoMunicipioIniPrestacao = objetoJson['codigoMunicipioIniPrestacao'];
			this.nomeMunicipioIniPrestacao = objetoJson['nomeMunicipioIniPrestacao'];
			this.ufIniPrestacao = objetoJson['ufIniPrestacao'];
			this.codigoMunicipioFimPrestacao = objetoJson['codigoMunicipioFimPrestacao'];
			this.nomeMunicipioFimPrestacao = objetoJson['nomeMunicipioFimPrestacao'];
			this.ufFimPrestacao = objetoJson['ufFimPrestacao'];
			this.retira = objetoJson['retira'];
			this.retiraDetalhe = objetoJson['retiraDetalhe'];
			this.tomador = objetoJson['tomador'];
			this.dataEntradaContingencia = objetoJson['dataEntradaContingencia'];
			this.justificativaContingencia = objetoJson['justificativaContingencia'];
			this.caracAdicionalTransporte = objetoJson['caracAdicionalTransporte'];
			this.caracAdicionalServico = objetoJson['caracAdicionalServico'];
			this.funcionarioEmissor = objetoJson['funcionarioEmissor'];
			this.fluxoOrigem = objetoJson['fluxoOrigem'];
			this.entregaTipoPeriodo = objetoJson['entregaTipoPeriodo'];
			this.entregaDataProgramada = objetoJson['entregaDataProgramada'];
			this.entregaDataInicial = objetoJson['entregaDataInicial'];
			this.entregaDataFinal = objetoJson['entregaDataFinal'];
			this.entregaTipoHora = objetoJson['entregaTipoHora'];
			this.entregaHoraProgramada = objetoJson['entregaHoraProgramada'];
			this.entregaHoraInicial = objetoJson['entregaHoraInicial'];
			this.entregaHoraFinal = objetoJson['entregaHoraFinal'];
			this.municipioOrigemCalculo = objetoJson['municipioOrigemCalculo'];
			this.municipioDestinoCalculo = objetoJson['municipioDestinoCalculo'];
			this.observacoesGerais = objetoJson['observacoesGerais'];
			this.valorTotalServico = objetoJson['valorTotalServico'];
			this.valorReceber = objetoJson['valorReceber'];
			this.cst = objetoJson['cst'];
			this.baseCalculoIcms = objetoJson['baseCalculoIcms'];
			this.aliquotaIcms = objetoJson['aliquotaIcms'];
			this.valorIcms = objetoJson['valorIcms'];
			this.percentualReducaoBcIcms = objetoJson['percentualReducaoBcIcms'];
			this.valorBcIcmsStRetido = objetoJson['valorBcIcmsStRetido'];
			this.valorIcmsStRetido = objetoJson['valorIcmsStRetido'];
			this.aliquotaIcmsStRetido = objetoJson['aliquotaIcmsStRetido'];
			this.valorCreditoPresumidoIcms = objetoJson['valorCreditoPresumidoIcms'];
			this.percentualBcIcmsOutraUf = objetoJson['percentualBcIcmsOutraUf'];
			this.valorBcIcmsOutraUf = objetoJson['valorBcIcmsOutraUf'];
			this.aliquotaIcmsOutraUf = objetoJson['aliquotaIcmsOutraUf'];
			this.valorIcmsOutraUf = objetoJson['valorIcmsOutraUf'];
			this.simplesNacionalIndicador = objetoJson['simplesNacionalIndicador'];
			this.simplesNacionalTotal = objetoJson['simplesNacionalTotal'];
			this.informacoesAddFisco = objetoJson['informacoesAddFisco'];
			this.valorTotalCarga = objetoJson['valorTotalCarga'];
			this.produtoPredominante = objetoJson['produtoPredominante'];
			this.cargaOutrasCaracteristicas = objetoJson['cargaOutrasCaracteristicas'];
			this.modalVersaoLayout = objetoJson['modalVersaoLayout'];
			this.chaveCteSubstituido = objetoJson['chaveCteSubstituido'];
			
			if (objetoJson['cteDestinatario'] != null) {
				this.cteDestinatario = new CteDestinatario(objetoJson['cteDestinatario']);
			}

			if (objetoJson['cteLocalEntrega'] != null) {
				this.cteLocalEntrega = new CteLocalEntrega(objetoJson['cteLocalEntrega']);
			}

			if (objetoJson['cteRemetente'] != null) {
				this.cteRemetente = new CteRemetente(objetoJson['cteRemetente']);
			}

			if (objetoJson['cteRodoviario'] != null) {
				this.cteRodoviario = new CteRodoviario(objetoJson['cteRodoviario']);
			}

			if (objetoJson['cteTomador'] != null) {
				this.cteTomador = new CteTomador(objetoJson['cteTomador']);
			}

			
			this.listaCteCarga = [];
			let listaCteCargaJson = objetoJson['listaCteCarga'];
			if (listaCteCargaJson != null) {
				for (let i = 0; i < listaCteCargaJson.length; i++) {
					let objeto = new CteCarga(listaCteCargaJson[i]);
					this.listaCteCarga.push(objeto);
				}
			}

		}
	}
}