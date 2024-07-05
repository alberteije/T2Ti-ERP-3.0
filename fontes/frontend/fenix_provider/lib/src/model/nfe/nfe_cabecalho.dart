/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_CABECALHO] 
                                                                                
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

import 'package:fenix/src/model/views_db/view_sped_nfe_detalhe.dart';
import 'package:intl/intl.dart';
import 'package:fenix/src/model/model.dart';

import 'nfe_acesso_xml.dart';
import 'nfe_cana.dart';
import 'nfe_cte_referenciado.dart';
import 'nfe_cupom_fiscal_referenciado.dart';
import 'nfe_fatura.dart';
import 'nfe_informacao_pagamento.dart';
import 'nfe_local_entrega.dart';
import 'nfe_local_retirada.dart';
import 'nfe_nf_referenciada.dart';
import 'nfe_processo_referenciado.dart';
import 'nfe_prod_rural_referenciada.dart';
import 'nfe_referenciada.dart';
import 'nfe_responsavel_tecnico.dart';
import 'nfe_transporte.dart';

class NfeCabecalho {
	int? id;
	int? idVendedor;
	int? idFornecedor;
	int? idCliente;
	int? idTributOperacaoFiscal;
	int? idVendaCabecalho;
	int? idNfceMovimento;
	int? ufEmitente;
	String? codigoNumerico;
	String? naturezaOperacao;
	String? codigoModelo;
	String? serie;
	String? numero;
	DateTime? dataHoraEmissao;
	DateTime? dataHoraEntradaSaida;
	String? tipoOperacao;
	String? localDestino;
	int? codigoMunicipio;
	String? formatoImpressaoDanfe;
	String? tipoEmissao;
	String? chaveAcesso;
	String? digitoChaveAcesso;
	String? ambiente;
	String? finalidadeEmissao;
	String? consumidorOperacao;
	String? consumidorPresenca;
	String? processoEmissao;
	String? versaoProcessoEmissao;
	DateTime? dataEntradaContingencia;
	String? justificativaContingencia;
	double? baseCalculoIcms;
	double? valorIcms;
	double? valorIcmsDesonerado;
	double? totalIcmsFcpUfDestino;
	double? totalIcmsInterestadualUfDestino;
	double? totalIcmsInterestadualUfRemetente;
	double? valorTotalFcp;
	double? baseCalculoIcmsSt;
	double? valorIcmsSt;
	double? valorTotalFcpSt;
	double? valorTotalFcpStRetido;
	double? valorTotalProdutos;
	double? valorFrete;
	double? valorSeguro;
	double? valorDesconto;
	double? valorImpostoImportacao;
	double? valorIpi;
	double? valorIpiDevolvido;
	double? valorPis;
	double? valorCofins;
	double? valorDespesasAcessorias;
	double? valorTotal;
	double? valorTotalTributos;
	double? valorServicos;
	double? baseCalculoIssqn;
	double? valorIssqn;
	double? valorPisIssqn;
	double? valorCofinsIssqn;
	DateTime? dataPrestacaoServico;
	double? valorDeducaoIssqn;
	double? outrasRetencoesIssqn;
	double? descontoIncondicionadoIssqn;
	double? descontoCondicionadoIssqn;
	double? totalRetencaoIssqn;
	String? regimeEspecialTributacao;
	double? valorRetidoPis;
	double? valorRetidoCofins;
	double? valorRetidoCsll;
	double? baseCalculoIrrf;
	double? valorRetidoIrrf;
	double? baseCalculoPrevidencia;
	double? valorRetidoPrevidencia;
	String? informacoesAddFisco;
	String? informacoesAddContribuinte;
	String? comexUfEmbarque;
	String? comexLocalEmbarque;
	String? comexLocalDespacho;
	String? compraNotaEmpenho;
	String? compraPedido;
	String? compraContrato;
	String? qrcode;
	String? urlChave;
	String? statusNota;
	NfeCana? nfeCana;
	NfeDestinatario? nfeDestinatario;
	NfeEmitente? nfeEmitente;
	NfeFatura? nfeFatura;
	NfeInformacaoPagamento? nfeInformacaoPagamento;
	NfeLocalEntrega? nfeLocalEntrega;
	NfeLocalRetirada? nfeLocalRetirada;
	NfeResponsavelTecnico? nfeResponsavelTecnico;
	NfeTransporte? nfeTransporte;
	Vendedor? vendedor;
	Fornecedor? fornecedor;
	Cliente? cliente;
	TributOperacaoFiscal? tributOperacaoFiscal;
	VendaCabecalho? vendaCabecalho;
	List<NfeAcessoXml>? listaNfeAcessoXml = [];
	List<NfeCteReferenciado>? listaNfeCteReferenciado = [];
	List<NfeCupomFiscalReferenciado>? listaNfeCupomFiscalReferenciado = [];
	List<NfeDetalhe>? listaNfeDetalhe = [];
	List<NfeNfReferenciada>? listaNfeNfReferenciada = [];
	List<NfeProcessoReferenciado>? listaNfeProcessoReferenciado = [];
	List<NfeProdRuralReferenciada>? listaNfeProdRuralReferenciada = [];
	List<NfeReferenciada>? listaNfeReferenciada = [];
	List<ViewSpedNfeDetalhe>? listaViewSpedNfeDetalhe = [];

	NfeCabecalho({
		id,
		idVendedor,
		idFornecedor,
		idCliente,
		idTributOperacaoFiscal,
		idVendaCabecalho,
		idNfceMovimento,
		ufEmitente,
		codigoNumerico,
		naturezaOperacao,
		codigoModelo,
		serie,
		numero,
		dataHoraEmissao,
		dataHoraEntradaSaida,
		tipoOperacao = '1=Saída',
		localDestino = '1=Operação interna',
		codigoMunicipio,
		formatoImpressaoDanfe = '1=DANFE normal, Retrato',
		tipoEmissao = '1=Emissão normal',
		chaveAcesso,
		digitoChaveAcesso,
		ambiente = '1=Produção',
		finalidadeEmissao = '1=NF-e normal',
		consumidorOperacao = '0=Normal',
		consumidorPresenca = '1=Operação presencial',
		processoEmissao = '0=Emissão de NF-e com aplicativo do contribuinte',
		versaoProcessoEmissao,
		dataEntradaContingencia,
		justificativaContingencia,
		baseCalculoIcms = 0.0,
		valorIcms = 0.0,
		valorIcmsDesonerado = 0.0,
		totalIcmsFcpUfDestino = 0.0,
		totalIcmsInterestadualUfDestino = 0.0,
		totalIcmsInterestadualUfRemetente = 0.0,
		valorTotalFcp = 0.0,
		baseCalculoIcmsSt = 0.0,
		valorIcmsSt = 0.0,
		valorTotalFcpSt = 0.0,
		valorTotalFcpStRetido = 0.0,
		valorTotalProdutos = 0.0,
		valorFrete = 0.0,
		valorSeguro = 0.0,
		valorDesconto = 0.0,
		valorImpostoImportacao = 0.0,
		valorIpi = 0.0,
		valorIpiDevolvido = 0.0,
		valorPis = 0.0,
		valorCofins = 0.0,
		valorDespesasAcessorias = 0.0,
		valorTotal = 0.0,
		valorTotalTributos = 0.0,
		valorServicos = 0.0,
		baseCalculoIssqn = 0.0,
		valorIssqn = 0.0,
		valorPisIssqn = 0.0,
		valorCofinsIssqn = 0.0,
		dataPrestacaoServico,
		valorDeducaoIssqn = 0.0,
		outrasRetencoesIssqn = 0.0,
		descontoIncondicionadoIssqn = 0.0,
		descontoCondicionadoIssqn = 0.0,
		totalRetencaoIssqn = 0.0,
		regimeEspecialTributacao,
		valorRetidoPis = 0.0,
		valorRetidoCofins = 0.0,
		valorRetidoCsll = 0.0,
		baseCalculoIrrf = 0.0,
		valorRetidoIrrf = 0.0,
		baseCalculoPrevidencia = 0.0,
		valorRetidoPrevidencia = 0.0,
		informacoesAddFisco,
		informacoesAddContribuinte,
		comexUfEmbarque,
		comexLocalEmbarque,
		comexLocalDespacho,
		compraNotaEmpenho,
		compraPedido,
		compraContrato,
		qrcode,
		urlChave,
		statusNota,
		nfeCana,
		nfeDestinatario,
		nfeEmitente,
		nfeFatura,
		nfeInformacaoPagamento,
		nfeLocalEntrega,
		nfeLocalRetirada,
		nfeResponsavelTecnico,
		nfeTransporte,
		vendedor,
		fornecedor,
		cliente,
		tributOperacaoFiscal,
		vendaCabecalho,
		listaNfeAcessoXml,
		listaNfeCteReferenciado,
		listaNfeCupomFiscalReferenciado,
		listaNfeDetalhe,
		listaNfeNfReferenciada,
		listaNfeProcessoReferenciado,
		listaNfeProdRuralReferenciada,
		listaNfeReferenciada,
		listaViewSpedNfeDetalhe,
	});

	static List<String> campos = <String>[
		'ID', 
		'UF_EMITENTE', 
		'CODIGO_NUMERICO', 
		'NATUREZA_OPERACAO', 
		'CODIGO_MODELO', 
		'SERIE', 
		'NUMERO', 
		'DATA_HORA_EMISSAO', 
		'DATA_HORA_ENTRADA_SAIDA', 
		'TIPO_OPERACAO', 
		'LOCAL_DESTINO', 
		'CODIGO_MUNICIPIO', 
		'FORMATO_IMPRESSAO_DANFE', 
		'TIPO_EMISSAO', 
		'CHAVE_ACESSO', 
		'DIGITO_CHAVE_ACESSO', 
		'AMBIENTE', 
		'FINALIDADE_EMISSAO', 
		'CONSUMIDOR_OPERACAO', 
		'CONSUMIDOR_PRESENCA', 
		'PROCESSO_EMISSAO', 
		'VERSAO_PROCESSO_EMISSAO', 
		'DATA_ENTRADA_CONTINGENCIA', 
		'JUSTIFICATIVA_CONTINGENCIA', 
		'BASE_CALCULO_ICMS', 
		'VALOR_ICMS', 
		'VALOR_ICMS_DESONERADO', 
		'TOTAL_ICMS_FCP_UF_DESTINO', 
		'TOTAL_ICMS_INTERESTADUAL_UF_DESTINO', 
		'TOTAL_ICMS_INTERESTADUAL_UF_REMETENTE', 
		'VALOR_TOTAL_FCP', 
		'BASE_CALCULO_ICMS_ST', 
		'VALOR_ICMS_ST', 
		'VALOR_TOTAL_FCP_ST', 
		'VALOR_TOTAL_FCP_ST_RETIDO', 
		'VALOR_TOTAL_PRODUTOS', 
		'VALOR_FRETE', 
		'VALOR_SEGURO', 
		'VALOR_DESCONTO', 
		'VALOR_IMPOSTO_IMPORTACAO', 
		'VALOR_IPI', 
		'VALOR_IPI_DEVOLVIDO', 
		'VALOR_PIS', 
		'VALOR_COFINS', 
		'VALOR_DESPESAS_ACESSORIAS', 
		'VALOR_TOTAL', 
		'VALOR_TOTAL_TRIBUTOS', 
		'VALOR_SERVICOS', 
		'BASE_CALCULO_ISSQN', 
		'VALOR_ISSQN', 
		'VALOR_PIS_ISSQN', 
		'VALOR_COFINS_ISSQN', 
		'DATA_PRESTACAO_SERVICO', 
		'VALOR_DEDUCAO_ISSQN', 
		'OUTRAS_RETENCOES_ISSQN', 
		'DESCONTO_INCONDICIONADO_ISSQN', 
		'DESCONTO_CONDICIONADO_ISSQN', 
		'TOTAL_RETENCAO_ISSQN', 
		'REGIME_ESPECIAL_TRIBUTACAO', 
		'VALOR_RETIDO_PIS', 
		'VALOR_RETIDO_COFINS', 
		'VALOR_RETIDO_CSLL', 
		'BASE_CALCULO_IRRF', 
		'VALOR_RETIDO_IRRF', 
		'BASE_CALCULO_PREVIDENCIA', 
		'VALOR_RETIDO_PREVIDENCIA', 
		'INFORMACOES_ADD_FISCO', 
		'INFORMACOES_ADD_CONTRIBUINTE', 
		'COMEX_UF_EMBARQUE', 
		'COMEX_LOCAL_EMBARQUE', 
		'COMEX_LOCAL_DESPACHO', 
		'COMPRA_NOTA_EMPENHO', 
		'COMPRA_PEDIDO', 
		'COMPRA_CONTRATO', 
		'QRCODE', 
		'URL_CHAVE', 
		'STATUS_NOTA', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Código UF', 
		'Código Numérico', 
		'Natureza da Operação', 
		'Código Modelo', 
		'Série', 
		'Número', 
		'Data/Hora Emissão', 
		'Data/Hora Entrada/Saída', 
		'Tipo Operação', 
		'Local Destino', 
		'Município IBGE', 
		'Formato de Impressão do DANFE', 
		'Tipo de Emissão', 
		'Chave de Acesso', 
		'Dígito Chave de Acesso', 
		'Ambiente', 
		'Finalidade Emissão', 
		'Consumidor Final', 
		'Indicador de Presença do Consumidor', 
		'Processo de Emissão', 
		'Versão Processo Emissão', 
		'Data Contingência', 
		'Justificativa Contingência', 
		'Base Cálculo ICMS', 
		'Valor do ICMS', 
		'Valor do ICMS Desonerado', 
		'Total ICMS FCP UF Destino', 
		'Total ICMS Interestadual UF Destino', 
		'Total ICMS Interestadual UF Remetente', 
		'Total FCP', 
		'Base Cálculo ICMS ST', 
		'Valor do ICMS ST', 
		'Valor Total FCP ST', 
		'Valor Total FCP ST Retido', 
		'Valor Total Produtos', 
		'Valor Frete', 
		'Valor Seguro', 
		'Valor Desconto', 
		'Valor Imposto Importação', 
		'Valor IPI', 
		'Valor IPI Devolvido', 
		'Valor PIS', 
		'Valor COFINS', 
		'Valor Despesas Acessórias', 
		'Valor Total NF', 
		'Valor Total Tributos', 
		'Valor Total Serviços', 
		'Base Cálculo ISSQN', 
		'Valor ISSQN', 
		'Valor PIS ISSQN', 
		'Valor COFINS ISSQN', 
		'Data Prestação do Serviço', 
		'Valor Dedução ISSQN', 
		'Outras Retenções ISSQN', 
		'Valor Desconto Incondicionado ISSQN', 
		'Valor Desconto Condicionado ISSQN', 
		'Total Retenção ISSQN', 
		'Código do Regime Especial de Tributação', 
		'Valor Retido PIS', 
		'Valor Retido COFINS', 
		'Valor Retido CSLL', 
		'Valor Base Cálculo IRRF', 
		'Valor Retido IRRF', 
		'Valor Base Cálculo Retenção Previdência', 
		'Valor Retido Previdência', 
		'Informações Adicionais Fisco', 
		'Informações Adicionais Contribuinte', 
		'UF de Embarque', 
		'Local de Embarque', 
		'Local de Despacho', 
		'Nota de Empenho', 
		'Pedido Compra', 
		'Contrato Compra', 
		'QRCode', 
		'URL Chave', 
		'Status Nota', 
	];

	NfeCabecalho.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idVendedor = jsonDados['idVendedor'];
		idFornecedor = jsonDados['idFornecedor'];
		idCliente = jsonDados['idCliente'];
		idTributOperacaoFiscal = jsonDados['idTributOperacaoFiscal'];
		idVendaCabecalho = jsonDados['idVendaCabecalho'];
		idNfceMovimento = jsonDados['idNfceMovimento'];
		ufEmitente = jsonDados['ufEmitente'];
		codigoNumerico = jsonDados['codigoNumerico'];
		naturezaOperacao = jsonDados['naturezaOperacao'];
		codigoModelo = jsonDados['codigoModelo'];
		serie = jsonDados['serie'];
		numero = jsonDados['numero'];
		dataHoraEmissao = jsonDados['dataHoraEmissao'] != null ? DateTime.tryParse(jsonDados['dataHoraEmissao']) : null;
		dataHoraEntradaSaida = jsonDados['dataHoraEntradaSaida'] != null ? DateTime.tryParse(jsonDados['dataHoraEntradaSaida']) : null;
		tipoOperacao = getTipoOperacao(jsonDados['tipoOperacao']);
		localDestino = getLocalDestino(jsonDados['localDestino']);
		codigoMunicipio = jsonDados['codigoMunicipio'];
		formatoImpressaoDanfe = getFormatoImpressaoDanfe(jsonDados['formatoImpressaoDanfe']);
		tipoEmissao = getTipoEmissao(jsonDados['tipoEmissao']);
		chaveAcesso = jsonDados['chaveAcesso'];
		digitoChaveAcesso = jsonDados['digitoChaveAcesso'];
		ambiente = getAmbiente(jsonDados['ambiente']);
		finalidadeEmissao = getFinalidadeEmissao(jsonDados['finalidadeEmissao']);
		consumidorOperacao = getConsumidorOperacao(jsonDados['consumidorOperacao']);
		consumidorPresenca = getConsumidorPresenca(jsonDados['consumidorPresenca']);
		processoEmissao = getProcessoEmissao(jsonDados['processoEmissao']);
		versaoProcessoEmissao = jsonDados['versaoProcessoEmissao'];
		dataEntradaContingencia = jsonDados['dataEntradaContingencia'] != null ? DateTime.tryParse(jsonDados['dataEntradaContingencia']) : null;
		justificativaContingencia = jsonDados['justificativaContingencia'];
		baseCalculoIcms = jsonDados['baseCalculoIcms']?.toDouble();
		valorIcms = jsonDados['valorIcms']?.toDouble();
		valorIcmsDesonerado = jsonDados['valorIcmsDesonerado']?.toDouble();
		totalIcmsFcpUfDestino = jsonDados['totalIcmsFcpUfDestino']?.toDouble();
		totalIcmsInterestadualUfDestino = jsonDados['totalIcmsInterestadualUfDestino']?.toDouble();
		// totalIcmsInterestadualUfRemetente = jsonDados['totalIcmsInterestadualUfRemetente']?.toDouble();
		valorTotalFcp = jsonDados['valorTotalFcp']?.toDouble();
		baseCalculoIcmsSt = jsonDados['baseCalculoIcmsSt']?.toDouble();
		valorIcmsSt = jsonDados['valorIcmsSt']?.toDouble();
		valorTotalFcpSt = jsonDados['valorTotalFcpSt']?.toDouble();
		valorTotalFcpStRetido = jsonDados['valorTotalFcpStRetido']?.toDouble();
		valorTotalProdutos = jsonDados['valorTotalProdutos']?.toDouble();
		valorFrete = jsonDados['valorFrete']?.toDouble();
		valorSeguro = jsonDados['valorSeguro']?.toDouble();
		valorDesconto = jsonDados['valorDesconto']?.toDouble();
		valorImpostoImportacao = jsonDados['valorImpostoImportacao']?.toDouble();
		valorIpi = jsonDados['valorIpi']?.toDouble();
		valorIpiDevolvido = jsonDados['valorIpiDevolvido']?.toDouble();
		valorPis = jsonDados['valorPis']?.toDouble();
		valorCofins = jsonDados['valorCofins']?.toDouble();
		valorDespesasAcessorias = jsonDados['valorDespesasAcessorias']?.toDouble();
		valorTotal = jsonDados['valorTotal']?.toDouble();
		valorTotalTributos = jsonDados['valorTotalTributos']?.toDouble();
		valorServicos = jsonDados['valorServicos']?.toDouble();
		baseCalculoIssqn = jsonDados['baseCalculoIssqn']?.toDouble();
		valorIssqn = jsonDados['valorIssqn']?.toDouble();
		valorPisIssqn = jsonDados['valorPisIssqn']?.toDouble();
		valorCofinsIssqn = jsonDados['valorCofinsIssqn']?.toDouble();
		dataPrestacaoServico = jsonDados['dataPrestacaoServico'] != null ? DateTime.tryParse(jsonDados['dataPrestacaoServico']) : null;
		valorDeducaoIssqn = jsonDados['valorDeducaoIssqn']?.toDouble();
		outrasRetencoesIssqn = jsonDados['outrasRetencoesIssqn']?.toDouble();
		descontoIncondicionadoIssqn = jsonDados['descontoIncondicionadoIssqn']?.toDouble();
		descontoCondicionadoIssqn = jsonDados['descontoCondicionadoIssqn']?.toDouble();
		totalRetencaoIssqn = jsonDados['totalRetencaoIssqn']?.toDouble();
		regimeEspecialTributacao = getRegimeEspecialTributacao(jsonDados['regimeEspecialTributacao']);
		valorRetidoPis = jsonDados['valorRetidoPis']?.toDouble();
		valorRetidoCofins = jsonDados['valorRetidoCofins']?.toDouble();
		valorRetidoCsll = jsonDados['valorRetidoCsll']?.toDouble();
		baseCalculoIrrf = jsonDados['baseCalculoIrrf']?.toDouble();
		valorRetidoIrrf = jsonDados['valorRetidoIrrf']?.toDouble();
		baseCalculoPrevidencia = jsonDados['baseCalculoPrevidencia']?.toDouble();
		valorRetidoPrevidencia = jsonDados['valorRetidoPrevidencia']?.toDouble();
		informacoesAddFisco = jsonDados['informacoesAddFisco'];
		informacoesAddContribuinte = jsonDados['informacoesAddContribuinte'];
		comexUfEmbarque = jsonDados['comexUfEmbarque'] == '' ? null : jsonDados['comexUfEmbarque'];
		comexLocalEmbarque = jsonDados['comexLocalEmbarque'];
		comexLocalDespacho = jsonDados['comexLocalDespacho'];
		compraNotaEmpenho = jsonDados['compraNotaEmpenho'];
		compraPedido = jsonDados['compraPedido'];
		compraContrato = jsonDados['compraContrato'];
		qrcode = jsonDados['qrcode'];
		urlChave = jsonDados['urlChave'];
		statusNota = getStatusNota(jsonDados['statusNota']);
		nfeCana = jsonDados['nfeCana'] == null ? null : NfeCana.fromJson(jsonDados['nfeCana']);
		nfeDestinatario = jsonDados['nfeDestinatario'] == null ? null : NfeDestinatario.fromJson(jsonDados['nfeDestinatario']);
		nfeEmitente = jsonDados['nfeEmitente'] == null ? null : NfeEmitente.fromJson(jsonDados['nfeEmitente']);
		nfeFatura = jsonDados['nfeFatura'] == null ? null : NfeFatura.fromJson(jsonDados['nfeFatura']);
		nfeInformacaoPagamento = jsonDados['nfeInformacaoPagamento'] == null ? null : NfeInformacaoPagamento.fromJson(jsonDados['nfeInformacaoPagamento']);
		nfeLocalEntrega = jsonDados['nfeLocalEntrega'] == null ? null : NfeLocalEntrega.fromJson(jsonDados['nfeLocalEntrega']);
		nfeLocalRetirada = jsonDados['nfeLocalRetirada'] == null ? null : NfeLocalRetirada.fromJson(jsonDados['nfeLocalRetirada']);
		nfeResponsavelTecnico = jsonDados['nfeResponsavelTecnico'] == null ? null : NfeResponsavelTecnico.fromJson(jsonDados['nfeResponsavelTecnico']);
		nfeTransporte = jsonDados['nfeTransporte'] == null ? null : NfeTransporte.fromJson(jsonDados['nfeTransporte']);
		vendedor = jsonDados['vendedor'] == null ? null : Vendedor.fromJson(jsonDados['vendedor']);
		fornecedor = jsonDados['fornecedor'] == null ? null : Fornecedor.fromJson(jsonDados['fornecedor']);
		cliente = jsonDados['cliente'] == null ? null : Cliente.fromJson(jsonDados['cliente']);
		tributOperacaoFiscal = jsonDados['tributOperacaoFiscal'] == null ? null : TributOperacaoFiscal.fromJson(jsonDados['tributOperacaoFiscal']);
		vendaCabecalho = jsonDados['vendaCabecalho'] == null ? null : VendaCabecalho.fromJson(jsonDados['vendaCabecalho']);
		listaNfeAcessoXml = (jsonDados['listaNfeAcessoXml'] as Iterable?)?.map((m) => NfeAcessoXml.fromJson(m)).toList() ?? [];
		listaNfeCteReferenciado = (jsonDados['listaNfeCteReferenciado'] as Iterable?)?.map((m) => NfeCteReferenciado.fromJson(m)).toList() ?? [];
		listaNfeCupomFiscalReferenciado = (jsonDados['listaNfeCupomFiscalReferenciado'] as Iterable?)?.map((m) => NfeCupomFiscalReferenciado.fromJson(m)).toList() ?? [];
		listaNfeDetalhe = (jsonDados['listaNfeDetalhe'] as Iterable?)?.map((m) => NfeDetalhe.fromJson(m)).toList() ?? [];
		listaNfeNfReferenciada = (jsonDados['listaNfeNfReferenciada'] as Iterable?)?.map((m) => NfeNfReferenciada.fromJson(m)).toList() ?? [];
		listaNfeProcessoReferenciado = (jsonDados['listaNfeProcessoReferenciado'] as Iterable?)?.map((m) => NfeProcessoReferenciado.fromJson(m)).toList() ?? [];
		listaNfeProdRuralReferenciada = (jsonDados['listaNfeProdRuralReferenciada'] as Iterable?)?.map((m) => NfeProdRuralReferenciada.fromJson(m)).toList() ?? [];
		listaNfeReferenciada = (jsonDados['listaNfeReferenciada'] as Iterable?)?.map((m) => NfeReferenciada.fromJson(m)).toList() ?? [];
		listaViewSpedNfeDetalhe = (jsonDados['listaViewSpedNfeDetalhe'] as Iterable?)?.map((m) => ViewSpedNfeDetalhe.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idVendedor'] = idVendedor ?? 0;
		jsonDados['idFornecedor'] = idFornecedor ?? 0;
		jsonDados['idCliente'] = idCliente ?? 0;
		jsonDados['idTributOperacaoFiscal'] = idTributOperacaoFiscal ?? 0;
		jsonDados['idVendaCabecalho'] = idVendaCabecalho ?? 0;
		jsonDados['idNfceMovimento'] = idNfceMovimento ?? 0;
		jsonDados['ufEmitente'] = ufEmitente ?? 0;
		jsonDados['codigoNumerico'] = codigoNumerico;
		jsonDados['naturezaOperacao'] = naturezaOperacao;
		jsonDados['codigoModelo'] = codigoModelo;
		jsonDados['serie'] = serie;
		jsonDados['numero'] = numero;
		jsonDados['dataHoraEmissao'] = dataHoraEmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataHoraEmissao!) : null;
		jsonDados['dataHoraEntradaSaida'] = dataHoraEntradaSaida != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataHoraEntradaSaida!) : null;
		jsonDados['tipoOperacao'] = setTipoOperacao(tipoOperacao);
		jsonDados['localDestino'] = setLocalDestino(localDestino);
		jsonDados['codigoMunicipio'] = codigoMunicipio ?? 0;
		jsonDados['formatoImpressaoDanfe'] = setFormatoImpressaoDanfe(formatoImpressaoDanfe);
		jsonDados['tipoEmissao'] = setTipoEmissao(tipoEmissao);
		jsonDados['chaveAcesso'] = chaveAcesso;
		jsonDados['digitoChaveAcesso'] = digitoChaveAcesso;
		jsonDados['ambiente'] = setAmbiente(ambiente);
		jsonDados['finalidadeEmissao'] = setFinalidadeEmissao(finalidadeEmissao);
		jsonDados['consumidorOperacao'] = setConsumidorOperacao(consumidorOperacao);
		jsonDados['consumidorPresenca'] = setConsumidorPresenca(consumidorPresenca);
		jsonDados['processoEmissao'] = setProcessoEmissao(processoEmissao);
		jsonDados['versaoProcessoEmissao'] = versaoProcessoEmissao;
		jsonDados['dataEntradaContingencia'] = dataEntradaContingencia != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEntradaContingencia!) : null;
		jsonDados['justificativaContingencia'] = justificativaContingencia;
		jsonDados['baseCalculoIcms'] = baseCalculoIcms;
		jsonDados['valorIcms'] = valorIcms;
		jsonDados['valorIcmsDesonerado'] = valorIcmsDesonerado;
		jsonDados['totalIcmsFcpUfDestino'] = totalIcmsFcpUfDestino;
		jsonDados['totalIcmsInterestadualUfDestino'] = totalIcmsInterestadualUfDestino;
		jsonDados['totalIcmsInterestadualUfRemetente'] = totalIcmsInterestadualUfRemetente;
		jsonDados['valorTotalFcp'] = valorTotalFcp;
		jsonDados['baseCalculoIcmsSt'] = baseCalculoIcmsSt;
		jsonDados['valorIcmsSt'] = valorIcmsSt;
		jsonDados['valorTotalFcpSt'] = valorTotalFcpSt;
		jsonDados['valorTotalFcpStRetido'] = valorTotalFcpStRetido;
		jsonDados['valorTotalProdutos'] = valorTotalProdutos;
		jsonDados['valorFrete'] = valorFrete;
		jsonDados['valorSeguro'] = valorSeguro;
		jsonDados['valorDesconto'] = valorDesconto;
		jsonDados['valorImpostoImportacao'] = valorImpostoImportacao;
		jsonDados['valorIpi'] = valorIpi;
		jsonDados['valorIpiDevolvido'] = valorIpiDevolvido;
		jsonDados['valorPis'] = valorPis;
		jsonDados['valorCofins'] = valorCofins;
		jsonDados['valorDespesasAcessorias'] = valorDespesasAcessorias;
		jsonDados['valorTotal'] = valorTotal;
		jsonDados['valorTotalTributos'] = valorTotalTributos;
		jsonDados['valorServicos'] = valorServicos;
		jsonDados['baseCalculoIssqn'] = baseCalculoIssqn;
		jsonDados['valorIssqn'] = valorIssqn;
		jsonDados['valorPisIssqn'] = valorPisIssqn;
		jsonDados['valorCofinsIssqn'] = valorCofinsIssqn;
		jsonDados['dataPrestacaoServico'] = dataPrestacaoServico != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataPrestacaoServico!) : null;
		jsonDados['valorDeducaoIssqn'] = valorDeducaoIssqn;
		jsonDados['outrasRetencoesIssqn'] = outrasRetencoesIssqn;
		jsonDados['descontoIncondicionadoIssqn'] = descontoIncondicionadoIssqn;
		jsonDados['descontoCondicionadoIssqn'] = descontoCondicionadoIssqn;
		jsonDados['totalRetencaoIssqn'] = totalRetencaoIssqn;
		jsonDados['regimeEspecialTributacao'] = setRegimeEspecialTributacao(regimeEspecialTributacao);
		jsonDados['valorRetidoPis'] = valorRetidoPis;
		jsonDados['valorRetidoCofins'] = valorRetidoCofins;
		jsonDados['valorRetidoCsll'] = valorRetidoCsll;
		jsonDados['baseCalculoIrrf'] = baseCalculoIrrf;
		jsonDados['valorRetidoIrrf'] = valorRetidoIrrf;
		jsonDados['baseCalculoPrevidencia'] = baseCalculoPrevidencia;
		jsonDados['valorRetidoPrevidencia'] = valorRetidoPrevidencia;
		jsonDados['informacoesAddFisco'] = informacoesAddFisco;
		jsonDados['informacoesAddContribuinte'] = informacoesAddContribuinte;
		jsonDados['comexUfEmbarque'] = comexUfEmbarque;
		jsonDados['comexLocalEmbarque'] = comexLocalEmbarque;
		jsonDados['comexLocalDespacho'] = comexLocalDespacho;
		jsonDados['compraNotaEmpenho'] = compraNotaEmpenho;
		jsonDados['compraPedido'] = compraPedido;
		jsonDados['compraContrato'] = compraContrato;
		jsonDados['qrcode'] = qrcode;
		jsonDados['urlChave'] = urlChave;
		jsonDados['statusNota'] = setStatusNota(statusNota);
		jsonDados['nfeCana'] = nfeCana == null ? null : nfeCana!.toJson;
		jsonDados['nfeDestinatario'] = nfeDestinatario == null ? null : nfeDestinatario!.toJson;
		jsonDados['nfeEmitente'] = nfeEmitente == null ? null : nfeEmitente!.toJson;
		jsonDados['nfeFatura'] = nfeFatura == null ? null : nfeFatura!.toJson;
		jsonDados['nfeInformacaoPagamento'] = nfeInformacaoPagamento == null ? null : nfeInformacaoPagamento!.toJson;
		jsonDados['nfeLocalEntrega'] = nfeLocalEntrega == null ? null : nfeLocalEntrega!.toJson;
		jsonDados['nfeLocalRetirada'] = nfeLocalRetirada == null ? null : nfeLocalRetirada!.toJson;
		jsonDados['nfeResponsavelTecnico'] = nfeResponsavelTecnico == null ? null : nfeResponsavelTecnico!.toJson;
		jsonDados['nfeTransporte'] = nfeTransporte == null ? null : nfeTransporte!.toJson;
		jsonDados['vendedor'] = vendedor == null ? null : vendedor!.toJson;
		jsonDados['fornecedor'] = fornecedor == null ? null : fornecedor!.toJson;
		jsonDados['cliente'] = cliente == null ? null : cliente!.toJson;
		jsonDados['tributOperacaoFiscal'] = tributOperacaoFiscal == null ? null : tributOperacaoFiscal!.toJson;
		jsonDados['vendaCabecalho'] = vendaCabecalho == null ? null : vendaCabecalho!.toJson;
		

		var listaNfeAcessoXmlLocal = [];
		for (NfeAcessoXml objeto in listaNfeAcessoXml ?? []) {
			listaNfeAcessoXmlLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeAcessoXml'] = listaNfeAcessoXmlLocal;
		

		var listaNfeCteReferenciadoLocal = [];
		for (NfeCteReferenciado objeto in listaNfeCteReferenciado ?? []) {
			listaNfeCteReferenciadoLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeCteReferenciado'] = listaNfeCteReferenciadoLocal;
		

		var listaNfeCupomFiscalReferenciadoLocal = [];
		for (NfeCupomFiscalReferenciado objeto in listaNfeCupomFiscalReferenciado ?? []) {
			listaNfeCupomFiscalReferenciadoLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeCupomFiscalReferenciado'] = listaNfeCupomFiscalReferenciadoLocal;
		

		var listaNfeDetalheLocal = [];
		for (NfeDetalhe objeto in listaNfeDetalhe ?? []) {
			listaNfeDetalheLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeDetalhe'] = listaNfeDetalheLocal;
		

		var listaNfeNfReferenciadaLocal = [];
		for (NfeNfReferenciada objeto in listaNfeNfReferenciada ?? []) {
			listaNfeNfReferenciadaLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeNfReferenciada'] = listaNfeNfReferenciadaLocal;
		

		var listaNfeProcessoReferenciadoLocal = [];
		for (NfeProcessoReferenciado objeto in listaNfeProcessoReferenciado ?? []) {
			listaNfeProcessoReferenciadoLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeProcessoReferenciado'] = listaNfeProcessoReferenciadoLocal;
		

		var listaNfeProdRuralReferenciadaLocal = [];
		for (NfeProdRuralReferenciada objeto in listaNfeProdRuralReferenciada ?? []) {
			listaNfeProdRuralReferenciadaLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeProdRuralReferenciada'] = listaNfeProdRuralReferenciadaLocal;
		

		var listaNfeReferenciadaLocal = [];
		for (NfeReferenciada objeto in listaNfeReferenciada ?? []) {
			listaNfeReferenciadaLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeReferenciada'] = listaNfeReferenciadaLocal;
		

		var listaViewSpedNfeDetalheLocal = [];
		for (ViewSpedNfeDetalhe objeto in listaViewSpedNfeDetalhe ?? []) {
			listaViewSpedNfeDetalheLocal.add(objeto.toJson);
		}
		jsonDados['listaViewSpedNfeDetalhe'] = listaViewSpedNfeDetalheLocal;
	
		return jsonDados;
	}
	
    getTipoOperacao(String? tipoOperacao) {
    	switch (tipoOperacao) {
    		case '0':
    			return '0=Entrada';
    		case '1':
    			return '1=Saída';
    		default:
    			return null;
    		}
    	}

    setTipoOperacao(String? tipoOperacao) {
    	switch (tipoOperacao) {
    		case '0=Entrada':
    			return '0';
    		case '0':
    			return '0';
        case '1=Saída':
    			return '1';
        case '1':
    			return '1';    		
        default:
    			return null;
    		}
    	}

    getLocalDestino(String? localDestino) {
    	switch (localDestino) {
    		case '1':
    			return '1=Operação interna';
    		case '2':
    			return '2=Operação interestadual';
    		case '3':
    			return '3=Operação com exterior';
    		default:
    			return null;
    		}
    	}

    setLocalDestino(String? localDestino) {
    	switch (localDestino) {
    		case '1=Operação interna':
    			return '1';
    		case '2=Operação interestadual':
    			return '2';
    		case '3=Operação com exterior':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getFormatoImpressaoDanfe(String? formatoImpressaoDanfe) {
    	switch (formatoImpressaoDanfe) {
    		case '0':
    			return '0=Sem geração de DANFE';
    		case '1':
    			return '1=DANFE normal, Retrato';
    		case '2':
    			return '2=DANFE normal, Paisagem';
    		case '3':
    			return '3=DANFE Simplificado';
    		default:
    			return null;
    		}
    	}

    setFormatoImpressaoDanfe(String? formatoImpressaoDanfe) {
    	switch (formatoImpressaoDanfe) {
    		case '0=Sem geração de DANFE':
    			return '0';
    		case '1=DANFE normal, Retrato':
    			return '1';
    		case '2=DANFE normal, Paisagem':
    			return '2';
    		case '3=DANFE Simplificado':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getTipoEmissao(String? tipoEmissao) {
    	switch (tipoEmissao) {
    		case '1':
    			return '1=Emissão normal';
    		case '2':
    			return '2=Contingência FS-IA';
    		case '4':
    			return '4=Contingência EPEC';
    		case '5':
    			return '5=Contingência FS-DA';
    		case '6':
    			return '6=Contingência SVC-AN';
    		case '7':
    			return '7=Contingência SVC-RS';
    		default:
    			return null;
    		}
    	}

    setTipoEmissao(String? tipoEmissao) {
    	switch (tipoEmissao) {
    		case '1=Emissão normal':
    			return '1';
    		case '2=Contingência FS-IA':
    			return '2';
    		case '4=Contingência EPEC':
    			return '4';
    		case '5=Contingência FS-DA':
    			return '5';
    		case '6=Contingência SVC-AN':
    			return '6';
    		case '7=Contingência SVC-RS':
    			return '7';
    		default:
    			return null;
    		}
    	}

    getAmbiente(String? ambiente) {
    	switch (ambiente) {
    		case '1':
    			return '1=Produção';
    		case '2':
    			return '2=Homologação';
    		default:
    			return null;
    		}
    	}

    setAmbiente(String? ambiente) {
    	switch (ambiente) {
    		case '1=Produção':
    			return '1';
    		case '2=Homologação':
    			return '2';
    		default:
    			return null;
    		}
    	}

    getFinalidadeEmissao(String? finalidadeEmissao) {
    	switch (finalidadeEmissao) {
    		case '1':
    			return '1=NF-e normal';
    		case '2':
    			return '2=NF-e complementar';
    		case '3':
    			return '3=NF-e de ajuste';
    		case '4':
    			return '4=Devolução de mercadoria';
    		default:
    			return null;
    		}
    	}

    setFinalidadeEmissao(String? finalidadeEmissao) {
    	switch (finalidadeEmissao) {
    		case '1=NF-e normal':
    			return '1';
    		case '2=NF-e complementar':
    			return '2';
    		case '3=NF-e de ajuste':
    			return '3';
    		case '4=Devolução de mercadoria':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getConsumidorOperacao(String? consumidorOperacao) {
    	switch (consumidorOperacao) {
    		case '0':
    			return '0=Normal';
    		case '1':
    			return '1=Consumidor final';
    		default:
    			return null;
    		}
    	}

    setConsumidorOperacao(String? consumidorOperacao) {
    	switch (consumidorOperacao) {
    		case '0=Normal':
    			return '0';
    		case '1=Consumidor final':
    			return '1';
    		default:
    			return null;
    		}
    	}

    getConsumidorPresenca(String? consumidorPresenca) {
    	switch (consumidorPresenca) {
    		case '0':
    			return '0=Não se aplica';
    		case '1':
    			return '1=Operação presencial';
    		case '2':
    			return '2=Operação não presencial, pela Internet';
    		case '3':
    			return '3=Operação não presencial, Teleatendimento';
    		case '4':
    			return '4=NFC-e em operação com entrega a domicílio';
    		case '5':
    			return '5=Operação presencial, fora do estabelecimento';
    		case '9':
    			return '9=Operação não presencial, outros';
    		default:
    			return null;
    		}
    	}

    setConsumidorPresenca(String? consumidorPresenca) {
    	switch (consumidorPresenca) {
    		case '0=Não se aplica':
    			return '0';
    		case '1=Operação presencial':
    			return '1';
    		case '2=Operação não presencial, pela Internet':
    			return '2';
    		case '3=Operação não presencial, Teleatendimento':
    			return '3';
    		case '4=NFC-e em operação com entrega a domicílio':
    			return '4';
    		case '5=Operação presencial, fora do estabelecimento':
    			return '5';
    		case '9=Operação não presencial, outros':
    			return '9';
    		default:
    			return null;
    		}
    	}

    getProcessoEmissao(String? processoEmissao) {
    	switch (processoEmissao) {
    		case '0':
    			return '0=Emissão de NF-e com aplicativo do contribuinte';
    		case '1':
    			return '1=Emissão de NF-e avulsa pelo Fisco';
    		case '2':
    			return '2=Emissão de NF-e avulsa, pelo contribuinte com seu certificado digital, através do site do Fisco';
    		case '3':
    			return '3=Emissão NF-e pelo contribuinte com aplicativo fornecido pelo Fisco';
    		default:
    			return null;
    		}
    	}

    setProcessoEmissao(String? processoEmissao) {
    	switch (processoEmissao) {
    		case '0=Emissão de NF-e com aplicativo do contribuinte':
    			return '0';
    		case '1=Emissão de NF-e avulsa pelo Fisco':
    			return '1';
    		case '2=Emissão de NF-e avulsa, pelo contribuinte com seu certificado digital, através do site do Fisco':
    			return '2';
    		case '3=Emissão NF-e pelo contribuinte com aplicativo fornecido pelo Fisco':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getRegimeEspecialTributacao(String? regimeEspecialTributacao) {
    	switch (regimeEspecialTributacao) {
    		case '0':
    			return '0=Emissão de NF-e com aplicativo do contribuinte';
    		case '1':
    			return '1=Microempresa Municipal';
    		case '2':
    			return '2=Estimativa';
    		case '3':
    			return '3=Sociedade de Profissionais';
    		case '4':
    			return '4=Cooperativa';
    		case '5':
    			return '5=Microempresário Individual (MEI)';
    		case '6':
    			return '6=Microempresário e Empresa de Pequeno Porte';
    		default:
    			return null;
    		}
    	}

    setRegimeEspecialTributacao(String? regimeEspecialTributacao) {
    	switch (regimeEspecialTributacao) {
    		case '0=Emissão de NF-e com aplicativo do contribuinte':
    			return '0';
    		case '1=Microempresa Municipal':
    			return '1';
    		case '2=Estimativa':
    			return '2';
    		case '3=Sociedade de Profissionais':
    			return '3';
    		case '4=Cooperativa':
    			return '4';
    		case '5=Microempresário Individual (MEI)':
    			return '5';
    		case '6=Microempresário e Empresa de Pequeno Porte':
    			return '6';
    		default:
    			return null;
    		}
    	}

    getStatusNota(String? statusNota) {
    	switch (statusNota) {
    		case '0':
    			return '0-Em Edição';
    		case '1':
    			return '1-Salva';
    		case '2':
    			return '2-Validada';
    		case '3':
    			return '3-Assinada';
    		case '4':
    			return '4-Autorizada';
    		case '5':
    			return '5-Inutilizada';
    		case '6':
    			return '6-Cancelada';
    		default:
    			return null;
    		}
    	}

    setStatusNota(String? statusNota) {
    	switch (statusNota) {
    		case '0-Em Edição':
    			return '0';
    		case '1-Salva':
    			return '1';
    		case '2-Validada':
    			return '2';
    		case '3-Assinada':
    			return '3';
    		case '4-Autorizada':
    			return '4';
    		case '5-Inutilizada':
    			return '5';
    		case '6-Cancelada':
    			return '6';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(NfeCabecalho objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}