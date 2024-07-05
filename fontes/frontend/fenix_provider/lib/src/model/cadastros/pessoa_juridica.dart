/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PESSOA_JURIDICA] 
                                                                                
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

class PessoaJuridica {
	int? id;
	int? idPessoa;
	String? cnpj;
	String? nomeFantasia;
	String? inscricaoEstadual;
	String? inscricaoMunicipal;
	DateTime? dataConstituicao;
	String? tipoRegime;
	String? crt;

	PessoaJuridica({
			id,
			idPessoa,
			cnpj,
			nomeFantasia,
			inscricaoEstadual,
			inscricaoMunicipal,
			dataConstituicao,
			tipoRegime,
			crt,
		});

	static List<String> campos = <String>[
		'ID', 
		'CNPJ', 
		'NOME_FANTASIA', 
		'INSCRICAO_ESTADUAL', 
		'INSCRICAO_MUNICIPAL', 
		'DATA_CONSTITUICAO', 
		'TIPO_REGIME', 
		'CRT', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'CNPJ', 
		'Nome de Fantasia', 
		'Inscrição Estadual', 
		'Inscrição Municipal', 
		'Data Constituição', 
		'Tipo Regime', 
		'CRT', 
	];

	PessoaJuridica.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idPessoa = jsonDados['idPessoa'];
		cnpj = jsonDados['cnpj'];
		nomeFantasia = jsonDados['nomeFantasia'];
		inscricaoEstadual = jsonDados['inscricaoEstadual'];
		inscricaoMunicipal = jsonDados['inscricaoMunicipal'];
		dataConstituicao = jsonDados['dataConstituicao'] != null ? DateTime.tryParse(jsonDados['dataConstituicao']) : null;
		tipoRegime = getTipoRegime(jsonDados['tipoRegime']);
		crt = getCrt(jsonDados['crt']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idPessoa'] = idPessoa ?? 0;
		jsonDados['cnpj'] = Biblioteca.removerMascara(cnpj);
		jsonDados['nomeFantasia'] = nomeFantasia;
		jsonDados['inscricaoEstadual'] = inscricaoEstadual;
		jsonDados['inscricaoMunicipal'] = inscricaoMunicipal;
		jsonDados['dataConstituicao'] = dataConstituicao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataConstituicao!) : null;
		jsonDados['tipoRegime'] = setTipoRegime(tipoRegime);
		jsonDados['crt'] = setCrt(crt);
	
		return jsonDados;
	}
	
    getTipoRegime(String? tipoRegime) {
    	switch (tipoRegime) {
    		case '1':
    			return '1-Lucro REAL';
    		case '2':
    			return '2-Lucro presumido';
    		case '3':
    			return '3-Simples nacional';
    		default:
    			return null;
    		}
    	}

    setTipoRegime(String? tipoRegime) {
    	switch (tipoRegime) {
    		case '1-Lucro REAL':
    			return '1';
    		case '2-Lucro presumido':
    			return '2';
    		case '3-Simples nacional':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getCrt(String? crt) {
    	switch (crt) {
    		case '1':
    			return '1-Simples Nacional';
    		case '2':
    			return '2-Simples Nacional - excesso de sublimite da receita bruta';
    		case '3':
    			return '3-Regime Normal';
    		default:
    			return null;
    		}
    	}

    setCrt(String? crt) {
    	switch (crt) {
    		case '1-Simples Nacional':
    			return '1';
    		case '2-Simples Nacional - excesso de sublimite da receita bruta':
    			return '2';
    		case '3-Regime Normal':
    			return '3';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(PessoaJuridica objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}