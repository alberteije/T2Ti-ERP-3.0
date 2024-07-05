/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [TRIBUT_COFINS] 
                                                                                
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


class TributCofins {
	int? id;
	int? idTributConfiguraOfGt;
	String? cstCofins;
	String? efdTabela435;
	String? modalidadeBaseCalculo;
	double? porcentoBaseCalculo;
	double? aliquotaPorcento;
	double? aliquotaUnidade;
	double? valorPrecoMaximo;
	double? valorPautaFiscal;

	TributCofins({
		id,
		idTributConfiguraOfGt,
		cstCofins,
		efdTabela435,
		modalidadeBaseCalculo,
		porcentoBaseCalculo = 0.0,
		aliquotaPorcento = 0.0,
		aliquotaUnidade = 0.0,
		valorPrecoMaximo = 0.0,
		valorPautaFiscal = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'CST_COFINS', 
		'EFD_TABELA_435', 
		'MODALIDADE_BASE_CALCULO', 
		'PORCENTO_BASE_CALCULO', 
		'ALIQUOTA_PORCENTO', 
		'ALIQUOTA_UNIDADE', 
		'VALOR_PRECO_MAXIMO', 
		'VALOR_PAUTA_FISCAL', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'CST COFINS', 
		'EFD 435', 
		'Modalidade Base Cálculo', 
		'Porcento Base Cálculo', 
		'Alíquota Porcento', 
		'Alíquota Unidade', 
		'Valor Preço Máximo', 
		'Valor Pauta Fiscal', 
	];

	TributCofins.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idTributConfiguraOfGt = jsonDados['idTributConfiguraOfGt'];
		cstCofins = jsonDados['cstCofins'];
		efdTabela435 = jsonDados['efdTabela435'];
		modalidadeBaseCalculo = getModalidadeBaseCalculo(jsonDados['modalidadeBaseCalculo']);
		porcentoBaseCalculo = jsonDados['porcentoBaseCalculo']?.toDouble();
		aliquotaPorcento = jsonDados['aliquotaPorcento']?.toDouble();
		aliquotaUnidade = jsonDados['aliquotaUnidade']?.toDouble();
		valorPrecoMaximo = jsonDados['valorPrecoMaximo']?.toDouble();
		valorPautaFiscal = jsonDados['valorPautaFiscal']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idTributConfiguraOfGt'] = idTributConfiguraOfGt ?? 0;
		jsonDados['cstCofins'] = cstCofins;
		jsonDados['efdTabela435'] = efdTabela435;
		jsonDados['modalidadeBaseCalculo'] = setModalidadeBaseCalculo(modalidadeBaseCalculo);
		jsonDados['porcentoBaseCalculo'] = porcentoBaseCalculo;
		jsonDados['aliquotaPorcento'] = aliquotaPorcento;
		jsonDados['aliquotaUnidade'] = aliquotaUnidade;
		jsonDados['valorPrecoMaximo'] = valorPrecoMaximo;
		jsonDados['valorPautaFiscal'] = valorPautaFiscal;
	
		return jsonDados;
	}
	
    getModalidadeBaseCalculo(String? modalidadeBaseCalculo) {
    	switch (modalidadeBaseCalculo) {
    		case '0':
    			return '0-Percentual';
    		case '1':
    			return '1-Unidade';
    		default:
    			return null;
    		}
    	}

    setModalidadeBaseCalculo(String? modalidadeBaseCalculo) {
    	switch (modalidadeBaseCalculo) {
    		case '0-Percentual':
    			return '0';
    		case '1-Unidade':
    			return '1';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(TributCofins objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}