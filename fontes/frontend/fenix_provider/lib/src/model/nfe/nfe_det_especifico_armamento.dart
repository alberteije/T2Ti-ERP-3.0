/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_ARMAMENTO] 
                                                                                
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


class NfeDetEspecificoArmamento {
	int? id;
	int? idNfeDetalhe;
	String? tipoArma;
	String? numeroSerieArma;
	String? numeroSerieCano;
	String? descricao;

	NfeDetEspecificoArmamento({
		id,
		idNfeDetalhe,
		tipoArma,
		numeroSerieArma,
		numeroSerieCano,
		descricao,
	});

	static List<String> campos = <String>[
		'ID', 
		'TIPO_ARMA', 
		'NUMERO_SERIE_ARMA', 
		'NUMERO_SERIE_CANO', 
		'DESCRICAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Indicador Tipo Arma', 
		'Número de Série Arma', 
		'Número de Série Cano', 
		'Descrição', 
	];

	NfeDetEspecificoArmamento.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeDetalhe = jsonDados['idNfeDetalhe'];
		tipoArma = getTipoArma(jsonDados['tipoArma']);
		numeroSerieArma = jsonDados['numeroSerieArma'];
		numeroSerieCano = jsonDados['numeroSerieCano'];
		descricao = jsonDados['descricao'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeDetalhe'] = idNfeDetalhe ?? 0;
		jsonDados['tipoArma'] = setTipoArma(tipoArma);
		jsonDados['numeroSerieArma'] = numeroSerieArma;
		jsonDados['numeroSerieCano'] = numeroSerieCano;
		jsonDados['descricao'] = descricao;
	
		return jsonDados;
	}
	
    getTipoArma(String? tipoArma) {
    	switch (tipoArma) {
    		case '0':
    			return '0=Uso permitido';
    		case '1':
    			return '1=Uso restrito';
    		default:
    			return null;
    		}
    	}

    setTipoArma(String? tipoArma) {
    	switch (tipoArma) {
    		case '0=Uso permitido':
    			return '0';
    		case '1=Uso restrito':
    			return '1';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}