/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PRODUTO] 
                                                                                
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

class Produto {
	int? id;
	int? idProdutoSubgrupo;
	int? idProdutoMarca;
	int? idProdutoUnidade;
	int? idTributIcmsCustomCab;
	int? idTributGrupoTributario;
	String? nome;
	String? descricao;
	String? gtin;
	String? codigoInterno;
	double? valorCompra;
	double? valorVenda;
	String? codigoNcm;
	double? estoqueMinimo;
	double? estoqueMaximo;
	double? quantidadeEstoque;
	DateTime? dataCadastro;
	ProdutoSubgrupo? produtoSubgrupo;
	ProdutoMarca? produtoMarca;
	ProdutoUnidade? produtoUnidade;
	TributIcmsCustomCab? tributIcmsCustomCab;
	TributGrupoTributario? tributGrupoTributario;

	Produto({
		id,
		idProdutoSubgrupo,
		idProdutoMarca,
		idProdutoUnidade,
		idTributIcmsCustomCab,
		idTributGrupoTributario,
		nome,
		descricao,
		gtin,
		codigoInterno,
		valorCompra = 0.0,
		valorVenda = 0.0,
		codigoNcm,
		estoqueMinimo = 0.0,
		estoqueMaximo = 0.0,
		quantidadeEstoque = 0.0,
		dataCadastro,
		produtoSubgrupo,
		produtoMarca,
		produtoUnidade,
		tributIcmsCustomCab,
		tributGrupoTributario,
	});

	static List<String> campos = <String>[
		'ID', 
		'NOME', 
		'DESCRICAO', 
		'GTIN', 
		'CODIGO_INTERNO', 
		'VALOR_COMPRA', 
		'VALOR_VENDA', 
		'CODIGO_NCM', 
		'ESTOQUE_MINIMO', 
		'ESTOQUE_MAXIMO', 
		'QUANTIDADE_ESTOQUE', 
		'DATA_CADASTRO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Nome', 
		'Descrição', 
		'GTIN', 
		'Código Interno', 
		'Valor Compra', 
		'Valor Venda', 
		'Código NCM', 
		'Estoque Mínimo', 
		'Estoque Máximo', 
		'Quantidade em Estoque', 
		'Data de Cadastro', 
	];

	Produto.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idProdutoSubgrupo = jsonDados['idProdutoSubgrupo'];
		idProdutoMarca = jsonDados['idProdutoMarca'];
		idProdutoUnidade = jsonDados['idProdutoUnidade'];
		idTributIcmsCustomCab = jsonDados['idTributIcmsCustomCab'];
		idTributGrupoTributario = jsonDados['idTributGrupoTributario'];
		nome = jsonDados['nome'];
		descricao = jsonDados['descricao'];
		gtin = jsonDados['gtin'];
		codigoInterno = jsonDados['codigoInterno'];
		valorCompra = jsonDados['valorCompra']?.toDouble();
		valorVenda = jsonDados['valorVenda']?.toDouble();
		codigoNcm = jsonDados['codigoNcm'];
		estoqueMinimo = jsonDados['estoqueMinimo']?.toDouble();
		estoqueMaximo = jsonDados['estoqueMaximo']?.toDouble();
		quantidadeEstoque = jsonDados['quantidadeEstoque']?.toDouble();
		dataCadastro = jsonDados['dataCadastro'] != null ? DateTime.tryParse(jsonDados['dataCadastro']) : null;
		produtoSubgrupo = jsonDados['produtoSubgrupo'] == null ? null : ProdutoSubgrupo.fromJson(jsonDados['produtoSubgrupo']);
		produtoMarca = jsonDados['produtoMarca'] == null ? null : ProdutoMarca.fromJson(jsonDados['produtoMarca']);
		produtoUnidade = jsonDados['produtoUnidade'] == null ? null : ProdutoUnidade.fromJson(jsonDados['produtoUnidade']);
		tributIcmsCustomCab = jsonDados['tributIcmsCustomCab'] == null ? null : TributIcmsCustomCab.fromJson(jsonDados['tributIcmsCustomCab']);
		tributGrupoTributario = jsonDados['tributGrupoTributario'] == null ? null : TributGrupoTributario.fromJson(jsonDados['tributGrupoTributario']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idProdutoSubgrupo'] = idProdutoSubgrupo ?? 0;
		jsonDados['idProdutoMarca'] = idProdutoMarca ?? 0;
		jsonDados['idProdutoUnidade'] = idProdutoUnidade ?? 0;
		jsonDados['idTributIcmsCustomCab'] = idTributIcmsCustomCab ?? 0;
		jsonDados['idTributGrupoTributario'] = idTributGrupoTributario ?? 0;
		jsonDados['nome'] = nome;
		jsonDados['descricao'] = descricao;
		jsonDados['gtin'] = gtin;
		jsonDados['codigoInterno'] = codigoInterno;
		jsonDados['valorCompra'] = valorCompra;
		jsonDados['valorVenda'] = valorVenda;
		jsonDados['codigoNcm'] = codigoNcm;
		jsonDados['estoqueMinimo'] = estoqueMinimo;
		jsonDados['estoqueMaximo'] = estoqueMaximo;
		jsonDados['quantidadeEstoque'] = quantidadeEstoque;
		jsonDados['dataCadastro'] = dataCadastro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataCadastro!) : null;
		jsonDados['produtoSubgrupo'] = produtoSubgrupo == null ? null : produtoSubgrupo!.toJson;
		jsonDados['produtoMarca'] = produtoMarca == null ? null : produtoMarca!.toJson;
		jsonDados['produtoUnidade'] = produtoUnidade == null ? null : produtoUnidade!.toJson;
		jsonDados['tributIcmsCustomCab'] = tributIcmsCustomCab == null ? null : tributIcmsCustomCab!.toJson;
		jsonDados['tributGrupoTributario'] = tributGrupoTributario == null ? null : tributGrupoTributario!.toJson;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(Produto objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}