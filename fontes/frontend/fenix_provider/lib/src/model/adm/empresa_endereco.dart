/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [EMPRESA_ENDERECO] 
                                                                                
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

class EmpresaEndereco {
	int? id;
	int? idEmpresa;
	String? logradouro;
	String? numero;
	String? bairro;
	String? cidade;
	String? uf;
	String? cep;
	int? municipioIbge;
	String? complemento;
	String? principal;
	String? entrega;
	String? cobranca;
	String? correspondencia;

	EmpresaEndereco({
		id,
		idEmpresa,
		logradouro,
		numero,
		bairro,
		cidade,
		uf,
		cep,
		municipioIbge,
		complemento,
		principal,
		entrega,
		cobranca,
		correspondencia,
	});

	static List<String> campos = <String>[
		'ID', 
		'LOGRADOURO', 
		'NUMERO', 
		'BAIRRO', 
		'CIDADE', 
		'UF', 
		'CEP', 
		'MUNICIPIO_IBGE', 
		'COMPLEMENTO', 
		'PRINCIPAL', 
		'ENTREGA', 
		'COBRANCA', 
		'CORRESPONDENCIA', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Logradouro', 
		'Número', 
		'Bairro', 
		'Cidade', 
		'UF', 
		'CEP', 
		'Município IBGE', 
		'Complemento', 
		'É Endereço Principal', 
		'É Endereço de Entrega', 
		'É Endereço de Cobrança', 
		'É Endereço de Correspondência', 
	];

	EmpresaEndereco.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idEmpresa = jsonDados['idEmpresa'];
		logradouro = jsonDados['logradouro'];
		numero = jsonDados['numero'];
		bairro = jsonDados['bairro'];
		cidade = jsonDados['cidade'];
		uf = jsonDados['uf'] == '' ? null : jsonDados['uf'];
		cep = jsonDados['cep'];
		municipioIbge = jsonDados['municipioIbge'];
		complemento = jsonDados['complemento'];
		principal = getPrincipal(jsonDados['principal']);
		entrega = getEntrega(jsonDados['entrega']);
		cobranca = getCobranca(jsonDados['cobranca']);
		correspondencia = getCorrespondencia(jsonDados['correspondencia']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idEmpresa'] = idEmpresa ?? 0;
		jsonDados['logradouro'] = logradouro;
		jsonDados['numero'] = numero;
		jsonDados['bairro'] = bairro;
		jsonDados['cidade'] = cidade;
		jsonDados['uf'] = uf;
		jsonDados['cep'] = Biblioteca.removerMascara(cep);
		jsonDados['municipioIbge'] = municipioIbge ?? 0;
		jsonDados['complemento'] = complemento;
		jsonDados['principal'] = setPrincipal(principal);
		jsonDados['entrega'] = setEntrega(entrega);
		jsonDados['cobranca'] = setCobranca(cobranca);
		jsonDados['correspondencia'] = setCorrespondencia(correspondencia);
	
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


	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}