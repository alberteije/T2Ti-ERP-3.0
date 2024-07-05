/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [COLABORADOR] 
                                                                                
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
import 'package:fenix/src/model/model.dart';

class Colaborador {
	int? id;
	int? idPessoa;
	int? idCargo;
	int? idSetor;
	int? idColaboradorSituacao;
	int? idTipoAdmissao;
	int? idColaboradorTipo;
	int? idSindicato;
	String? matricula;
	DateTime? dataCadastro;
	DateTime? dataAdmissao;
	DateTime? dataDemissao;
	String? ctpsNumero;
	String? ctpsSerie;
	DateTime? ctpsDataExpedicao;
	String? ctpsUf;
	String? observacao;
	Usuario? usuario;
	Cargo? cargo;
	Setor? setor;
	ColaboradorSituacao? colaboradorSituacao;
	TipoAdmissao? tipoAdmissao;
	ColaboradorTipo? colaboradorTipo;
	Sindicato? sindicato;
	ViewPessoaColaborador? pessoa;
	// Pessoa? pessoa;  // esse objeto recebe os dados da view, pois a Pessoa precisa ter um Colaborador vinculado - evita referência circular no servidor
	List<Vendedor>? listaVendedor = [];

	Colaborador({
		id,
		idPessoa,
		idCargo,
		idSetor,
		idColaboradorSituacao,
		idTipoAdmissao,
		idColaboradorTipo,
		idSindicato,
		matricula,
		dataCadastro,
		dataAdmissao,
		dataDemissao,
		ctpsNumero,
		ctpsSerie,
		ctpsDataExpedicao,
		ctpsUf,
		observacao,
		usuario,
		cargo,
		setor,
		colaboradorSituacao,
		tipoAdmissao,
		colaboradorTipo,
		sindicato,
		// pessoa,
    viewPessoaColaborador,
		listaVendedor,
	});

	static List<String> campos = <String>[
		'ID', 
		'MATRICULA', 
		'DATA_CADASTRO', 
		'DATA_ADMISSAO', 
		'DATA_DEMISSAO', 
		'CTPS_NUMERO', 
		'CTPS_SERIE', 
		'CTPS_DATA_EXPEDICAO', 
		'CTPS_UF', 
		'OBSERVACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Matrícula', 
		'Data de Cadastro', 
		'Data de Admissão', 
		'Data de Demissão', 
		'Número CTPS', 
		'Série CTPS', 
		'Data de Expedição', 
		'UF CTPS', 
		'Observação', 
	];

	Colaborador.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idPessoa = jsonDados['idPessoa'];
		idCargo = jsonDados['idCargo'];
		idSetor = jsonDados['idSetor'];
		idColaboradorSituacao = jsonDados['idColaboradorSituacao'];
		idTipoAdmissao = jsonDados['idTipoAdmissao'];
		idColaboradorTipo = jsonDados['idColaboradorTipo'];
		idSindicato = jsonDados['idSindicato'];
		matricula = jsonDados['matricula'];
		dataCadastro = jsonDados['dataCadastro'] != null ? DateTime.tryParse(jsonDados['dataCadastro']) : null;
		dataAdmissao = jsonDados['dataAdmissao'] != null ? DateTime.tryParse(jsonDados['dataAdmissao']) : null;
		dataDemissao = jsonDados['dataDemissao'] != null ? DateTime.tryParse(jsonDados['dataDemissao']) : null;
		ctpsNumero = jsonDados['ctpsNumero'];
		ctpsSerie = jsonDados['ctpsSerie'];
		ctpsDataExpedicao = jsonDados['ctpsDataExpedicao'] != null ? DateTime.tryParse(jsonDados['ctpsDataExpedicao']) : null;
		ctpsUf = jsonDados['ctpsUf'] == '' ? null : jsonDados['ctpsUf'];
		observacao = jsonDados['observacao'];
		usuario = jsonDados['usuario'] == null ? null : Usuario.fromJson(jsonDados['usuario']);
		cargo = jsonDados['cargo'] == null ? null : Cargo.fromJson(jsonDados['cargo']);
		setor = jsonDados['setor'] == null ? null : Setor.fromJson(jsonDados['setor']);
		colaboradorSituacao = jsonDados['colaboradorSituacao'] == null ? null : ColaboradorSituacao.fromJson(jsonDados['colaboradorSituacao']);
		tipoAdmissao = jsonDados['tipoAdmissao'] == null ? null : TipoAdmissao.fromJson(jsonDados['tipoAdmissao']);
		colaboradorTipo = jsonDados['colaboradorTipo'] == null ? null : ColaboradorTipo.fromJson(jsonDados['colaboradorTipo']);
		sindicato = jsonDados['sindicato'] == null ? null : Sindicato.fromJson(jsonDados['sindicato']);
		// pessoa = jsonDados['pessoa'] == null ? null : Pessoa.fromJson(jsonDados['pessoa']);
		pessoa = jsonDados['viewPessoaColaborador'] == null ? null : ViewPessoaColaborador.fromJson(jsonDados['viewPessoaColaborador']);
    listaVendedor = (jsonDados['listaVendedor'] as Iterable?)?.map((m) => Vendedor.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idPessoa'] = idPessoa ?? 0;
		jsonDados['idCargo'] = idCargo ?? 0;
		jsonDados['idSetor'] = idSetor ?? 0;
		jsonDados['idColaboradorSituacao'] = idColaboradorSituacao ?? 0;
		jsonDados['idTipoAdmissao'] = idTipoAdmissao ?? 0;
		jsonDados['idColaboradorTipo'] = idColaboradorTipo ?? 0;
		jsonDados['idSindicato'] = idSindicato ?? 0;
		jsonDados['matricula'] = matricula;
		jsonDados['dataCadastro'] = dataCadastro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataCadastro!) : null;
		jsonDados['dataAdmissao'] = dataAdmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataAdmissao!) : null;
		jsonDados['dataDemissao'] = dataDemissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataDemissao!) : null;
		jsonDados['ctpsNumero'] = ctpsNumero;
		jsonDados['ctpsSerie'] = ctpsSerie;
		jsonDados['ctpsDataExpedicao'] = ctpsDataExpedicao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(ctpsDataExpedicao!) : null;
		jsonDados['ctpsUf'] = ctpsUf;
		jsonDados['observacao'] = observacao;
		jsonDados['usuario'] = usuario == null ? null : usuario!.toJson;
		jsonDados['cargo'] = cargo == null ? null : cargo!.toJson;
		jsonDados['setor'] = setor == null ? null : setor!.toJson;
		jsonDados['colaboradorSituacao'] = colaboradorSituacao == null ? null : colaboradorSituacao!.toJson;
		jsonDados['tipoAdmissao'] = tipoAdmissao == null ? null : tipoAdmissao!.toJson;
		jsonDados['colaboradorTipo'] = colaboradorTipo == null ? null : colaboradorTipo!.toJson;
		jsonDados['sindicato'] = sindicato == null ? null : sindicato!.toJson;
		// jsonDados['pessoa'] = pessoa == null ? null : pessoa!.toJson;		
    jsonDados['viewPessoaColaborador'] = pessoa == null ? null : pessoa!.toJson;

		var listaVendedorLocal = [];
		for (Vendedor objeto in listaVendedor ?? []) {
			listaVendedorLocal.add(objeto.toJson);
		}
		jsonDados['listaVendedor'] = listaVendedorLocal;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(Colaborador objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}