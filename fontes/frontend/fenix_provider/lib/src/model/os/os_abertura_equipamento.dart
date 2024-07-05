/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [OS_ABERTURA_EQUIPAMENTO] 
                                                                                
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

class OsAberturaEquipamento {
	int? id;
	int? idOsEquipamento;
	int? idOsAbertura;
	String? numeroSerie;
	String? tipoCobertura;
	OsEquipamento? osEquipamento;

	OsAberturaEquipamento({
			id,
			idOsEquipamento,
			idOsAbertura,
			numeroSerie,
			tipoCobertura,
			osEquipamento,
		});

	static List<String> campos = <String>[
		'ID', 
		'NUMERO_SERIE', 
		'TIPO_COBERTURA', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Número de Série', 
		'Tipo Cobertura', 
	];

	OsAberturaEquipamento.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idOsEquipamento = jsonDados['idOsEquipamento'];
		idOsAbertura = jsonDados['idOsAbertura'];
		numeroSerie = jsonDados['numeroSerie'];
		tipoCobertura = getTipoCobertura(jsonDados['tipoCobertura']);
		osEquipamento = jsonDados['osEquipamento'] == null ? null : OsEquipamento.fromJson(jsonDados['osEquipamento']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idOsEquipamento'] = idOsEquipamento ?? 0;
		jsonDados['idOsAbertura'] = idOsAbertura ?? 0;
		jsonDados['numeroSerie'] = numeroSerie;
		jsonDados['tipoCobertura'] = setTipoCobertura(tipoCobertura);
		jsonDados['osEquipamento'] = osEquipamento == null ? null : osEquipamento!.toJson;
	
		return jsonDados;
	}
	
    getTipoCobertura(String? tipoCobertura) {
    	switch (tipoCobertura) {
    		case '0':
    			return 'Nenhum';
    		case '1':
    			return 'Garantia';
    		case '2':
    			return 'Seguro';
    		case '3':
    			return 'Contrato';
    		default:
    			return null;
    		}
    	}

    setTipoCobertura(String? tipoCobertura) {
    	switch (tipoCobertura) {
    		case 'Nenhum':
    			return '0';
    		case 'Garantia':
    			return '1';
    		case 'Seguro':
    			return '2';
    		case 'Contrato':
    			return '3';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(OsAberturaEquipamento objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}