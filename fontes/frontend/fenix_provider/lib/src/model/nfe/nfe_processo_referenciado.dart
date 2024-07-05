/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_PROCESSO_REFERENCIADO] 
                                                                                
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


class NfeProcessoReferenciado {
	int? id;
	int? idNfeCabecalho;
	String? identificador;
	String? origem;

	NfeProcessoReferenciado({
		id,
		idNfeCabecalho,
		identificador,
		origem,
	});

	static List<String> campos = <String>[
		'ID', 
		'IDENTIFICADOR', 
		'ORIGEM', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Identificador', 
		'Origem', 
	];

	NfeProcessoReferenciado.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeCabecalho = jsonDados['idNfeCabecalho'];
		identificador = jsonDados['identificador'];
		origem = getOrigem(jsonDados['origem']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeCabecalho'] = idNfeCabecalho ?? 0;
		jsonDados['identificador'] = identificador;
		jsonDados['origem'] = setOrigem(origem);
	
		return jsonDados;
	}
	
    getOrigem(String? origem) {
    	switch (origem) {
    		case '0':
    			return '0=SEFAZ';
    		case '1':
    			return '1=Justiça Federal';
    		case '2':
    			return '2=Justiça Estadual';
    		case '3':
    			return '3=Secex/RFB';
    		case '9':
    			return '9=Outros';
    		default:
    			return null;
    		}
    	}

    setOrigem(String? origem) {
    	switch (origem) {
    		case '0=SEFAZ':
    			return '0';
    		case '1=Justiça Federal':
    			return '1';
    		case '2=Justiça Estadual':
    			return '2';
    		case '3=Secex/RFB':
    			return '3';
    		case '9=Outros':
    			return '9';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(NfeProcessoReferenciado objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}