/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FIN_EXTRATO_CONTA_BANCO] 
                                                                                
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

class FinExtratoContaBanco {
	int? id;
	int? idBancoContaCaixa;
	String? mesAno;
	String? mes;
	String? ano;
	DateTime? dataMovimento;
	DateTime? dataBalancete;
	String? historico;
	String? documento;
	double? valor;
	String? conciliado;
	String? observacao;
	BancoContaCaixa? bancoContaCaixa;

	FinExtratoContaBanco({
		id,
		idBancoContaCaixa,
		mesAno,
		mes,
		ano,
		dataMovimento,
		dataBalancete,
		historico,
		documento,
		valor = 0.0,
		conciliado,
		observacao,
		bancoContaCaixa,
	});

	static List<String> campos = <String>[
		'ID', 
		'MES_ANO', 
		'MES', 
		'ANO', 
		'DATA_MOVIMENTO', 
		'DATA_BALANCETE', 
		'HISTORICO', 
		'DOCUMENTO', 
		'VALOR', 
		'CONCILIADO', 
		'OBSERVACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Mês/Ano', 
		'Mês', 
		'Ano', 
		'Data de Movimento', 
		'Data do Balancete', 
		'Histórico', 
		'Documento', 
		'Valor', 
		'Conciliado', 
		'Observação', 
	];

	FinExtratoContaBanco.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idBancoContaCaixa = jsonDados['idBancoContaCaixa'];
		mesAno = jsonDados['mesAno'];
		mes = jsonDados['mes'];
		ano = jsonDados['ano'];
		dataMovimento = jsonDados['dataMovimento'] != null ? DateTime.tryParse(jsonDados['dataMovimento']) : null;
		dataBalancete = jsonDados['dataBalancete'] != null ? DateTime.tryParse(jsonDados['dataBalancete']) : null;
		historico = jsonDados['historico'];
		documento = jsonDados['documento'];
		valor = jsonDados['valor']?.toDouble();
		conciliado = getConciliado(jsonDados['conciliado']);
		observacao = jsonDados['observacao'];
		bancoContaCaixa = jsonDados['bancoContaCaixa'] == null ? null : BancoContaCaixa.fromJson(jsonDados['bancoContaCaixa']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idBancoContaCaixa'] = idBancoContaCaixa ?? 0;
		jsonDados['mesAno'] = Biblioteca.removerMascara(mesAno);
		jsonDados['mes'] = Biblioteca.removerMascara(mes);
		jsonDados['ano'] = ano;
		jsonDados['dataMovimento'] = dataMovimento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataMovimento!) : null;
		jsonDados['dataBalancete'] = dataBalancete != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataBalancete!) : null;
		jsonDados['historico'] = historico;
		jsonDados['documento'] = documento;
		jsonDados['valor'] = valor;
		jsonDados['conciliado'] = setConciliado(conciliado);
		jsonDados['observacao'] = observacao;
		jsonDados['bancoContaCaixa'] = bancoContaCaixa == null ? null : bancoContaCaixa!.toJson;
	
		return jsonDados;
	}
	
    getConciliado(String? conciliado) {
    	switch (conciliado) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setConciliado(String? conciliado) {
    	switch (conciliado) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(FinExtratoContaBanco objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}