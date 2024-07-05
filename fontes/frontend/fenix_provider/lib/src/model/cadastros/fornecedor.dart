/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FORNECEDOR] 
                                                                                
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

class Fornecedor {
	int? id;
	int? idPessoa;
	DateTime? desde;
	DateTime? dataCadastro;
	String? observacao;
	// Pessoa? pessoa; // esse objeto recebe os dados da view, pois a Pessoa precisa ter um Colaborador vinculado - evita referência circular no servidor
	ViewPessoaFornecedor? pessoa;

	Fornecedor({
		id,
		idPessoa,
		desde,
		dataCadastro,
		observacao,
    // pessoa,
    viewPessoaFornecedor,
	});

	static List<String> campos = <String>[
		'ID', 
		'DESDE', 
		'DATA_CADASTRO', 
		'OBSERVACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'É Fornecedor Desde', 
		'Data de Cadastro', 
		'Observação', 
	];

	Fornecedor.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idPessoa = jsonDados['idPessoa'];
		desde = jsonDados['desde'] != null ? DateTime.tryParse(jsonDados['desde']) : null;
		dataCadastro = jsonDados['dataCadastro'] != null ? DateTime.tryParse(jsonDados['dataCadastro']) : null;
		observacao = jsonDados['observacao'];
		// pessoa = jsonDados['pessoa'] == null ? null : Pessoa.fromJson(jsonDados['pessoa']);
    pessoa = jsonDados['viewPessoaFornecedor'] == null ? null : ViewPessoaFornecedor.fromJson(jsonDados['viewPessoaFornecedor']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idPessoa'] = idPessoa ?? 0;
		jsonDados['desde'] = desde != null ? DateFormat('yyyy-MM-ddT00:00:00').format(desde!) : null;
		jsonDados['dataCadastro'] = dataCadastro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataCadastro!) : null;
		jsonDados['observacao'] = observacao;
		// jsonDados['pessoa'] = pessoa == null ? null : pessoa!.toJson;
    jsonDados['viewPessoaFornecedor'] = pessoa == null ? null : pessoa!.toJson;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(Fornecedor objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}