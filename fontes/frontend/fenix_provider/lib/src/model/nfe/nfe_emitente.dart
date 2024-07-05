/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_EMITENTE] 
                                                                                
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

class NfeEmitente {
	int? id;
	int? idNfeCabecalho;
	String? cnpj;
	String? cpf;
	String? nome;
	String? fantasia;
	String? logradouro;
	String? numero;
	String? complemento;
	String? bairro;
	int? codigoMunicipio;
	String? nomeMunicipio;
	String? uf;
	String? cep;
	int? codigoPais;
	String? nomePais;
	String? telefone;
	String? inscricaoEstadual;
	String? inscricaoEstadualSt;
	String? inscricaoMunicipal;
	String? cnae;
	String? crt;
	String? email;

	NfeEmitente({
		id,
		idNfeCabecalho,
		cnpj,
		cpf,
		nome,
		fantasia,
		logradouro,
		numero,
		complemento,
		bairro,
		codigoMunicipio,
		nomeMunicipio,
		uf,
		cep,
		codigoPais,
		nomePais,
		telefone,
		inscricaoEstadual,
		inscricaoEstadualSt,
		inscricaoMunicipal,
		cnae,
		crt,
		email,
    	});

	static List<String> campos = <String>[
		'ID', 
		'CNPJ', 
		'CPF', 
		'NOME', 
		'FANTASIA', 
		'LOGRADOURO', 
		'NUMERO', 
		'COMPLEMENTO', 
		'BAIRRO', 
		'CODIGO_MUNICIPIO', 
		'NOME_MUNICIPIO', 
		'UF', 
		'CEP', 
		'CODIGO_PAIS', 
		'NOME_PAIS', 
		'TELEFONE', 
		'INSCRICAO_ESTADUAL', 
		'INSCRICAO_ESTADUAL_ST', 
		'INSCRICAO_MUNICIPAL', 
		'CNAE', 
		'CRT', 
		'EMAIL',     
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'CNPJ', 
		'CPF', 
		'Nome', 
		'Fantasia', 
		'Logradouro', 
		'Número', 
		'Complemento', 
		'Bairro', 
		'Município IBGE', 
		'Município', 
		'UF', 
		'CEP', 
		'País BACEN', 
		'País', 
		'Telefone', 
		'Incrição Estadual', 
		'Incrição Estadual ST', 
		'Incrição Municipal', 
		'CNAE', 
		'CRT', 
		'EMail', 
	];

	NfeEmitente.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeCabecalho = jsonDados['idNfeCabecalho'];
		cnpj = jsonDados['cnpj'];
		cpf = jsonDados['cpf'];
		nome = jsonDados['nome'];
		fantasia = jsonDados['fantasia'];
		logradouro = jsonDados['logradouro'];
		numero = jsonDados['numero'];
		complemento = jsonDados['complemento'];
		bairro = jsonDados['bairro'];
		codigoMunicipio = jsonDados['codigoMunicipio'];
		nomeMunicipio = jsonDados['nomeMunicipio'];
		uf = jsonDados['uf'] == '' ? null : jsonDados['uf'];
		cep = jsonDados['cep'];
		codigoPais = jsonDados['codigoPais'];
		nomePais = jsonDados['nomePais'];
		telefone = jsonDados['telefone'];
		inscricaoEstadual = jsonDados['inscricaoEstadual'];
		inscricaoEstadualSt = jsonDados['inscricaoEstadualSt'];
		inscricaoMunicipal = jsonDados['inscricaoMunicipal'];
		cnae = jsonDados['cnae'];
		crt = getCrt(jsonDados['crt']);
		email = jsonDados['email'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeCabecalho'] = idNfeCabecalho ?? 0;
		jsonDados['cnpj'] = Biblioteca.removerMascara(cnpj);
		jsonDados['cpf'] = Biblioteca.removerMascara(cpf);
		jsonDados['nome'] = nome;
		jsonDados['fantasia'] = fantasia;
		jsonDados['logradouro'] = logradouro;
		jsonDados['numero'] = numero;
		jsonDados['complemento'] = complemento;
		jsonDados['bairro'] = bairro;
		jsonDados['codigoMunicipio'] = codigoMunicipio ?? 0;
		jsonDados['nomeMunicipio'] = nomeMunicipio;
		jsonDados['uf'] = uf;
		jsonDados['cep'] = Biblioteca.removerMascara(cep);
		jsonDados['codigoPais'] = codigoPais ?? 0;
		jsonDados['nomePais'] = nomePais;
		jsonDados['telefone'] = Biblioteca.removerMascara(telefone);
		jsonDados['inscricaoEstadual'] = inscricaoEstadual;
		jsonDados['inscricaoEstadualSt'] = inscricaoEstadualSt;
		jsonDados['inscricaoMunicipal'] = inscricaoMunicipal;
		jsonDados['cnae'] = cnae;
		jsonDados['crt'] = setCrt(crt);
		jsonDados['email'] = email;
	
		return jsonDados;
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


	String objetoEncodeJson(NfeEmitente objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}