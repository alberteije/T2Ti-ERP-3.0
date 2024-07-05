/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PRODUTO_PROMOCAO] 
                                                                                
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

class ProdutoPromocao {
	int? id;
	int? idProduto;
	DateTime? dataInicio;
	DateTime? dataFim;
	double? quantidadeEmPromocao;
	double? quantidadeMaximaCliente;
	double? valor;
	Produto? produto;

	ProdutoPromocao({
		id,
		idProduto,
		dataInicio,
		dataFim,
		quantidadeEmPromocao = 0.0,
		quantidadeMaximaCliente = 0.0,
		valor = 0.0,
		produto,
	});

	static List<String> campos = <String>[
		'ID', 
		'DATA_INICIO', 
		'DATA_FIM', 
		'QUANTIDADE_EM_PROMOCAO', 
		'QUANTIDADE_MAXIMA_CLIENTE', 
		'VALOR', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Data Inicio', 
		'Data Fim', 
		'Quantidade Em Promocao', 
		'Quantidade Maxima Cliente', 
		'Valor', 
	];

	ProdutoPromocao.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idProduto = jsonDados['idProduto'];
		dataInicio = jsonDados['dataInicio'] != null ? DateTime.tryParse(jsonDados['dataInicio']) : null;
		dataFim = jsonDados['dataFim'] != null ? DateTime.tryParse(jsonDados['dataFim']) : null;
		quantidadeEmPromocao = jsonDados['quantidadeEmPromocao']?.toDouble();
		quantidadeMaximaCliente = jsonDados['quantidadeMaximaCliente']?.toDouble();
		valor = jsonDados['valor']?.toDouble();
		produto = jsonDados['produto'] == null ? null : Produto.fromJson(jsonDados['produto']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idProduto'] = idProduto ?? 0;
		jsonDados['dataInicio'] = dataInicio != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataInicio!) : null;
		jsonDados['dataFim'] = dataFim != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataFim!) : null;
		jsonDados['quantidadeEmPromocao'] = quantidadeEmPromocao;
		jsonDados['quantidadeMaximaCliente'] = quantidadeMaximaCliente;
		jsonDados['valor'] = valor;
		jsonDados['produto'] = produto == null ? null : produto!.toJson;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(ProdutoPromocao objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}