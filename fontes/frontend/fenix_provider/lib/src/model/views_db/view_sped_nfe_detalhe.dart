/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VIEW_SPED_NFE_DETALHE] 
                                                                                
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

import 'package:fenix/src/infra/biblioteca.dart';
import 'package:fenix/src/model/model.dart';

class ViewSpedNfeDetalhe {
	int? id;
	int? idNfeCabecalho;
	int? idProduto;
	int? numeroItem;
	String? codigoProduto;
	String? gtin;
	String? nomeProduto;
	String? ncm;
	String? nve;
	String? cest;
	String? indicadorEscalaRelevante;
	String? cnpjFabricante;
	String? codigoBeneficioFiscal;
	int? exTipi;
	int? cfop;
	String? unidadeComercial;
	double? quantidadeComercial;
	String? numeroPedidoCompra;
	int? itemPedidoCompra;
	String? numeroFci;
	String? numeroRecopi;
	double? valorUnitarioComercial;
	double? valorBrutoProduto;
	String? gtinUnidadeTributavel;
	String? unidadeTributavel;
	double? quantidadeTributavel;
	double? valorUnitarioTributavel;
	double? valorFrete;
	double? valorSeguro;
	double? valorDesconto;
	double? valorOutrasDespesas;
	String? entraTotal;
	double? valorTotalTributos;
	double? percentualDevolvido;
	double? valorIpiDevolvido;
	String? informacoesAdicionais;
	double? valorSubtotal;
	double? valorTotal;
	int? idTributOperacaoFiscal;
	int? idProdutoUnidade;
	String? cstCofins;
	double? quantidadeVendidaCofins;
	double? baseCalculoCofins;
	double? aliquotaCofinsPercentual;
	double? aliquotaCofinsReais;
	double? valorCofins;
	String? origemMercadoria;
	String? cstIcms;
	String? csosn;
	String? modalidadeBcIcms;
	double? percentualReducaoBcIcms;
	double? valorBcIcms;
	double? aliquotaIcms;
	double? valorIcms;
	String? motivoDesoneracaoIcms;
	String? modalidadeBcIcmsSt;
	double? percentualMvaIcmsSt;
	double? percentualReducaoBcIcmsSt;
	double? valorBaseCalculoIcmsSt;
	double? aliquotaIcmsSt;
	double? valorIcmsSt;
	double? valorBcIcmsStRetido;
	double? valorIcmsStRetido;
	double? valorBcIcmsStDestino;
	double? valorIcmsStDestino;
	double? aliquotaCreditoIcmsSn;
	double? valorCreditoIcmsSn;
	double? percentualBcOperacaoPropria;
	String? ufSt;
	double? valorBcIi;
	double? valorDespesasAduaneiras;
	double? valorImpostoImportacao;
	double? valorIof;
	String? cnpjProdutor;
	String? codigoSeloIpi;
	int? quantidadeSeloIpi;
	String? enquadramentoLegalIpi;
	String? cstIpi;
	double? valorBaseCalculoIpi;
	double? aliquotaIpi;
	double? quantidadeUnidadeTributavel;
	double? valorUnidadeTributavel;
	double? valorIpi;
	double? baseCalculoIssqn;
	double? aliquotaIssqn;
	double? valorIssqn;
	int? municipioIssqn;
	int? itemListaServicos;
	String? cstPis;
	double? quantidadeVendidaPis;
	double? valorBaseCalculoPis;
	double? aliquotaPisPercentual;
	double? aliquotaPisReais;
	double? valorPis;
	Produto? produto;
	TributOperacaoFiscal? tributOperacaoFiscal;
	ProdutoUnidade? produtoUnidade;

	ViewSpedNfeDetalhe({
		id,
		idNfeCabecalho,
		idProduto,
		numeroItem,
		codigoProduto,
		gtin,
		nomeProduto,
		ncm,
		nve,
		cest,
		indicadorEscalaRelevante,
		cnpjFabricante,
		codigoBeneficioFiscal,
		exTipi,
		cfop,
		unidadeComercial,
		quantidadeComercial = 0.0,
		numeroPedidoCompra,
		itemPedidoCompra,
		numeroFci,
		numeroRecopi,
		valorUnitarioComercial = 0.0,
		valorBrutoProduto = 0.0,
		gtinUnidadeTributavel,
		unidadeTributavel,
		quantidadeTributavel = 0.0,
		valorUnitarioTributavel = 0.0,
		valorFrete = 0.0,
		valorSeguro = 0.0,
		valorDesconto = 0.0,
		valorOutrasDespesas = 0.0,
		entraTotal,
		valorTotalTributos = 0.0,
		percentualDevolvido = 0.0,
		valorIpiDevolvido = 0.0,
		informacoesAdicionais,
		valorSubtotal = 0.0,
		valorTotal = 0.0,
		idTributOperacaoFiscal,
		idProdutoUnidade,
		cstCofins,
		quantidadeVendidaCofins = 0.0,
		baseCalculoCofins = 0.0,
		aliquotaCofinsPercentual = 0.0,
		aliquotaCofinsReais = 0.0,
		valorCofins = 0.0,
		origemMercadoria,
		cstIcms,
		csosn,
		modalidadeBcIcms,
		percentualReducaoBcIcms = 0.0,
		valorBcIcms = 0.0,
		aliquotaIcms = 0.0,
		valorIcms = 0.0,
		motivoDesoneracaoIcms,
		modalidadeBcIcmsSt,
		percentualMvaIcmsSt = 0.0,
		percentualReducaoBcIcmsSt = 0.0,
		valorBaseCalculoIcmsSt = 0.0,
		aliquotaIcmsSt = 0.0,
		valorIcmsSt = 0.0,
		valorBcIcmsStRetido = 0.0,
		valorIcmsStRetido = 0.0,
		valorBcIcmsStDestino = 0.0,
		valorIcmsStDestino = 0.0,
		aliquotaCreditoIcmsSn = 0.0,
		valorCreditoIcmsSn = 0.0,
		percentualBcOperacaoPropria = 0.0,
		ufSt,
		valorBcIi = 0.0,
		valorDespesasAduaneiras = 0.0,
		valorImpostoImportacao = 0.0,
		valorIof = 0.0,
		cnpjProdutor,
		codigoSeloIpi,
		quantidadeSeloIpi,
		enquadramentoLegalIpi,
		cstIpi,
		valorBaseCalculoIpi = 0.0,
		aliquotaIpi = 0.0,
		quantidadeUnidadeTributavel = 0.0,
		valorUnidadeTributavel = 0.0,
		valorIpi = 0.0,
		baseCalculoIssqn = 0.0,
		aliquotaIssqn = 0.0,
		valorIssqn = 0.0,
		municipioIssqn,
		itemListaServicos,
		cstPis,
		quantidadeVendidaPis = 0.0,
		valorBaseCalculoPis = 0.0,
		aliquotaPisPercentual = 0.0,
		aliquotaPisReais = 0.0,
		valorPis = 0.0,
		produto,
		tributOperacaoFiscal,
		produtoUnidade,
	});

	static List<String> campos = <String>[
		'ID', 
		'NUMERO_ITEM', 
		'CODIGO_PRODUTO', 
		'GTIN', 
		'NOME_PRODUTO', 
		'NCM', 
		'NVE', 
		'CEST', 
		'INDICADOR_ESCALA_RELEVANTE', 
		'CNPJ_FABRICANTE', 
		'CODIGO_BENEFICIO_FISCAL', 
		'EX_TIPI', 
		'CFOP', 
		'UNIDADE_COMERCIAL', 
		'QUANTIDADE_COMERCIAL', 
		'NUMERO_PEDIDO_COMPRA', 
		'ITEM_PEDIDO_COMPRA', 
		'NUMERO_FCI', 
		'NUMERO_RECOPI', 
		'VALOR_UNITARIO_COMERCIAL', 
		'VALOR_BRUTO_PRODUTO', 
		'GTIN_UNIDADE_TRIBUTAVEL', 
		'UNIDADE_TRIBUTAVEL', 
		'QUANTIDADE_TRIBUTAVEL', 
		'VALOR_UNITARIO_TRIBUTAVEL', 
		'VALOR_FRETE', 
		'VALOR_SEGURO', 
		'VALOR_DESCONTO', 
		'VALOR_OUTRAS_DESPESAS', 
		'ENTRA_TOTAL', 
		'VALOR_TOTAL_TRIBUTOS', 
		'PERCENTUAL_DEVOLVIDO', 
		'VALOR_IPI_DEVOLVIDO', 
		'INFORMACOES_ADICIONAIS', 
		'VALOR_SUBTOTAL', 
		'VALOR_TOTAL', 
		'CST_COFINS', 
		'QUANTIDADE_VENDIDA_COFINS', 
		'BASE_CALCULO_COFINS', 
		'ALIQUOTA_COFINS_PERCENTUAL', 
		'ALIQUOTA_COFINS_REAIS', 
		'VALOR_COFINS', 
		'ORIGEM_MERCADORIA', 
		'CST_ICMS', 
		'CSOSN', 
		'MODALIDADE_BC_ICMS', 
		'PERCENTUAL_REDUCAO_BC_ICMS', 
		'VALOR_BC_ICMS', 
		'ALIQUOTA_ICMS', 
		'VALOR_ICMS', 
		'MOTIVO_DESONERACAO_ICMS', 
		'MODALIDADE_BC_ICMS_ST', 
		'PERCENTUAL_MVA_ICMS_ST', 
		'PERCENTUAL_REDUCAO_BC_ICMS_ST', 
		'VALOR_BASE_CALCULO_ICMS_ST', 
		'ALIQUOTA_ICMS_ST', 
		'VALOR_ICMS_ST', 
		'VALOR_BC_ICMS_ST_RETIDO', 
		'VALOR_ICMS_ST_RETIDO', 
		'VALOR_BC_ICMS_ST_DESTINO', 
		'VALOR_ICMS_ST_DESTINO', 
		'ALIQUOTA_CREDITO_ICMS_SN', 
		'VALOR_CREDITO_ICMS_SN', 
		'PERCENTUAL_BC_OPERACAO_PROPRIA', 
		'UF_ST', 
		'VALOR_BC_II', 
		'VALOR_DESPESAS_ADUANEIRAS', 
		'VALOR_IMPOSTO_IMPORTACAO', 
		'VALOR_IOF', 
		'CNPJ_PRODUTOR', 
		'CODIGO_SELO_IPI', 
		'QUANTIDADE_SELO_IPI', 
		'ENQUADRAMENTO_LEGAL_IPI', 
		'CST_IPI', 
		'VALOR_BASE_CALCULO_IPI', 
		'ALIQUOTA_IPI', 
		'QUANTIDADE_UNIDADE_TRIBUTAVEL', 
		'VALOR_UNIDADE_TRIBUTAVEL', 
		'VALOR_IPI', 
		'BASE_CALCULO_ISSQN', 
		'ALIQUOTA_ISSQN', 
		'VALOR_ISSQN', 
		'MUNICIPIO_ISSQN', 
		'ITEM_LISTA_SERVICOS', 
		'CST_PIS', 
		'QUANTIDADE_VENDIDA_PIS', 
		'VALOR_BASE_CALCULO_PIS', 
		'ALIQUOTA_PIS_PERCENTUAL', 
		'ALIQUOTA_PIS_REAIS', 
		'VALOR_PIS', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Número do Item', 
		'Código do Produto', 
		'GTIN', 
		'Nome', 
		'NCM', 
		'NVE', 
		'CEST', 
		'Indicador Escala Relevante', 
		'CNPJ do Fabricante', 
		'Código Benefício Fiscal', 
		'EX TIPI', 
		'CFOP', 
		'Unidade Comercial', 
		'Quantidade Comercial', 
		'Número Pedido Compra', 
		'Item Pedido Compra', 
		'Número FCI', 
		'Número RECOPI', 
		'Valor Unitário Comercial', 
		'Valor Bruto Produto', 
		'GTIN Unidade Tributável', 
		'Unidade Tributável', 
		'Quantidade Tributável', 
		'Valor Unitário Tributável', 
		'Valor Frete', 
		'Valor Seguro', 
		'Valor Desconto', 
		'Valor Outras Despesas', 
		'Indicador Exibilidade', 
		'Valor Total Tributos', 
		'Percentual Devolvido', 
		'Valor IPI Devolvido', 
		'Informações Adicionais', 
		'Valor Subtotal', 
		'Valor Total', 
		'CST COFINS', 
		'Quantidade Vendida', 
		'Valor BC COFINS', 
		'Alíquota COFINS Percentual', 
		'Alíquota COFINS Reais', 
		'Valor COFINS', 
		'Origem da Mercadoria', 
		'CST', 
		'CSOSN', 
		'Modalidade Base Cálculo', 
		'Percentual Redução BC ICMS', 
		'Valor BC ICMS', 
		'Alíquota ICMS', 
		'Valor ICMS', 
		'UF', 
		'Indicador Exibilidade', 
		'Percentual MVA ICMS ST', 
		'Percentual Redução BC ICMS ST', 
		'Valor BC ICMS ST', 
		'Alíquota ICMS ST', 
		'Valor ICMS ST', 
		'Valor BC ICMS ST Retido', 
		'Valor ICMS ST Retido', 
		'Valor BC ICMS ST Destino', 
		'Valor ICMS ST Destino', 
		'Alíquota Crédito ICMS SN', 
		'Valor Crédito ICMS SN', 
		'Percentual BC Operação Própria', 
		'UF', 
		'Valor BC II', 
		'Valor Despesas Aduaneiras', 
		'Valor Imposto Importação', 
		'Valor IOF', 
		'CNPJ Produtor', 
		'Código Selo IPI', 
		'Quantidade Selos', 
		'Código de Enquadramento Legal', 
		'CST IPI', 
		'Valor BC IPI', 
		'Alíquota IPI', 
		'Quantidade Unidade Tributável', 
		'Valor Unidade Tributável', 
		'Valor IPI', 
		'Valor BC ISSQN', 
		'Alíquota ISSQN', 
		'Valor ISSQN', 
		'Município IBGE', 
		'Item Lista Serviços', 
		'CST PIS', 
		'Quantidade Vendida', 
		'Valor BC PIS', 
		'Alíquota PIS Percentual', 
		'Alíquota PIS Reais', 
		'Valor PIS', 
	];

	ViewSpedNfeDetalhe.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeCabecalho = jsonDados['idNfeCabecalho'];
		idProduto = jsonDados['idProduto'];
		numeroItem = jsonDados['numeroItem'];
		codigoProduto = jsonDados['codigoProduto'];
		gtin = jsonDados['gtin'];
		nomeProduto = jsonDados['nomeProduto'];
		ncm = jsonDados['ncm'];
		nve = jsonDados['nve'];
		cest = jsonDados['cest'];
		indicadorEscalaRelevante = getIndicadorEscalaRelevante(jsonDados['indicadorEscalaRelevante']);
		cnpjFabricante = jsonDados['cnpjFabricante'];
		codigoBeneficioFiscal = jsonDados['codigoBeneficioFiscal'];
		exTipi = jsonDados['exTipi'];
		cfop = jsonDados['cfop'];
		unidadeComercial = jsonDados['unidadeComercial'];
		quantidadeComercial = jsonDados['quantidadeComercial']?.toDouble();
		numeroPedidoCompra = jsonDados['numeroPedidoCompra'];
		itemPedidoCompra = jsonDados['itemPedidoCompra'];
		numeroFci = jsonDados['numeroFci'];
		numeroRecopi = jsonDados['numeroRecopi'];
		valorUnitarioComercial = jsonDados['valorUnitarioComercial']?.toDouble();
		valorBrutoProduto = jsonDados['valorBrutoProduto']?.toDouble();
		gtinUnidadeTributavel = jsonDados['gtinUnidadeTributavel'];
		unidadeTributavel = jsonDados['unidadeTributavel'];
		quantidadeTributavel = jsonDados['quantidadeTributavel']?.toDouble();
		valorUnitarioTributavel = jsonDados['valorUnitarioTributavel']?.toDouble();
		valorFrete = jsonDados['valorFrete']?.toDouble();
		valorSeguro = jsonDados['valorSeguro']?.toDouble();
		valorDesconto = jsonDados['valorDesconto']?.toDouble();
		valorOutrasDespesas = jsonDados['valorOutrasDespesas']?.toDouble();
		entraTotal = getEntraTotal(jsonDados['entraTotal']);
		valorTotalTributos = jsonDados['valorTotalTributos']?.toDouble();
		percentualDevolvido = jsonDados['percentualDevolvido']?.toDouble();
		valorIpiDevolvido = jsonDados['valorIpiDevolvido']?.toDouble();
		informacoesAdicionais = jsonDados['informacoesAdicionais'];
		valorSubtotal = jsonDados['valorSubtotal']?.toDouble();
		valorTotal = jsonDados['valorTotal']?.toDouble();
		idTributOperacaoFiscal = jsonDados['idTributOperacaoFiscal'];
		idProdutoUnidade = jsonDados['idProdutoUnidade'];
		cstCofins = jsonDados['cstCofins'];
		quantidadeVendidaCofins = jsonDados['quantidadeVendidaCofins']?.toDouble();
		baseCalculoCofins = jsonDados['baseCalculoCofins']?.toDouble();
		aliquotaCofinsPercentual = jsonDados['aliquotaCofinsPercentual']?.toDouble();
		aliquotaCofinsReais = jsonDados['aliquotaCofinsReais']?.toDouble();
		valorCofins = jsonDados['valorCofins']?.toDouble();
		origemMercadoria = jsonDados['origemMercadoria'] == '' ? null : jsonDados['origemMercadoria'];
		cstIcms = jsonDados['cstIcms'];
		csosn = jsonDados['csosn'];
		modalidadeBcIcms = getModalidadeBcIcms(jsonDados['modalidadeBcIcms']);
		percentualReducaoBcIcms = jsonDados['percentualReducaoBcIcms']?.toDouble();
		valorBcIcms = jsonDados['valorBcIcms']?.toDouble();
		aliquotaIcms = jsonDados['aliquotaIcms']?.toDouble();
		valorIcms = jsonDados['valorIcms']?.toDouble();
		motivoDesoneracaoIcms = jsonDados['motivoDesoneracaoIcms'] == '' ? null : jsonDados['motivoDesoneracaoIcms'];
		modalidadeBcIcmsSt = getModalidadeBcIcmsSt(jsonDados['modalidadeBcIcmsSt']);
		percentualMvaIcmsSt = jsonDados['percentualMvaIcmsSt']?.toDouble();
		percentualReducaoBcIcmsSt = jsonDados['percentualReducaoBcIcmsSt']?.toDouble();
		valorBaseCalculoIcmsSt = jsonDados['valorBaseCalculoIcmsSt']?.toDouble();
		aliquotaIcmsSt = jsonDados['aliquotaIcmsSt']?.toDouble();
		valorIcmsSt = jsonDados['valorIcmsSt']?.toDouble();
		valorBcIcmsStRetido = jsonDados['valorBcIcmsStRetido']?.toDouble();
		valorIcmsStRetido = jsonDados['valorIcmsStRetido']?.toDouble();
		valorBcIcmsStDestino = jsonDados['valorBcIcmsStDestino']?.toDouble();
		valorIcmsStDestino = jsonDados['valorIcmsStDestino']?.toDouble();
		aliquotaCreditoIcmsSn = jsonDados['aliquotaCreditoIcmsSn']?.toDouble();
		valorCreditoIcmsSn = jsonDados['valorCreditoIcmsSn']?.toDouble();
		percentualBcOperacaoPropria = jsonDados['percentualBcOperacaoPropria']?.toDouble();
		ufSt = jsonDados['ufSt'] == '' ? null : jsonDados['ufSt'];
		valorBcIi = jsonDados['valorBcIi']?.toDouble();
		valorDespesasAduaneiras = jsonDados['valorDespesasAduaneiras']?.toDouble();
		valorImpostoImportacao = jsonDados['valorImpostoImportacao']?.toDouble();
		valorIof = jsonDados['valorIof']?.toDouble();
		cnpjProdutor = jsonDados['cnpjProdutor'];
		codigoSeloIpi = jsonDados['codigoSeloIpi'];
		quantidadeSeloIpi = jsonDados['quantidadeSeloIpi'];
		enquadramentoLegalIpi = jsonDados['enquadramentoLegalIpi'];
		cstIpi = jsonDados['cstIpi'];
		valorBaseCalculoIpi = jsonDados['valorBaseCalculoIpi']?.toDouble();
		aliquotaIpi = jsonDados['aliquotaIpi']?.toDouble();
		quantidadeUnidadeTributavel = jsonDados['quantidadeUnidadeTributavel']?.toDouble();
		valorUnidadeTributavel = jsonDados['valorUnidadeTributavel']?.toDouble();
		valorIpi = jsonDados['valorIpi']?.toDouble();
		baseCalculoIssqn = jsonDados['baseCalculoIssqn']?.toDouble();
		aliquotaIssqn = jsonDados['aliquotaIssqn']?.toDouble();
		valorIssqn = jsonDados['valorIssqn']?.toDouble();
		municipioIssqn = jsonDados['municipioIssqn'];
		itemListaServicos = jsonDados['itemListaServicos'];
		cstPis = jsonDados['cstPis'];
		quantidadeVendidaPis = jsonDados['quantidadeVendidaPis']?.toDouble();
		valorBaseCalculoPis = jsonDados['valorBaseCalculoPis']?.toDouble();
		aliquotaPisPercentual = jsonDados['aliquotaPisPercentual']?.toDouble();
		aliquotaPisReais = jsonDados['aliquotaPisReais']?.toDouble();
		valorPis = jsonDados['valorPis']?.toDouble();
		produto = jsonDados['produto'] == null ? null : Produto.fromJson(jsonDados['produto']);
		tributOperacaoFiscal = jsonDados['tributOperacaoFiscal'] == null ? null : TributOperacaoFiscal.fromJson(jsonDados['tributOperacaoFiscal']);
		produtoUnidade = jsonDados['produtoUnidade'] == null ? null : ProdutoUnidade.fromJson(jsonDados['produtoUnidade']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeCabecalho'] = idNfeCabecalho ?? 0;
		jsonDados['idProduto'] = idProduto ?? 0;
		jsonDados['numeroItem'] = numeroItem ?? 0;
		jsonDados['codigoProduto'] = codigoProduto;
		jsonDados['gtin'] = gtin;
		jsonDados['nomeProduto'] = nomeProduto;
		jsonDados['ncm'] = ncm;
		jsonDados['nve'] = nve;
		jsonDados['cest'] = cest;
		jsonDados['indicadorEscalaRelevante'] = setIndicadorEscalaRelevante(indicadorEscalaRelevante);
		jsonDados['cnpjFabricante'] = Biblioteca.removerMascara(cnpjFabricante);
		jsonDados['codigoBeneficioFiscal'] = codigoBeneficioFiscal;
		jsonDados['exTipi'] = exTipi ?? 0;
		jsonDados['cfop'] = cfop ?? 0;
		jsonDados['unidadeComercial'] = unidadeComercial;
		jsonDados['quantidadeComercial'] = quantidadeComercial;
		jsonDados['numeroPedidoCompra'] = numeroPedidoCompra;
		jsonDados['itemPedidoCompra'] = itemPedidoCompra ?? 0;
		jsonDados['numeroFci'] = numeroFci;
		jsonDados['numeroRecopi'] = numeroRecopi;
		jsonDados['valorUnitarioComercial'] = valorUnitarioComercial;
		jsonDados['valorBrutoProduto'] = valorBrutoProduto;
		jsonDados['gtinUnidadeTributavel'] = gtinUnidadeTributavel;
		jsonDados['unidadeTributavel'] = unidadeTributavel;
		jsonDados['quantidadeTributavel'] = quantidadeTributavel;
		jsonDados['valorUnitarioTributavel'] = valorUnitarioTributavel;
		jsonDados['valorFrete'] = valorFrete;
		jsonDados['valorSeguro'] = valorSeguro;
		jsonDados['valorDesconto'] = valorDesconto;
		jsonDados['valorOutrasDespesas'] = valorOutrasDespesas;
		jsonDados['entraTotal'] = setEntraTotal(entraTotal);
		jsonDados['valorTotalTributos'] = valorTotalTributos;
		jsonDados['percentualDevolvido'] = percentualDevolvido;
		jsonDados['valorIpiDevolvido'] = valorIpiDevolvido;
		jsonDados['informacoesAdicionais'] = informacoesAdicionais;
		jsonDados['valorSubtotal'] = valorSubtotal;
		jsonDados['valorTotal'] = valorTotal;
		jsonDados['idTributOperacaoFiscal'] = idTributOperacaoFiscal ?? 0;
		jsonDados['idProdutoUnidade'] = idProdutoUnidade ?? 0;
		jsonDados['cstCofins'] = cstCofins;
		jsonDados['quantidadeVendidaCofins'] = quantidadeVendidaCofins;
		jsonDados['baseCalculoCofins'] = baseCalculoCofins;
		jsonDados['aliquotaCofinsPercentual'] = aliquotaCofinsPercentual;
		jsonDados['aliquotaCofinsReais'] = aliquotaCofinsReais;
		jsonDados['valorCofins'] = valorCofins;
		jsonDados['origemMercadoria'] = origemMercadoria;
		jsonDados['cstIcms'] = cstIcms;
		jsonDados['csosn'] = csosn;
		jsonDados['modalidadeBcIcms'] = setModalidadeBcIcms(modalidadeBcIcms);
		jsonDados['percentualReducaoBcIcms'] = percentualReducaoBcIcms;
		jsonDados['valorBcIcms'] = valorBcIcms;
		jsonDados['aliquotaIcms'] = aliquotaIcms;
		jsonDados['valorIcms'] = valorIcms;
		jsonDados['motivoDesoneracaoIcms'] = motivoDesoneracaoIcms;
		jsonDados['modalidadeBcIcmsSt'] = setModalidadeBcIcmsSt(modalidadeBcIcmsSt);
		jsonDados['percentualMvaIcmsSt'] = percentualMvaIcmsSt;
		jsonDados['percentualReducaoBcIcmsSt'] = percentualReducaoBcIcmsSt;
		jsonDados['valorBaseCalculoIcmsSt'] = valorBaseCalculoIcmsSt;
		jsonDados['aliquotaIcmsSt'] = aliquotaIcmsSt;
		jsonDados['valorIcmsSt'] = valorIcmsSt;
		jsonDados['valorBcIcmsStRetido'] = valorBcIcmsStRetido;
		jsonDados['valorIcmsStRetido'] = valorIcmsStRetido;
		jsonDados['valorBcIcmsStDestino'] = valorBcIcmsStDestino;
		jsonDados['valorIcmsStDestino'] = valorIcmsStDestino;
		jsonDados['aliquotaCreditoIcmsSn'] = aliquotaCreditoIcmsSn;
		jsonDados['valorCreditoIcmsSn'] = valorCreditoIcmsSn;
		jsonDados['percentualBcOperacaoPropria'] = percentualBcOperacaoPropria;
		jsonDados['ufSt'] = ufSt;
		jsonDados['valorBcIi'] = valorBcIi;
		jsonDados['valorDespesasAduaneiras'] = valorDespesasAduaneiras;
		jsonDados['valorImpostoImportacao'] = valorImpostoImportacao;
		jsonDados['valorIof'] = valorIof;
		jsonDados['cnpjProdutor'] = Biblioteca.removerMascara(cnpjProdutor);
		jsonDados['codigoSeloIpi'] = codigoSeloIpi;
		jsonDados['quantidadeSeloIpi'] = quantidadeSeloIpi ?? 0;
		jsonDados['enquadramentoLegalIpi'] = enquadramentoLegalIpi;
		jsonDados['cstIpi'] = cstIpi;
		jsonDados['valorBaseCalculoIpi'] = valorBaseCalculoIpi;
		jsonDados['aliquotaIpi'] = aliquotaIpi;
		jsonDados['quantidadeUnidadeTributavel'] = quantidadeUnidadeTributavel;
		jsonDados['valorUnidadeTributavel'] = valorUnidadeTributavel;
		jsonDados['valorIpi'] = valorIpi;
		jsonDados['baseCalculoIssqn'] = baseCalculoIssqn;
		jsonDados['aliquotaIssqn'] = aliquotaIssqn;
		jsonDados['valorIssqn'] = valorIssqn;
		jsonDados['municipioIssqn'] = municipioIssqn ?? 0;
		jsonDados['itemListaServicos'] = itemListaServicos ?? 0;
		jsonDados['cstPis'] = cstPis;
		jsonDados['quantidadeVendidaPis'] = quantidadeVendidaPis;
		jsonDados['valorBaseCalculoPis'] = valorBaseCalculoPis;
		jsonDados['aliquotaPisPercentual'] = aliquotaPisPercentual;
		jsonDados['aliquotaPisReais'] = aliquotaPisReais;
		jsonDados['valorPis'] = valorPis;
		jsonDados['produto'] = produto == null ? null : produto!.toJson;
		jsonDados['tributOperacaoFiscal'] = tributOperacaoFiscal == null ? null : tributOperacaoFiscal!.toJson;
		jsonDados['produtoUnidade'] = produtoUnidade == null ? null : produtoUnidade!.toJson;
	
		return jsonDados;
	}
	
    getIndicadorEscalaRelevante(String? indicadorEscalaRelevante) {
    	switch (indicadorEscalaRelevante) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setIndicadorEscalaRelevante(String? indicadorEscalaRelevante) {
    	switch (indicadorEscalaRelevante) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getEntraTotal(String? entraTotal) {
    	switch (entraTotal) {
    		case '0':
    			return '0=Valor do item (vProd) não compõe o valor total da NF-e';
    		case '1':
    			return '1=Valor do item (vProd) compõe o valor total da NF-e (vProd)';
    		default:
    			return null;
    		}
    	}

    setEntraTotal(String? entraTotal) {
    	switch (entraTotal) {
    		case '0=Valor do item (vProd) não compõe o valor total da NF-e':
    			return '0';
    		case '1=Valor do item (vProd) compõe o valor total da NF-e (vProd)':
    			return '1';
    		default:
    			return null;
    		}
    	}

    getModalidadeBcIcms(String? modalidadeBcIcms) {
    	switch (modalidadeBcIcms) {
    		case '0':
    			return '0=Margem Valor Agregado (%)';
    		case '1':
    			return '1=Pauta (valor)';
    		case '2':
    			return '2=Preço Tabelado Máximo (valor)';
    		case '3':
    			return '3=Valor da Operação';
    		default:
    			return null;
    		}
    	}

    setModalidadeBcIcms(String? modalidadeBcIcms) {
    	switch (modalidadeBcIcms) {
    		case '0=Margem Valor Agregado (%)':
    			return '0';
    		case '1=Pauta (valor)':
    			return '1';
    		case '2=Preço Tabelado Máximo (valor)':
    			return '2';
    		case '3=Valor da Operação':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getModalidadeBcIcmsSt(String? modalidadeBcIcmsSt) {
    	switch (modalidadeBcIcmsSt) {
    		case '0':
    			return '0=Preço tabelado ou máximo sugerido';
    		case '1':
    			return '1=Lista Negativa (valor)';
    		case '2':
    			return '2=Lista Positiva (valor)';
    		case '3':
    			return '3=Lista Neutra (valor)';
    		case '4':
    			return '4=Margem Valor Agregado (%)';
    		case '5':
    			return '5=Pauta (valor)';
    		default:
    			return null;
    		}
    	}

    setModalidadeBcIcmsSt(String? modalidadeBcIcmsSt) {
    	switch (modalidadeBcIcmsSt) {
    		case '0=Preço tabelado ou máximo sugerido':
    			return '0';
    		case '1=Lista Negativa (valor)':
    			return '1';
    		case '2=Lista Positiva (valor)':
    			return '2';
    		case '3=Lista Neutra (valor)':
    			return '3';
    		case '4=Margem Valor Agregado (%)':
    			return '4';
    		case '5=Pauta (valor)':
    			return '5';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(ViewSpedNfeDetalhe objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}