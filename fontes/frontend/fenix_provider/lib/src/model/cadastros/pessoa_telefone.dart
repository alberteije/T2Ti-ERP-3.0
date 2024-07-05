/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PESSOA_TELEFONE] 
                                                                                
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

class PessoaTelefone {
	int? id;
	int? idPessoa;
	String? tipo;
	String? numero;
	Pessoa? pessoa;

	PessoaTelefone({
		id,
		idPessoa,
		tipo,
		numero,
		pessoa,
	});

	static List<String> campos = <String>[
		'ID', 
		'TIPO', 
		'NUMERO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Tipo', 
		'Numero', 
	];

	PessoaTelefone.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idPessoa = jsonDados['idPessoa'];
		tipo = getTipo(jsonDados['tipo']);
		numero = jsonDados['numero'];
		pessoa = jsonDados['pessoa'] == null ? null : Pessoa.fromJson(jsonDados['pessoa']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idPessoa'] = idPessoa ?? 0;
		jsonDados['tipo'] = setTipo(tipo);
		jsonDados['numero'] = numero;
		jsonDados['pessoa'] = pessoa == null ? null : pessoa!.toJson;
	
		return jsonDados;
	}
	
    getTipo(String? tipo) {
    	switch (tipo) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setTipo(String? tipo) {
    	switch (tipo) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(PessoaTelefone objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}