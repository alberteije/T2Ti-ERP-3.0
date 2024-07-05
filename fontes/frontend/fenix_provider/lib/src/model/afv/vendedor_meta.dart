/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VENDEDOR_META] 
                                                                                
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
import 'package:fenix/src/model/model.dart';

class VendedorMeta {
	int? id;
	int? idVendedor;
	int? idCliente;
	String? periodoMeta;
	double? metaOrcada;
	double? metaRealizada;
	DateTime? dataInicio;
	DateTime? dataFim;
	Vendedor? vendedor;
	Cliente? cliente;

	VendedorMeta({
		id,
		idVendedor,
		idCliente,
		periodoMeta,
		metaOrcada = 0.0,
		metaRealizada = 0.0,
		dataInicio,
		dataFim,
		vendedor,
		cliente,
	});

	static List<String> campos = <String>[
		'ID', 
		'PERIODO_META', 
		'META_ORCADA', 
		'META_REALIZADA', 
		'DATA_INICIO', 
		'DATA_FIM', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Período', 
		'Meta Orçada', 
		'Meta Realizada', 
		'Data Inicial', 
		'Data Final', 
	];

	VendedorMeta.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idVendedor = jsonDados['idVendedor'];
		idCliente = jsonDados['idCliente'];
		periodoMeta = getPeriodoMeta(jsonDados['periodoMeta']);
		metaOrcada = jsonDados['metaOrcada']?.toDouble();
		metaRealizada = jsonDados['metaRealizada']?.toDouble();
		dataInicio = jsonDados['dataInicio'] != null ? DateTime.tryParse(jsonDados['dataInicio']) : null;
		dataFim = jsonDados['dataFim'] != null ? DateTime.tryParse(jsonDados['dataFim']) : null;
		vendedor = jsonDados['vendedor'] == null ? null : Vendedor.fromJson(jsonDados['vendedor']);
		cliente = jsonDados['cliente'] == null ? null : Cliente.fromJson(jsonDados['cliente']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idVendedor'] = idVendedor ?? 0;
		jsonDados['idCliente'] = idCliente ?? 0;
		jsonDados['periodoMeta'] = setPeriodoMeta(periodoMeta);
		jsonDados['metaOrcada'] = metaOrcada;
		jsonDados['metaRealizada'] = metaRealizada;
		jsonDados['dataInicio'] = dataInicio != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataInicio!) : null;
		jsonDados['dataFim'] = dataFim != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataFim!) : null;
		jsonDados['vendedor'] = vendedor == null ? null : vendedor!.toJson;
		jsonDados['cliente'] = cliente == null ? null : cliente!.toJson;
	
		return jsonDados;
	}
	
    getPeriodoMeta(String? periodoMeta) {
    	switch (periodoMeta) {
    		case '0':
    			return 'Semanal';
    		case '1':
    			return 'Mensal';
    		case '2':
    			return 'Bimestral';
    		case '3':
    			return 'Trimestral';
    		case '4':
    			return 'Semestral';
    		case '5':
    			return 'Anual';
    		default:
    			return null;
    		}
    	}

    setPeriodoMeta(String? periodoMeta) {
    	switch (periodoMeta) {
    		case 'Semanal':
    			return '0';
    		case 'Mensal':
    			return '1';
    		case 'Bimestral':
    			return '2';
    		case 'Trimestral':
    			return '3';
    		case 'Semestral':
    			return '4';
    		case 'Anual':
    			return '5';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(VendedorMeta objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}