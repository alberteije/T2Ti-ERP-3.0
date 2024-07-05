/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PESSOA_ENDERECO] 
                                                                                
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

class PessoaEndereco {
	int? id;
	int? idPessoa;
	String? logradouro;
	String? numero;
	String? bairro;
	int? municipioIbge;
	String? uf;
	String? cep;
	String? cidade;
	String? complemento;
	String? principal;
	String? entrega;
	String? cobranca;
	String? correspondencia;
	Pessoa? pessoa;

	PessoaEndereco({
		id,
		idPessoa,
		logradouro,
		numero,
		bairro,
		municipioIbge,
		uf,
		cep,
		cidade,
		complemento,
		principal,
		entrega,
		cobranca,
		correspondencia,
		pessoa,
	});

	static List<String> campos = <String>[
		'ID', 
		'LOGRADOURO', 
		'NUMERO', 
		'BAIRRO', 
		'MUNICIPIO_IBGE', 
		'UF', 
		'CEP', 
		'CIDADE', 
		'COMPLEMENTO', 
		'PRINCIPAL', 
		'ENTREGA', 
		'COBRANCA', 
		'CORRESPONDENCIA', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Logradouro', 
		'Numero', 
		'Bairro', 
		'Municipio Ibge', 
		'Uf', 
		'Cep', 
		'Cidade', 
		'Complemento', 
		'Principal', 
		'Entrega', 
		'Cobranca', 
		'Correspondencia', 
	];

	PessoaEndereco.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idPessoa = jsonDados['idPessoa'];
		logradouro = jsonDados['logradouro'];
		numero = jsonDados['numero'];
		bairro = jsonDados['bairro'];
		municipioIbge = jsonDados['municipioIbge'];
		uf = jsonDados['uf'];
		cep = jsonDados['cep'];
		cidade = jsonDados['cidade'];
		complemento = jsonDados['complemento'];
		principal = getPrincipal(jsonDados['principal']);
		entrega = getEntrega(jsonDados['entrega']);
		cobranca = getCobranca(jsonDados['cobranca']);
		correspondencia = getCorrespondencia(jsonDados['correspondencia']);
		pessoa = jsonDados['pessoa'] == null ? null : Pessoa.fromJson(jsonDados['pessoa']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idPessoa'] = idPessoa ?? 0;
		jsonDados['logradouro'] = logradouro;
		jsonDados['numero'] = numero;
		jsonDados['bairro'] = bairro;
		jsonDados['municipioIbge'] = municipioIbge ?? 0;
		jsonDados['uf'] = uf;
		jsonDados['cep'] = cep;
		jsonDados['cidade'] = cidade;
		jsonDados['complemento'] = complemento;
		jsonDados['principal'] = setPrincipal(principal);
		jsonDados['entrega'] = setEntrega(entrega);
		jsonDados['cobranca'] = setCobranca(cobranca);
		jsonDados['correspondencia'] = setCorrespondencia(correspondencia);
		jsonDados['pessoa'] = pessoa == null ? null : pessoa!.toJson;
	
		return jsonDados;
	}
	
    getPrincipal(String? principal) {
    	switch (principal) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setPrincipal(String? principal) {
    	switch (principal) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getEntrega(String? entrega) {
    	switch (entrega) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setEntrega(String? entrega) {
    	switch (entrega) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getCobranca(String? cobranca) {
    	switch (cobranca) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setCobranca(String? cobranca) {
    	switch (cobranca) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getCorrespondencia(String? correspondencia) {
    	switch (correspondencia) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setCorrespondencia(String? correspondencia) {
    	switch (correspondencia) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(PessoaEndereco objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}