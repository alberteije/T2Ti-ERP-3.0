/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_VEICULO_NOVO] 
                                                                                
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


class CteVeiculoNovo {
	int? id;
	int? idCteCabecalho;
	String? chassi;
	String? cor;
	String? descricaoCor;
	String? codigoMarcaModelo;
	double? valorUnitario;
	double? valorFrete;

	CteVeiculoNovo({
		id,
		idCteCabecalho,
		chassi,
		cor,
		descricaoCor,
		codigoMarcaModelo,
		valorUnitario = 0.0,
		valorFrete = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'CHASSI', 
		'COR', 
		'DESCRICAO_COR', 
		'CODIGO_MARCA_MODELO', 
		'VALOR_UNITARIO', 
		'VALOR_FRETE', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Chassi', 
		'Cor', 
		'Descricao Cor', 
		'Codigo Marca Modelo', 
		'Valor Unitario', 
		'Valor Frete', 
	];

	CteVeiculoNovo.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteCabecalho = jsonDados['idCteCabecalho'];
		chassi = jsonDados['chassi'];
		cor = jsonDados['cor'];
		descricaoCor = jsonDados['descricaoCor'];
		codigoMarcaModelo = jsonDados['codigoMarcaModelo'];
		valorUnitario = jsonDados['valorUnitario']?.toDouble();
		valorFrete = jsonDados['valorFrete']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteCabecalho'] = idCteCabecalho ?? 0;
		jsonDados['chassi'] = chassi;
		jsonDados['cor'] = cor;
		jsonDados['descricaoCor'] = descricaoCor;
		jsonDados['codigoMarcaModelo'] = codigoMarcaModelo;
		jsonDados['valorUnitario'] = valorUnitario;
		jsonDados['valorFrete'] = valorFrete;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CteVeiculoNovo objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}