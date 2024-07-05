/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VENDA_CONDICOES_PARCELAS] 
                                                                                
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


class VendaCondicoesParcelas {
	int? id;
	int? idVendaCondicoesPagamento;
	int? parcela;
	int? dias;
	double? taxa;

	VendaCondicoesParcelas({
		id,
		idVendaCondicoesPagamento,
		parcela,
		dias,
		taxa = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'PARCELA', 
		'DIAS', 
		'TAXA', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Número da Parcela', 
		'Dias', 
		'Taxa da Parcela', 
	];

	VendaCondicoesParcelas.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idVendaCondicoesPagamento = jsonDados['idVendaCondicoesPagamento'];
		parcela = jsonDados['parcela'];
		dias = jsonDados['dias'];
		taxa = jsonDados['taxa']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idVendaCondicoesPagamento'] = idVendaCondicoesPagamento ?? 0;
		jsonDados['parcela'] = parcela ?? 0;
		jsonDados['dias'] = dias ?? 0;
		jsonDados['taxa'] = taxa;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(VendaCondicoesParcelas objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}