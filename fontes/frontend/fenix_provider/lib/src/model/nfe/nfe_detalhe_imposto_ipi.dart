/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_IPI] 
                                                                                
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

class NfeDetalheImpostoIpi {
	int? id;
	int? idNfeDetalhe;
	String? cnpjProdutor;
	String? codigoSeloIpi;
	int? quantidadeSeloIpi;
	String? enquadramentoLegalIpi;
	String? cstIpi;
	double? valorBaseCalculoIpi;
	double? quantidadeUnidadeTributavel;
	double? valorUnidadeTributavel;
	double? aliquotaIpi;
	double? valorIpi;

	NfeDetalheImpostoIpi({
		id,
		idNfeDetalhe,
		cnpjProdutor,
		codigoSeloIpi,
		quantidadeSeloIpi,
		enquadramentoLegalIpi,
		cstIpi,
		valorBaseCalculoIpi = 0.0,
		quantidadeUnidadeTributavel = 0.0,
		valorUnidadeTributavel = 0.0,
		aliquotaIpi = 0.0,
		valorIpi = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'CNPJ_PRODUTOR', 
		'CODIGO_SELO_IPI', 
		'QUANTIDADE_SELO_IPI', 
		'ENQUADRAMENTO_LEGAL_IPI', 
		'CST_IPI', 
		'VALOR_BASE_CALCULO_IPI', 
		'QUANTIDADE_UNIDADE_TRIBUTAVEL', 
		'VALOR_UNIDADE_TRIBUTAVEL', 
		'ALIQUOTA_IPI', 
		'VALOR_IPI', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'CNPJ Produtor', 
		'Código Selo IPI', 
		'Quantidade Selos', 
		'Código de Enquadramento Legal', 
		'CST IPI', 
		'Valor BC IPI', 
		'Quantidade Unidade Tributável', 
		'Valor Unidade Tributável', 
		'Alíquota IPI', 
		'Valor IPI', 
	];

	NfeDetalheImpostoIpi.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeDetalhe = jsonDados['idNfeDetalhe'];
		cnpjProdutor = jsonDados['cnpjProdutor'];
		codigoSeloIpi = jsonDados['codigoSeloIpi'];
		quantidadeSeloIpi = jsonDados['quantidadeSeloIpi'];
		enquadramentoLegalIpi = jsonDados['enquadramentoLegalIpi'];
		cstIpi = jsonDados['cstIpi'];
		valorBaseCalculoIpi = jsonDados['valorBaseCalculoIpi']?.toDouble();
		quantidadeUnidadeTributavel = jsonDados['quantidadeUnidadeTributavel']?.toDouble();
		valorUnidadeTributavel = jsonDados['valorUnidadeTributavel']?.toDouble();
		aliquotaIpi = jsonDados['aliquotaIpi']?.toDouble();
		valorIpi = jsonDados['valorIpi']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeDetalhe'] = idNfeDetalhe ?? 0;
		jsonDados['cnpjProdutor'] = Biblioteca.removerMascara(cnpjProdutor);
		jsonDados['codigoSeloIpi'] = codigoSeloIpi;
		jsonDados['quantidadeSeloIpi'] = quantidadeSeloIpi ?? 0;
		jsonDados['enquadramentoLegalIpi'] = enquadramentoLegalIpi;
		jsonDados['cstIpi'] = cstIpi;
		jsonDados['valorBaseCalculoIpi'] = valorBaseCalculoIpi;
		jsonDados['quantidadeUnidadeTributavel'] = quantidadeUnidadeTributavel;
		jsonDados['valorUnidadeTributavel'] = valorUnidadeTributavel;
		jsonDados['aliquotaIpi'] = aliquotaIpi;
		jsonDados['valorIpi'] = valorIpi;
	
		return jsonDados;
	}
	

	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}