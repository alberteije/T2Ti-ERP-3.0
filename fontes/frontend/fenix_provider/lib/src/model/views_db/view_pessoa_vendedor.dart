/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VIEW_PESSOA_VENDEDOR] 
                                                                                
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

class ViewPessoaVendedor {
	int? id;
	String? nome;
	String? tipo;
	String? email;
	String? site;
	String? cpfCnpj;
	String? rgIe;
	String? matricula;
	DateTime? dataCadastro;
	DateTime? dataAdmissao;
	DateTime? dataDemissao;
	String? ctpsNumero;
	String? ctpsSerie;
	DateTime? ctpsDataExpedicao;
	String? ctpsUf;
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
	int? idCargo;
	int? idSetor;
	double? comissao;
	double? metaVenda;

	ViewPessoaVendedor({
		id,
		nome,
		tipo,
		email,
		site,
		cpfCnpj,
		rgIe,
		matricula,
		dataCadastro,
		dataAdmissao,
		dataDemissao,
		ctpsNumero,
		ctpsSerie,
		ctpsDataExpedicao,
		ctpsUf,
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
		idCargo,
		idSetor,
		comissao = 0.0,
		metaVenda = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'NOME', 
		'TIPO', 
		'EMAIL', 
		'SITE', 
		'CPF_CNPJ', 
		'RG_IE', 
		'MATRICULA', 
		'DATA_CADASTRO', 
		'DATA_ADMISSAO', 
		'DATA_DEMISSAO', 
		'CTPS_NUMERO', 
		'CTPS_SERIE', 
		'CTPS_DATA_EXPEDICAO', 
		'CTPS_UF', 
		'OBSERVACAO', 
		'LOGRADOURO', 
		'NUMERO', 
		'COMPLEMENTO', 
		'BAIRRO', 
		'CIDADE', 
		'CEP', 
		'MUNICIPIO_IBGE', 
		'UF', 
		'COMISSAO', 
		'META_VENDA', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Nome', 
		'Tipo', 
		'Email', 
		'Site', 
		'Cpf Cnpj', 
		'Rg Ie', 
		'Matricula', 
		'Data Cadastro', 
		'Data Admissao', 
		'Data Demissao', 
		'Ctps Numero', 
		'Ctps Serie', 
		'Ctps Data Expedicao', 
		'Ctps Uf', 
		'Observacao', 
		'Logradouro', 
		'Numero', 
		'Complemento', 
		'Bairro', 
		'Cidade', 
		'Cep', 
		'Municipio Ibge', 
		'Uf', 
		'Comissao', 
		'Meta Venda', 
	];

	ViewPessoaVendedor.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		nome = jsonDados['nome'];
		tipo = jsonDados['tipo'];
		email = jsonDados['email'];
		site = jsonDados['site'];
		cpfCnpj = jsonDados['cpfCnpj'];
		rgIe = jsonDados['rgIe'];
		matricula = jsonDados['matricula'];
		dataCadastro = jsonDados['dataCadastro'] != null ? DateTime.tryParse(jsonDados['dataCadastro']) : null;
		dataAdmissao = jsonDados['dataAdmissao'] != null ? DateTime.tryParse(jsonDados['dataAdmissao']) : null;
		dataDemissao = jsonDados['dataDemissao'] != null ? DateTime.tryParse(jsonDados['dataDemissao']) : null;
		ctpsNumero = jsonDados['ctpsNumero'];
		ctpsSerie = jsonDados['ctpsSerie'];
		ctpsDataExpedicao = jsonDados['ctpsDataExpedicao'] != null ? DateTime.tryParse(jsonDados['ctpsDataExpedicao']) : null;
		ctpsUf = jsonDados['ctpsUf'];
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
		idCargo = jsonDados['idCargo'];
		idSetor = jsonDados['idSetor'];
		comissao = jsonDados['comissao']?.toDouble();
		metaVenda = jsonDados['metaVenda']?.toDouble();
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
		jsonDados['matricula'] = matricula;
		jsonDados['dataCadastro'] = dataCadastro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataCadastro!) : null;
		jsonDados['dataAdmissao'] = dataAdmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataAdmissao!) : null;
		jsonDados['dataDemissao'] = dataDemissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataDemissao!) : null;
		jsonDados['ctpsNumero'] = ctpsNumero;
		jsonDados['ctpsSerie'] = ctpsSerie;
		jsonDados['ctpsDataExpedicao'] = ctpsDataExpedicao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(ctpsDataExpedicao!) : null;
		jsonDados['ctpsUf'] = ctpsUf;
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
		jsonDados['idCargo'] = idCargo ?? 0;
		jsonDados['idSetor'] = idSetor ?? 0;
		jsonDados['comissao'] = comissao;
		jsonDados['metaVenda'] = metaVenda;
	
		return jsonDados;
	}
	

	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}