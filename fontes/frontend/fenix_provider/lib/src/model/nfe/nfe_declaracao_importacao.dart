/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DECLARACAO_IMPORTACAO] 
                                                                                
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
import 'package:fenix/src/infra/biblioteca.dart';

class NfeDeclaracaoImportacao {
	int? id;
	int? idNfeDetalhe;
	String? numeroDocumento;
	DateTime? dataRegistro;
	String? localDesembaraco;
	String? ufDesembaraco;
	DateTime? dataDesembaraco;
	String? viaTransporte;
	double? valorAfrmm;
	String? formaIntermediacao;
	String? cnpj;
	String? ufTerceiro;
	String? codigoExportador;

	NfeDeclaracaoImportacao({
		id,
		idNfeDetalhe,
		numeroDocumento,
		dataRegistro,
		localDesembaraco,
		ufDesembaraco,
		dataDesembaraco,
		viaTransporte,
		valorAfrmm = 0.0,
		formaIntermediacao,
		cnpj,
		ufTerceiro,
		codigoExportador,
	});

	static List<String> campos = <String>[
		'ID', 
		'NUMERO_DOCUMENTO', 
		'DATA_REGISTRO', 
		'LOCAL_DESEMBARACO', 
		'UF_DESEMBARACO', 
		'DATA_DESEMBARACO', 
		'VIA_TRANSPORTE', 
		'VALOR_AFRMM', 
		'FORMA_INTERMEDIACAO', 
		'CNPJ', 
		'UF_TERCEIRO', 
		'CODIGO_EXPORTADOR', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Número do Documento', 
		'Data de Registro', 
		'Local Desembaraço', 
		'UF Desembaraço', 
		'Data de Desembaraço', 
		'Via Transporte', 
		'Valor AFRMM', 
		'Forma Intermediação', 
		'CNPJ', 
		'UF Terceiro', 
		'Código Exportador', 
	];

	NfeDeclaracaoImportacao.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeDetalhe = jsonDados['idNfeDetalhe'];
		numeroDocumento = jsonDados['numeroDocumento'];
		dataRegistro = jsonDados['dataRegistro'] != null ? DateTime.tryParse(jsonDados['dataRegistro']) : null;
		localDesembaraco = jsonDados['localDesembaraco'];
		ufDesembaraco = jsonDados['ufDesembaraco'] == '' ? null : jsonDados['ufDesembaraco'];
		dataDesembaraco = jsonDados['dataDesembaraco'] != null ? DateTime.tryParse(jsonDados['dataDesembaraco']) : null;
		viaTransporte = getViaTransporte(jsonDados['viaTransporte']);
		valorAfrmm = jsonDados['valorAfrmm']?.toDouble();
		formaIntermediacao = getFormaIntermediacao(jsonDados['formaIntermediacao']);
		cnpj = jsonDados['cnpj'];
		ufTerceiro = jsonDados['ufTerceiro'] == '' ? null : jsonDados['ufTerceiro'];
		codigoExportador = jsonDados['codigoExportador'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeDetalhe'] = idNfeDetalhe ?? 0;
		jsonDados['numeroDocumento'] = numeroDocumento;
		jsonDados['dataRegistro'] = dataRegistro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataRegistro!) : null;
		jsonDados['localDesembaraco'] = localDesembaraco;
		jsonDados['ufDesembaraco'] = ufDesembaraco;
		jsonDados['dataDesembaraco'] = dataDesembaraco != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataDesembaraco!) : null;
		jsonDados['viaTransporte'] = setViaTransporte(viaTransporte);
		jsonDados['valorAfrmm'] = valorAfrmm;
		jsonDados['formaIntermediacao'] = setFormaIntermediacao(formaIntermediacao);
		jsonDados['cnpj'] = Biblioteca.removerMascara(cnpj);
		jsonDados['ufTerceiro'] = ufTerceiro;
		jsonDados['codigoExportador'] = codigoExportador;
	
		return jsonDados;
	}
	
    getViaTransporte(String? viaTransporte) {
    	switch (viaTransporte) {
    		case '1':
    			return '1=Marítima';
    		case '2':
    			return '2=Fluvial';
    		case '3':
    			return '3=Lacustre';
    		case '4':
    			return '4=Aérea';
    		case '5':
    			return '5=Postal';
    		case '6':
    			return '6=Ferroviária';
    		case '7':
    			return '7=Rodoviária';
    		default:
    			return null;
    		}
    	}

    setViaTransporte(String? viaTransporte) {
    	switch (viaTransporte) {
    		case '1=Marítima':
    			return '1';
    		case '2=Fluvial':
    			return '2';
    		case '3=Lacustre':
    			return '3';
    		case '4=Aérea':
    			return '4';
    		case '5=Postal':
    			return '5';
    		case '6=Ferroviária':
    			return '6';
    		case '7=Rodoviária':
    			return '7';
    		default:
    			return null;
    		}
    	}

    getFormaIntermediacao(String? formaIntermediacao) {
    	switch (formaIntermediacao) {
    		case '1':
    			return '1=Importação por conta própria';
    		case '2':
    			return '2=Importação por conta e ordem';
    		case '3':
    			return '3=Importação por encomenda';
    		default:
    			return null;
    		}
    	}

    setFormaIntermediacao(String? formaIntermediacao) {
    	switch (formaIntermediacao) {
    		case '1=Importação por conta própria':
    			return '1';
    		case '2=Importação por conta e ordem':
    			return '2';
    		case '3=Importação por encomenda':
    			return '3';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}