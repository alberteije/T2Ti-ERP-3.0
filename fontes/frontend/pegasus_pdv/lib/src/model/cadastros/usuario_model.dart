/*
Title: T2Ti ERP 3.0                                                              
Description: Model - Usuário do PDV na 
retaguarda da SH
                                                                                
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
import 'package:pegasus_pdv/src/infra/infra.dart';

class UsuarioModel {
	int? id;
	String? email;
	String? senha;
	DateTime? dataCadastro;
	String? pendente;
  String? modulo;
	String? whatsapp;
	String? news;

	UsuarioModel({
			this.id,
			this.email,
			this.senha,
			this.dataCadastro,
			this.pendente,
      this.modulo,
			this.whatsapp,
			this.news,
		});

	UsuarioModel.fromJson(Map<String, dynamic> jsonDados) {
		// id = jsonDados['id'];
		email = jsonDados['email'];
		senha = jsonDados['senha'];
		dataCadastro = Biblioteca.tratarDataJson(jsonDados['dataCadastro']);
		pendente = jsonDados['pendente'];
    modulo = jsonDados['modulo'];
		whatsapp = jsonDados['whatsapp'];
		news = jsonDados['news'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		// jsonDados['id'] = this.id ?? 0;
		jsonDados['email'] = email;
		jsonDados['senha'] = senha;
		jsonDados['dataCadastro'] = dataCadastro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataCadastro!) : null;
		jsonDados['pendente'] = pendente;
    jsonDados['modulo'] = modulo;
		jsonDados['whatsapp'] = whatsapp;
		jsonDados['news'] = news;
	
		return jsonDados;
	}
	
	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}