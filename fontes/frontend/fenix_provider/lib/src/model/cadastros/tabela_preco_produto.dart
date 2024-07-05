/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [TABELA_PRECO_PRODUTO] 
                                                                                
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

class TabelaPrecoProduto {
	int? id;
	int? idTabelaPreco;
	int? idProduto;
	double? preco;
	Produto? produto;

	TabelaPrecoProduto({
		id,
		idTabelaPreco,
		idProduto,
		preco = 0.0,
		produto,
	});

	static List<String> campos = <String>[
		'ID', 
		'PRECO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Preço', 
	];

	TabelaPrecoProduto.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idTabelaPreco = jsonDados['idTabelaPreco'];
		idProduto = jsonDados['idProduto'];
		preco = jsonDados['preco']?.toDouble();
		produto = jsonDados['produto'] == null ? null : Produto.fromJson(jsonDados['produto']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idTabelaPreco'] = idTabelaPreco ?? 0;
		jsonDados['idProduto'] = idProduto ?? 0;
		jsonDados['preco'] = preco;
		jsonDados['produto'] = produto == null ? null : produto!.toJson;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(TabelaPrecoProduto objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}