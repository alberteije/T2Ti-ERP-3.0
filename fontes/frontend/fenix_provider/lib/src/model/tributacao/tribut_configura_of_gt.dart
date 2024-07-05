/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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

class TributConfiguraOfGt {
	int? id;
	int? idTributGrupoTributario;
	int? idTributOperacaoFiscal;
	TributCofins? tributCofins;
	TributIpi? tributIpi;
	TributPis? tributPis;
	TributGrupoTributario? tributGrupoTributario;
	TributOperacaoFiscal? tributOperacaoFiscal;
	List<TributIcmsUf>? listaTributIcmsUf = [];

	TributConfiguraOfGt({
		id,
		idTributGrupoTributario,
		idTributOperacaoFiscal,
		tributCofins,
		tributIpi,
		tributPis,
		tributGrupoTributario,
		tributOperacaoFiscal,
		listaTributIcmsUf,
	});

	static List<String> campos = <String>[
		'ID', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
	];

	TributConfiguraOfGt.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idTributGrupoTributario = jsonDados['idTributGrupoTributario'];
		idTributOperacaoFiscal = jsonDados['idTributOperacaoFiscal'];
		tributCofins = jsonDados['tributCofins'] == null ? null : TributCofins.fromJson(jsonDados['tributCofins']);
		tributIpi = jsonDados['tributIpi'] == null ? null : TributIpi.fromJson(jsonDados['tributIpi']);
		tributPis = jsonDados['tributPis'] == null ? null : TributPis.fromJson(jsonDados['tributPis']);
		tributGrupoTributario = jsonDados['tributGrupoTributario'] == null ? null : TributGrupoTributario.fromJson(jsonDados['tributGrupoTributario']);
		tributOperacaoFiscal = jsonDados['tributOperacaoFiscal'] == null ? null : TributOperacaoFiscal.fromJson(jsonDados['tributOperacaoFiscal']);
		listaTributIcmsUf = (jsonDados['listaTributIcmsUf'] as Iterable?)?.map((m) => TributIcmsUf.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idTributGrupoTributario'] = idTributGrupoTributario ?? 0;
		jsonDados['idTributOperacaoFiscal'] = idTributOperacaoFiscal ?? 0;
		jsonDados['tributCofins'] = tributCofins == null ? null : tributCofins!.toJson;
		jsonDados['tributIpi'] = tributIpi == null ? null : tributIpi!.toJson;
		jsonDados['tributPis'] = tributPis == null ? null : tributPis!.toJson;
		jsonDados['tributGrupoTributario'] = tributGrupoTributario == null ? null : tributGrupoTributario!.toJson;
		jsonDados['tributOperacaoFiscal'] = tributOperacaoFiscal == null ? null : tributOperacaoFiscal!.toJson;
		

		var listaTributIcmsUfLocal = [];
		for (TributIcmsUf objeto in listaTributIcmsUf ?? []) {
			listaTributIcmsUfLocal.add(objeto.toJson);
		}
		jsonDados['listaTributIcmsUf'] = listaTributIcmsUfLocal;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(TributConfiguraOfGt objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}