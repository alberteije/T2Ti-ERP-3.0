/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [COMPRA_COTACAO] 
                                                                                
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

class CompraCotacao {
	int? id;
	int? idCompraRequisicao;
	DateTime? dataCotacao;
	String? descricao;
	CompraRequisicao? compraRequisicao;
	List<CompraFornecedorCotacao>? listaCompraFornecedorCotacao = [];

	CompraCotacao({
			id,
			idCompraRequisicao,
			dataCotacao,
			descricao,
			compraRequisicao,
			listaCompraFornecedorCotacao,
		});

	static List<String> campos = <String>[
		'ID', 
		'DATA_COTACAO', 
		'DESCRICAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Data da Cotação', 
		'Descrição', 
	];

	CompraCotacao.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCompraRequisicao = jsonDados['idCompraRequisicao'];
		dataCotacao = jsonDados['dataCotacao'] != null ? DateTime.tryParse(jsonDados['dataCotacao']) : null;
		descricao = jsonDados['descricao'];
		compraRequisicao = jsonDados['compraRequisicao'] == null ? null : CompraRequisicao.fromJson(jsonDados['compraRequisicao']);
		listaCompraFornecedorCotacao = (jsonDados['listaCompraFornecedorCotacao'] as Iterable?)?.map((m) => CompraFornecedorCotacao.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCompraRequisicao'] = idCompraRequisicao ?? 0;
		jsonDados['dataCotacao'] = dataCotacao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataCotacao!) : null;
		jsonDados['descricao'] = descricao;
		jsonDados['compraRequisicao'] = compraRequisicao == null ? null : compraRequisicao!.toJson;
		

		var listaCompraFornecedorCotacaoLocal = [];
		for (CompraFornecedorCotacao objeto in listaCompraFornecedorCotacao ?? []) {
			listaCompraFornecedorCotacaoLocal.add(objeto.toJson);
		}
		jsonDados['listaCompraFornecedorCotacao'] = listaCompraFornecedorCotacaoLocal;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CompraCotacao objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}