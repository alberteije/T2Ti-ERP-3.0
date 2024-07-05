/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CBO] 
                                                                                
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


class Cbo {
	int? id;
	String? codigo;
	String? codigo1994;
	String? nome;
	String? observacao;

	Cbo({
		id,
		codigo,
		codigo1994,
		nome,
		observacao,
	});

	static List<String> campos = <String>[
		'ID', 
		'CODIGO', 
		'CODIGO_1994', 
		'NOME', 
		'OBSERVACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Código CBO 2002', 
		'Código CBO 1994', 
		'Nome', 
		'Observação', 
	];

	Cbo.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		codigo = jsonDados['codigo'];
		codigo1994 = jsonDados['codigo1994'];
		nome = jsonDados['nome'];
		observacao = jsonDados['observacao'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['codigo'] = codigo;
		jsonDados['codigo1994'] = codigo1994;
		jsonDados['nome'] = nome;
		jsonDados['observacao'] = observacao;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(Cbo objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}