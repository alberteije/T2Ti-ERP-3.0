/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [OS_EVOLUCAO] 
                                                                                
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
import 'package:fenix/src/infra/biblioteca.dart';

class OsEvolucao {
	int? id;
	int? idOsAbertura;
	DateTime? dataRegistro;
	String? horaRegistro;
	String? observacao;
	String? enviarEmail;

	OsEvolucao({
			id,
			idOsAbertura,
			dataRegistro,
			horaRegistro,
			observacao,
			enviarEmail,
		});

	static List<String> campos = <String>[
		'ID', 
		'DATA_REGISTRO', 
		'HORA_REGISTRO', 
		'OBSERVACAO', 
		'ENVIAR_EMAIL', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Data do Registro', 
		'Hora do Registro', 
		'Observação', 
		'Enviar E-mail', 
	];

	OsEvolucao.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idOsAbertura = jsonDados['idOsAbertura'];
		dataRegistro = jsonDados['dataRegistro'] != null ? DateTime.tryParse(jsonDados['dataRegistro']) : null;
		horaRegistro = jsonDados['horaRegistro'];
		observacao = jsonDados['observacao'];
		enviarEmail = getEnviarEmail(jsonDados['enviarEmail']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idOsAbertura'] = idOsAbertura ?? 0;
		jsonDados['dataRegistro'] = dataRegistro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataRegistro!) : null;
		jsonDados['horaRegistro'] = Biblioteca.removerMascara(horaRegistro);
		jsonDados['observacao'] = observacao;
		jsonDados['enviarEmail'] = setEnviarEmail(enviarEmail);
	
		return jsonDados;
	}
	
    getEnviarEmail(String? enviarEmail) {
    	switch (enviarEmail) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setEnviarEmail(String? enviarEmail) {
    	switch (enviarEmail) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(OsEvolucao objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}