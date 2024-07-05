/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_COFINS] 
                                                                                
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


class NfeDetalheImpostoCofins {
	int? id;
	int? idNfeDetalhe;
	String? cstCofins;
	double? baseCalculoCofins;
	double? aliquotaCofinsPercentual;
	double? quantidadeVendida;
	double? aliquotaCofinsReais;
	double? valorCofins;

	NfeDetalheImpostoCofins({
		id,
		idNfeDetalhe,
		cstCofins,
		baseCalculoCofins = 0.0,
		aliquotaCofinsPercentual = 0.0,
		quantidadeVendida = 0.0,
		aliquotaCofinsReais = 0.0,
		valorCofins = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'CST_COFINS', 
		'BASE_CALCULO_COFINS', 
		'ALIQUOTA_COFINS_PERCENTUAL', 
		'QUANTIDADE_VENDIDA', 
		'ALIQUOTA_COFINS_REAIS', 
		'VALOR_COFINS', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'CST COFINS', 
		'Valor BC COFINS', 
		'Alíquota COFINS Percentual', 
		'Quantidade Vendida', 
		'Alíquota COFINS Reais', 
		'Valor COFINS', 
	];

	NfeDetalheImpostoCofins.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeDetalhe = jsonDados['idNfeDetalhe'];
		cstCofins = jsonDados['cstCofins'];
		baseCalculoCofins = jsonDados['baseCalculoCofins']?.toDouble();
		aliquotaCofinsPercentual = jsonDados['aliquotaCofinsPercentual']?.toDouble();
		quantidadeVendida = jsonDados['quantidadeVendida']?.toDouble();
		aliquotaCofinsReais = jsonDados['aliquotaCofinsReais']?.toDouble();
		valorCofins = jsonDados['valorCofins']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeDetalhe'] = idNfeDetalhe ?? 0;
		jsonDados['cstCofins'] = cstCofins;
		jsonDados['baseCalculoCofins'] = baseCalculoCofins;
		jsonDados['aliquotaCofinsPercentual'] = aliquotaCofinsPercentual;
		jsonDados['quantidadeVendida'] = quantidadeVendida;
		jsonDados['aliquotaCofinsReais'] = aliquotaCofinsReais;
		jsonDados['valorCofins'] = valorCofins;
	
		return jsonDados;
	}
	

	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}