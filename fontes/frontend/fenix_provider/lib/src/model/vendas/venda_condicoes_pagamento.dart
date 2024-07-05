/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VENDA_CONDICOES_PAGAMENTO] 
                                                                                
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

class VendaCondicoesPagamento {
	int? id;
	String? nome;
	String? descricao;
	double? faturamentoMinimo;
	double? faturamentoMaximo;
	double? indiceCorrecao;
	int? diasTolerancia;
	double? valorTolerancia;
	int? prazoMedio;
	String? vistaPrazo;
	List<VendaCondicoesParcelas>? listaVendaCondicoesParcelas = [];

	VendaCondicoesPagamento({
		id,
		nome,
		descricao,
		faturamentoMinimo = 0.0,
		faturamentoMaximo = 0.0,
		indiceCorrecao = 0.0,
		diasTolerancia,
		valorTolerancia = 0.0,
		prazoMedio,
		vistaPrazo,
		listaVendaCondicoesParcelas,
	});

	static List<String> campos = <String>[
		'ID', 
		'NOME', 
		'DESCRICAO', 
		'FATURAMENTO_MINIMO', 
		'FATURAMENTO_MAXIMO', 
		'INDICE_CORRECAO', 
		'DIAS_TOLERANCIA', 
		'VALOR_TOLERANCIA', 
		'PRAZO_MEDIO', 
		'VISTA_PRAZO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Nome', 
		'Descrição', 
		'Faturamento Mínimo', 
		'Faturamento Máximo', 
		'Índice de Correção', 
		'Dias de Tolerância', 
		'Valor Tolerância', 
		'Prazo Médio', 
		'Vista ou Prazo', 
	];

	VendaCondicoesPagamento.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		nome = jsonDados['nome'];
		descricao = jsonDados['descricao'];
		faturamentoMinimo = jsonDados['faturamentoMinimo']?.toDouble();
		faturamentoMaximo = jsonDados['faturamentoMaximo']?.toDouble();
		indiceCorrecao = jsonDados['indiceCorrecao']?.toDouble();
		diasTolerancia = jsonDados['diasTolerancia'];
		valorTolerancia = jsonDados['valorTolerancia']?.toDouble();
		prazoMedio = jsonDados['prazoMedio'];
		vistaPrazo = getVistaPrazo(jsonDados['vistaPrazo']);
		listaVendaCondicoesParcelas = (jsonDados['listaVendaCondicoesParcelas'] as Iterable?)?.map((m) => VendaCondicoesParcelas.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['nome'] = nome;
		jsonDados['descricao'] = descricao;
		jsonDados['faturamentoMinimo'] = faturamentoMinimo;
		jsonDados['faturamentoMaximo'] = faturamentoMaximo;
		jsonDados['indiceCorrecao'] = indiceCorrecao;
		jsonDados['diasTolerancia'] = diasTolerancia ?? 0;
		jsonDados['valorTolerancia'] = valorTolerancia;
		jsonDados['prazoMedio'] = prazoMedio ?? 0;
		jsonDados['vistaPrazo'] = setVistaPrazo(vistaPrazo);
		

		var listaVendaCondicoesParcelasLocal = [];
		for (VendaCondicoesParcelas objeto in listaVendaCondicoesParcelas ?? []) {
			listaVendaCondicoesParcelasLocal.add(objeto.toJson);
		}
		jsonDados['listaVendaCondicoesParcelas'] = listaVendaCondicoesParcelasLocal;
	
		return jsonDados;
	}
	
    getVistaPrazo(String? vistaPrazo) {
    	switch (vistaPrazo) {
    		case 'V':
    			return 'Vista';
    		case 'P':
    			return 'Prazo';
    		default:
    			return null;
    		}
    	}

    setVistaPrazo(String? vistaPrazo) {
    	switch (vistaPrazo) {
    		case 'Vista':
    			return 'V';
    		case 'Prazo':
    			return 'P';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(VendaCondicoesPagamento objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}