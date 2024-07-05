/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_LOCAL_ENTREGA] 
                                                                                
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

class NfeLocalEntrega {
	int? id;
	int? idNfeCabecalho;
	String? cnpj;
	String? cpf;
	String? nomeRecebedor;
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
	String? email;
	String? inscricaoEstadual;

	NfeLocalEntrega({
		id,
		idNfeCabecalho,
		cnpj,
		cpf,
		nomeRecebedor,
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
		email,
		inscricaoEstadual,
	});

	static List<String> campos = <String>[
		'ID', 
		'CNPJ', 
		'CPF', 
		'NOME_RECEBEDOR', 
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
		'EMAIL', 
		'INSCRICAO_ESTADUAL', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'CNPJ', 
		'CPF', 
		'Nome', 
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
		'EMail', 
		'Incrição Estadual', 
	];

	NfeLocalEntrega.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeCabecalho = jsonDados['idNfeCabecalho'];
		cnpj = jsonDados['cnpj'];
		cpf = jsonDados['cpf'];
		nomeRecebedor = jsonDados['nomeRecebedor'];
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
		email = jsonDados['email'];
		inscricaoEstadual = jsonDados['inscricaoEstadual'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeCabecalho'] = idNfeCabecalho ?? 0;
		jsonDados['cnpj'] = Biblioteca.removerMascara(cnpj);
		jsonDados['cpf'] = Biblioteca.removerMascara(cpf);
		jsonDados['nomeRecebedor'] = nomeRecebedor;
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
		jsonDados['email'] = email;
		jsonDados['inscricaoEstadual'] = inscricaoEstadual;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(NfeLocalEntrega objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}