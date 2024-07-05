/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [EMPRESA] 
                                                                                
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
import 'package:fenix/src/model/model.dart';

class Empresa {
	int? id;
	String? razaoSocial;
	String? nomeFantasia;
	String? cnpj;
	String? inscricaoEstadual;
	String? inscricaoMunicipal;
	String? tipoRegime;
	String? crt;
	String? email;
	String? site;
	String? contato;
	DateTime? dataConstituicao;
	String? tipo;
	String? inscricaoJuntaComercial;
	DateTime? dataInscJuntaComercial;
	int? codigoIbgeCidade;
	int? codigoIbgeUf;
	String? cei;
	String? codigoCnaePrincipal;
	String? imagemLogotipo;
	List<EmpresaContato>? listaEmpresaContato = [];
	List<EmpresaEndereco>? listaEmpresaEndereco = [];
	List<EmpresaTelefone>? listaEmpresaTelefone = [];

	Empresa({
		id,
		razaoSocial,
		nomeFantasia,
		cnpj,
		inscricaoEstadual,
		inscricaoMunicipal,
		tipoRegime,
		crt,
		email,
		site,
		contato,
		dataConstituicao,
		tipo,
		inscricaoJuntaComercial,
		dataInscJuntaComercial,
		codigoIbgeCidade,
		codigoIbgeUf,
		cei,
		codigoCnaePrincipal,
		imagemLogotipo,
		listaEmpresaContato,
		listaEmpresaEndereco,
		listaEmpresaTelefone,
	});

	static List<String> campos = <String>[
		'ID', 
		'RAZAO_SOCIAL', 
		'NOME_FANTASIA', 
		'CNPJ', 
		'INSCRICAO_ESTADUAL', 
		'INSCRICAO_MUNICIPAL', 
		'TIPO_REGIME', 
		'CRT', 
		'EMAIL', 
		'SITE', 
		'CONTATO', 
		'DATA_CONSTITUICAO', 
		'TIPO', 
		'INSCRICAO_JUNTA_COMERCIAL', 
		'DATA_INSC_JUNTA_COMERCIAL', 
		'CODIGO_IBGE_CIDADE', 
		'CODIGO_IBGE_UF', 
		'CEI', 
		'CODIGO_CNAE_PRINCIPAL', 
		'IMAGEM_LOGOTIPO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Razão Social', 
		'Nome Fantasia', 
		'CNPJ', 
		'Inscrição Estadual', 
		'Inscrição Municipal', 
		'Tipo Regime', 
		'CRT', 
		'E-Mail', 
		'Site', 
		'Nome Contato', 
		'Data Constituição', 
		'Tipo', 
		'Inscrição Junta Comercial', 
		'Data Inscrição Junta Comercial', 
		'Código IBGE Cidade', 
		'Código IBGE UF', 
		'Código CEI', 
		'CNAE Principal', 
		'CNAE Principal', 
	];

	Empresa.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		razaoSocial = jsonDados['razaoSocial'];
		nomeFantasia = jsonDados['nomeFantasia'];
		cnpj = jsonDados['cnpj'];
		inscricaoEstadual = jsonDados['inscricaoEstadual'];
		inscricaoMunicipal = jsonDados['inscricaoMunicipal'];
		tipoRegime = getTipoRegime(jsonDados['tipoRegime']);
		crt = getCrt(jsonDados['crt']);
		email = jsonDados['email'];
		site = jsonDados['site'];
		contato = jsonDados['contato'];
		dataConstituicao = jsonDados['dataConstituicao'] != null ? DateTime.tryParse(jsonDados['dataConstituicao']) : null;
		tipo = getTipo(jsonDados['tipo']);
		inscricaoJuntaComercial = jsonDados['inscricaoJuntaComercial'];
		dataInscJuntaComercial = jsonDados['dataInscJuntaComercial'] != null ? DateTime.tryParse(jsonDados['dataInscJuntaComercial']) : null;
		codigoIbgeCidade = jsonDados['codigoIbgeCidade'];
		codigoIbgeUf = jsonDados['codigoIbgeUf'];
		cei = jsonDados['cei'];
		codigoCnaePrincipal = jsonDados['codigoCnaePrincipal'];
		imagemLogotipo = jsonDados['imagemLogotipo'];
		listaEmpresaContato = (jsonDados['listaEmpresaContato'] as Iterable?)?.map((m) => EmpresaContato.fromJson(m)).toList() ?? [];
		listaEmpresaEndereco = (jsonDados['listaEmpresaEndereco'] as Iterable?)?.map((m) => EmpresaEndereco.fromJson(m)).toList() ?? [];
		listaEmpresaTelefone = (jsonDados['listaEmpresaTelefone'] as Iterable?)?.map((m) => EmpresaTelefone.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['razaoSocial'] = razaoSocial;
		jsonDados['nomeFantasia'] = nomeFantasia;
		jsonDados['cnpj'] = Biblioteca.removerMascara(cnpj);
		jsonDados['inscricaoEstadual'] = inscricaoEstadual;
		jsonDados['inscricaoMunicipal'] = inscricaoMunicipal;
		jsonDados['tipoRegime'] = setTipoRegime(tipoRegime);
		jsonDados['crt'] = setCrt(crt);
		jsonDados['email'] = email;
		jsonDados['site'] = site;
		jsonDados['contato'] = contato;
		jsonDados['dataConstituicao'] = dataConstituicao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataConstituicao!) : null;
		jsonDados['tipo'] = setTipo(tipo);
		jsonDados['inscricaoJuntaComercial'] = inscricaoJuntaComercial;
		jsonDados['dataInscJuntaComercial'] = dataInscJuntaComercial != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataInscJuntaComercial!) : null;
		jsonDados['codigoIbgeCidade'] = codigoIbgeCidade ?? 0;
		jsonDados['codigoIbgeUf'] = codigoIbgeUf ?? 0;
		jsonDados['cei'] = cei;
		jsonDados['codigoCnaePrincipal'] = codigoCnaePrincipal;
		jsonDados['imagemLogotipo'] = imagemLogotipo;
		

		var listaEmpresaContatoLocal = [];
		for (EmpresaContato objeto in listaEmpresaContato ?? []) {
			listaEmpresaContatoLocal.add(objeto.toJson);
		}
		jsonDados['listaEmpresaContato'] = listaEmpresaContatoLocal;
		

		var listaEmpresaEnderecoLocal = [];
		for (EmpresaEndereco objeto in listaEmpresaEndereco ?? []) {
			listaEmpresaEnderecoLocal.add(objeto.toJson);
		}
		jsonDados['listaEmpresaEndereco'] = listaEmpresaEnderecoLocal;
		

		var listaEmpresaTelefoneLocal = [];
		for (EmpresaTelefone objeto in listaEmpresaTelefone ?? []) {
			listaEmpresaTelefoneLocal.add(objeto.toJson);
		}
		jsonDados['listaEmpresaTelefone'] = listaEmpresaTelefoneLocal;
	
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

    getTipo(String? tipo) {
    	switch (tipo) {
    		case 'M':
    			return 'Matriz';
    		case 'F':
    			return 'Filial';
    		default:
    			return null;
    		}
    	}

    setTipo(String? tipo) {
    	switch (tipo) {
    		case 'Matriz':
    			return 'M';
    		case 'Filial':
    			return 'F';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}