/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [COMPRA_PEDIDO_DETALHE] 
                                                                                
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

import 'package:fenix/src/model/model.dart';

class CompraPedidoDetalhe {
	int? id;
	int? idCompraPedido;
	int? idProduto;
	double? quantidade;
	double? valorUnitario;
	double? valorSubtotal;
	double? taxaDesconto;
	double? valorDesconto;
	double? valorTotal;
	String? cst;
	String? csosn;
	int? cfop;
	double? baseCalculoIcms;
	double? valorIcms;
	double? valorIpi;
	double? aliquotaIcms;
	double? aliquotaIpi;
	Produto? produto;

	CompraPedidoDetalhe({
			id,
			idCompraPedido,
			idProduto,
			quantidade,
			valorUnitario,
			valorSubtotal,
			taxaDesconto,
			valorDesconto,
			valorTotal,
			cst,
			csosn,
			cfop,
			baseCalculoIcms,
			valorIcms,
			valorIpi,
			aliquotaIcms,
			aliquotaIpi,
			produto,
		});

	static List<String> campos = <String>[
		'ID', 
		'QUANTIDADE', 
		'VALOR_UNITARIO', 
		'VALOR_SUBTOTAL', 
		'TAXA_DESCONTO', 
		'VALOR_DESCONTO', 
		'VALOR_TOTAL', 
		'CST', 
		'CSOSN', 
		'CFOP', 
		'BASE_CALCULO_ICMS', 
		'VALOR_ICMS', 
		'VALOR_IPI', 
		'ALIQUOTA_ICMS', 
		'ALIQUOTA_IPI', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Quantidade', 
		'Valor Unitário', 
		'Valor Subtotal', 
		'Taxa Desconto', 
		'Valor Desconto', 
		'Valor Total', 
		'CST', 
		'CSOSN', 
		'CFOP', 
		'CFOP', 
		'Valor do ICMS', 
		'Valor do IPI', 
		'Alíquota do ICMS', 
		'Alíquota do IPI', 
	];

	CompraPedidoDetalhe.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCompraPedido = jsonDados['idCompraPedido'];
		idProduto = jsonDados['idProduto'];
		quantidade = jsonDados['quantidade']?.toDouble();
		valorUnitario = jsonDados['valorUnitario']?.toDouble();
		valorSubtotal = jsonDados['valorSubtotal']?.toDouble();
		taxaDesconto = jsonDados['taxaDesconto']?.toDouble();
		valorDesconto = jsonDados['valorDesconto']?.toDouble();
		valorTotal = jsonDados['valorTotal']?.toDouble();
		cst = jsonDados['cst'];
		csosn = jsonDados['csosn'];
		cfop = jsonDados['cfop'];
		baseCalculoIcms = jsonDados['baseCalculoIcms']?.toDouble();
		valorIcms = jsonDados['valorIcms']?.toDouble();
		valorIpi = jsonDados['valorIpi']?.toDouble();
		aliquotaIcms = jsonDados['aliquotaIcms']?.toDouble();
		aliquotaIpi = jsonDados['aliquotaIpi']?.toDouble();
		produto = jsonDados['produto'] == null ? null : Produto.fromJson(jsonDados['produto']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCompraPedido'] = idCompraPedido ?? 0;
		jsonDados['idProduto'] = idProduto ?? 0;
		jsonDados['quantidade'] = quantidade;
		jsonDados['valorUnitario'] = valorUnitario;
		jsonDados['valorSubtotal'] = valorSubtotal;
		jsonDados['taxaDesconto'] = taxaDesconto;
		jsonDados['valorDesconto'] = valorDesconto;
		jsonDados['valorTotal'] = valorTotal;
		jsonDados['cst'] = cst;
		jsonDados['csosn'] = csosn;
		jsonDados['cfop'] = cfop ?? 0;
		jsonDados['baseCalculoIcms'] = baseCalculoIcms;
		jsonDados['valorIcms'] = valorIcms;
		jsonDados['valorIpi'] = valorIpi;
		jsonDados['aliquotaIcms'] = aliquotaIcms;
		jsonDados['aliquotaIpi'] = aliquotaIpi;
		jsonDados['produto'] = produto == null ? null : produto!.toJson;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CompraPedidoDetalhe objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}