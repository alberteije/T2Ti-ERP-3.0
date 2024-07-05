/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_DOCUMENTO_ANTERIOR_ID] 
                                                                                
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

class CteDocumentoAnteriorId {
	int? id;
	int? idCteDocumentoAnterior;
	String? tipo;
	String? serie;
	String? subserie;
	String? numero;
	DateTime? dataEmissao;
	String? chaveCte;

	CteDocumentoAnteriorId({
		id,
		idCteDocumentoAnterior,
		tipo,
		serie,
		subserie,
		numero,
		dataEmissao,
		chaveCte,
	});

	static List<String> campos = <String>[
		'ID', 
		'TIPO', 
		'SERIE', 
		'SUBSERIE', 
		'NUMERO', 
		'DATA_EMISSAO', 
		'CHAVE_CTE', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Tipo', 
		'Serie', 
		'Subserie', 
		'Numero', 
		'Data Emissao', 
		'Chave Cte', 
	];

	CteDocumentoAnteriorId.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteDocumentoAnterior = jsonDados['idCteDocumentoAnterior'];
		tipo = jsonDados['tipo'];
		serie = jsonDados['serie'];
		subserie = jsonDados['subserie'];
		numero = jsonDados['numero'];
		dataEmissao = jsonDados['dataEmissao'] != null ? DateTime.tryParse(jsonDados['dataEmissao']) : null;
		chaveCte = jsonDados['chaveCte'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteDocumentoAnterior'] = idCteDocumentoAnterior ?? 0;
		jsonDados['tipo'] = tipo;
		jsonDados['serie'] = serie;
		jsonDados['subserie'] = subserie;
		jsonDados['numero'] = numero;
		jsonDados['dataEmissao'] = dataEmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEmissao!) : null;
		jsonDados['chaveCte'] = chaveCte;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CteDocumentoAnteriorId objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}