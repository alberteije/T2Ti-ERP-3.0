/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PRODUTO_FICHA_TECNICA] 
                                                                                
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

class ProdutoFichaTecnica {
	int? id;
	int? idProduto;
	String? descricao;
	int? idProdutoFilho;
	double? quantidade;
	int? sequenciaProducao;
	Produto? produto;
	// ProdutoFilho? produtoFilho;

	ProdutoFichaTecnica({
		id,
		idProduto,
		descricao,
		idProdutoFilho,
		quantidade = 0.0,
		sequenciaProducao,
		produto,
		// produtoFilho,
	});

	static List<String> campos = <String>[
		'ID', 
		'DESCRICAO', 
		'QUANTIDADE', 
		'SEQUENCIA_PRODUCAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Descricao', 
		'Quantidade', 
		'Sequencia Producao', 
	];

	ProdutoFichaTecnica.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idProduto = jsonDados['idProduto'];
		descricao = jsonDados['descricao'];
		idProdutoFilho = jsonDados['idProdutoFilho'];
		quantidade = jsonDados['quantidade']?.toDouble();
		sequenciaProducao = jsonDados['sequenciaProducao'];
		produto = jsonDados['produto'] == null ? null : Produto.fromJson(jsonDados['produto']);
		// produtoFilho = jsonDados['produtoFilho'] == null ? null : ProdutoFilho.fromJson(jsonDados['produtoFilho']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idProduto'] = idProduto ?? 0;
		jsonDados['descricao'] = descricao;
		jsonDados['idProdutoFilho'] = idProdutoFilho ?? 0;
		jsonDados['quantidade'] = quantidade;
		jsonDados['sequenciaProducao'] = sequenciaProducao ?? 0;
		jsonDados['produto'] = produto == null ? null : produto!.toJson;
		// jsonDados['produtoFilho'] = produtoFilho == null ? null : produtoFilho!.toJson;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(ProdutoFichaTecnica objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}