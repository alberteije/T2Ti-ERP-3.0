/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [EMPRESA_TELEFONE] 
                                                                                
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

import 'package:fenix/src/infra/biblioteca.dart';

class EmpresaTelefone {
	int? id;
	int? idEmpresa;
	String? tipo;
	String? numero;

	EmpresaTelefone({
		id,
		idEmpresa,
		tipo,
		numero,
	});

	static List<String> campos = <String>[
		'ID', 
		'TIPO', 
		'NUMERO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Tipoe', 
		'Número', 
	];

	EmpresaTelefone.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idEmpresa = jsonDados['idEmpresa'];
		tipo = getTipo(jsonDados['tipo']);
		numero = jsonDados['numero'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idEmpresa'] = idEmpresa ?? 0;
		jsonDados['tipo'] = setTipo(tipo);
		jsonDados['numero'] = Biblioteca.removerMascara(numero);
	
		return jsonDados;
	}
	
    getTipo(String? tipo) {
    	switch (tipo) {
    		case '0':
    			return 'Residencial';
    		case '1':
    			return 'Comercial';
    		case '2':
    			return 'Celular';
    		case '3':
    			return 'Outro';
    		default:
    			return null;
    		}
    	}

    setTipo(String? tipo) {
    	switch (tipo) {
    		case 'Residencial':
    			return '0';
    		case 'Comercial':
    			return '1';
    		case 'Celular':
    			return '2';
    		case 'Outro':
    			return '3';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}