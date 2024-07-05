/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [INVENTARIO_CONTAGEM_CAB] 
                                                                                
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

class InventarioContagemCab {
	int? id;
	DateTime? dataContagem;
	String? estoqueAtualizado;
	String? tipo;
	List<InventarioContagemDet>? listaInventarioContagemDet = [];

	InventarioContagemCab({
		id,
		dataContagem,
		estoqueAtualizado,
		tipo,
		listaInventarioContagemDet,
	});

	static List<String> campos = <String>[
		'ID', 
		'DATA_CONTAGEM', 
		'ESTOQUE_ATUALIZADO', 
		'TIPO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Data da Contagem', 
		'Estoque Atualizado', 
		'Tipo', 
	];

	InventarioContagemCab.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		dataContagem = jsonDados['dataContagem'] != null ? DateTime.tryParse(jsonDados['dataContagem']) : null;
		estoqueAtualizado = getEstoqueAtualizado(jsonDados['estoqueAtualizado']);
		tipo = getTipo(jsonDados['tipo']);
		listaInventarioContagemDet = (jsonDados['listaInventarioContagemDet'] as Iterable?)?.map((m) => InventarioContagemDet.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['dataContagem'] = dataContagem != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataContagem!) : null;
		jsonDados['estoqueAtualizado'] = setEstoqueAtualizado(estoqueAtualizado);
		jsonDados['tipo'] = setTipo(tipo);
		

		var listaInventarioContagemDetLocal = [];
		for (InventarioContagemDet objeto in listaInventarioContagemDet ?? []) {
			listaInventarioContagemDetLocal.add(objeto.toJson);
		}
		jsonDados['listaInventarioContagemDet'] = listaInventarioContagemDetLocal;
	
		return jsonDados;
	}
	
    getEstoqueAtualizado(String? estoqueAtualizado) {
    	switch (estoqueAtualizado) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setEstoqueAtualizado(String? estoqueAtualizado) {
    	switch (estoqueAtualizado) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getTipo(String? tipo) {
    	switch (tipo) {
    		case 'G':
    			return 'G=Geral';
    		case 'D':
    			return 'D=Dinâmico';
    		case 'R':
    			return 'R=Rotativo';
    		case 'A':
    			return 'A=por Amostragem';
    		default:
    			return null;
    		}
    	}

    setTipo(String? tipo) {
    	switch (tipo) {
    		case 'G=Geral':
    			return 'G';
    		case 'D=Dinâmico':
    			return 'D';
    		case 'R=Rotativo':
    			return 'R';
    		case 'A=por Amostragem':
    			return 'A';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}