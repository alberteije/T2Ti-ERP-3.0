/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_DUTOVIARIO] 
                                                                                
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

class CteDutoviario {
	int? id;
	int? idCteCabecalho;
	double? valorTarifa;
	DateTime? dataInicio;
	DateTime? dataFim;

	CteDutoviario({
		id,
		idCteCabecalho,
		valorTarifa = 0.0,
		dataInicio,
		dataFim,
	});

	static List<String> campos = <String>[
		'ID', 
		'VALOR_TARIFA', 
		'DATA_INICIO', 
		'DATA_FIM', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Valor Tarifa', 
		'Data Inicio', 
		'Data Fim', 
	];

	CteDutoviario.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteCabecalho = jsonDados['idCteCabecalho'];
		valorTarifa = jsonDados['valorTarifa']?.toDouble();
		dataInicio = jsonDados['dataInicio'] != null ? DateTime.tryParse(jsonDados['dataInicio']) : null;
		dataFim = jsonDados['dataFim'] != null ? DateTime.tryParse(jsonDados['dataFim']) : null;
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteCabecalho'] = idCteCabecalho ?? 0;
		jsonDados['valorTarifa'] = valorTarifa;
		jsonDados['dataInicio'] = dataInicio != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataInicio!) : null;
		jsonDados['dataFim'] = dataFim != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataFim!) : null;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CteDutoviario objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}