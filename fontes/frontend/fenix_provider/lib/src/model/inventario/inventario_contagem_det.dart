/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [INVENTARIO_CONTAGEM_DET] 
                                                                                
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

import 'package:fenix/src/infra/biblioteca.dart';
import 'package:fenix/src/model/model.dart';

class InventarioContagemDet {
	int? id;
	int? idInventarioContagemCab;
	int? idProduto;
	double? contagem01;
	double? contagem02;
	double? contagem03;
	String? fechadoContagem;
	double? quantidadeSistema;
	double? acuracidade;
	double? divergencia;
	Produto? produto;

	InventarioContagemDet({
		id,
		idInventarioContagemCab,
		idProduto,
		contagem01 = 0.0,
		contagem02 = 0.0,
		contagem03 = 0.0,
		fechadoContagem,
		quantidadeSistema = 0.0,
		acuracidade = 0.0,
		divergencia = 0.0,
		produto,
	});

	static List<String> campos = <String>[
		'ID', 
		'CONTAGEM01', 
		'CONTAGEM02', 
		'CONTAGEM03', 
		'FECHADO_CONTAGEM', 
		'QUANTIDADE_SISTEMA', 
		'ACURACIDADE', 
		'DIVERGENCIA', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Contagem 01', 
		'Contagem 02', 
		'Contagem 03', 
		'Fechado na Contagem', 
		'Quantidade Sistema', 
		'Acuracidade', 
		'Divergência', 
	];

	InventarioContagemDet.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idInventarioContagemCab = jsonDados['idInventarioContagemCab'];
		idProduto = jsonDados['idProduto'];
		contagem01 = jsonDados['contagem01']?.toDouble();
		contagem02 = jsonDados['contagem02']?.toDouble();
		contagem03 = jsonDados['contagem03']?.toDouble();
		fechadoContagem = jsonDados['fechadoContagem'];
		quantidadeSistema = jsonDados['quantidadeSistema']?.toDouble();
		acuracidade = jsonDados['acuracidade']?.toDouble();
		divergencia = jsonDados['divergencia']?.toDouble();
		produto = jsonDados['produto'] == null ? null : Produto.fromJson(jsonDados['produto']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idInventarioContagemCab'] = idInventarioContagemCab ?? 0;
		jsonDados['idProduto'] = idProduto ?? 0;
		jsonDados['contagem01'] = contagem01;
		jsonDados['contagem02'] = contagem02;
		jsonDados['contagem03'] = contagem03;
		jsonDados['fechadoContagem'] = Biblioteca.removerMascara(fechadoContagem);
		jsonDados['quantidadeSistema'] = quantidadeSistema;
		jsonDados['acuracidade'] = acuracidade;
		jsonDados['divergencia'] = divergencia;
		jsonDados['produto'] = produto == null ? null : produto!.toJson;
	
		return jsonDados;
	}
	

	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}