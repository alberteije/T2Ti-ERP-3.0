/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PESSOA] 
                                                                                
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

class Pessoa {
	int? id;
	String? nome;
	String? tipo;
	String? site;
	String? email;
	String? ehCliente;
	String? ehFornecedor;
	String? ehTransportadora;
	String? ehColaborador;
	String? ehContador;
	Cliente? cliente;
	Colaborador? colaborador;
	Contador? contador;
	Fornecedor? fornecedor;
	PessoaFisica? pessoaFisica;
	PessoaJuridica? pessoaJuridica;
	Transportadora? transportadora;
	List<PessoaContato>? listaPessoaContato = [];
	List<PessoaEndereco>? listaPessoaEndereco = [];
	List<PessoaTelefone>? listaPessoaTelefone = [];

	Pessoa({
		id,
		nome,
        tipo = 'Física',
		site,
		email,
		ehCliente,
		ehFornecedor,
		ehTransportadora,
		ehColaborador,
		ehContador,
		cliente,
		colaborador,
		contador,
		fornecedor,
		pessoaFisica,
		pessoaJuridica,
		transportadora,
		listaPessoaContato,
		listaPessoaEndereco,
		listaPessoaTelefone,
	});

	static List<String> campos = <String>[
		'ID', 
		'NOME', 
		'TIPO', 
		'SITE', 
		'EMAIL', 
		'EH_CLIENTE', 
		'EH_FORNECEDOR', 
		'EH_TRANSPORTADORA', 
		'EH_COLABORADOR', 
		'EH_CONTADOR', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Nome', 
		'Tipo Pessoa', 
		'Site', 
		'EMail', 
		'É Cliente', 
		'É Fornecedor', 
		'É Transportadora', 
		'É Colaborador', 
		'É Contador', 
	];

	Pessoa.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		nome = jsonDados['nome'];
		tipo = getTipo(jsonDados['tipo']);
		site = jsonDados['site'];
		email = jsonDados['email'];
		ehCliente = getEhCliente(jsonDados['ehCliente']);
		ehFornecedor = getEhFornecedor(jsonDados['ehFornecedor']);
		ehTransportadora = getEhTransportadora(jsonDados['ehTransportadora']);
		ehColaborador = getEhColaborador(jsonDados['ehColaborador']);
		ehContador = getEhContador(jsonDados['ehContador']);
		cliente = jsonDados['cliente'] == null ? null : Cliente.fromJson(jsonDados['cliente']);
		colaborador = jsonDados['colaborador'] == null ? null : Colaborador.fromJson(jsonDados['colaborador']);
		contador = jsonDados['contador'] == null ? null : Contador.fromJson(jsonDados['contador']);
		fornecedor = jsonDados['fornecedor'] == null ? null : Fornecedor.fromJson(jsonDados['fornecedor']);
		pessoaFisica = jsonDados['pessoaFisica'] == null ? null : PessoaFisica.fromJson(jsonDados['pessoaFisica']);
		pessoaJuridica = jsonDados['pessoaJuridica'] == null ? null : PessoaJuridica.fromJson(jsonDados['pessoaJuridica']);
		transportadora = jsonDados['transportadora'] == null ? null : Transportadora.fromJson(jsonDados['transportadora']);
		listaPessoaContato = (jsonDados['listaPessoaContato'] as Iterable?)?.map((m) => PessoaContato.fromJson(m)).toList() ?? [];
		listaPessoaEndereco = (jsonDados['listaPessoaEndereco'] as Iterable?)?.map((m) => PessoaEndereco.fromJson(m)).toList() ?? [];
		listaPessoaTelefone = (jsonDados['listaPessoaTelefone'] as Iterable?)?.map((m) => PessoaTelefone.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['nome'] = nome;
		jsonDados['tipo'] = setTipo(tipo);
		jsonDados['site'] = site;
		jsonDados['email'] = email;
		jsonDados['ehCliente'] = setEhCliente(ehCliente);
		jsonDados['ehFornecedor'] = setEhFornecedor(ehFornecedor);
		jsonDados['ehTransportadora'] = setEhTransportadora(ehTransportadora);
		jsonDados['ehColaborador'] = setEhColaborador(ehColaborador);
		jsonDados['ehContador'] = setEhContador(ehContador);
		jsonDados['cliente'] = cliente == null ? null : cliente!.toJson;
		jsonDados['colaborador'] = colaborador == null ? null : colaborador!.toJson;
		jsonDados['contador'] = contador == null ? null : contador!.toJson;
		jsonDados['fornecedor'] = fornecedor == null ? null : fornecedor!.toJson;
		jsonDados['pessoaFisica'] = pessoaFisica == null ? null : pessoaFisica!.toJson;
		jsonDados['pessoaJuridica'] = pessoaJuridica == null ? null : pessoaJuridica!.toJson;
		jsonDados['transportadora'] = transportadora == null ? null : transportadora!.toJson;
		

		var listaPessoaContatoLocal = [];
		for (PessoaContato objeto in listaPessoaContato ?? []) {
			listaPessoaContatoLocal.add(objeto.toJson);
		}
		jsonDados['listaPessoaContato'] = listaPessoaContatoLocal;

		var listaPessoaEnderecoLocal = [];
		for (PessoaEndereco objeto in listaPessoaEndereco ?? []) {
			listaPessoaEnderecoLocal.add(objeto.toJson);
		}
		jsonDados['listaPessoaEndereco'] = listaPessoaEnderecoLocal;
		

		var listaPessoaTelefoneLocal = [];
		for (PessoaTelefone objeto in listaPessoaTelefone ?? []) {
			listaPessoaTelefoneLocal.add(objeto.toJson);
		}
		jsonDados['listaPessoaTelefone'] = listaPessoaTelefoneLocal;
		
		return jsonDados;
	}
	
    getTipo(String? tipo) {
    	switch (tipo) {
    		case 'F':
    			return 'Física';
    		case 'J':
    			return 'Jurídica';
    		default:
    			return null;
    		}
    	}

    setTipo(String? tipo) {
    	switch (tipo) {
    		case 'Física':
    			return 'F';
    		case 'Jurídica':
    			return 'J';
    		default:
    			return null;
    		}
    	}

    getEhCliente(String? ehCliente) {
    	switch (ehCliente) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setEhCliente(String? ehCliente) {
    	switch (ehCliente) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getEhFornecedor(String? ehFornecedor) {
    	switch (ehFornecedor) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setEhFornecedor(String? ehFornecedor) {
    	switch (ehFornecedor) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getEhTransportadora(String? ehTransportadora) {
    	switch (ehTransportadora) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setEhTransportadora(String? ehTransportadora) {
    	switch (ehTransportadora) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getEhColaborador(String? ehColaborador) {
    	switch (ehColaborador) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setEhColaborador(String? ehColaborador) {
    	switch (ehColaborador) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getEhContador(String? ehContador) {
    	switch (ehContador) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setEhContador(String? ehContador) {
    	switch (ehContador) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(Pessoa objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}