/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VENDA_COMISSAO] 
                                                                                
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

class VendaComissao {
	int? id;
	int? idVendaCabecalho;
	int? idVendedor;
	double? valorVenda;
	String? tipoContabil;
	double? valorComissao;
	String? situacao;
	DateTime? dataLancamento;
	Vendedor? vendedor;

	VendaComissao({
		id,
		idVendaCabecalho,
		idVendedor,
		valorVenda = 0.0,
		tipoContabil,
		valorComissao = 0.0,
		situacao,
		dataLancamento,
		vendedor,
	});

	static List<String> campos = <String>[
		'ID', 
		'VALOR_VENDA', 
		'TIPO_CONTABIL', 
		'VALOR_COMISSAO', 
		'SITUACAO', 
		'DATA_LANCAMENTO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Valor Venda', 
		'Tipo Contábil', 
		'Valor Comissão', 
		'Situação', 
		'Data de Lançamento', 
	];

	VendaComissao.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idVendaCabecalho = jsonDados['idVendaCabecalho'];
		idVendedor = jsonDados['idVendedor'];
		valorVenda = jsonDados['valorVenda']?.toDouble();
		tipoContabil = getTipoContabil(jsonDados['tipoContabil']);
		valorComissao = jsonDados['valorComissao']?.toDouble();
		situacao = getSituacao(jsonDados['situacao']);
		dataLancamento = jsonDados['dataLancamento'] != null ? DateTime.tryParse(jsonDados['dataLancamento']) : null;
		vendedor = jsonDados['vendedor'] == null ? null : Vendedor.fromJson(jsonDados['vendedor']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idVendaCabecalho'] = idVendaCabecalho ?? 0;
		jsonDados['idVendedor'] = idVendedor ?? 0;
		jsonDados['valorVenda'] = valorVenda;
		jsonDados['tipoContabil'] = setTipoContabil(tipoContabil);
		jsonDados['valorComissao'] = valorComissao;
		jsonDados['situacao'] = setSituacao(situacao);
		jsonDados['dataLancamento'] = dataLancamento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataLancamento!) : null;
		jsonDados['vendedor'] = vendedor == null ? null : vendedor!.toJson;
	
		return jsonDados;
	}
	
    getTipoContabil(String? tipoContabil) {
    	switch (tipoContabil) {
    		case 'C':
    			return 'Crédito';
    		case 'D':
    			return 'Débito';
    		default:
    			return null;
    		}
    	}

    setTipoContabil(String? tipoContabil) {
    	switch (tipoContabil) {
    		case 'Crédito':
    			return 'C';
    		case 'Débito':
    			return 'D';
    		default:
    			return null;
    		}
    	}

    getSituacao(String? situacao) {
    	switch (situacao) {
    		case 'A':
    			return 'Aberto';
    		case 'Q':
    			return 'Quitado';
    		default:
    			return null;
    		}
    	}

    setSituacao(String? situacao) {
    	switch (situacao) {
    		case 'Aberto':
    			return 'A';
    		case 'Quitado':
    			return 'Q';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(VendaComissao objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}