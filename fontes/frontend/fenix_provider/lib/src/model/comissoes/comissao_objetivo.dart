/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [COMISSAO_OBJETIVO] 
                                                                                
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

class ComissaoObjetivo {
	int? id;
	int? idComissaoPerfil;
	int? idProduto;
	String? codigo;
	String? nome;
	String? descricao;
	String? formaPagamento;
	double? taxaPagamento;
	double? valorPagamento;
	double? valorMeta;
	double? quantidade;
	ComissaoPerfil? comissaoPerfil;
	Produto? produto;

	ComissaoObjetivo({
		id,
		idComissaoPerfil,
		idProduto,
		codigo,
		nome,
		descricao,
		formaPagamento,
		taxaPagamento = 0.0,
		valorPagamento = 0.0,
		valorMeta = 0.0,
		quantidade = 0.0,
		comissaoPerfil,
		produto,
	});

	static List<String> campos = <String>[
		'ID', 
		'CODIGO', 
		'NOME', 
		'DESCRICAO', 
		'FORMA_PAGAMENTO', 
		'TAXA_PAGAMENTO', 
		'VALOR_PAGAMENTO', 
		'VALOR_META', 
		'QUANTIDADE', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Código', 
		'Nome', 
		'Descrição', 
		'Forma de Pagamento', 
		'Taxa Pagamento', 
		'Valor Pagamento', 
		'Valor Meta', 
		'Quantidade', 
	];

	ComissaoObjetivo.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idComissaoPerfil = jsonDados['idComissaoPerfil'];
		idProduto = jsonDados['idProduto'];
		codigo = jsonDados['codigo'];
		nome = jsonDados['nome'];
		descricao = jsonDados['descricao'];
		formaPagamento = getFormaPagamento(jsonDados['formaPagamento']);
		taxaPagamento = jsonDados['taxaPagamento']?.toDouble();
		valorPagamento = jsonDados['valorPagamento']?.toDouble();
		valorMeta = jsonDados['valorMeta']?.toDouble();
		quantidade = jsonDados['quantidade']?.toDouble();
		comissaoPerfil = jsonDados['comissaoPerfil'] == null ? null : ComissaoPerfil.fromJson(jsonDados['comissaoPerfil']);
		produto = jsonDados['produto'] == null ? null : Produto.fromJson(jsonDados['produto']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idComissaoPerfil'] = idComissaoPerfil ?? 0;
		jsonDados['idProduto'] = idProduto ?? 0;
		jsonDados['codigo'] = codigo;
		jsonDados['nome'] = nome;
		jsonDados['descricao'] = descricao;
		jsonDados['formaPagamento'] = setFormaPagamento(formaPagamento);
		jsonDados['taxaPagamento'] = taxaPagamento;
		jsonDados['valorPagamento'] = valorPagamento;
		jsonDados['valorMeta'] = valorMeta;
		jsonDados['quantidade'] = quantidade;
		jsonDados['comissaoPerfil'] = comissaoPerfil == null ? null : comissaoPerfil!.toJson;
		jsonDados['produto'] = produto == null ? null : produto!.toJson;
	
		return jsonDados;
	}
	
    getFormaPagamento(String? formaPagamento) {
    	switch (formaPagamento) {
    		case 'V':
    			return 'Valor Fixo';
    		case 'P':
    			return 'Percentual';
    		default:
    			return null;
    		}
    	}

    setFormaPagamento(String? formaPagamento) {
    	switch (formaPagamento) {
    		case 'Valor Fixo':
    			return 'V';
    		case 'Percentual':
    			return 'P';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(ComissaoObjetivo objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}