/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_INFORMACAO_PAGAMENTO] 
                                                                                
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

class NfeInformacaoPagamento {
	int? id;
	int? idNfeCabecalho;
	String? indicadorPagamento;
	String? meioPagamento;
	double? valor;
	String? tipoIntegracao;
	String? cnpjOperadoraCartao;
	String? bandeira;
	String? numeroAutorizacao;
	double? troco;

	NfeInformacaoPagamento({
		id,
		idNfeCabecalho,
		indicadorPagamento,
		meioPagamento,
		valor = 0.0,
		tipoIntegracao,
		cnpjOperadoraCartao,
		bandeira,
		numeroAutorizacao,
		troco = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'INDICADOR_PAGAMENTO', 
		'MEIO_PAGAMENTO', 
		'VALOR', 
		'TIPO_INTEGRACAO', 
		'CNPJ_OPERADORA_CARTAO', 
		'BANDEIRA', 
		'NUMERO_AUTORIZACAO', 
		'TROCO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Indicador Pagamento', 
		'Meio de Pagamento', 
		'Valor', 
		'Tipo Integração', 
		'CNPJ', 
		'Bandeira', 
		'Número Autorização', 
		'Troco', 
	];

	NfeInformacaoPagamento.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeCabecalho = jsonDados['idNfeCabecalho'];
		indicadorPagamento = getIndicadorPagamento(jsonDados['indicadorPagamento']);
		meioPagamento = jsonDados['meioPagamento'] == '' ? null : jsonDados['meioPagamento'];
		valor = jsonDados['valor']?.toDouble();
		tipoIntegracao = getTipoIntegracao(jsonDados['tipoIntegracao']);
		cnpjOperadoraCartao = jsonDados['cnpjOperadoraCartao'];
		bandeira = getBandeira(jsonDados['bandeira']);
		numeroAutorizacao = jsonDados['numeroAutorizacao'];
		troco = jsonDados['troco']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeCabecalho'] = idNfeCabecalho ?? 0;
		jsonDados['indicadorPagamento'] = setIndicadorPagamento(indicadorPagamento);
		jsonDados['meioPagamento'] = meioPagamento;
		jsonDados['valor'] = valor;
		jsonDados['tipoIntegracao'] = setTipoIntegracao(tipoIntegracao);
		jsonDados['cnpjOperadoraCartao'] = Biblioteca.removerMascara(cnpjOperadoraCartao);
		jsonDados['bandeira'] = setBandeira(bandeira);
		jsonDados['numeroAutorizacao'] = numeroAutorizacao;
		jsonDados['troco'] = troco;
	
		return jsonDados;
	}
	
    getIndicadorPagamento(String? indicadorPagamento) {
    	switch (indicadorPagamento) {
    		case '0':
    			return '0=Pagamento à vista';
    		case '1':
    			return '1=Pagamento à prazo';
    		default:
    			return null;
    		}
    	}

    setIndicadorPagamento(String? indicadorPagamento) {
    	switch (indicadorPagamento) {
    		case '0=Pagamento à vista':
    			return '0';
    		case '1=Pagamento à prazo':
    			return '1';
    		default:
    			return null;
    		}
    	}

    getTipoIntegracao(String? tipoIntegracao) {
    	switch (tipoIntegracao) {
    		case '1':
    			return '1=Pagamento integrado com o sistema de automação da empresa';
    		case '2':
    			return '2=Pagamento não integrado com o sistema de automação da empresa';
    		default:
    			return null;
    		}
    	}

    setTipoIntegracao(String? tipoIntegracao) {
    	switch (tipoIntegracao) {
    		case '1=Pagamento integrado com o sistema de automação da empresa':
    			return '1';
    		case '2=Pagamento não integrado com o sistema de automação da empresa':
    			return '2';
    		default:
    			return null;
    		}
    	}

    getBandeira(String? bandeira) {
    	switch (bandeira) {
    		case '0':
    			return '01=Visa';
    		case '1':
    			return '02=Mastercard';
    		case '2':
    			return '03=American Express';
    		case '3':
    			return '04=Sorocred';
    		case '9':
    			return '99=Outros';
    		default:
    			return null;
    		}
    	}

    setBandeira(String? bandeira) {
    	switch (bandeira) {
    		case '01=Visa':
    			return '0';
    		case '02=Mastercard':
    			return '0';
    		case '03=American Express':
    			return '0';
    		case '04=Sorocred':
    			return '0';
    		case '99=Outros':
    			return '9';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(NfeInformacaoPagamento objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}