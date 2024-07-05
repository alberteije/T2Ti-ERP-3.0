/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_FERROVIARIO_FERROVIA] 
                                                                                
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


class CteFerroviarioFerrovia {
	int? id;
	int? idCteFerroviario;
	String? cnpj;
	String? codigoInterno;
	String? ie;
	String? nome;
	String? logradouro;
	String? numero;
	String? complemento;
	String? bairro;
	int? codigoMunicipio;
	String? nomeMunicipio;
	String? uf;
	String? cep;

	CteFerroviarioFerrovia({
		id,
		idCteFerroviario,
		cnpj,
		codigoInterno,
		ie,
		nome,
		logradouro,
		numero,
		complemento,
		bairro,
		codigoMunicipio,
		nomeMunicipio,
		uf,
		cep,
	});

	static List<String> campos = <String>[
		'ID', 
		'CNPJ', 
		'CODIGO_INTERNO', 
		'IE', 
		'NOME', 
		'LOGRADOURO', 
		'NUMERO', 
		'COMPLEMENTO', 
		'BAIRRO', 
		'CODIGO_MUNICIPIO', 
		'NOME_MUNICIPIO', 
		'UF', 
		'CEP', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Cnpj', 
		'Codigo Interno', 
		'Ie', 
		'Nome', 
		'Logradouro', 
		'Numero', 
		'Complemento', 
		'Bairro', 
		'Codigo Municipio', 
		'Nome Municipio', 
		'Uf', 
		'Cep', 
	];

	CteFerroviarioFerrovia.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteFerroviario = jsonDados['idCteFerroviario'];
		cnpj = jsonDados['cnpj'];
		codigoInterno = jsonDados['codigoInterno'];
		ie = jsonDados['ie'];
		nome = jsonDados['nome'];
		logradouro = jsonDados['logradouro'];
		numero = jsonDados['numero'];
		complemento = jsonDados['complemento'];
		bairro = jsonDados['bairro'];
		codigoMunicipio = jsonDados['codigoMunicipio'];
		nomeMunicipio = jsonDados['nomeMunicipio'];
		uf = jsonDados['uf'];
		cep = jsonDados['cep'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteFerroviario'] = idCteFerroviario ?? 0;
		jsonDados['cnpj'] = cnpj;
		jsonDados['codigoInterno'] = codigoInterno;
		jsonDados['ie'] = ie;
		jsonDados['nome'] = nome;
		jsonDados['logradouro'] = logradouro;
		jsonDados['numero'] = numero;
		jsonDados['complemento'] = complemento;
		jsonDados['bairro'] = bairro;
		jsonDados['codigoMunicipio'] = codigoMunicipio ?? 0;
		jsonDados['nomeMunicipio'] = nomeMunicipio;
		jsonDados['uf'] = uf;
		jsonDados['cep'] = cep;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CteFerroviarioFerrovia objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}