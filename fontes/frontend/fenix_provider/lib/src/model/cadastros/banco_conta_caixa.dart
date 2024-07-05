/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [BANCO_CONTA_CAIXA] 
                                                                                
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

class BancoContaCaixa {
	int? id;
	int? idBancoAgencia;
	String? numero;
	String? digito;
	String? nome;
	String? tipo;
	String? descricao;
	BancoAgencia? bancoAgencia;

	BancoContaCaixa({
		id,
		idBancoAgencia,
		numero,
		digito,
		nome,
		tipo,
		descricao,
		bancoAgencia,
	});

	static List<String> campos = <String>[
		'ID', 
		'NUMERO', 
		'DIGITO', 
		'NOME', 
		'TIPO', 
		'DESCRICAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Número', 
		'Dígito', 
		'Nome', 
		'Tipo', 
		'Descrição', 
	];

	BancoContaCaixa.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idBancoAgencia = jsonDados['idBancoAgencia'];
		numero = jsonDados['numero'];
		digito = jsonDados['digito'];
		nome = jsonDados['nome'];
		tipo = getTipo(jsonDados['tipo']);
		descricao = jsonDados['descricao'];
		bancoAgencia = jsonDados['bancoAgencia'] == null ? null : BancoAgencia.fromJson(jsonDados['bancoAgencia']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idBancoAgencia'] = idBancoAgencia ?? 0;
		jsonDados['numero'] = numero;
		jsonDados['digito'] = digito;
		jsonDados['nome'] = nome;
		jsonDados['tipo'] = setTipo(tipo);
		jsonDados['descricao'] = descricao;
		jsonDados['bancoAgencia'] = bancoAgencia == null ? null : bancoAgencia!.toJson;
	
		return jsonDados;
	}
	
    getTipo(String? tipo) {
    	switch (tipo) {
    		case '0':
    			return 'Corrente';
    		case '1':
    			return 'Poupança';
    		case '2':
    			return 'Investimento';
    		case '3':
    			return 'Caixa Interno';
    		default:
    			return null;
    		}
    	}

    setTipo(String? tipo) {
    	switch (tipo) {
    		case 'Corrente':
    			return '0';
    		case 'Poupança':
    			return '1';
    		case 'Investimento':
    			return '2';
    		case 'Caixa Interno':
    			return '3';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(BancoContaCaixa objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}