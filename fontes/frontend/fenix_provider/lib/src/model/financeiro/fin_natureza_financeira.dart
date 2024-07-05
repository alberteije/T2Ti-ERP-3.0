/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FIN_NATUREZA_FINANCEIRA] 
                                                                                
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


class FinNaturezaFinanceira {
	int? id;
	String? codigo;
	String? descricao;
	String? tipo;
	String? aplicacao;

	FinNaturezaFinanceira({
			id,
			codigo,
			descricao,
			tipo,
			aplicacao,
		});

	static List<String> campos = <String>[
		'ID', 
		'CODIGO', 
		'DESCRICAO', 
		'TIPO', 
		'APLICACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Código', 
		'Descrição', 
		'Tipo', 
		'Aplicação', 
	];

	FinNaturezaFinanceira.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		codigo = jsonDados['codigo'];
		descricao = jsonDados['descricao'];
		tipo = getTipo(jsonDados['tipo']);
		aplicacao = jsonDados['aplicacao'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['codigo'] = codigo;
		jsonDados['descricao'] = descricao;
		jsonDados['tipo'] = setTipo(tipo);
		jsonDados['aplicacao'] = aplicacao;
	
		return jsonDados;
	}
	
    getTipo(String? tipo) {
    	switch (tipo) {
    		case 'R':
    			return 'Receita';
    		case 'D':
    			return 'Despesa';
    		default:
    			return null;
    		}
    	}

    setTipo(String? tipo) {
    	switch (tipo) {
    		case 'Receita':
    			return 'R';
    		case 'Despesa':
    			return 'D';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(FinNaturezaFinanceira objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}