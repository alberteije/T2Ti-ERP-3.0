/*
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
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:fenix/src/infra/biblioteca.dart';
import 'package:fenix/src/model/model.dart';

class VendaCabecalho {
	int? id;
	int? idVendaOrcamentoCabecalho;
	int? idVendaCondicoesPagamento;
	int? idNotaFiscalTipo;
	int? idCliente;
	int? idTransportadora;
	int? idVendedor;
	DateTime? dataVenda;
	DateTime? dataSaida;
	String? horaSaida;
	int? numeroFatura;
	String? localEntrega;
	String? localCobranca;
	double? valorSubtotal;
	double? taxaComissao;
	double? valorComissao;
	double? taxaDesconto;
	double? valorDesconto;
	double? valorTotal;
	String? tipoFrete;
	String? formaPagamento;
	double? valorFrete;
	double? valorSeguro;
	String? observacao;
	String? situacao;
	String? diaFixoParcela;
  VendaFrete? vendaFrete;
	VendaOrcamentoCabecalho? vendaOrcamentoCabecalho;
	VendaCondicoesPagamento? vendaCondicoesPagamento;
	NotaFiscalTipo? notaFiscalTipo;
	Cliente? cliente;
	Transportadora? transportadora;
	Vendedor? vendedor;
	List<VendaComissao>? listaVendaComissao = [];
	List<VendaDetalhe>? listaVendaDetalhe = [];

	VendaCabecalho({
		id,
		idVendaOrcamentoCabecalho,
		idVendaCondicoesPagamento,
		idNotaFiscalTipo,
		idCliente,
		idTransportadora,
		idVendedor,
		dataVenda,
		dataSaida,
		horaSaida,
		numeroFatura,
		localEntrega,
		localCobranca,
		valorSubtotal = 0.0,
		taxaComissao = 0.0,
		valorComissao = 0.0,
		taxaDesconto = 0.0,
		valorDesconto = 0.0,
		valorTotal = 0.0,
		tipoFrete,
		formaPagamento,
		valorFrete = 0.0,
		valorSeguro = 0.0,
		observacao,
		situacao,
		diaFixoParcela,
    vendaFrete,
		vendaOrcamentoCabecalho,
		vendaCondicoesPagamento,
		notaFiscalTipo,
		cliente,
		transportadora,
		vendedor,
		listaVendaComissao,
		listaVendaDetalhe,
	});

	static List<String> campos = <String>[
		'ID', 
		'DATA_VENDA', 
		'DATA_SAIDA', 
		'HORA_SAIDA', 
		'NUMERO_FATURA', 
		'LOCAL_ENTREGA', 
		'LOCAL_COBRANCA', 
		'VALOR_SUBTOTAL', 
		'TAXA_COMISSAO', 
		'VALOR_COMISSAO', 
		'TAXA_DESCONTO', 
		'VALOR_DESCONTO', 
		'VALOR_TOTAL', 
		'TIPO_FRETE', 
		'FORMA_PAGAMENTO', 
		'VALOR_FRETE', 
		'VALOR_SEGURO', 
		'OBSERVACAO', 
		'SITUACAO', 
		'DIA_FIXO_PARCELA', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Data da Venda', 
		'Data da Saída', 
		'Hora da Saída', 
		'Número da Fatura', 
		'Local de Entrega', 
		'Local de Cobrança', 
		'Valor Subtotal', 
		'Taxa Comissão', 
		'Valor Comissão', 
		'Taxa Desconto', 
		'Valor Desconto', 
		'Valor Total', 
		'Tipo do Frete', 
		'Forma de Pagamento', 
		'Valor Frete', 
		'Valor Seguro', 
		'Observação', 
		'Situação', 
		'Dia Fixo da Parcela', 
	];

	VendaCabecalho.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idVendaOrcamentoCabecalho = jsonDados['idVendaOrcamentoCabecalho'];
		idVendaCondicoesPagamento = jsonDados['idVendaCondicoesPagamento'];
		idNotaFiscalTipo = jsonDados['idNotaFiscalTipo'];
		idCliente = jsonDados['idCliente'];
		idTransportadora = jsonDados['idTransportadora'];
		idVendedor = jsonDados['idVendedor'];
		dataVenda = jsonDados['dataVenda'] != null ? DateTime.tryParse(jsonDados['dataVenda']) : null;
		dataSaida = jsonDados['dataSaida'] != null ? DateTime.tryParse(jsonDados['dataSaida']) : null;
		horaSaida = jsonDados['horaSaida'];
		numeroFatura = jsonDados['numeroFatura'];
		localEntrega = jsonDados['localEntrega'];
		localCobranca = jsonDados['localCobranca'];
		valorSubtotal = jsonDados['valorSubtotal']?.toDouble();
		taxaComissao = jsonDados['taxaComissao']?.toDouble();
		valorComissao = jsonDados['valorComissao']?.toDouble();
		taxaDesconto = jsonDados['taxaDesconto']?.toDouble();
		valorDesconto = jsonDados['valorDesconto']?.toDouble();
		valorTotal = jsonDados['valorTotal']?.toDouble();
		tipoFrete = getTipoFrete(jsonDados['tipoFrete']);
		formaPagamento = getFormaPagamento(jsonDados['formaPagamento']);
		valorFrete = jsonDados['valorFrete']?.toDouble();
		valorSeguro = jsonDados['valorSeguro']?.toDouble();
		observacao = jsonDados['observacao'];
		situacao = getSituacao(jsonDados['situacao']);
		diaFixoParcela = jsonDados['diaFixoParcela'];
    vendaFrete = jsonDados['vendaFrete'] == null ? null : VendaFrete.fromJson(jsonDados['vendaFrete']);
		vendaOrcamentoCabecalho = jsonDados['vendaOrcamentoCabecalho'] == null ? null : VendaOrcamentoCabecalho.fromJson(jsonDados['vendaOrcamentoCabecalho']);
		vendaCondicoesPagamento = jsonDados['vendaCondicoesPagamento'] == null ? null : VendaCondicoesPagamento.fromJson(jsonDados['vendaCondicoesPagamento']);
		notaFiscalTipo = jsonDados['notaFiscalTipo'] == null ? null : NotaFiscalTipo.fromJson(jsonDados['notaFiscalTipo']);
		cliente = jsonDados['cliente'] == null ? null : Cliente.fromJson(jsonDados['cliente']);
		transportadora = jsonDados['transportadora'] == null ? null : Transportadora.fromJson(jsonDados['transportadora']);
		vendedor = jsonDados['vendedor'] == null ? null : Vendedor.fromJson(jsonDados['vendedor']);
		listaVendaComissao = (jsonDados['listaVendaComissao'] as Iterable?)?.map((m) => VendaComissao.fromJson(m)).toList() ?? [];
		listaVendaDetalhe = (jsonDados['listaVendaDetalhe'] as Iterable?)?.map((m) => VendaDetalhe.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idVendaOrcamentoCabecalho'] = idVendaOrcamentoCabecalho ?? 0;
		jsonDados['idVendaCondicoesPagamento'] = idVendaCondicoesPagamento ?? 0;
		jsonDados['idNotaFiscalTipo'] = idNotaFiscalTipo ?? 0;
		jsonDados['idCliente'] = idCliente ?? 0;
		jsonDados['idTransportadora'] = idTransportadora ?? 0;
		jsonDados['idVendedor'] = idVendedor ?? 0;
		jsonDados['dataVenda'] = dataVenda != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataVenda!) : null;
		jsonDados['dataSaida'] = dataSaida != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataSaida!) : null;
		jsonDados['horaSaida'] = Biblioteca.removerMascara(horaSaida);
		jsonDados['numeroFatura'] = numeroFatura ?? 0;
		jsonDados['localEntrega'] = localEntrega;
		jsonDados['localCobranca'] = localCobranca;
		jsonDados['valorSubtotal'] = valorSubtotal;
		jsonDados['taxaComissao'] = taxaComissao;
		jsonDados['valorComissao'] = valorComissao;
		jsonDados['taxaDesconto'] = taxaDesconto;
		jsonDados['valorDesconto'] = valorDesconto;
		jsonDados['valorTotal'] = valorTotal;
		jsonDados['tipoFrete'] = setTipoFrete(tipoFrete);
		jsonDados['formaPagamento'] = setFormaPagamento(formaPagamento);
		jsonDados['valorFrete'] = valorFrete;
		jsonDados['valorSeguro'] = valorSeguro;
		jsonDados['observacao'] = observacao;
		jsonDados['situacao'] = setSituacao(situacao);
		jsonDados['diaFixoParcela'] = diaFixoParcela;
    jsonDados['vendaFrete'] = vendaFrete == null ? null : vendaFrete!.toJson;
		jsonDados['vendaOrcamentoCabecalho'] = vendaOrcamentoCabecalho == null ? null : vendaOrcamentoCabecalho!.toJson;
		jsonDados['vendaCondicoesPagamento'] = vendaCondicoesPagamento == null ? null : vendaCondicoesPagamento!.toJson;
		jsonDados['notaFiscalTipo'] = notaFiscalTipo == null ? null : notaFiscalTipo!.toJson;
		jsonDados['cliente'] = cliente == null ? null : cliente!.toJson;
		jsonDados['transportadora'] = transportadora == null ? null : transportadora!.toJson;
		jsonDados['vendedor'] = vendedor == null ? null : vendedor!.toJson;
		

		var listaVendaComissaoLocal = [];
		for (VendaComissao objeto in listaVendaComissao ?? []) {
			listaVendaComissaoLocal.add(objeto.toJson);
		}
		jsonDados['listaVendaComissao'] = listaVendaComissaoLocal;
		

		var listaVendaDetalheLocal = [];
		for (VendaDetalhe objeto in listaVendaDetalhe ?? []) {
			listaVendaDetalheLocal.add(objeto.toJson);
		}
		jsonDados['listaVendaDetalhe'] = listaVendaDetalheLocal;
	
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

    getSituacao(String? situacao) {
    	switch (situacao) {
    		case '0':
    			return 'Digitação';
    		case '1':
    			return 'Produção';
    		case '2':
    			return 'Expedição';
    		case '3':
    			return 'Faturado';
    		case '4':
    			return 'Entregue';
    		case '5':
    			return 'Devolução';
    		default:
    			return null;
    		}
    	}

    setSituacao(String? situacao) {
    	switch (situacao) {
    		case 'Digitação':
    			return '0';
    		case 'Produção':
    			return '1';
    		case 'Expedição':
    			return '2';
    		case 'Faturado':
    			return '3';
    		case 'Entregue':
    			return '4';
    		case 'Devolução':
    			return '5';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(VendaCabecalho objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}