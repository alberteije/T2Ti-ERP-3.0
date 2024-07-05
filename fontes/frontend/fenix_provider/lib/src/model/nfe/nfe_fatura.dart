/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_FATURA] 
                                                                                
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

class NfeFatura {
	int? id;
	int? idNfeCabecalho;
	String? numero;
	double? valorOriginal;
	double? valorDesconto;
	double? valorLiquido;
	 List<NfeDuplicata>? listaNfeDuplicata = [];

	NfeFatura({
		id,
		idNfeCabecalho,
		numero,
		valorOriginal = 0.0,
		valorDesconto = 0.0,
		valorLiquido = 0.0,
		listaNfeDuplicata,
	});

	static List<String> campos = <String>[
		'ID', 
		'NUMERO', 
		'VALOR_ORIGINAL', 
		'VALOR_DESCONTO', 
		'VALOR_LIQUIDO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Número', 
		'Valor Original', 
		'Valor Desconto', 
		'Valor Líquido', 
	];

	NfeFatura.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeCabecalho = jsonDados['idNfeCabecalho'];
		numero = jsonDados['numero'];
		valorOriginal = jsonDados['valorOriginal']?.toDouble();
		valorDesconto = jsonDados['valorDesconto']?.toDouble();
		valorLiquido = jsonDados['valorLiquido']?.toDouble();
		listaNfeDuplicata = (jsonDados['listaNfeDuplicata'] as Iterable?)?.map((m) => NfeDuplicata.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeCabecalho'] = idNfeCabecalho ?? 0;
		jsonDados['numero'] = numero;
		jsonDados['valorOriginal'] = valorOriginal;
		jsonDados['valorDesconto'] = valorDesconto;
		jsonDados['valorLiquido'] = valorLiquido;
		

		var listaNfeDuplicataLocal = [];
		for (NfeDuplicata objeto in listaNfeDuplicata ?? []) {
			listaNfeDuplicataLocal.add(objeto.toJson);
		}
		jsonDados['listaNfeDuplicata'] = listaNfeDuplicataLocal;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(NfeFatura objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}