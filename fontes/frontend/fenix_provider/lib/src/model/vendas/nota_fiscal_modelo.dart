/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NOTA_FISCAL_MODELO] 
                                                                                
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

class NotaFiscalModelo {
	int? id;
	String? codigo;
	String? descricao;
	String? modelo;
	List<NotaFiscalTipo>? listaNotaFiscalTipo = [];

	NotaFiscalModelo({
			id,
			codigo,
			descricao,
			modelo,
			listaNotaFiscalTipo,
		});

	static List<String> campos = <String>[
		'ID', 
		'CODIGO', 
		'DESCRICAO', 
		'MODELO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Código do Modelo', 
		'Descrição', 
		'Modelo', 
	];

	NotaFiscalModelo.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		codigo = jsonDados['codigo'];
		descricao = jsonDados['descricao'];
		modelo = jsonDados['modelo'];
		listaNotaFiscalTipo = (jsonDados['listaNotaFiscalTipo'] as Iterable?)?.map((m) => NotaFiscalTipo.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['codigo'] = codigo;
		jsonDados['descricao'] = descricao;
		jsonDados['modelo'] = modelo;
		

		var listaNotaFiscalTipoLocal = [];
		for (NotaFiscalTipo objeto in listaNotaFiscalTipo ?? []) {
			listaNotaFiscalTipoLocal.add(objeto.toJson);
		}
		jsonDados['listaNotaFiscalTipo'] = listaNotaFiscalTipoLocal;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(NotaFiscalModelo objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}