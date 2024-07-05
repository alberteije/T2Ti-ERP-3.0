/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_RODOVIARIO] 
                                                                                
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

class CteRodoviario {
	int? id;
	int? idCteCabecalho;
	String? rntrc;
	DateTime? dataPrevistaEntrega;
	String? indicadorLotacao;
	int? ciot;

	CteRodoviario({
		id,
		idCteCabecalho,
		rntrc,
		dataPrevistaEntrega,
		indicadorLotacao,
		ciot,
	});

	static List<String> campos = <String>[
		'ID', 
		'RNTRC', 
		'DATA_PREVISTA_ENTREGA', 
		'INDICADOR_LOTACAO', 
		'CIOT', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'RNTRC', 
		'Previsão de Entrega', 
		'Indicador Lotação', 
		'CIOT', 
	];

	CteRodoviario.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteCabecalho = jsonDados['idCteCabecalho'];
		rntrc = jsonDados['rntrc'];
		dataPrevistaEntrega = jsonDados['dataPrevistaEntrega'] != null ? DateTime.tryParse(jsonDados['dataPrevistaEntrega']) : null;
		indicadorLotacao = getIndicadorLotacao(jsonDados['indicadorLotacao']);
		ciot = jsonDados['ciot'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteCabecalho'] = idCteCabecalho ?? 0;
		jsonDados['rntrc'] = rntrc;
		jsonDados['dataPrevistaEntrega'] = dataPrevistaEntrega != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataPrevistaEntrega!) : null;
		jsonDados['indicadorLotacao'] = setIndicadorLotacao(indicadorLotacao);
		jsonDados['ciot'] = ciot ?? 0;
	
		return jsonDados;
	}
	
    getIndicadorLotacao(String? indicadorLotacao) {
    	switch (indicadorLotacao) {
    		case ' ':
    			return ' 0 - Não';
    		case '1':
    			return '1 - Sim';
    		default:
    			return null;
    		}
    	}

    setIndicadorLotacao(String? indicadorLotacao) {
    	switch (indicadorLotacao) {
    		case ' 0 - Não':
    			return ' ';
    		case '1 - Sim':
    			return '1';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(CteRodoviario objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}