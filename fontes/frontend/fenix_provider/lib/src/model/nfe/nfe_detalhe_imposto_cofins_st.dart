/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_COFINS_ST] 
                                                                                
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


class NfeDetalheImpostoCofinsSt {
	int? id;
	int? idNfeDetalhe;
	double? baseCalculoCofinsSt;
	double? aliquotaCofinsStPercentual;
	double? quantidadeVendidaCofinsSt;
	double? aliquotaCofinsStReais;
	double? valorCofinsSt;

	NfeDetalheImpostoCofinsSt({
		id,
		idNfeDetalhe,
		baseCalculoCofinsSt = 0.0,
		aliquotaCofinsStPercentual = 0.0,
		quantidadeVendidaCofinsSt = 0.0,
		aliquotaCofinsStReais = 0.0,
		valorCofinsSt = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'BASE_CALCULO_COFINS_ST', 
		'ALIQUOTA_COFINS_ST_PERCENTUAL', 
		'QUANTIDADE_VENDIDA_COFINS_ST', 
		'ALIQUOTA_COFINS_ST_REAIS', 
		'VALOR_COFINS_ST', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Valor BC COFINS ST', 
		'Alíquota COFINS ST Percentual', 
		'Quantidade Venda COFINS ST', 
		'Alíquota COFINS ST Reais', 
		'Valor COFINS ST', 
	];

	NfeDetalheImpostoCofinsSt.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeDetalhe = jsonDados['idNfeDetalhe'];
		baseCalculoCofinsSt = jsonDados['baseCalculoCofinsSt']?.toDouble();
		aliquotaCofinsStPercentual = jsonDados['aliquotaCofinsStPercentual']?.toDouble();
		quantidadeVendidaCofinsSt = jsonDados['quantidadeVendidaCofinsSt']?.toDouble();
		aliquotaCofinsStReais = jsonDados['aliquotaCofinsStReais']?.toDouble();
		valorCofinsSt = jsonDados['valorCofinsSt']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeDetalhe'] = idNfeDetalhe ?? 0;
		jsonDados['baseCalculoCofinsSt'] = baseCalculoCofinsSt;
		jsonDados['aliquotaCofinsStPercentual'] = aliquotaCofinsStPercentual;
		jsonDados['quantidadeVendidaCofinsSt'] = quantidadeVendidaCofinsSt;
		jsonDados['aliquotaCofinsStReais'] = aliquotaCofinsStReais;
		jsonDados['valorCofinsSt'] = valorCofinsSt;
	
		return jsonDados;
	}
	

	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}