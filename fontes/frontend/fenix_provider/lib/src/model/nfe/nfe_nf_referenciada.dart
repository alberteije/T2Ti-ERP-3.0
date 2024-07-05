/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_NF_REFERENCIADA] 
                                                                                
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

class NfeNfReferenciada {
	int? id;
	int? idNfeCabecalho;
	int? codigoUf;
	String? anoMes;
	String? cnpj;
	String? modelo;
	String? serie;
	int? numeroNf;

	NfeNfReferenciada({
		id,
		idNfeCabecalho,
		codigoUf,
		anoMes,
		cnpj,
		modelo,
		serie,
		numeroNf,
	});

	static List<String> campos = <String>[
		'ID', 
		'CODIGO_UF', 
		'ANO_MES', 
		'CNPJ', 
		'MODELO', 
		'SERIE', 
		'NUMERO_NF', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Código UF', 
		'Ano/Mês', 
		'CNPJ', 
		'Modelo', 
		'Série', 
		'Número NF', 
	];

	NfeNfReferenciada.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeCabecalho = jsonDados['idNfeCabecalho'];
		codigoUf = jsonDados['codigoUf'];
		anoMes = jsonDados['anoMes'];
		cnpj = jsonDados['cnpj'];
		modelo = getModelo(jsonDados['modelo']);
		serie = jsonDados['serie'];
		numeroNf = jsonDados['numeroNf'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeCabecalho'] = idNfeCabecalho ?? 0;
		jsonDados['codigoUf'] = codigoUf ?? 0;
		jsonDados['anoMes'] = anoMes;
		jsonDados['cnpj'] = Biblioteca.removerMascara(cnpj);
		jsonDados['modelo'] = setModelo(modelo);
		jsonDados['serie'] = serie;
		jsonDados['numeroNf'] = numeroNf ?? 0;
	
		return jsonDados;
	}
	
    getModelo(String? modelo) {
    	switch (modelo) {
    		case '0':
    			return '01=modelo 01';
    		case '1':
    			return '02=modelo 02';
    		default:
    			return null;
    		}
    	}

    setModelo(String? modelo) {
    	switch (modelo) {
    		case '01=modelo 01':
    			return '0';
    		case '02=modelo 02':
    			return '1';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(NfeNfReferenciada objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}