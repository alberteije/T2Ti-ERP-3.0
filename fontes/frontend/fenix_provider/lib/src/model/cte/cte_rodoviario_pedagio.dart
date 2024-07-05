/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_RODOVIARIO_PEDAGIO] 
                                                                                
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


class CteRodoviarioPedagio {
	int? id;
	int? idCteRodoviario;
	String? cnpjFornecedor;
	String? comprovanteCompra;
	String? cnpjResponsavel;
	double? valor;

	CteRodoviarioPedagio({
		id,
		idCteRodoviario,
		cnpjFornecedor,
		comprovanteCompra,
		cnpjResponsavel,
		valor = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'CNPJ_FORNECEDOR', 
		'COMPROVANTE_COMPRA', 
		'CNPJ_RESPONSAVEL', 
		'VALOR', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Cnpj Fornecedor', 
		'Comprovante Compra', 
		'Cnpj Responsavel', 
		'Valor', 
	];

	CteRodoviarioPedagio.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteRodoviario = jsonDados['idCteRodoviario'];
		cnpjFornecedor = jsonDados['cnpjFornecedor'];
		comprovanteCompra = jsonDados['comprovanteCompra'];
		cnpjResponsavel = jsonDados['cnpjResponsavel'];
		valor = jsonDados['valor']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteRodoviario'] = idCteRodoviario ?? 0;
		jsonDados['cnpjFornecedor'] = cnpjFornecedor;
		jsonDados['comprovanteCompra'] = comprovanteCompra;
		jsonDados['cnpjResponsavel'] = cnpjResponsavel;
		jsonDados['valor'] = valor;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CteRodoviarioPedagio objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}