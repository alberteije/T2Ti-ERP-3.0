/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_CARGA] 
                                                                                
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


class CteCarga {
	int? id;
	int? idCteCabecalho;
	String? codigoUnidadeMedida;
	String? tipoMedida;
	double? quantidade;

	CteCarga({
		id,
		idCteCabecalho,
		codigoUnidadeMedida,
		tipoMedida,
		quantidade = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'CODIGO_UNIDADE_MEDIDA', 
		'TIPO_MEDIDA', 
		'QUANTIDADE', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Código Unidade Medida', 
		'Tipo Medida', 
		'Quantidade', 
	];

	CteCarga.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteCabecalho = jsonDados['idCteCabecalho'];
		codigoUnidadeMedida = getCodigoUnidadeMedida(jsonDados['codigoUnidadeMedida']);
		tipoMedida = getTipoMedida(jsonDados['tipoMedida']);
		quantidade = jsonDados['quantidade']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteCabecalho'] = idCteCabecalho ?? 0;
		jsonDados['codigoUnidadeMedida'] = setCodigoUnidadeMedida(codigoUnidadeMedida);
		jsonDados['tipoMedida'] = setTipoMedida(tipoMedida);
		jsonDados['quantidade'] = quantidade;
	
		return jsonDados;
	}
	
    getCodigoUnidadeMedida(String? codigoUnidadeMedida) {
    	switch (codigoUnidadeMedida) {
    		case '0':
    			return '00-M3';
    		case '1':
    			return '01-KG';
    		case '2':
    			return '02-TON';
    		case '3':
    			return '03-UNIDADE';
    		case '4':
    			return '04-LITROS';
    		case '5':
    			return '05-MMBTU';
    		default:
    			return null;
    		}
    	}

    setCodigoUnidadeMedida(String? codigoUnidadeMedida) {
    	switch (codigoUnidadeMedida) {
    		case '00-M3':
    			return '0';
    		case '01-KG':
    			return '0';
    		case '02-TON':
    			return '0';
    		case '03-UNIDADE':
    			return '0';
    		case '04-LITROS':
    			return '0';
    		case '05-MMBTU':
    			return '0';
    		default:
    			return null;
    		}
    	}

    getTipoMedida(String? tipoMedida) {
    	switch (tipoMedida) {
    		case '0':
    			return 'PESO BRUTO';
    		case '1':
    			return 'PESO DECLARADO';
    		case '2':
    			return 'PESO CUBADO';
    		case '3':
    			return 'PESO AFORADO';
    		case '4':
    			return 'PESO AFERIDO';
    		case '5':
    			return 'PESO BASE DE  CÁLCULO';
    		case '6':
    			return 'LITRAGEM';
    		case '7':
    			return 'CAIXAS';
    		default:
    			return null;
    		}
    	}

    setTipoMedida(String? tipoMedida) {
    	switch (tipoMedida) {
    		case 'PESO BRUTO':
    			return 'P';
    		case 'PESO DECLARADO':
    			return 'P';
    		case 'PESO CUBADO':
    			return 'P';
    		case 'PESO AFORADO':
    			return 'P';
    		case 'PESO AFERIDO':
    			return 'P';
    		case 'PESO BASE DE  CÁLCULO':
    			return 'P';
    		case 'LITRAGEM':
    			return 'L';
    		case 'CAIXAS':
    			return 'C';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(CteCarga objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}