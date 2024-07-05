/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [COMPRA_PEDIDO] 
                                                                                
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

class CompraPedido {
	int? id;
	int? idCompraTipoPedido;
	int? idFornecedor;
	int? idColaborador;
	DateTime? dataPedido;
	DateTime? dataPrevistaEntrega;
	DateTime? dataPrevisaoPagamento;
	String? localEntrega;
	String? localCobranca;
	String? contato;
	double? valorSubtotal;
	double? taxaDesconto;
	double? valorDesconto;
	double? valorTotal;
	String? tipoFrete;
	String? formaPagamento;
	double? baseCalculoIcms;
	double? valorIcms;
	double? baseCalculoIcmsSt;
	double? valorIcmsSt;
	double? valorTotalProdutos;
	double? valorFrete;
	double? valorSeguro;
	double? valorOutrasDespesas;
	double? valorIpi;
	double? valorTotalNf;
	int? quantidadeParcelas;
	String? diaPrimeiroVencimento;
	int? intervaloEntreParcelas;
	String? diaFixoParcela;
	String? codigoCotacao;
	CompraTipoPedido? compraTipoPedido;
	Fornecedor? fornecedor;
	Colaborador? colaborador;
	List<CompraPedidoDetalhe>? listaCompraPedidoDetalhe = [];

	CompraPedido({
			id,
			idCompraTipoPedido,
			idFornecedor,
			idColaborador,
			dataPedido,
			dataPrevistaEntrega,
			dataPrevisaoPagamento,
			localEntrega,
			localCobranca,
			contato,
			valorSubtotal,
			taxaDesconto,
			valorDesconto,
			valorTotal,
			tipoFrete,
			formaPagamento,
			baseCalculoIcms,
			valorIcms,
			baseCalculoIcmsSt,
			valorIcmsSt,
			valorTotalProdutos,
			valorFrete,
			valorSeguro,
			valorOutrasDespesas,
			valorIpi,
			valorTotalNf,
			quantidadeParcelas,
			diaPrimeiroVencimento,
			intervaloEntreParcelas,
			diaFixoParcela,
			codigoCotacao,
			compraTipoPedido,
			fornecedor,
			colaborador,
			listaCompraPedidoDetalhe,
		});

	static List<String> campos = <String>[
		'ID', 
		'DATA_PEDIDO', 
		'DATA_PREVISTA_ENTREGA', 
		'DATA_PREVISAO_PAGAMENTO', 
		'LOCAL_ENTREGA', 
		'LOCAL_COBRANCA', 
		'CONTATO', 
		'VALOR_SUBTOTAL', 
		'TAXA_DESCONTO', 
		'VALOR_DESCONTO', 
		'VALOR_TOTAL', 
		'TIPO_FRETE', 
		'FORMA_PAGAMENTO', 
		'BASE_CALCULO_ICMS', 
		'VALOR_ICMS', 
		'BASE_CALCULO_ICMS_ST', 
		'VALOR_ICMS_ST', 
		'VALOR_TOTAL_PRODUTOS', 
		'VALOR_FRETE', 
		'VALOR_SEGURO', 
		'VALOR_OUTRAS_DESPESAS', 
		'VALOR_IPI', 
		'VALOR_TOTAL_NF', 
		'QUANTIDADE_PARCELAS', 
		'DIA_PRIMEIRO_VENCIMENTO', 
		'INTERVALO_ENTRE_PARCELAS', 
		'DIA_FIXO_PARCELA', 
		'CODIGO_COTACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Data do Pedido', 
		'Data Prevista para Entrega', 
		'Data Previsão Pagamento', 
		'Local de Entrega', 
		'Local de Cobrança', 
		'Nome do Contato', 
		'Valor Subtotal', 
		'Taxa Desconto', 
		'Valor Desconto', 
		'Valor Total', 
		'Tipo do Frete', 
		'Forma de Pagamento', 
		'Base Cálculo ICMS', 
		'Valor do ICMS', 
		'Base Cálculo ICMS ST', 
		'Valor do ICMS ST', 
		'Valor Total Produtos', 
		'Valor Frete', 
		'Valor Seguro', 
		'Valor Outras Despesas', 
		'Valor do IPI', 
		'Valor Total NF', 
		'Quantidade de Parcelas', 
		'Dia Primeiro Vencimento', 
		'Intervalo entre Parcelas', 
		'Dia Fixo da Parcela', 
		'Código da Cotação', 
	];

	CompraPedido.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCompraTipoPedido = jsonDados['idCompraTipoPedido'];
		idFornecedor = jsonDados['idFornecedor'];
		idColaborador = jsonDados['idColaborador'];
		dataPedido = jsonDados['dataPedido'] != null ? DateTime.tryParse(jsonDados['dataPedido']) : null;
		dataPrevistaEntrega = jsonDados['dataPrevistaEntrega'] != null ? DateTime.tryParse(jsonDados['dataPrevistaEntrega']) : null;
		dataPrevisaoPagamento = jsonDados['dataPrevisaoPagamento'] != null ? DateTime.tryParse(jsonDados['dataPrevisaoPagamento']) : null;
		localEntrega = jsonDados['localEntrega'];
		localCobranca = jsonDados['localCobranca'];
		contato = jsonDados['contato'];
		valorSubtotal = jsonDados['valorSubtotal']?.toDouble();
		taxaDesconto = jsonDados['taxaDesconto']?.toDouble();
		valorDesconto = jsonDados['valorDesconto']?.toDouble();
		valorTotal = jsonDados['valorTotal']?.toDouble();
		tipoFrete = getTipoFrete(jsonDados['tipoFrete']);
		formaPagamento = getFormaPagamento(jsonDados['formaPagamento']);
		baseCalculoIcms = jsonDados['baseCalculoIcms']?.toDouble();
		valorIcms = jsonDados['valorIcms']?.toDouble();
		baseCalculoIcmsSt = jsonDados['baseCalculoIcmsSt']?.toDouble();
		valorIcmsSt = jsonDados['valorIcmsSt']?.toDouble();
		valorTotalProdutos = jsonDados['valorTotalProdutos']?.toDouble();
		valorFrete = jsonDados['valorFrete']?.toDouble();
		valorSeguro = jsonDados['valorSeguro']?.toDouble();
		valorOutrasDespesas = jsonDados['valorOutrasDespesas']?.toDouble();
		valorIpi = jsonDados['valorIpi']?.toDouble();
		valorTotalNf = jsonDados['valorTotalNf']?.toDouble();
		quantidadeParcelas = jsonDados['quantidadeParcelas'];
		diaPrimeiroVencimento = jsonDados['diaPrimeiroVencimento'];
		intervaloEntreParcelas = jsonDados['intervaloEntreParcelas'];
		diaFixoParcela = jsonDados['diaFixoParcela'];
		codigoCotacao = jsonDados['codigoCotacao'];
		compraTipoPedido = jsonDados['compraTipoPedido'] == null ? null : CompraTipoPedido.fromJson(jsonDados['compraTipoPedido']);
		fornecedor = jsonDados['fornecedor'] == null ? null : Fornecedor.fromJson(jsonDados['fornecedor']);
		colaborador = jsonDados['colaborador'] == null ? null : Colaborador.fromJson(jsonDados['colaborador']);
		listaCompraPedidoDetalhe = (jsonDados['listaCompraPedidoDetalhe'] as Iterable?)?.map((m) => CompraPedidoDetalhe.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCompraTipoPedido'] = idCompraTipoPedido ?? 0;
		jsonDados['idFornecedor'] = idFornecedor ?? 0;
		jsonDados['idColaborador'] = idColaborador ?? 0;
		jsonDados['dataPedido'] = dataPedido != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataPedido!) : null;
		jsonDados['dataPrevistaEntrega'] = dataPrevistaEntrega != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataPrevistaEntrega!) : null;
		jsonDados['dataPrevisaoPagamento'] = dataPrevisaoPagamento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataPrevisaoPagamento!) : null;
		jsonDados['localEntrega'] = localEntrega;
		jsonDados['localCobranca'] = localCobranca;
		jsonDados['contato'] = contato;
		jsonDados['valorSubtotal'] = valorSubtotal;
		jsonDados['taxaDesconto'] = taxaDesconto;
		jsonDados['valorDesconto'] = valorDesconto;
		jsonDados['valorTotal'] = valorTotal;
		jsonDados['tipoFrete'] = setTipoFrete(tipoFrete);
		jsonDados['formaPagamento'] = setFormaPagamento(formaPagamento);
		jsonDados['baseCalculoIcms'] = baseCalculoIcms;
		jsonDados['valorIcms'] = valorIcms;
		jsonDados['baseCalculoIcmsSt'] = baseCalculoIcmsSt;
		jsonDados['valorIcmsSt'] = valorIcmsSt;
		jsonDados['valorTotalProdutos'] = valorTotalProdutos;
		jsonDados['valorFrete'] = valorFrete;
		jsonDados['valorSeguro'] = valorSeguro;
		jsonDados['valorOutrasDespesas'] = valorOutrasDespesas;
		jsonDados['valorIpi'] = valorIpi;
		jsonDados['valorTotalNf'] = valorTotalNf;
		jsonDados['quantidadeParcelas'] = quantidadeParcelas ?? 0;
		jsonDados['diaPrimeiroVencimento'] = Biblioteca.removerMascara(diaPrimeiroVencimento);
		jsonDados['intervaloEntreParcelas'] = intervaloEntreParcelas ?? 0;
		jsonDados['diaFixoParcela'] = Biblioteca.removerMascara(diaFixoParcela);
		jsonDados['codigoCotacao'] = codigoCotacao;
		jsonDados['compraTipoPedido'] = compraTipoPedido == null ? null : compraTipoPedido!.toJson;
		jsonDados['fornecedor'] = fornecedor == null ? null : fornecedor!.toJson;
		jsonDados['colaborador'] = colaborador == null ? null : colaborador!.toJson;
		

		var listaCompraPedidoDetalheLocal = [];
		for (CompraPedidoDetalhe objeto in listaCompraPedidoDetalhe ?? []) {
			listaCompraPedidoDetalheLocal.add(objeto.toJson);
		}
		jsonDados['listaCompraPedidoDetalhe'] = listaCompraPedidoDetalheLocal;
	
		return jsonDados;
	}
	
    getTipoFrete(String? tipoFrete) {
    	switch (tipoFrete) {
    		case 'C':
    			return 'CIF';
    		case 'F':
    			return 'FOB';
    		default:
    			return null;
    		}
    	}

    setTipoFrete(String? tipoFrete) {
    	switch (tipoFrete) {
    		case 'CIF':
    			return 'C';
    		case 'FOB':
    			return 'F';
    		default:
    			return null;
    		}
    	}

    getFormaPagamento(String? formaPagamento) {
    	switch (formaPagamento) {
    		case '0':
    			return 'Pagamento a Vista';
    		case '1':
    			return 'Pagamento a Prazo';
    		case '2':
    			return 'Outros';
    		default:
    			return null;
    		}
    	}

    setFormaPagamento(String? formaPagamento) {
    	switch (formaPagamento) {
    		case 'Pagamento a Vista':
    			return '0';
    		case 'Pagamento a Prazo':
    			return '1';
    		case 'Outros':
    			return '2';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(CompraPedido objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}