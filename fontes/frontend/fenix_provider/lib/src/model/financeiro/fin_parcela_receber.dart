/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FIN_PARCELA_RECEBER] 
                                                                                
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

class FinParcelaReceber {
	int? id;
	int? idFinLancamentoReceber;
	int? idFinStatusParcela;
	int? idFinTipoRecebimento;
	int? idFinChequeRecebido;
	int? numeroParcela;
	DateTime? dataEmissao;
	DateTime? dataVencimento;
	DateTime? dataRecebimento;
	DateTime? descontoAte;
	double? valor;
	double? taxaJuro;
	double? taxaMulta;
	double? taxaDesconto;
	double? valorJuro;
	double? valorMulta;
	double? valorDesconto;
	String? emitiuBoleto;
	String? boletoNossoNumero;
	double? valorRecebido;
	String? historico;
	FinStatusParcela? finStatusParcela;
	FinTipoRecebimento? finTipoRecebimento;
	FinChequeRecebido? finChequeRecebido;

	FinParcelaReceber({
			id,
			idFinLancamentoReceber,
			idFinStatusParcela,
			idFinTipoRecebimento,
			idFinChequeRecebido,
			numeroParcela,
			dataEmissao,
			dataVencimento,
			dataRecebimento,
			descontoAte,
			valor = 0.0,
			taxaJuro = 0.0,
			taxaMulta = 0.0,
			taxaDesconto = 0.0,
			valorJuro = 0.0,
			valorMulta = 0.0,
			valorDesconto = 0.0,
			emitiuBoleto,
			boletoNossoNumero,
			valorRecebido = 0.0,
			historico,
			finStatusParcela,
			finTipoRecebimento,
			finChequeRecebido,
		});

	static List<String> campos = <String>[
		'ID', 
		'NUMERO_PARCELA', 
		'DATA_EMISSAO', 
		'DATA_VENCIMENTO', 
		'DATA_RECEBIMENTO', 
		'DESCONTO_ATE', 
		'VALOR', 
		'TAXA_JURO', 
		'TAXA_MULTA', 
		'TAXA_DESCONTO', 
		'VALOR_JURO', 
		'VALOR_MULTA', 
		'VALOR_DESCONTO', 
		'EMITIU_BOLETO', 
		'BOLETO_NOSSO_NUMERO', 
		'VALOR_RECEBIDO', 
		'HISTORICO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Número da Parcela', 
		'Data de Emissão', 
		'Data de Vencimento', 
		'Data de Recebimento', 
		'Desconto Até', 
		'Valor', 
		'Taxa Juros', 
		'Taxa Multa', 
		'Taxa Desconto', 
		'Valor Juros', 
		'Valor Multa', 
		'Valor Desconto', 
		'Emitiu Boleto', 
		'Boleto Nosso Número', 
		'Valor Recebido', 
		'Histórico', 
	];

	FinParcelaReceber.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idFinLancamentoReceber = jsonDados['idFinLancamentoReceber'];
		idFinStatusParcela = jsonDados['idFinStatusParcela'];
		idFinTipoRecebimento = jsonDados['idFinTipoRecebimento'];
		idFinChequeRecebido = jsonDados['idFinChequeRecebido'];
		numeroParcela = jsonDados['numeroParcela'];
		dataEmissao = jsonDados['dataEmissao'] != null ? DateTime.tryParse(jsonDados['dataEmissao']) : null;
		dataVencimento = jsonDados['dataVencimento'] != null ? DateTime.tryParse(jsonDados['dataVencimento']) : null;
		dataRecebimento = jsonDados['dataRecebimento'] != null ? DateTime.tryParse(jsonDados['dataRecebimento']) : null;
		descontoAte = jsonDados['descontoAte'] != null ? DateTime.tryParse(jsonDados['descontoAte']) : null;
		valor = jsonDados['valor']?.toDouble();
		taxaJuro = jsonDados['taxaJuro']?.toDouble();
		taxaMulta = jsonDados['taxaMulta']?.toDouble();
		taxaDesconto = jsonDados['taxaDesconto']?.toDouble();
		valorJuro = jsonDados['valorJuro']?.toDouble();
		valorMulta = jsonDados['valorMulta']?.toDouble();
		valorDesconto = jsonDados['valorDesconto']?.toDouble();
		emitiuBoleto = getEmitiuBoleto(jsonDados['emitiuBoleto']);
		boletoNossoNumero = jsonDados['boletoNossoNumero'];
		valorRecebido = jsonDados['valorRecebido']?.toDouble();
		historico = jsonDados['historico'];
		finStatusParcela = jsonDados['finStatusParcela'] == null ? null : FinStatusParcela.fromJson(jsonDados['finStatusParcela']);
		finTipoRecebimento = jsonDados['finTipoRecebimento'] == null ? null : FinTipoRecebimento.fromJson(jsonDados['finTipoRecebimento']);
		finChequeRecebido = jsonDados['finChequeRecebido'] == null ? null : FinChequeRecebido.fromJson(jsonDados['finChequeRecebido']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idFinLancamentoReceber'] = idFinLancamentoReceber ?? 0;
		jsonDados['idFinStatusParcela'] = idFinStatusParcela ?? 0;
		jsonDados['idFinTipoRecebimento'] = idFinTipoRecebimento ?? 0;
		jsonDados['idFinChequeRecebido'] = idFinChequeRecebido ?? 0;
		jsonDados['numeroParcela'] = numeroParcela ?? 0;
		jsonDados['dataEmissao'] = dataEmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEmissao!) : null;
		jsonDados['dataVencimento'] = dataVencimento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataVencimento!) : null;
		jsonDados['dataRecebimento'] = dataRecebimento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataRecebimento!) : null;
		jsonDados['descontoAte'] = descontoAte != null ? DateFormat('yyyy-MM-ddT00:00:00').format(descontoAte!) : null;
		jsonDados['valor'] = valor;
		jsonDados['taxaJuro'] = taxaJuro;
		jsonDados['taxaMulta'] = taxaMulta;
		jsonDados['taxaDesconto'] = taxaDesconto;
		jsonDados['valorJuro'] = valorJuro;
		jsonDados['valorMulta'] = valorMulta;
		jsonDados['valorDesconto'] = valorDesconto;
		jsonDados['emitiuBoleto'] = setEmitiuBoleto(emitiuBoleto);
		jsonDados['boletoNossoNumero'] = boletoNossoNumero;
		jsonDados['valorRecebido'] = valorRecebido;
		jsonDados['historico'] = historico;
		jsonDados['finStatusParcela'] = finStatusParcela == null ? null : finStatusParcela!.toJson;
		jsonDados['finTipoRecebimento'] = finTipoRecebimento == null ? null : finTipoRecebimento!.toJson;
		jsonDados['finChequeRecebido'] = finChequeRecebido == null ? null : finChequeRecebido!.toJson;
	
		return jsonDados;
	}
	
    getEmitiuBoleto(String? emitiuBoleto) {
    	switch (emitiuBoleto) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setEmitiuBoleto(String? emitiuBoleto) {
    	switch (emitiuBoleto) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(FinParcelaReceber objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}