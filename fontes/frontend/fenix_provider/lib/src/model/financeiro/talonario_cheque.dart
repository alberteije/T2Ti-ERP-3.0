/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [TALONARIO_CHEQUE] 
                                                                                
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

import 'package:fenix/src/model/model.dart';

class TalonarioCheque {
	int? id;
	int? idBancoContaCaixa;
	String? talao;
	int? numero;
	String? statusTalao;
	BancoContaCaixa? bancoContaCaixa;
	List<Cheque>? listaCheque = [];

	TalonarioCheque({
			id,
			idBancoContaCaixa,
			talao,
			numero,
			statusTalao,
			bancoContaCaixa,
			listaCheque,
		});

	static List<String> campos = <String>[
		'ID', 
		'TALAO', 
		'NUMERO', 
		'STATUS_TALAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Código do Talão', 
		'Número do Talão', 
		'Status do Talão', 
	];

	TalonarioCheque.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idBancoContaCaixa = jsonDados['idBancoContaCaixa'];
		talao = jsonDados['talao'];
		numero = jsonDados['numero'];
		statusTalao = getStatusTalao(jsonDados['statusTalao']);
		bancoContaCaixa = jsonDados['bancoContaCaixa'] == null ? null : BancoContaCaixa.fromJson(jsonDados['bancoContaCaixa']);
		listaCheque = (jsonDados['listaCheque'] as Iterable?)?.map((m) => Cheque.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idBancoContaCaixa'] = idBancoContaCaixa ?? 0;
		jsonDados['talao'] = talao;
		jsonDados['numero'] = numero ?? 0;
		jsonDados['statusTalao'] = setStatusTalao(statusTalao);
		jsonDados['bancoContaCaixa'] = bancoContaCaixa == null ? null : bancoContaCaixa!.toJson;
		

		var listaChequeLocal = [];
		for (Cheque objeto in listaCheque ?? []) {
			listaChequeLocal.add(objeto.toJson);
		}
		jsonDados['listaCheque'] = listaChequeLocal;
	
		return jsonDados;
	}
	
    getStatusTalao(String? statusTalao) {
    	switch (statusTalao) {
    		case 'N':
    			return 'Normal';
    		case 'C':
    			return 'Cancelado';
    		case 'E':
    			return 'Extraviado';
    		case 'U':
    			return 'Utilizado';
    		default:
    			return null;
    		}
    	}

    setStatusTalao(String? statusTalao) {
    	switch (statusTalao) {
    		case 'Normal':
    			return 'N';
    		case 'Cancelado':
    			return 'C';
    		case 'Extraviado':
    			return 'E';
    		case 'Utilizado':
    			return 'U';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(TalonarioCheque objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}