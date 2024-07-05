/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [COMPRA_REQUISICAO] 
                                                                                
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

class CompraRequisicao {
	int? id;
	int? idCompraTipoRequisicao;
	int? idColaborador;
	String? descricao;
	DateTime? dataRequisicao;
	String? observacao;
	CompraTipoRequisicao? compraTipoRequisicao;
	Colaborador? colaborador;
	List<CompraRequisicaoDetalhe>? listaCompraRequisicaoDetalhe = [];

	CompraRequisicao({
			id,
			idCompraTipoRequisicao,
			idColaborador,
			descricao,
			dataRequisicao,
			observacao,
			compraTipoRequisicao,
			colaborador,
			listaCompraRequisicaoDetalhe,
		});

	static List<String> campos = <String>[
		'ID', 
		'DESCRICAO', 
		'DATA_REQUISICAO', 
		'OBSERVACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Descrição', 
		'Data da Requisição', 
		'Observação', 
	];

	CompraRequisicao.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCompraTipoRequisicao = jsonDados['idCompraTipoRequisicao'];
		idColaborador = jsonDados['idColaborador'];
		descricao = jsonDados['descricao'];
		dataRequisicao = jsonDados['dataRequisicao'] != null ? DateTime.tryParse(jsonDados['dataRequisicao']) : null;
		observacao = jsonDados['observacao'];
		compraTipoRequisicao = jsonDados['compraTipoRequisicao'] == null ? null : CompraTipoRequisicao.fromJson(jsonDados['compraTipoRequisicao']);
		colaborador = jsonDados['colaborador'] == null ? null : Colaborador.fromJson(jsonDados['colaborador']);
		listaCompraRequisicaoDetalhe = (jsonDados['listaCompraRequisicaoDetalhe'] as Iterable?)?.map((m) => CompraRequisicaoDetalhe.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCompraTipoRequisicao'] = idCompraTipoRequisicao ?? 0;
		jsonDados['idColaborador'] = idColaborador ?? 0;
		jsonDados['descricao'] = descricao;
		jsonDados['dataRequisicao'] = dataRequisicao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataRequisicao!) : null;
		jsonDados['observacao'] = observacao;
		jsonDados['compraTipoRequisicao'] = compraTipoRequisicao == null ? null : compraTipoRequisicao!.toJson;
		jsonDados['colaborador'] = colaborador == null ? null : colaborador!.toJson;
		

		var listaCompraRequisicaoDetalheLocal = [];
		for (CompraRequisicaoDetalhe objeto in listaCompraRequisicaoDetalhe ?? []) {
			listaCompraRequisicaoDetalheLocal.add(objeto.toJson);
		}
		jsonDados['listaCompraRequisicaoDetalhe'] = listaCompraRequisicaoDetalheLocal;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CompraRequisicao objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}