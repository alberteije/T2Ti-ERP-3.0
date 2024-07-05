/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VIEW_PESSOA_TRANSPORTADORA] 
                                                                                
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

class ViewPessoaTransportadora {
	int? id;
	String? nome;
	String? tipo;
	String? email;
	String? site;
	String? cpfCnpj;
	String? rgIe;
	DateTime? dataCadastro;
	String? observacao;
	int? idPessoa;

	ViewPessoaTransportadora({
		id,
		nome,
		tipo,
		email,
		site,
		cpfCnpj,
		rgIe,
		dataCadastro,
		observacao,
		idPessoa,
	});

	static List<String> campos = <String>[
		'ID', 
		'NOME', 
		'TIPO', 
		'EMAIL', 
		'SITE', 
		'CPF_CNPJ', 
		'RG_IE', 
		'DATA_CADASTRO', 
		'OBSERVACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Nome', 
		'Tipo', 
		'Email', 
		'Site', 
		'Cpf Cnpj', 
		'Rg Ie', 
		'Data Cadastro', 
		'Observacao', 
	];

	ViewPessoaTransportadora.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		nome = jsonDados['nome'];
		tipo = jsonDados['tipo'];
		email = jsonDados['email'];
		site = jsonDados['site'];
		cpfCnpj = jsonDados['cpfCnpj'];
		rgIe = jsonDados['rgIe'];
		dataCadastro = jsonDados['dataCadastro'] != null ? DateTime.tryParse(jsonDados['dataCadastro']) : null;
		observacao = jsonDados['observacao'];
		idPessoa = jsonDados['idPessoa'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['nome'] = nome;
		jsonDados['tipo'] = tipo;
		jsonDados['email'] = email;
		jsonDados['site'] = site;
		jsonDados['cpfCnpj'] = cpfCnpj;
		jsonDados['rgIe'] = rgIe;
		jsonDados['dataCadastro'] = dataCadastro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataCadastro!) : null;
		jsonDados['observacao'] = observacao;
		jsonDados['idPessoa'] = idPessoa ?? 0;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(ViewPessoaTransportadora objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}