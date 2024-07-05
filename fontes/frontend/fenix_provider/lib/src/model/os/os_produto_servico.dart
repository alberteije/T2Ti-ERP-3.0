/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [OS_PRODUTO_SERVICO] 
                                                                                
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

class OsProdutoServico {
	int? id;
	int? idOsAbertura;
	int? idProduto;
	String? tipo;
	String? complemento;
	double? quantidade;
	double? valorUnitario;
	double? valorSubtotal;
	double? taxaDesconto;
	double? valorDesconto;
	double? valorTotal;
	Produto? produto;

	OsProdutoServico({
		id,
		idOsAbertura,
		idProduto,
		tipo,
		complemento,
		quantidade = 0.0,
		valorUnitario = 0.0,
		valorSubtotal = 0.0,
		taxaDesconto = 0.0,
		valorDesconto = 0.0,
		valorTotal = 0.0,
		produto,
	});

	static List<String> campos = <String>[
		'ID', 
		'TIPO', 
		'COMPLEMENTO', 
		'QUANTIDADE', 
		'VALOR_UNITARIO', 
		'VALOR_SUBTOTAL', 
		'TAXA_DESCONTO', 
		'VALOR_DESCONTO', 
		'VALOR_TOTAL', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Tipo', 
		'Complemento', 
		'Quantidade', 
		'Valor Unitário', 
		'Valor Subtotal', 
		'Taxa Desconto', 
		'Valor Desconto', 
		'Valor Total', 
	];

	OsProdutoServico.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idOsAbertura = jsonDados['idOsAbertura'];
		idProduto = jsonDados['idProduto'];
		tipo = getTipo(jsonDados['tipo']);
		complemento = jsonDados['complemento'];
		quantidade = jsonDados['quantidade']?.toDouble();
		valorUnitario = jsonDados['valorUnitario']?.toDouble();
		valorSubtotal = jsonDados['valorSubtotal']?.toDouble();
		taxaDesconto = jsonDados['taxaDesconto']?.toDouble();
		valorDesconto = jsonDados['valorDesconto']?.toDouble();
		valorTotal = jsonDados['valorTotal']?.toDouble();
		produto = jsonDados['produto'] == null ? null : Produto.fromJson(jsonDados['produto']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idOsAbertura'] = idOsAbertura ?? 0;
		jsonDados['idProduto'] = idProduto ?? 0;
		jsonDados['tipo'] = setTipo(tipo);
		jsonDados['complemento'] = complemento;
		jsonDados['quantidade'] = quantidade;
		jsonDados['valorUnitario'] = valorUnitario;
		jsonDados['valorSubtotal'] = valorSubtotal;
		jsonDados['taxaDesconto'] = taxaDesconto;
		jsonDados['valorDesconto'] = valorDesconto;
		jsonDados['valorTotal'] = valorTotal;
		jsonDados['produto'] = produto == null ? null : produto!.toJson;
	
		return jsonDados;
	}
	
    getTipo(String? tipo) {
    	switch (tipo) {
    		case 'P':
    			return 'Produto';
    		case 'S':
    			return 'Serviço';
    		default:
    			return null;
    		}
    	}

    setTipo(String? tipo) {
    	switch (tipo) {
    		case 'Produto':
    			return 'P';
    		case 'Serviço':
    			return 'S';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(OsProdutoServico objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}