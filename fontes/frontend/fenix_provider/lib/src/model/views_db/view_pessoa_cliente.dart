/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VIEW_PESSOA_CLIENTE] 
                                                                                
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

class ViewPessoaCliente {
	int? id;
	String? nome;
	String? tipo;
	String? email;
	String? site;
	String? cpfCnpj;
	String? rgIe;
	DateTime? desde;
	double? taxaDesconto;
	double? limiteCredito;
	DateTime? dataCadastro;
	String? observacao;
	String? logradouro;
	String? numero;
	String? complemento;
	String? bairro;
	String? cidade;
	String? cep;
	int? municipioIbge;
	String? uf;
	int? idPessoa;

	ViewPessoaCliente({
		id,
		nome,
		tipo,
		email,
		site,
		cpfCnpj,
		rgIe,
		desde,
		taxaDesconto = 0.0,
		limiteCredito = 0.0,
		dataCadastro,
		observacao,
		logradouro,
		numero,
		complemento,
		bairro,
		cidade,
		cep,
		municipioIbge,
		uf,
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
		'DESDE', 
		'TAXA_DESCONTO', 
		'LIMITE_CREDITO', 
		'DATA_CADASTRO', 
		'OBSERVACAO', 
		'LOGRADOURO', 
		'NUMERO', 
		'COMPLEMENTO', 
		'BAIRRO', 
		'CIDADE', 
		'CEP', 
		'MUNICIPIO_IBGE', 
		'UF', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Nome', 
		'Tipo', 
		'Email', 
		'Site', 
		'Cpf Cnpj', 
		'Rg Ie', 
		'Desde', 
		'Taxa Desconto', 
		'Limite Credito', 
		'Data Cadastro', 
		'Observacao', 
		'Logradouro', 
		'Numero', 
		'Complemento', 
		'Bairro', 
		'Cidade', 
		'Cep', 
		'Municipio Ibge', 
		'Uf', 
	];

	ViewPessoaCliente.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		nome = jsonDados['nome'];
		tipo = jsonDados['tipo'];
		email = jsonDados['email'];
		site = jsonDados['site'];
		cpfCnpj = jsonDados['cpfCnpj'];
		rgIe = jsonDados['rgIe'];
		desde = jsonDados['desde'] != null ? DateTime.tryParse(jsonDados['desde']) : null;
		taxaDesconto = jsonDados['taxaDesconto']?.toDouble();
		limiteCredito = jsonDados['limiteCredito']?.toDouble();
		dataCadastro = jsonDados['dataCadastro'] != null ? DateTime.tryParse(jsonDados['dataCadastro']) : null;
		observacao = jsonDados['observacao'];
		logradouro = jsonDados['logradouro'];
		numero = jsonDados['numero'];
		complemento = jsonDados['complemento'];
		bairro = jsonDados['bairro'];
		cidade = jsonDados['cidade'];
		cep = jsonDados['cep'];
		municipioIbge = jsonDados['municipioIbge'];
		uf = jsonDados['uf'];
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
		jsonDados['desde'] = desde != null ? DateFormat('yyyy-MM-ddT00:00:00').format(desde!) : null;
		jsonDados['taxaDesconto'] = taxaDesconto;
		jsonDados['limiteCredito'] = limiteCredito;
		jsonDados['dataCadastro'] = dataCadastro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataCadastro!) : null;
		jsonDados['observacao'] = observacao;
		jsonDados['logradouro'] = logradouro;
		jsonDados['numero'] = numero;
		jsonDados['complemento'] = complemento;
		jsonDados['bairro'] = bairro;
		jsonDados['cidade'] = cidade;
		jsonDados['cep'] = cep;
		jsonDados['municipioIbge'] = municipioIbge ?? 0;
		jsonDados['uf'] = uf;
		jsonDados['idPessoa'] = idPessoa ?? 0;
	
		return jsonDados;
	}
	

	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}