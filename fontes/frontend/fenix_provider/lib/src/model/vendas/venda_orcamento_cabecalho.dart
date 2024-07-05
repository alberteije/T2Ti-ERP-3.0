/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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
import 'package:fenix/src/model/model.dart';

class VendaOrcamentoCabecalho {
	int? id;
	int? idVendaCondicoesPagamento;
	int? idVendedor;
	int? idCliente;
	int? idTransportadora;
	String? codigo;
	DateTime? dataCadastro;
	DateTime? dataEntrega;
	DateTime? validade;
	String? tipoFrete;
	double? valorSubtotal;
	double? valorFrete;
	double? taxaComissao;
	double? valorComissao;
	double? taxaDesconto;
	double? valorDesconto;
	double? valorTotal;
	String? observacao;
	VendaCondicoesPagamento? vendaCondicoesPagamento;
	Vendedor? vendedor;
	Cliente? cliente;
	Transportadora? transportadora;
	List<VendaOrcamentoDetalhe>? listaVendaOrcamentoDetalhe = [];

	VendaOrcamentoCabecalho({
			id,
			idVendaCondicoesPagamento,
			idVendedor,
			idCliente,
			idTransportadora,
			codigo,
			dataCadastro,
			dataEntrega,
			validade,
			tipoFrete,
			valorSubtotal = 0.0,
			valorFrete = 0.0,
			taxaComissao = 0.0,
			valorComissao = 0.0,
			taxaDesconto = 0.0,
			valorDesconto = 0.0,
			valorTotal = 0.0,
			observacao,
			vendaCondicoesPagamento,
			vendedor,
			cliente,
			transportadora,
			listaVendaOrcamentoDetalhe,
		});

	static List<String> campos = <String>[
		'ID', 
		'CODIGO', 
		'DATA_CADASTRO', 
		'DATA_ENTREGA', 
		'VALIDADE', 
		'TIPO_FRETE', 
		'VALOR_SUBTOTAL', 
		'VALOR_FRETE', 
		'TAXA_COMISSAO', 
		'VALOR_COMISSAO', 
		'TAXA_DESCONTO', 
		'VALOR_DESCONTO', 
		'VALOR_TOTAL', 
		'OBSERVACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Código do Orçamento', 
		'Data de Cadastro', 
		'Data de Entrega', 
		'Data de Validade', 
		'Tipo do Frete', 
		'Valor Subtotal', 
		'Valor Frete', 
		'Taxa Comissão', 
		'Valor Comissão', 
		'Taxa Desconto', 
		'Valor Desconto', 
		'Valor Total', 
		'Observação', 
	];

	VendaOrcamentoCabecalho.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idVendaCondicoesPagamento = jsonDados['idVendaCondicoesPagamento'];
		idVendedor = jsonDados['idVendedor'];
		idCliente = jsonDados['idCliente'];
		idTransportadora = jsonDados['idTransportadora'];
		codigo = jsonDados['codigo'];
		dataCadastro = jsonDados['dataCadastro'] != null ? DateTime.tryParse(jsonDados['dataCadastro']) : null;
		dataEntrega = jsonDados['dataEntrega'] != null ? DateTime.tryParse(jsonDados['dataEntrega']) : null;
		validade = jsonDados['validade'] != null ? DateTime.tryParse(jsonDados['validade']) : null;
		tipoFrete = getTipoFrete(jsonDados['tipoFrete']);
		valorSubtotal = jsonDados['valorSubtotal'] != null ? jsonDados['valorSubtotal'].toDouble() : 0.0;
		valorFrete = jsonDados['valorFrete'] != null ? jsonDados['valorFrete'].toDouble() : 0.0;
		taxaComissao = jsonDados['taxaComissao'] != null ? jsonDados['taxaComissao'].toDouble() : 0.0;
		valorComissao = jsonDados['valorComissao'] != null ? jsonDados['valorComissao'].toDouble() : 0.0;
		taxaDesconto = jsonDados['taxaDesconto'] != null ? jsonDados['taxaDesconto'].toDouble() : 0.0;
		valorDesconto = jsonDados['valorDesconto'] != null ? jsonDados['valorDesconto'].toDouble() : 0.0;
		valorTotal = jsonDados['valorTotal'] != null ? jsonDados['valorTotal'].toDouble() : 0.0;
		observacao = jsonDados['observacao'];
		vendaCondicoesPagamento = jsonDados['vendaCondicoesPagamento'] == null ? null : VendaCondicoesPagamento.fromJson(jsonDados['vendaCondicoesPagamento']);
		vendedor = jsonDados['vendedor'] == null ? null : Vendedor.fromJson(jsonDados['vendedor']);
		cliente = jsonDados['cliente'] == null ? null : Cliente.fromJson(jsonDados['cliente']);
		transportadora = jsonDados['transportadora'] == null ? null : Transportadora.fromJson(jsonDados['transportadora']);
		listaVendaOrcamentoDetalhe = (jsonDados['listaVendaOrcamentoDetalhe'] as Iterable?)?.map((m) => VendaOrcamentoDetalhe.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idVendaCondicoesPagamento'] = idVendaCondicoesPagamento ?? 0;
		jsonDados['idVendedor'] = idVendedor ?? 0;
		jsonDados['idCliente'] = idCliente ?? 0;
		jsonDados['idTransportadora'] = idTransportadora ?? 0;
		jsonDados['codigo'] = codigo;
		jsonDados['dataCadastro'] = dataCadastro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataCadastro!) : null;
		jsonDados['dataEntrega'] = dataEntrega != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEntrega!) : null;
		jsonDados['validade'] = validade != null ? DateFormat('yyyy-MM-ddT00:00:00').format(validade!) : null;
		jsonDados['tipoFrete'] = setTipoFrete(tipoFrete);
		jsonDados['valorSubtotal'] = valorSubtotal;
		jsonDados['valorFrete'] = valorFrete;
		jsonDados['taxaComissao'] = taxaComissao;
		jsonDados['valorComissao'] = valorComissao;
		jsonDados['taxaDesconto'] = taxaDesconto;
		jsonDados['valorDesconto'] = valorDesconto;
		jsonDados['valorTotal'] = valorTotal;
		jsonDados['observacao'] = observacao;
		jsonDados['vendaCondicoesPagamento'] = vendaCondicoesPagamento == null ? null : vendaCondicoesPagamento!.toJson;
		jsonDados['vendedor'] = vendedor == null ? null : vendedor!.toJson;
		jsonDados['cliente'] = cliente == null ? null : cliente!.toJson;
		jsonDados['transportadora'] = transportadora == null ? null : transportadora!.toJson;
		

		var listaVendaOrcamentoDetalheLocal = [];
		for (VendaOrcamentoDetalhe objeto in listaVendaOrcamentoDetalhe ?? []) {
			listaVendaOrcamentoDetalheLocal.add(objeto.toJson);
		}
		jsonDados['listaVendaOrcamentoDetalhe'] = listaVendaOrcamentoDetalheLocal;
	
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


	String objetoEncodeJson(VendaOrcamentoCabecalho objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}