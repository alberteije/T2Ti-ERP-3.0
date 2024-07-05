/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_RODOVIARIO_OCC] 
                                                                                
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

class CteRodoviarioOcc {
	int? id;
	int? idCteRodoviario;
	String? serie;
	int? numero;
	DateTime? dataEmissao;
	String? cnpj;
	String? codigoInterno;
	String? ie;
	String? uf;
	String? telefone;

	CteRodoviarioOcc({
		id,
		idCteRodoviario,
		serie,
		numero,
		dataEmissao,
		cnpj,
		codigoInterno,
		ie,
		uf,
		telefone,
	});

	static List<String> campos = <String>[
		'ID', 
		'SERIE', 
		'NUMERO', 
		'DATA_EMISSAO', 
		'CNPJ', 
		'CODIGO_INTERNO', 
		'IE', 
		'UF', 
		'TELEFONE', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Serie', 
		'Numero', 
		'Data Emissao', 
		'Cnpj', 
		'Codigo Interno', 
		'Ie', 
		'Uf', 
		'Telefone', 
	];

	CteRodoviarioOcc.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteRodoviario = jsonDados['idCteRodoviario'];
		serie = jsonDados['serie'];
		numero = jsonDados['numero'];
		dataEmissao = jsonDados['dataEmissao'] != null ? DateTime.tryParse(jsonDados['dataEmissao']) : null;
		cnpj = jsonDados['cnpj'];
		codigoInterno = jsonDados['codigoInterno'];
		ie = jsonDados['ie'];
		uf = jsonDados['uf'];
		telefone = jsonDados['telefone'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteRodoviario'] = idCteRodoviario ?? 0;
		jsonDados['serie'] = serie;
		jsonDados['numero'] = numero ?? 0;
		jsonDados['dataEmissao'] = dataEmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEmissao!) : null;
		jsonDados['cnpj'] = cnpj;
		jsonDados['codigoInterno'] = codigoInterno;
		jsonDados['ie'] = ie;
		jsonDados['uf'] = uf;
		jsonDados['telefone'] = telefone;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CteRodoviarioOcc objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}