/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [GED_DOCUMENTO_DETALHE] 
                                                                                
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

class GedDocumentoDetalhe {
	int? id;
	int? idGedDocumentoCabecalho;
	int? idGedTipoDocumento;
	String? nome;
	String? descricao;
	String? palavrasChave;
	String? podeExcluir;
	String? podeAlterar;
	String? assinado;
	DateTime? dataFimVigencia;
	DateTime? dataExclusao;
	GedTipoDocumento? gedTipoDocumento;

	GedDocumentoDetalhe({
		id,
		idGedDocumentoCabecalho,
		idGedTipoDocumento,
		nome,
		descricao,
		palavrasChave,
		podeExcluir,
		podeAlterar,
		assinado,
		dataFimVigencia,
		dataExclusao,
		gedTipoDocumento,
	});

	static List<String> campos = <String>[
		'ID', 
		'NOME', 
		'DESCRICAO', 
		'PALAVRAS_CHAVE', 
		'PODE_EXCLUIR', 
		'PODE_ALTERAR', 
		'ASSINADO', 
		'DATA_FIM_VIGENCIA', 
		'DATA_EXCLUSAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Nome', 
		'Descrição', 
		'Palavras Chave', 
		'Pode Excluir', 
		'Pode Alterar', 
		'Assinatura Digital', 
		'Data Fim Vigência', 
		'Data Exclusão', 
	];

	GedDocumentoDetalhe.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idGedDocumentoCabecalho = jsonDados['idGedDocumentoCabecalho'];
		idGedTipoDocumento = jsonDados['idGedTipoDocumento'];
		nome = jsonDados['nome'];
		descricao = jsonDados['descricao'];
		palavrasChave = jsonDados['palavrasChave'];
		podeExcluir = getPodeExcluir(jsonDados['podeExcluir']);
		podeAlterar = getPodeAlterar(jsonDados['podeAlterar']);
		assinado = getAssinado(jsonDados['assinado']);
		dataFimVigencia = jsonDados['dataFimVigencia'] != null ? DateTime.tryParse(jsonDados['dataFimVigencia']) : null;
		dataExclusao = jsonDados['dataExclusao'] != null ? DateTime.tryParse(jsonDados['dataExclusao']) : null;
		gedTipoDocumento = jsonDados['gedTipoDocumento'] == null ? null : GedTipoDocumento.fromJson(jsonDados['gedTipoDocumento']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idGedDocumentoCabecalho'] = idGedDocumentoCabecalho ?? 0;
		jsonDados['idGedTipoDocumento'] = idGedTipoDocumento ?? 0;
		jsonDados['nome'] = nome;
		jsonDados['descricao'] = descricao;
		jsonDados['palavrasChave'] = palavrasChave;
		jsonDados['podeExcluir'] = setPodeExcluir(podeExcluir);
		jsonDados['podeAlterar'] = setPodeAlterar(podeAlterar);
		jsonDados['assinado'] = setAssinado(assinado);
		jsonDados['dataFimVigencia'] = dataFimVigencia != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataFimVigencia!) : null;
		jsonDados['dataExclusao'] = dataExclusao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataExclusao!) : null;
		jsonDados['gedTipoDocumento'] = gedTipoDocumento == null ? null : gedTipoDocumento!.toJson;
	
		return jsonDados;
	}
	
    getPodeExcluir(String? podeExcluir) {
    	switch (podeExcluir) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setPodeExcluir(String? podeExcluir) {
    	switch (podeExcluir) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getPodeAlterar(String? podeAlterar) {
    	switch (podeAlterar) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setPodeAlterar(String? podeAlterar) {
    	switch (podeAlterar) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getAssinado(String? assinado) {
    	switch (assinado) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setAssinado(String? assinado) {
    	switch (assinado) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(GedDocumentoDetalhe objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}