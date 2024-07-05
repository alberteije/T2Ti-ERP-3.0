/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [TRIBUT_ICMS_CUSTOM_DET] 
                                                                                
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

import 'package:fenix/src/infra/biblioteca.dart';

class TributIcmsCustomDet {
	int? id;
	int? idTributIcmsCustomCab;
	String? ufDestino;
	int? cfop;
	String? csosn;
	String? cst;
	String? modalidadeBc;
	double? aliquota;
	double? valorPauta;
	double? valorPrecoMaximo;
	double? mva;
	double? porcentoBc;
	String? modalidadeBcSt;
	double? aliquotaInternaSt;
	double? aliquotaInterestadualSt;
	double? porcentoBcSt;
	double? aliquotaIcmsSt;
	double? valorPautaSt;
	double? valorPrecoMaximoSt;

	TributIcmsCustomDet({
		id,
		idTributIcmsCustomCab,
		ufDestino,
		cfop,
		csosn,
		cst,
		modalidadeBc,
		aliquota = 0.0,
		valorPauta = 0.0,
		valorPrecoMaximo = 0.0,
		mva = 0.0,
		porcentoBc = 0.0,
		modalidadeBcSt,
		aliquotaInternaSt = 0.0,
		aliquotaInterestadualSt = 0.0,
		porcentoBcSt = 0.0,
		aliquotaIcmsSt = 0.0,
		valorPautaSt = 0.0,
		valorPrecoMaximoSt = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'UF_DESTINO', 
		'CFOP', 
		'CSOSN', 
		'CST', 
		'MODALIDADE_BC', 
		'ALIQUOTA', 
		'VALOR_PAUTA', 
		'VALOR_PRECO_MAXIMO', 
		'MVA', 
		'PORCENTO_BC', 
		'MODALIDADE_BC_ST', 
		'ALIQUOTA_INTERNA_ST', 
		'ALIQUOTA_INTERESTADUAL_ST', 
		'PORCENTO_BC_ST', 
		'ALIQUOTA_ICMS_ST', 
		'VALOR_PAUTA_ST', 
		'VALOR_PRECO_MAXIMO_ST', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'UF', 
		'CFOP', 
		'CSOSN', 
		'CST', 
		'Modalidade Base Cálculo', 
		'Alíquota', 
		'Valor Pauta', 
		'Valor Preço Máximo', 
		'Valor MVA', 
		'Porcento Base Cálculo', 
		'Porcento Base Cálculo', 
		'Alíquota Interna ST', 
		'Alíquota Interestadual ST', 
		'Porcento Base Cálculo ST', 
		'Alíquota ICMS ST', 
		'Valor Pauta ST', 
		'Valor Preço Máximo ST', 
	];

	TributIcmsCustomDet.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idTributIcmsCustomCab = jsonDados['idTributIcmsCustomCab'];
		ufDestino = jsonDados['ufDestino'] == '' ? null : jsonDados['ufDestino'];
		cfop = jsonDados['cfop'];
		csosn = jsonDados['csosn'];
		cst = jsonDados['cst'];
		modalidadeBc = getModalidadeBc(jsonDados['modalidadeBc']);
		aliquota = jsonDados['aliquota']?.toDouble();
		valorPauta = jsonDados['valorPauta']?.toDouble();
		valorPrecoMaximo = jsonDados['valorPrecoMaximo']?.toDouble();
		mva = jsonDados['mva']?.toDouble();
		porcentoBc = jsonDados['porcentoBc']?.toDouble();
		modalidadeBcSt = jsonDados['modalidadeBcSt'];
		aliquotaInternaSt = jsonDados['aliquotaInternaSt']?.toDouble();
		aliquotaInterestadualSt = jsonDados['aliquotaInterestadualSt']?.toDouble();
		porcentoBcSt = jsonDados['porcentoBcSt']?.toDouble();
		aliquotaIcmsSt = jsonDados['aliquotaIcmsSt']?.toDouble();
		valorPautaSt = jsonDados['valorPautaSt']?.toDouble();
		valorPrecoMaximoSt = jsonDados['valorPrecoMaximoSt']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idTributIcmsCustomCab'] = idTributIcmsCustomCab ?? 0;
		jsonDados['ufDestino'] = ufDestino;
		jsonDados['cfop'] = cfop ?? 0;
		jsonDados['csosn'] = csosn;
		jsonDados['cst'] = cst;
		jsonDados['modalidadeBc'] = setModalidadeBc(modalidadeBc);
		jsonDados['aliquota'] = aliquota;
		jsonDados['valorPauta'] = valorPauta;
		jsonDados['valorPrecoMaximo'] = valorPrecoMaximo;
		jsonDados['mva'] = mva;
		jsonDados['porcentoBc'] = porcentoBc;
		jsonDados['modalidadeBcSt'] = Biblioteca.removerMascara(modalidadeBcSt);
		jsonDados['aliquotaInternaSt'] = aliquotaInternaSt;
		jsonDados['aliquotaInterestadualSt'] = aliquotaInterestadualSt;
		jsonDados['porcentoBcSt'] = porcentoBcSt;
		jsonDados['aliquotaIcmsSt'] = aliquotaIcmsSt;
		jsonDados['valorPautaSt'] = valorPautaSt;
		jsonDados['valorPrecoMaximoSt'] = valorPrecoMaximoSt;
	
		return jsonDados;
	}
	
    getModalidadeBc(String? modalidadeBc) {
    	switch (modalidadeBc) {
    		case '0':
    			return '0-Margem Valor Agregado (%)';
    		case '1':
    			return '1-Pauta (Valor)';
    		case '2':
    			return '2-Preço Tabelado Máx. (valor)';
    		case '3':
    			return '3-Valor da Operação';
    		default:
    			return null;
    		}
    	}

    setModalidadeBc(String? modalidadeBc) {
    	switch (modalidadeBc) {
    		case '0-Margem Valor Agregado (%)':
    			return '0';
    		case '1-Pauta (Valor)':
    			return '1';
    		case '2-Preço Tabelado Máx. (valor)':
    			return '2';
    		case '3-Valor da Operação':
    			return '3';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(TributIcmsCustomDet objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}