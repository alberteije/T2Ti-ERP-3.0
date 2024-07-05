/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DETALHE] 
                                                                                
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

class NfeDetalhe {
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
	NfeDetEspecificoCombustivel? nfeDetEspecificoCombustivel = NfeDetEspecificoCombustivel();
	NfeDetEspecificoMedicamento? nfeDetEspecificoMedicamento = NfeDetEspecificoMedicamento();
	NfeDetEspecificoVeiculo? nfeDetEspecificoVeiculo = NfeDetEspecificoVeiculo();
	NfeDetalheImpostoCofins? nfeDetalheImpostoCofins = NfeDetalheImpostoCofins();
	NfeDetalheImpostoCofinsSt? nfeDetalheImpostoCofinsSt = NfeDetalheImpostoCofinsSt();
	NfeDetalheImpostoIcms? nfeDetalheImpostoIcms = NfeDetalheImpostoIcms();
	NfeDetalheImpostoIcmsUfdest? nfeDetalheImpostoIcmsUfdest = NfeDetalheImpostoIcmsUfdest();
	NfeDetalheImpostoIi? nfeDetalheImpostoIi = NfeDetalheImpostoIi();
	NfeDetalheImpostoIpi? nfeDetalheImpostoIpi = NfeDetalheImpostoIpi();
	NfeDetalheImpostoIssqn? nfeDetalheImpostoIssqn = NfeDetalheImpostoIssqn();
	NfeDetalheImpostoPis? nfeDetalheImpostoPis = NfeDetalheImpostoPis();
	NfeDetalheImpostoPisSt? nfeDetalheImpostoPisSt = NfeDetalheImpostoPisSt();
	Produto? produto;
	List<NfeDeclaracaoImportacao>? listaNfeDeclaracaoImportacao = [];
	List<NfeDetEspecificoArmamento>? listaNfeDetEspecificoArmamento = [];
	List<NfeExportacao>? listaNfeExportacao = [];
	List<NfeItemRastreado>? listaNfeItemRastreado = [];

	NfeDetalhe({
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
		nfeDetEspecificoCombustivel,
		nfeDetEspecificoMedicamento,
		nfeDetEspecificoVeiculo,
		nfeDetalheImpostoCofins,
		nfeDetalheImpostoCofinsSt,
		nfeDetalheImpostoIcms,
		nfeDetalheImpostoIcmsUfdest,
		nfeDetalheImpostoIi,
		nfeDetalheImpostoIpi,
		nfeDetalheImpostoIssqn,
		nfeDetalheImpostoPis,
		nfeDetalheImpostoPisSt,
		produto,
		listaNfeDeclaracaoImportacao,
		listaNfeDetEspecificoArmamento,
		listaNfeExportacao,
		listaNfeItemRastreado,
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
	];

	NfeDetalhe.fromJson(Map<String, dynamic> jsonDados) {
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
		nfeDetEspecificoCombustivel = jsonDados['nfeDetEspecificoCombustivel'] == null ? NfeDetEspecificoCombustivel() : NfeDetEspecificoCombustivel.fromJson(jsonDados['nfeDetEspecificoCombustivel']);
		nfeDetEspecificoMedicamento = jsonDados['nfeDetEspecificoMedicamento'] == null ? NfeDetEspecificoMedicamento() : NfeDetEspecificoMedicamento.fromJson(jsonDados['nfeDetEspecificoMedicamento']);
		nfeDetEspecificoVeiculo = jsonDados['nfeDetEspecificoVeiculo'] == null ? NfeDetEspecificoVeiculo() : NfeDetEspecificoVeiculo.fromJson(jsonDados['nfeDetEspecificoVeiculo']);
		nfeDetalheImpostoCofins = jsonDados['nfeDetalheImpostoCofins'] == null ? NfeDetalheImpostoCofins() : NfeDetalheImpostoCofins.fromJson(jsonDados['nfeDetalheImpostoCofins']);
		nfeDetalheImpostoCofinsSt = jsonDados['nfeDetalheImpostoCofinsSt'] == null ? NfeDetalheImpostoCofinsSt() : NfeDetalheImpostoCofinsSt.fromJson(jsonDados['nfeDetalheImpostoCofinsSt']);
		nfeDetalheImpostoIcms = jsonDados['nfeDetalheImpostoIcms'] == null ? NfeDetalheImpostoIcms() : NfeDetalheImpostoIcms.fromJson(jsonDados['nfeDetalheImpostoIcms']);
		nfeDetalheImpostoIcmsUfdest = jsonDados['nfeDetalheImpostoIcmsUfdest'] == null ? NfeDetalheImpostoIcmsUfdest() : NfeDetalheImpostoIcmsUfdest.fromJson(jsonDados['nfeDetalheImpostoIcmsUfdest']);
		nfeDetalheImpostoIi = jsonDados['nfeDetalheImpostoIi'] == null ? NfeDetalheImpostoIi() : NfeDetalheImpostoIi.fromJson(jsonDados['nfeDetalheImpostoIi']);
		nfeDetalheImpostoIpi = jsonDados['nfeDetalheImpostoIpi'] == null ? NfeDetalheImpostoIpi() : NfeDetalheImpostoIpi.fromJson(jsonDados['nfeDetalheImpostoIpi']);
		nfeDetalheImpostoIssqn = jsonDados['nfeDetalheImpostoIssqn'] == null ? NfeDetalheImpostoIssqn() : NfeDetalheImpostoIssqn.fromJson(jsonDados['nfeDetalheImpostoIssqn']);
		nfeDetalheImpostoPis = jsonDados['nfeDetalheImpostoPis'] == null ? NfeDetalheImpostoPis() : NfeDetalheImpostoPis.fromJson(jsonDados['nfeDetalheImpostoPis']);
		nfeDetalheImpostoPisSt = jsonDados['nfeDetalheImpostoPisSt'] == null ? NfeDetalheImpostoPisSt() : NfeDetalheImpostoPisSt.fromJson(jsonDados['nfeDetalheImpostoPisSt']);
		produto = jsonDados['produto'] == null ? Produto() : Produto.fromJson(jsonDados['produto']);
		listaNfeDeclaracaoImportacao = (jsonDados['listaNfeDeclaracaoImportacao'] as Iterable?)?.map((m) => NfeDeclaracaoImportacao.fromJson(m)).toList() ?? [];
		listaNfeDetEspecificoArmamento = (jsonDados['listaNfeDetEspecificoArmamento'] as Iterable?)?.map((m) => NfeDetEspecificoArmamento.fromJson(m)).toList() ?? [];
		listaNfeExportacao = (jsonDados['listaNfeExportacao'] as Iterable?)?.map((m) => NfeExportacao.fromJson(m)).toList() ?? [];
		listaNfeItemRastreado = (jsonDados['listaNfeItemRastreado'] as Iterable?)?.map((m) => NfeItemRastreado.fromJson(m)).toList() ?? [];
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
		jsonDados['nfeDetEspecificoCombustivel'] = nfeDetEspecificoCombustivel == null ? null : nfeDetEspecificoCombustivel!.toJson;
		jsonDados['nfeDetEspecificoMedicamento'] = nfeDetEspecificoMedicamento == null ? null : nfeDetEspecificoMedicamento!.toJson;
		jsonDados['nfeDetEspecificoVeiculo'] = nfeDetEspecificoVeiculo == null ? null : nfeDetEspecificoVeiculo!.toJson;
		jsonDados['nfeDetalheImpostoCofins'] = nfeDetalheImpostoCofins == null ? null : nfeDetalheImpostoCofins!.toJson;
		jsonDados['nfeDetalheImpostoCofinsSt'] = nfeDetalheImpostoCofinsSt == null ? null : nfeDetalheImpostoCofinsSt!.toJson;
		jsonDados['nfeDetalheImpostoIcms'] = nfeDetalheImpostoIcms == null ? null : nfeDetalheImpostoIcms!.toJson;
		jsonDados['nfeDetalheImpostoIcmsUfdest'] = nfeDetalheImpostoIcmsUfdest == null ? null : nfeDetalheImpostoIcmsUfdest!.toJson;
		jsonDados['nfeDetalheImpostoIi'] = nfeDetalheImpostoIi == null ? null : nfeDetalheImpostoIi!.toJson;
		jsonDados['nfeDetalheImpostoIpi'] = nfeDetalheImpostoIpi == null ? null : nfeDetalheImpostoIpi!.toJson;
		jsonDados['nfeDetalheImpostoIssqn'] = nfeDetalheImpostoIssqn == null ? null : nfeDetalheImpostoIssqn!.toJson;
		jsonDados['nfeDetalheImpostoPis'] = nfeDetalheImpostoPis == null ? null : nfeDetalheImpostoPis!.toJson;
		jsonDados['nfeDetalheImpostoPisSt'] = nfeDetalheImpostoPisSt == null ? null : nfeDetalheImpostoPisSt!.toJson;
		jsonDados['produto'] = produto == null ? null : produto!.toJson;
		

		var listaNfeDeclaracaoImportacaoLocal = [];
		for (NfeDeclaracaoImportacao objeto in listaNfeDeclaracaoImportacao ?? []) {
			listaNfeDeclaracaoImportacaoLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeDeclaracaoImportacao'] = listaNfeDeclaracaoImportacaoLocal;
		

		var listaNfeDetEspecificoArmamentoLocal = [];
		for (NfeDetEspecificoArmamento objeto in listaNfeDetEspecificoArmamento ?? []) {
			listaNfeDetEspecificoArmamentoLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeDetEspecificoArmamento'] = listaNfeDetEspecificoArmamentoLocal;
		

		var listaNfeExportacaoLocal = [];
		for (NfeExportacao objeto in listaNfeExportacao ?? []) {
			listaNfeExportacaoLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeExportacao'] = listaNfeExportacaoLocal;
		

		var listaNfeItemRastreadoLocal = [];
		for (NfeItemRastreado objeto in listaNfeItemRastreado ?? []) {
			listaNfeItemRastreadoLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeItemRastreado'] = listaNfeItemRastreadoLocal;
	
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
      if (entraTotal?.length == 1) {
        return entraTotal;
      }    
    	switch (entraTotal) {
    		case '0=Valor do item (vProd) não compõe o valor total da NF-e':
    			return '0';
    		case '1=Valor do item (vProd) compõe o valor total da NF-e (vProd)':
    			return '1';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}