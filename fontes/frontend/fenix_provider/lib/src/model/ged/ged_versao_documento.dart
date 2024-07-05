/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [GED_VERSAO_DOCUMENTO] 
                                                                                
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

class GedVersaoDocumento {
	int? id;
	int? idGedDocumentoDetalhe;
	int? idColaborador;
	int? versao;
	DateTime? dataVersao;
	String? horaVersao;
	String? hashArquivo;
	String? caminho;
	String? acao;
	Colaborador? colaborador;

	GedVersaoDocumento({
		id,
		idGedDocumentoDetalhe,
		idColaborador,
		versao,
		dataVersao,
		horaVersao,
		hashArquivo,
		caminho,
		acao,
		colaborador,
	});

	static List<String> campos = <String>[
		'ID', 
		'VERSAO', 
		'DATA_VERSAO', 
		'HORA_VERSAO', 
		'HASH_ARQUIVO', 
		'CAMINHO', 
		'ACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Versão', 
		'Data da Versão', 
		'Hora da Versão', 
		'Hash Arquivo', 
		'Caminho Arquivo', 
		'Ação', 
	];

	GedVersaoDocumento.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idGedDocumentoDetalhe = jsonDados['idGedDocumentoDetalhe'];
		idColaborador = jsonDados['idColaborador'];
		versao = jsonDados['versao'];
		dataVersao = jsonDados['dataVersao'] != null ? DateTime.tryParse(jsonDados['dataVersao']) : null;
		horaVersao = jsonDados['horaVersao'];
		hashArquivo = jsonDados['hashArquivo'];
		caminho = jsonDados['caminho'];
		acao = getAcao(jsonDados['acao']);
		colaborador = jsonDados['colaborador'] == null ? null : Colaborador.fromJson(jsonDados['colaborador']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idGedDocumentoDetalhe'] = idGedDocumentoDetalhe ?? 0;
		jsonDados['idColaborador'] = idColaborador ?? 0;
		jsonDados['versao'] = versao ?? 0;
		jsonDados['dataVersao'] = dataVersao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataVersao!) : null;
		jsonDados['horaVersao'] = Biblioteca.removerMascara(horaVersao);
		jsonDados['hashArquivo'] = hashArquivo;
		jsonDados['caminho'] = caminho;
		jsonDados['acao'] = setAcao(acao);
		jsonDados['colaborador'] = colaborador == null ? null : colaborador!.toJson;
	
		return jsonDados;
	}
	
    getAcao(String? acao) {
    	switch (acao) {
    		case 'I':
    			return 'Incluído';
    		case 'A':
    			return 'Alterado';
    		case 'E':
    			return 'Excluído';
    		default:
    			return null;
    		}
    	}

    setAcao(String? acao) {
    	switch (acao) {
    		case 'Incluído':
    			return 'I';
    		case 'Alterado':
    			return 'A';
    		case 'Excluído':
    			return 'E';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(GedVersaoDocumento objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}