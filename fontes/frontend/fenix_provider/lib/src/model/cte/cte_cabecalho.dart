/*
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
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:fenix/src/infra/biblioteca.dart';
import 'package:fenix/src/model/model.dart';

class CteCabecalho {
	int? id;
	int? ufEmitente;
	String? codigoNumerico;
	int? cfop;
	String? naturezaOperacao;
	String? formaPagamento;
	String? modelo;
	String? serie;
	String? numero;
	DateTime? dataHoraEmissao;
	String? formatoImpressaoDacte;
	String? tipoEmissao;
	String? chaveAcesso;
	String? digitoChaveAcesso;
	String? ambiente;
	String? tipoCte;
	String? processoEmissao;
	String? versaoProcessoEmissao;
	String? chaveReferenciado;
	int? codigoMunicipioEnvio;
	String? nomeMunicipioEnvio;
	String? ufEnvio;
	String? modal;
	String? tipoServico;
	int? codigoMunicipioIniPrestacao;
	String? nomeMunicipioIniPrestacao;
	String? ufIniPrestacao;
	int? codigoMunicipioFimPrestacao;
	String? nomeMunicipioFimPrestacao;
	String? ufFimPrestacao;
	String? retira;
	String? retiraDetalhe;
	String? tomador;
	DateTime? dataEntradaContingencia;
	String? justificativaContingencia;
	String? caracAdicionalTransporte;
	String? caracAdicionalServico;
	String? funcionarioEmissor;
	String? fluxoOrigem;
	String? entregaTipoPeriodo;
	DateTime? entregaDataProgramada;
	DateTime? entregaDataInicial;
	DateTime? entregaDataFinal;
	String? entregaTipoHora;
	String? entregaHoraProgramada;
	String? entregaHoraInicial;
	String? entregaHoraFinal;
	String? municipioOrigemCalculo;
	String? municipioDestinoCalculo;
	String? observacoesGerais;
	double? valorTotalServico;
	double? valorReceber;
	String? cst;
	double? baseCalculoIcms;
	double? aliquotaIcms;
	double? valorIcms;
	double? percentualReducaoBcIcms;
	double? valorBcIcmsStRetido;
	double? valorIcmsStRetido;
	double? aliquotaIcmsStRetido;
	double? valorCreditoPresumidoIcms;
	double? percentualBcIcmsOutraUf;
	double? valorBcIcmsOutraUf;
	double? aliquotaIcmsOutraUf;
	double? valorIcmsOutraUf;
	String? simplesNacionalIndicador;
	double? simplesNacionalTotal;
	String? informacoesAddFisco;
	double? valorTotalCarga;
	String? produtoPredominante;
	String? cargaOutrasCaracteristicas;
	int? modalVersaoLayout;
	String? chaveCteSubstituido;
	CteDestinatario? cteDestinatario;
	CteLocalEntrega? cteLocalEntrega;
	CteRemetente? cteRemetente;
	CteRodoviario? cteRodoviario;
	CteTomador? cteTomador;
	List<CteCarga>? listaCteCarga = [];

	CteCabecalho({
		id,
		ufEmitente,
		codigoNumerico,
		cfop,
		naturezaOperacao,
		formaPagamento,
		modelo,
		serie,
		numero,
		dataHoraEmissao,
		formatoImpressaoDacte,
		tipoEmissao,
		chaveAcesso,
		digitoChaveAcesso,
		ambiente,
		tipoCte,
		processoEmissao,
		versaoProcessoEmissao,
		chaveReferenciado,
		codigoMunicipioEnvio,
		nomeMunicipioEnvio,
		ufEnvio,
		modal,
		tipoServico,
		codigoMunicipioIniPrestacao,
		nomeMunicipioIniPrestacao,
		ufIniPrestacao,
		codigoMunicipioFimPrestacao,
		nomeMunicipioFimPrestacao,
		ufFimPrestacao,
		retira,
		retiraDetalhe,
		tomador,
		dataEntradaContingencia,
		justificativaContingencia,
		caracAdicionalTransporte,
		caracAdicionalServico,
		funcionarioEmissor,
		fluxoOrigem,
		entregaTipoPeriodo,
		entregaDataProgramada,
		entregaDataInicial,
		entregaDataFinal,
		entregaTipoHora,
		entregaHoraProgramada,
		entregaHoraInicial,
		entregaHoraFinal,
		municipioOrigemCalculo,
		municipioDestinoCalculo,
		observacoesGerais,
		valorTotalServico = 0.0,
		valorReceber = 0.0,
		cst,
		baseCalculoIcms = 0.0,
		aliquotaIcms = 0.0,
		valorIcms = 0.0,
		percentualReducaoBcIcms = 0.0,
		valorBcIcmsStRetido = 0.0,
		valorIcmsStRetido = 0.0,
		aliquotaIcmsStRetido = 0.0,
		valorCreditoPresumidoIcms = 0.0,
		percentualBcIcmsOutraUf = 0.0,
		valorBcIcmsOutraUf = 0.0,
		aliquotaIcmsOutraUf = 0.0,
		valorIcmsOutraUf = 0.0,
		simplesNacionalIndicador,
		simplesNacionalTotal = 0.0,
		informacoesAddFisco,
		valorTotalCarga = 0.0,
		produtoPredominante,
		cargaOutrasCaracteristicas,
		modalVersaoLayout,
		chaveCteSubstituido,
		cteDestinatario,
		cteLocalEntrega,
		cteRemetente,
		cteRodoviario,
		cteTomador,
		listaCteCarga,
	});

	static List<String> campos = <String>[
		'ID', 
		'UF_EMITENTE', 
		'CODIGO_NUMERICO', 
		'CFOP', 
		'NATUREZA_OPERACAO', 
		'FORMA_PAGAMENTO', 
		'MODELO', 
		'SERIE', 
		'NUMERO', 
		'DATA_HORA_EMISSAO', 
		'FORMATO_IMPRESSAO_DACTE', 
		'TIPO_EMISSAO', 
		'CHAVE_ACESSO', 
		'DIGITO_CHAVE_ACESSO', 
		'AMBIENTE', 
		'TIPO_CTE', 
		'PROCESSO_EMISSAO', 
		'VERSAO_PROCESSO_EMISSAO', 
		'CHAVE_REFERENCIADO', 
		'CODIGO_MUNICIPIO_ENVIO', 
		'NOME_MUNICIPIO_ENVIO', 
		'UF_ENVIO', 
		'MODAL', 
		'TIPO_SERVICO', 
		'CODIGO_MUNICIPIO_INI_PRESTACAO', 
		'NOME_MUNICIPIO_INI_PRESTACAO', 
		'UF_INI_PRESTACAO', 
		'CODIGO_MUNICIPIO_FIM_PRESTACAO', 
		'NOME_MUNICIPIO_FIM_PRESTACAO', 
		'UF_FIM_PRESTACAO', 
		'RETIRA', 
		'RETIRA_DETALHE', 
		'TOMADOR', 
		'DATA_ENTRADA_CONTINGENCIA', 
		'JUSTIFICATIVA_CONTINGENCIA', 
		'CARAC_ADICIONAL_TRANSPORTE', 
		'CARAC_ADICIONAL_SERVICO', 
		'FUNCIONARIO_EMISSOR', 
		'FLUXO_ORIGEM', 
		'ENTREGA_TIPO_PERIODO', 
		'ENTREGA_DATA_PROGRAMADA', 
		'ENTREGA_DATA_INICIAL', 
		'ENTREGA_DATA_FINAL', 
		'ENTREGA_TIPO_HORA', 
		'ENTREGA_HORA_PROGRAMADA', 
		'ENTREGA_HORA_INICIAL', 
		'ENTREGA_HORA_FINAL', 
		'MUNICIPIO_ORIGEM_CALCULO', 
		'MUNICIPIO_DESTINO_CALCULO', 
		'OBSERVACOES_GERAIS', 
		'VALOR_TOTAL_SERVICO', 
		'VALOR_RECEBER', 
		'CST', 
		'BASE_CALCULO_ICMS', 
		'ALIQUOTA_ICMS', 
		'VALOR_ICMS', 
		'PERCENTUAL_REDUCAO_BC_ICMS', 
		'VALOR_BC_ICMS_ST_RETIDO', 
		'VALOR_ICMS_ST_RETIDO', 
		'ALIQUOTA_ICMS_ST_RETIDO', 
		'VALOR_CREDITO_PRESUMIDO_ICMS', 
		'PERCENTUAL_BC_ICMS_OUTRA_UF', 
		'VALOR_BC_ICMS_OUTRA_UF', 
		'ALIQUOTA_ICMS_OUTRA_UF', 
		'VALOR_ICMS_OUTRA_UF', 
		'SIMPLES_NACIONAL_INDICADOR', 
		'SIMPLES_NACIONAL_TOTAL', 
		'INFORMACOES_ADD_FISCO', 
		'VALOR_TOTAL_CARGA', 
		'PRODUTO_PREDOMINANTE', 
		'CARGA_OUTRAS_CARACTERISTICAS', 
		'MODAL_VERSAO_LAYOUT', 
		'CHAVE_CTE_SUBSTITUIDO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Uf Emitente', 
		'Codigo Numerico', 
		'CFOP', 
		'Natureza da Operação', 
		'Forma Pagamento', 
		'Forma Pagamento', 
		'Série', 
		'Número', 
		'Data de Emissão', 
		'Formato Impressão DACTE', 
		'Tipo Emissão', 
		'Chave de Acesso', 
		'DV Chave Acesso', 
		'DV Chave Acesso', 
		'Tipo CT-e', 
		'Tipo CT-e', 
		'Tipo CT-e', 
		'Tipo CT-e', 
		'Tipo CT-e', 
		'Tipo CT-e', 
		'Tipo CT-e', 
		'Modal', 
		'Modal', 
		'Modal', 
		'Município Início Prestação', 
		'UF Início Prestação', 
		'UF Início Prestação', 
		'Município Fim Prestação', 
		'UF Fim Prestação', 
		'Retira', 
		'Retira', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Tomador do Serviço', 
		'Observação', 
		'Valor Total Serviços', 
		'Valor a Receber', 
		'Valor a Receber', 
		'Valor a Receber', 
		'Valor a Receber', 
		'Valor ICMS', 
		'Valor ICMS', 
		'Valor ICMS', 
		'Valor ICMS', 
		'Valor ICMS', 
		'Valor ICMS', 
		'Valor ICMS', 
		'Valor ICMS', 
		'Valor ICMS', 
		'Valor ICMS', 
		'Valor ICMS', 
		'Valor ICMS', 
		'Valor ICMS', 
		'Valor Total Carga', 
		'Produto Predominante', 
		'Outras Características Carga', 
		'Outras Características Carga', 
		'Outras Características Carga', 
	];

	CteCabecalho.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		ufEmitente = jsonDados['ufEmitente'];
		codigoNumerico = jsonDados['codigoNumerico'];
		cfop = jsonDados['cfop'];
		naturezaOperacao = jsonDados['naturezaOperacao'];
		formaPagamento = getFormaPagamento(jsonDados['formaPagamento']);
		modelo = getModelo(jsonDados['modelo']);
		serie = jsonDados['serie'];
		numero = jsonDados['numero'];
		dataHoraEmissao = jsonDados['dataHoraEmissao'] != null ? DateTime.tryParse(jsonDados['dataHoraEmissao']) : null;
		formatoImpressaoDacte = getFormatoImpressaoDacte(jsonDados['formatoImpressaoDacte']);
		tipoEmissao = getTipoEmissao(jsonDados['tipoEmissao']);
		chaveAcesso = jsonDados['chaveAcesso'];
		digitoChaveAcesso = jsonDados['digitoChaveAcesso'];
		ambiente = jsonDados['ambiente'];
		tipoCte = getTipoCte(jsonDados['tipoCte']);
		processoEmissao = getProcessoEmissao(jsonDados['processoEmissao']);
		versaoProcessoEmissao = getVersaoProcessoEmissao(jsonDados['versaoProcessoEmissao']);
		chaveReferenciado = getChaveReferenciado(jsonDados['chaveReferenciado']);
		codigoMunicipioEnvio = getCodigoMunicipioEnvio(jsonDados['codigoMunicipioEnvio']);
		nomeMunicipioEnvio = getNomeMunicipioEnvio(jsonDados['nomeMunicipioEnvio']);
		ufEnvio = getUfEnvio(jsonDados['ufEnvio']);
		modal = getModal(jsonDados['modal']);
		tipoServico = getTipoServico(jsonDados['tipoServico']);
		codigoMunicipioIniPrestacao = getCodigoMunicipioIniPrestacao(jsonDados['codigoMunicipioIniPrestacao']);
		nomeMunicipioIniPrestacao = jsonDados['nomeMunicipioIniPrestacao'];
		ufIniPrestacao = jsonDados['ufIniPrestacao'] == '' ? null : jsonDados['ufIniPrestacao'];
		codigoMunicipioFimPrestacao = jsonDados['codigoMunicipioFimPrestacao'] == '' ? null : jsonDados['codigoMunicipioFimPrestacao'];
		nomeMunicipioFimPrestacao = jsonDados['nomeMunicipioFimPrestacao'];
		ufFimPrestacao = jsonDados['ufFimPrestacao'] == '' ? null : jsonDados['ufFimPrestacao'];
		retira = getRetira(jsonDados['retira']);
		retiraDetalhe = getRetiraDetalhe(jsonDados['retiraDetalhe']);
		tomador = getTomador(jsonDados['tomador']);
		dataEntradaContingencia = getDataEntradaContingencia(jsonDados['dataEntradaContingencia']) != null ? DateTime.tryParse(jsonDados['dataEntradaContingencia']) : null;
		justificativaContingencia = getJustificativaContingencia(jsonDados['justificativaContingencia']);
		caracAdicionalTransporte = getCaracAdicionalTransporte(jsonDados['caracAdicionalTransporte']);
		caracAdicionalServico = getCaracAdicionalServico(jsonDados['caracAdicionalServico']);
		funcionarioEmissor = getFuncionarioEmissor(jsonDados['funcionarioEmissor']);
		fluxoOrigem = getFluxoOrigem(jsonDados['fluxoOrigem']);
		entregaTipoPeriodo = getEntregaTipoPeriodo(jsonDados['entregaTipoPeriodo']);
		entregaDataProgramada = getEntregaDataProgramada(jsonDados['entregaDataProgramada']) != null ? DateTime.tryParse(jsonDados['entregaDataProgramada']) : null;
		entregaDataInicial = getEntregaDataInicial(jsonDados['entregaDataInicial']) != null ? DateTime.tryParse(jsonDados['entregaDataInicial']) : null;
		entregaDataFinal = getEntregaDataFinal(jsonDados['entregaDataFinal']) != null ? DateTime.tryParse(jsonDados['entregaDataFinal']) : null;
		entregaTipoHora = getEntregaTipoHora(jsonDados['entregaTipoHora']);
		entregaHoraProgramada = getEntregaHoraProgramada(jsonDados['entregaHoraProgramada']);
		entregaHoraInicial = getEntregaHoraInicial(jsonDados['entregaHoraInicial']);
		entregaHoraFinal = getEntregaHoraFinal(jsonDados['entregaHoraFinal']);
		municipioOrigemCalculo = getMunicipioOrigemCalculo(jsonDados['municipioOrigemCalculo']);
		municipioDestinoCalculo = getMunicipioDestinoCalculo(jsonDados['municipioDestinoCalculo']);
		observacoesGerais = jsonDados['observacoesGerais'];
		valorTotalServico = jsonDados['valorTotalServico']?.toDouble();
		valorReceber = jsonDados['valorReceber']?.toDouble();
		cst = jsonDados['cst'];
		baseCalculoIcms = jsonDados['baseCalculoIcms']?.toDouble();
		aliquotaIcms = jsonDados['aliquotaIcms']?.toDouble();
		valorIcms = jsonDados['valorIcms']?.toDouble();
		percentualReducaoBcIcms = jsonDados['percentualReducaoBcIcms']?.toDouble();
		valorBcIcmsStRetido = jsonDados['valorBcIcmsStRetido']?.toDouble();
		valorIcmsStRetido = jsonDados['valorIcmsStRetido']?.toDouble();
		aliquotaIcmsStRetido = jsonDados['aliquotaIcmsStRetido']?.toDouble();
		valorCreditoPresumidoIcms = jsonDados['valorCreditoPresumidoIcms']?.toDouble();
		percentualBcIcmsOutraUf = jsonDados['percentualBcIcmsOutraUf']?.toDouble();
		valorBcIcmsOutraUf = jsonDados['valorBcIcmsOutraUf']?.toDouble();
		aliquotaIcmsOutraUf = jsonDados['aliquotaIcmsOutraUf']?.toDouble();
		valorIcmsOutraUf = jsonDados['valorIcmsOutraUf']?.toDouble();
		simplesNacionalIndicador = jsonDados['simplesNacionalIndicador'];
		simplesNacionalTotal = jsonDados['simplesNacionalTotal']?.toDouble();
		informacoesAddFisco = jsonDados['informacoesAddFisco'];
		valorTotalCarga = jsonDados['valorTotalCarga']?.toDouble();
		produtoPredominante = jsonDados['produtoPredominante'];
		cargaOutrasCaracteristicas = jsonDados['cargaOutrasCaracteristicas'];
		modalVersaoLayout = jsonDados['modalVersaoLayout'];
		chaveCteSubstituido = jsonDados['chaveCteSubstituido'];
		cteDestinatario = jsonDados['cteDestinatario'] == null ? null : CteDestinatario.fromJson(jsonDados['cteDestinatario']);
		cteLocalEntrega = jsonDados['cteLocalEntrega'] == null ? null : CteLocalEntrega.fromJson(jsonDados['cteLocalEntrega']);
		cteRemetente = jsonDados['cteRemetente'] == null ? null : CteRemetente.fromJson(jsonDados['cteRemetente']);
		cteRodoviario = jsonDados['cteRodoviario'] == null ? null : CteRodoviario.fromJson(jsonDados['cteRodoviario']);
		cteTomador = jsonDados['cteTomador'] == null ? null : CteTomador.fromJson(jsonDados['cteTomador']);
		listaCteCarga = (jsonDados['listaCteCarga'] as Iterable?)?.map((m) => CteCarga.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['ufEmitente'] = ufEmitente ?? 0;
		jsonDados['codigoNumerico'] = codigoNumerico;
		jsonDados['cfop'] = cfop ?? 0;
		jsonDados['naturezaOperacao'] = naturezaOperacao;
		jsonDados['formaPagamento'] = setFormaPagamento(formaPagamento);
		jsonDados['modelo'] = setModelo(modelo);
		jsonDados['serie'] = serie;
		jsonDados['numero'] = numero;
		jsonDados['dataHoraEmissao'] = dataHoraEmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataHoraEmissao!) : null;
		jsonDados['formatoImpressaoDacte'] = setFormatoImpressaoDacte(formatoImpressaoDacte);
		jsonDados['tipoEmissao'] = setTipoEmissao(tipoEmissao);
		jsonDados['chaveAcesso'] = chaveAcesso;
		jsonDados['digitoChaveAcesso'] = digitoChaveAcesso;
		jsonDados['ambiente'] = ambiente;
		jsonDados['tipoCte'] = setTipoCte(tipoCte);
		jsonDados['processoEmissao'] = setProcessoEmissao(processoEmissao);
		jsonDados['versaoProcessoEmissao'] = setVersaoProcessoEmissao(versaoProcessoEmissao);
		jsonDados['chaveReferenciado'] = setChaveReferenciado(chaveReferenciado);
		jsonDados['codigoMunicipioEnvio'] = setCodigoMunicipioEnvio(codigoMunicipioEnvio?.toString()) ?? 0;
		jsonDados['nomeMunicipioEnvio'] = setNomeMunicipioEnvio(nomeMunicipioEnvio);
		jsonDados['ufEnvio'] = setUfEnvio(ufEnvio);
		jsonDados['modal'] = setModal(modal);
		jsonDados['tipoServico'] = setTipoServico(tipoServico);
		jsonDados['codigoMunicipioIniPrestacao'] = setCodigoMunicipioIniPrestacao(codigoMunicipioIniPrestacao?.toString()) ?? 0;
		jsonDados['nomeMunicipioIniPrestacao'] = nomeMunicipioIniPrestacao;
		jsonDados['ufIniPrestacao'] = ufIniPrestacao;
		jsonDados['codigoMunicipioFimPrestacao'] = codigoMunicipioFimPrestacao ?? 0;
		jsonDados['nomeMunicipioFimPrestacao'] = nomeMunicipioFimPrestacao;
		jsonDados['ufFimPrestacao'] = ufFimPrestacao;
		jsonDados['retira'] = setRetira(retira);
		jsonDados['retiraDetalhe'] = setRetiraDetalhe(retiraDetalhe);
		jsonDados['tomador'] = setTomador(tomador);
		jsonDados['dataEntradaContingencia'] = setDataEntradaContingencia(dataEntradaContingencia?.toString()) != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEntradaContingencia!) : null;
		jsonDados['justificativaContingencia'] = setJustificativaContingencia(justificativaContingencia);
		jsonDados['caracAdicionalTransporte'] = setCaracAdicionalTransporte(caracAdicionalTransporte);
		jsonDados['caracAdicionalServico'] = setCaracAdicionalServico(caracAdicionalServico);
		jsonDados['funcionarioEmissor'] = setFuncionarioEmissor(funcionarioEmissor);
		jsonDados['fluxoOrigem'] = setFluxoOrigem(fluxoOrigem);
		jsonDados['entregaTipoPeriodo'] = setEntregaTipoPeriodo(entregaTipoPeriodo);
		jsonDados['entregaDataProgramada'] = setEntregaDataProgramada(entregaDataProgramada?.toString()) != null ? DateFormat('yyyy-MM-ddT00:00:00').format(entregaDataProgramada!) : null;
		jsonDados['entregaDataInicial'] = setEntregaDataInicial(entregaDataInicial?.toString()) != null ? DateFormat('yyyy-MM-ddT00:00:00').format(entregaDataInicial!) : null;
		jsonDados['entregaDataFinal'] = setEntregaDataFinal(entregaDataFinal?.toString()) != null ? DateFormat('yyyy-MM-ddT00:00:00').format(entregaDataFinal!) : null;
		jsonDados['entregaTipoHora'] = setEntregaTipoHora(entregaTipoHora);
		jsonDados['entregaHoraProgramada'] = setEntregaHoraProgramada(entregaHoraProgramada);
		jsonDados['entregaHoraInicial'] = setEntregaHoraInicial(entregaHoraInicial);
		jsonDados['entregaHoraFinal'] = setEntregaHoraFinal(entregaHoraFinal);
		jsonDados['municipioOrigemCalculo'] = setMunicipioOrigemCalculo(municipioOrigemCalculo);
		jsonDados['municipioDestinoCalculo'] = setMunicipioDestinoCalculo(municipioDestinoCalculo);
		jsonDados['observacoesGerais'] = observacoesGerais;
		jsonDados['valorTotalServico'] = valorTotalServico;
		jsonDados['valorReceber'] = valorReceber;
		jsonDados['cst'] = Biblioteca.removerMascara(cst);
		jsonDados['baseCalculoIcms'] = baseCalculoIcms;
		jsonDados['aliquotaIcms'] = aliquotaIcms;
		jsonDados['valorIcms'] = valorIcms;
		jsonDados['percentualReducaoBcIcms'] = percentualReducaoBcIcms;
		jsonDados['valorBcIcmsStRetido'] = valorBcIcmsStRetido;
		jsonDados['valorIcmsStRetido'] = valorIcmsStRetido;
		jsonDados['aliquotaIcmsStRetido'] = aliquotaIcmsStRetido;
		jsonDados['valorCreditoPresumidoIcms'] = valorCreditoPresumidoIcms;
		jsonDados['percentualBcIcmsOutraUf'] = percentualBcIcmsOutraUf;
		jsonDados['valorBcIcmsOutraUf'] = valorBcIcmsOutraUf;
		jsonDados['aliquotaIcmsOutraUf'] = aliquotaIcmsOutraUf;
		jsonDados['valorIcmsOutraUf'] = valorIcmsOutraUf;
		jsonDados['simplesNacionalIndicador'] = Biblioteca.removerMascara(simplesNacionalIndicador);
		jsonDados['simplesNacionalTotal'] = simplesNacionalTotal;
		jsonDados['informacoesAddFisco'] = Biblioteca.removerMascara(informacoesAddFisco);
		jsonDados['valorTotalCarga'] = valorTotalCarga;
		jsonDados['produtoPredominante'] = produtoPredominante;
		jsonDados['cargaOutrasCaracteristicas'] = cargaOutrasCaracteristicas;
		jsonDados['modalVersaoLayout'] = modalVersaoLayout ?? 0;
		jsonDados['chaveCteSubstituido'] = chaveCteSubstituido;
		jsonDados['cteDestinatario'] = cteDestinatario == null ? null : cteDestinatario!.toJson;
		jsonDados['cteLocalEntrega'] = cteLocalEntrega == null ? null : cteLocalEntrega!.toJson;
		jsonDados['cteRemetente'] = cteRemetente == null ? null : cteRemetente!.toJson;
		jsonDados['cteRodoviario'] = cteRodoviario == null ? null : cteRodoviario!.toJson;
		jsonDados['cteTomador'] = cteTomador == null ? null : cteTomador!.toJson;
		

		var listaCteCargaLocal = [];
		for (CteCarga objeto in listaCteCarga ?? []) {
			listaCteCargaLocal.add(objeto.toJson);
		}
		jsonDados['listaCteCarga'] = listaCteCargaLocal;
	
		return jsonDados;
	}
	
    getFormaPagamento(String? formaPagamento) {
    	switch (formaPagamento) {
    		case '0':
    			return '0 - Pago';
    		case '1':
    			return '1 - A pagar';
    		case ' ':
    			return ' 2 - Outros';
    		default:
    			return null;
    		}
    	}

    setFormaPagamento(String? formaPagamento) {
    	switch (formaPagamento) {
    		case '0 - Pago':
    			return '0';
    		case '1 - A pagar':
    			return '1';
    		case ' 2 - Outros':
    			return ' ';
    		default:
    			return null;
    		}
    	}

    getModelo(String? modelo) {
    	switch (modelo) {
    		case '0':
    			return '0 - Pago';
    		case '1':
    			return '1 - A pagar';
    		case ' ':
    			return ' 2 - Outros';
    		default:
    			return null;
    		}
    	}

    setModelo(String? modelo) {
    	switch (modelo) {
    		case '0 - Pago':
    			return '0';
    		case '1 - A pagar':
    			return '1';
    		case ' 2 - Outros':
    			return ' ';
    		default:
    			return null;
    		}
    	}

    getFormatoImpressaoDacte(String? formatoImpressaoDacte) {
    	switch (formatoImpressaoDacte) {
    		case '1':
    			return '1 - Retrato';
    		case '2':
    			return '2 -  Paisagem';
    		default:
    			return null;
    		}
    	}

    setFormatoImpressaoDacte(String? formatoImpressaoDacte) {
    	switch (formatoImpressaoDacte) {
    		case '1 - Retrato':
    			return '1';
    		case '2 -  Paisagem':
    			return '2';
    		default:
    			return null;
    		}
    	}

    getTipoEmissao(String? tipoEmissao) {
    	switch (tipoEmissao) {
    		case '1':
    			return '1 - Normal';
    		case '4':
    			return '4-EPEC pela SVC';
    		case '5':
    			return '5 - Contingência FSDA';
    		case '7':
    			return '7 - Autorização pela SVC-RS';
    		case '8':
    			return '8 - Autorização pela SVC-SP';
    		default:
    			return null;
    		}
    	}

    setTipoEmissao(String? tipoEmissao) {
    	switch (tipoEmissao) {
    		case '1 - Normal':
    			return '1';
    		case '4-EPEC pela SVC':
    			return '4';
    		case '5 - Contingência FSDA':
    			return '5';
    		case '7 - Autorização pela SVC-RS':
    			return '7';
    		case '8 - Autorização pela SVC-SP':
    			return '8';
    		default:
    			return null;
    		}
    	}

    getTipoCte(String? tipoCte) {
    	switch (tipoCte) {
    		case '0':
    			return '0 - CT-e Normal';
    		case '1':
    			return '1 - CT-e de Complemento de Valores';
    		case '2':
    			return '2 -  CT-e de Anulação';
    		case '3':
    			return '3 - CT-e Substituto';
    		default:
    			return null;
    		}
    	}

    setTipoCte(String? tipoCte) {
    	switch (tipoCte) {
    		case '0 - CT-e Normal':
    			return '0';
    		case '1 - CT-e de Complemento de Valores':
    			return '1';
    		case '2 -  CT-e de Anulação':
    			return '2';
    		case '3 - CT-e Substituto':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getProcessoEmissao(String? processoEmissao) {
    	switch (processoEmissao) {
    		case '0':
    			return '0 - CT-e Normal';
    		case '1':
    			return '1 - CT-e de Complemento de Valores';
    		case '2':
    			return '2 -  CT-e de Anulação';
    		case '3':
    			return '3 - CT-e Substituto';
    		default:
    			return null;
    		}
    	}

    setProcessoEmissao(String? processoEmissao) {
    	switch (processoEmissao) {
    		case '0 - CT-e Normal':
    			return '0';
    		case '1 - CT-e de Complemento de Valores':
    			return '1';
    		case '2 -  CT-e de Anulação':
    			return '2';
    		case '3 - CT-e Substituto':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getVersaoProcessoEmissao(String? versaoProcessoEmissao) {
    	switch (versaoProcessoEmissao) {
    		case '0':
    			return '0 - CT-e Normal';
    		case '1':
    			return '1 - CT-e de Complemento de Valores';
    		case '2':
    			return '2 -  CT-e de Anulação';
    		case '3':
    			return '3 - CT-e Substituto';
    		default:
    			return null;
    		}
    	}

    setVersaoProcessoEmissao(String? versaoProcessoEmissao) {
    	switch (versaoProcessoEmissao) {
    		case '0 - CT-e Normal':
    			return '0';
    		case '1 - CT-e de Complemento de Valores':
    			return '1';
    		case '2 -  CT-e de Anulação':
    			return '2';
    		case '3 - CT-e Substituto':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getChaveReferenciado(String? chaveReferenciado) {
    	switch (chaveReferenciado) {
    		case '0':
    			return '0 - CT-e Normal';
    		case '1':
    			return '1 - CT-e de Complemento de Valores';
    		case '2':
    			return '2 -  CT-e de Anulação';
    		case '3':
    			return '3 - CT-e Substituto';
    		default:
    			return null;
    		}
    	}

    setChaveReferenciado(String? chaveReferenciado) {
    	switch (chaveReferenciado) {
    		case '0 - CT-e Normal':
    			return '0';
    		case '1 - CT-e de Complemento de Valores':
    			return '1';
    		case '2 -  CT-e de Anulação':
    			return '2';
    		case '3 - CT-e Substituto':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getCodigoMunicipioEnvio(String? codigoMunicipioEnvio) {
    	switch (codigoMunicipioEnvio) {
    		case '0':
    			return '0 - CT-e Normal';
    		case '1':
    			return '1 - CT-e de Complemento de Valores';
    		case '2':
    			return '2 -  CT-e de Anulação';
    		case '3':
    			return '3 - CT-e Substituto';
    		default:
    			return null;
    		}
    	}

    setCodigoMunicipioEnvio(String? codigoMunicipioEnvio) {
    	switch (codigoMunicipioEnvio) {
    		case '0 - CT-e Normal':
    			return '0';
    		case '1 - CT-e de Complemento de Valores':
    			return '1';
    		case '2 -  CT-e de Anulação':
    			return '2';
    		case '3 - CT-e Substituto':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getNomeMunicipioEnvio(String? nomeMunicipioEnvio) {
    	switch (nomeMunicipioEnvio) {
    		case '0':
    			return '0 - CT-e Normal';
    		case '1':
    			return '1 - CT-e de Complemento de Valores';
    		case '2':
    			return '2 -  CT-e de Anulação';
    		case '3':
    			return '3 - CT-e Substituto';
    		default:
    			return null;
    		}
    	}

    setNomeMunicipioEnvio(String? nomeMunicipioEnvio) {
    	switch (nomeMunicipioEnvio) {
    		case '0 - CT-e Normal':
    			return '0';
    		case '1 - CT-e de Complemento de Valores':
    			return '1';
    		case '2 -  CT-e de Anulação':
    			return '2';
    		case '3 - CT-e Substituto':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getUfEnvio(String? ufEnvio) {
    	switch (ufEnvio) {
    		case '0':
    			return '0 - CT-e Normal';
    		case '1':
    			return '1 - CT-e de Complemento de Valores';
    		case '2':
    			return '2 -  CT-e de Anulação';
    		case '3':
    			return '3 - CT-e Substituto';
    		default:
    			return null;
    		}
    	}

    setUfEnvio(String? ufEnvio) {
    	switch (ufEnvio) {
    		case '0 - CT-e Normal':
    			return '0';
    		case '1 - CT-e de Complemento de Valores':
    			return '1';
    		case '2 -  CT-e de Anulação':
    			return '2';
    		case '3 - CT-e Substituto':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getModal(String? modal) {
    	switch (modal) {
    		case '0':
    			return '01-Rodoviário';
    		case '1':
    			return '02-Aéreo';
    		case '2':
    			return '03-Aquaviário';
    		case '3':
    			return '04-Ferroviário';
    		case '4':
    			return '05-Dutoviário';
    		case '5':
    			return '06-Multimodal';
    		default:
    			return null;
    		}
    	}

    setModal(String? modal) {
    	switch (modal) {
    		case '01-Rodoviário':
    			return '0';
    		case '02-Aéreo':
    			return '0';
    		case '03-Aquaviário':
    			return '0';
    		case '04-Ferroviário':
    			return '0';
    		case '05-Dutoviário':
    			return '0';
    		case '06-Multimodal':
    			return '0';
    		default:
    			return null;
    		}
    	}

    getTipoServico(String? tipoServico) {
    	switch (tipoServico) {
    		case '0':
    			return '01-Rodoviário';
    		case '1':
    			return '02-Aéreo';
    		case '2':
    			return '03-Aquaviário';
    		case '3':
    			return '04-Ferroviário';
    		case '4':
    			return '05-Dutoviário';
    		case '5':
    			return '06-Multimodal';
    		default:
    			return null;
    		}
    	}

    setTipoServico(String? tipoServico) {
    	switch (tipoServico) {
    		case '01-Rodoviário':
    			return '0';
    		case '02-Aéreo':
    			return '0';
    		case '03-Aquaviário':
    			return '0';
    		case '04-Ferroviário':
    			return '0';
    		case '05-Dutoviário':
    			return '0';
    		case '06-Multimodal':
    			return '0';
    		default:
    			return null;
    		}
    	}

    getCodigoMunicipioIniPrestacao(String? codigoMunicipioIniPrestacao) {
    	switch (codigoMunicipioIniPrestacao) {
    		case '0':
    			return '01-Rodoviário';
    		case '1':
    			return '02-Aéreo';
    		case '2':
    			return '03-Aquaviário';
    		case '3':
    			return '04-Ferroviário';
    		case '4':
    			return '05-Dutoviário';
    		case '5':
    			return '06-Multimodal';
    		default:
    			return null;
    		}
    	}

    setCodigoMunicipioIniPrestacao(String? codigoMunicipioIniPrestacao) {
    	switch (codigoMunicipioIniPrestacao) {
    		case '01-Rodoviário':
    			return '0';
    		case '02-Aéreo':
    			return '0';
    		case '03-Aquaviário':
    			return '0';
    		case '04-Ferroviário':
    			return '0';
    		case '05-Dutoviário':
    			return '0';
    		case '06-Multimodal':
    			return '0';
    		default:
    			return null;
    		}
    	}

    getRetira(String? retira) {
    	switch (retira) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setRetira(String? retira) {
    	switch (retira) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getRetiraDetalhe(String? retiraDetalhe) {
    	switch (retiraDetalhe) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setRetiraDetalhe(String? retiraDetalhe) {
    	switch (retiraDetalhe) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getTomador(String? tomador) {
    	switch (tomador) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setTomador(String? tomador) {
    	switch (tomador) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getDataEntradaContingencia(String? dataEntradaContingencia) {
    	switch (dataEntradaContingencia) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setDataEntradaContingencia(String? dataEntradaContingencia) {
    	switch (dataEntradaContingencia) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getJustificativaContingencia(String? justificativaContingencia) {
    	switch (justificativaContingencia) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setJustificativaContingencia(String? justificativaContingencia) {
    	switch (justificativaContingencia) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getCaracAdicionalTransporte(String? caracAdicionalTransporte) {
    	switch (caracAdicionalTransporte) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setCaracAdicionalTransporte(String? caracAdicionalTransporte) {
    	switch (caracAdicionalTransporte) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getCaracAdicionalServico(String? caracAdicionalServico) {
    	switch (caracAdicionalServico) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setCaracAdicionalServico(String? caracAdicionalServico) {
    	switch (caracAdicionalServico) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getFuncionarioEmissor(String? funcionarioEmissor) {
    	switch (funcionarioEmissor) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setFuncionarioEmissor(String? funcionarioEmissor) {
    	switch (funcionarioEmissor) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getFluxoOrigem(String? fluxoOrigem) {
    	switch (fluxoOrigem) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setFluxoOrigem(String? fluxoOrigem) {
    	switch (fluxoOrigem) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getEntregaTipoPeriodo(String? entregaTipoPeriodo) {
    	switch (entregaTipoPeriodo) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setEntregaTipoPeriodo(String? entregaTipoPeriodo) {
    	switch (entregaTipoPeriodo) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getEntregaDataProgramada(String? entregaDataProgramada) {
    	switch (entregaDataProgramada) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setEntregaDataProgramada(String? entregaDataProgramada) {
    	switch (entregaDataProgramada) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getEntregaDataInicial(String? entregaDataInicial) {
    	switch (entregaDataInicial) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setEntregaDataInicial(String? entregaDataInicial) {
    	switch (entregaDataInicial) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getEntregaDataFinal(String? entregaDataFinal) {
    	switch (entregaDataFinal) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setEntregaDataFinal(String? entregaDataFinal) {
    	switch (entregaDataFinal) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getEntregaTipoHora(String? entregaTipoHora) {
    	switch (entregaTipoHora) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setEntregaTipoHora(String? entregaTipoHora) {
    	switch (entregaTipoHora) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getEntregaHoraProgramada(String? entregaHoraProgramada) {
    	switch (entregaHoraProgramada) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setEntregaHoraProgramada(String? entregaHoraProgramada) {
    	switch (entregaHoraProgramada) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getEntregaHoraInicial(String? entregaHoraInicial) {
    	switch (entregaHoraInicial) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setEntregaHoraInicial(String? entregaHoraInicial) {
    	switch (entregaHoraInicial) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getEntregaHoraFinal(String? entregaHoraFinal) {
    	switch (entregaHoraFinal) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setEntregaHoraFinal(String? entregaHoraFinal) {
    	switch (entregaHoraFinal) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getMunicipioOrigemCalculo(String? municipioOrigemCalculo) {
    	switch (municipioOrigemCalculo) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setMunicipioOrigemCalculo(String? municipioOrigemCalculo) {
    	switch (municipioOrigemCalculo) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getMunicipioDestinoCalculo(String? municipioDestinoCalculo) {
    	switch (municipioDestinoCalculo) {
    		case '0':
    			return '0-Remetente';
    		case '1':
    			return '1-Expedidor';
    		case '2':
    			return '2-Recebedor';
    		case '3':
    			return '3-Destinatário';
    		case '4':
    			return '4 - Outros';
    		default:
    			return null;
    		}
    	}

    setMunicipioDestinoCalculo(String? municipioDestinoCalculo) {
    	switch (municipioDestinoCalculo) {
    		case '0-Remetente':
    			return '0';
    		case '1-Expedidor':
    			return '1';
    		case '2-Recebedor':
    			return '2';
    		case '3-Destinatário':
    			return '3';
    		case '4 - Outros':
    			return '4';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(CteCabecalho objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}