/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_EXPORTACAO] 
                                                                                
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


class NfeExportacao {
	int? id;
	int? idNfeDetalhe;
	int? drawback;
	int? numeroRegistro;
	String? chaveAcesso;
	double? quantidade;

	NfeExportacao({
		id,
		idNfeDetalhe,
		drawback,
		numeroRegistro,
		chaveAcesso,
		quantidade = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'DRAWBACK', 
		'NUMERO_REGISTRO', 
		'CHAVE_ACESSO', 
		'QUANTIDADE', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Drawback', 
		'Número Registro', 
		'Chave de Acesso', 
		'Quantidade', 
	];

	NfeExportacao.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeDetalhe = jsonDados['idNfeDetalhe'];
		drawback = jsonDados['drawback'];
		numeroRegistro = jsonDados['numeroRegistro'];
		chaveAcesso = jsonDados['chaveAcesso'];
		quantidade = jsonDados['quantidade']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeDetalhe'] = idNfeDetalhe ?? 0;
		jsonDados['drawback'] = drawback ?? 0;
		jsonDados['numeroRegistro'] = numeroRegistro ?? 0;
		jsonDados['chaveAcesso'] = chaveAcesso;
		jsonDados['quantidade'] = quantidade;
	
		return jsonDados;
	}
	

	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}