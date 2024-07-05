/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_PERIGOSO] 
                                                                                
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


class CtePerigoso {
	int? id;
	int? idCteCabecalho;
	String? numeroOnu;
	String? nomeApropriado;
	String? classeRisco;
	String? grupoEmbalagem;
	String? quantidadeTotalProduto;
	String? quantidadeTipoVolume;
	String? pontoFulgor;

	CtePerigoso({
		id,
		idCteCabecalho,
		numeroOnu,
		nomeApropriado,
		classeRisco,
		grupoEmbalagem,
		quantidadeTotalProduto,
		quantidadeTipoVolume,
		pontoFulgor,
	});

	static List<String> campos = <String>[
		'ID', 
		'NUMERO_ONU', 
		'NOME_APROPRIADO', 
		'CLASSE_RISCO', 
		'GRUPO_EMBALAGEM', 
		'QUANTIDADE_TOTAL_PRODUTO', 
		'QUANTIDADE_TIPO_VOLUME', 
		'PONTO_FULGOR', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Numero Onu', 
		'Nome Apropriado', 
		'Classe Risco', 
		'Grupo Embalagem', 
		'Quantidade Total Produto', 
		'Quantidade Tipo Volume', 
		'Ponto Fulgor', 
	];

	CtePerigoso.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteCabecalho = jsonDados['idCteCabecalho'];
		numeroOnu = jsonDados['numeroOnu'];
		nomeApropriado = jsonDados['nomeApropriado'];
		classeRisco = jsonDados['classeRisco'];
		grupoEmbalagem = jsonDados['grupoEmbalagem'];
		quantidadeTotalProduto = jsonDados['quantidadeTotalProduto'];
		quantidadeTipoVolume = jsonDados['quantidadeTipoVolume'];
		pontoFulgor = jsonDados['pontoFulgor'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteCabecalho'] = idCteCabecalho ?? 0;
		jsonDados['numeroOnu'] = numeroOnu;
		jsonDados['nomeApropriado'] = nomeApropriado;
		jsonDados['classeRisco'] = classeRisco;
		jsonDados['grupoEmbalagem'] = grupoEmbalagem;
		jsonDados['quantidadeTotalProduto'] = quantidadeTotalProduto;
		jsonDados['quantidadeTipoVolume'] = quantidadeTipoVolume;
		jsonDados['pontoFulgor'] = pontoFulgor;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CtePerigoso objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}