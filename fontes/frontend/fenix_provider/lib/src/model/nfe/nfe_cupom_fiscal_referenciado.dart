/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_CUPOM_FISCAL_REFERENCIADO] 
                                                                                
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

import 'package:intl/intl.dart';

class NfeCupomFiscalReferenciado {
	int? id;
	int? idNfeCabecalho;
	String? modeloDocumentoFiscal;
	int? numeroOrdemEcf;
	int? coo;
	DateTime? dataEmissaoCupom;
	int? numeroCaixa;
	String? numeroSerieEcf;

	NfeCupomFiscalReferenciado({
		id,
		idNfeCabecalho,
		modeloDocumentoFiscal,
		numeroOrdemEcf,
		coo,
		dataEmissaoCupom,
		numeroCaixa,
		numeroSerieEcf,
	});

	static List<String> campos = <String>[
		'ID', 
		'MODELO_DOCUMENTO_FISCAL', 
		'NUMERO_ORDEM_ECF', 
		'COO', 
		'DATA_EMISSAO_CUPOM', 
		'NUMERO_CAIXA', 
		'NUMERO_SERIE_ECF', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Modelo Documento Fiscal', 
		'Número de Ordem ECF', 
		'COO', 
		'Data de Emissão', 
		'Número Caixa', 
		'Número Série ECF', 
	];

	NfeCupomFiscalReferenciado.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeCabecalho = jsonDados['idNfeCabecalho'];
		modeloDocumentoFiscal = getModeloDocumentoFiscal(jsonDados['modeloDocumentoFiscal']);
		numeroOrdemEcf = jsonDados['numeroOrdemEcf'];
		coo = jsonDados['coo'];
		dataEmissaoCupom = jsonDados['dataEmissaoCupom'] != null ? DateTime.tryParse(jsonDados['dataEmissaoCupom']) : null;
		numeroCaixa = jsonDados['numeroCaixa'];
		numeroSerieEcf = jsonDados['numeroSerieEcf'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeCabecalho'] = idNfeCabecalho ?? 0;
		jsonDados['modeloDocumentoFiscal'] = setModeloDocumentoFiscal(modeloDocumentoFiscal);
		jsonDados['numeroOrdemEcf'] = numeroOrdemEcf ?? 0;
		jsonDados['coo'] = coo ?? 0;
		jsonDados['dataEmissaoCupom'] = dataEmissaoCupom != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEmissaoCupom!) : null;
		jsonDados['numeroCaixa'] = numeroCaixa ?? 0;
		jsonDados['numeroSerieEcf'] = numeroSerieEcf;
	
		return jsonDados;
	}
	
    getModeloDocumentoFiscal(String? modeloDocumentoFiscal) {
    	switch (modeloDocumentoFiscal) {
    		case '0':
    			return '2B=Cupom Fiscal emitido por máquina registradora';
    		case '1':
    			return '2C=Cupom Fiscal PDV';
    		case '2':
    			return '2D=Cupom Fiscal-emitido por ECF';
    		default:
    			return null;
    		}
    	}

    setModeloDocumentoFiscal(String? modeloDocumentoFiscal) {
    	switch (modeloDocumentoFiscal) {
    		case '2B=Cupom Fiscal emitido por máquina registradora':
    			return '0';
    		case '2C=Cupom Fiscal PDV':
    			return '1';
    		case '2D=Cupom Fiscal-emitido por ECF':
    			return '2';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(NfeCupomFiscalReferenciado objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}