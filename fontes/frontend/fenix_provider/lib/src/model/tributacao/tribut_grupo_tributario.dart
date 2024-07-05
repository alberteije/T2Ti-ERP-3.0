/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [TRIBUT_GRUPO_TRIBUTARIO] 
                                                                                
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


class TributGrupoTributario {
	int? id;
	String? descricao;
	String? origemMercadoria;
	String? observacao;

	TributGrupoTributario({
			id,
			descricao,
			origemMercadoria,
			observacao,
		});

	static List<String> campos = <String>[
		'ID', 
		'DESCRICAO', 
		'ORIGEM_MERCADORIA', 
		'OBSERVACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Descrição', 
		'Origem da Mercadoria', 
		'Observação', 
	];

	TributGrupoTributario.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		descricao = jsonDados['descricao'];
		origemMercadoria = getOrigemMercadoria(jsonDados['origemMercadoria']);
		observacao = jsonDados['observacao'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['descricao'] = descricao;
		jsonDados['origemMercadoria'] = setOrigemMercadoria(origemMercadoria);
		jsonDados['observacao'] = observacao;
	
		return jsonDados;
	}
	
    getOrigemMercadoria(String? origemMercadoria) {
    	switch (origemMercadoria) {
    		case '0':
    			return '0-Nacional';
    		case '1':
    			return '1-Estrangeira - Importação direta';
    		case '2':
    			return '2-Estrangeira - Adquirida no mercado interno';
    		default:
    			return null;
    		}
    	}

    setOrigemMercadoria(String? origemMercadoria) {
    	switch (origemMercadoria) {
    		case '0-Nacional':
    			return '0';
    		case '1-Estrangeira - Importação direta':
    			return '1';
    		case '2-Estrangeira - Adquirida no mercado interno':
    			return '2';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(TributGrupoTributario objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}