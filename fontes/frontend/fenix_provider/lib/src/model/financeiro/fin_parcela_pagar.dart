/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FIN_PARCELA_PAGAR] 
                                                                                
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

class FinParcelaPagar {
	int? id;
	int? idFinLancamentoPagar;
	int? idFinStatusParcela;
	int? idFinTipoPagamento;
	int? idFinChequeEmitido;
	int? numeroParcela;
	DateTime? dataEmissao;
	DateTime? dataVencimento;
	DateTime? dataPagamento;
	DateTime? descontoAte;
	double? valor;
	double? taxaJuro;
	double? taxaMulta;
	double? taxaDesconto;
	double? valorJuro;
	double? valorMulta;
	double? valorDesconto;
	double? valorPago;
	String? historico;
	FinStatusParcela? finStatusParcela;
	FinTipoPagamento? finTipoPagamento;
	FinChequeEmitido? finChequeEmitido;
	FinLancamentoPagar? finLancamentoPagar;

	FinParcelaPagar({
			id,
			idFinLancamentoPagar,
			idFinStatusParcela,
			idFinTipoPagamento,
			idFinChequeEmitido,
			numeroParcela,
			dataEmissao,
			dataVencimento,
			dataPagamento,
			descontoAte,
			valor,
			taxaJuro,
			taxaMulta,
			taxaDesconto,
			valorJuro,
			valorMulta,
			valorDesconto,
			valorPago,
			historico,
			finStatusParcela,
			finTipoPagamento,
			finChequeEmitido,
			finLancamentoPagar,
		});

	static List<String> campos = <String>[
		'ID', 
		'NUMERO_PARCELA', 
		'DATA_EMISSAO', 
		'DATA_VENCIMENTO', 
		'DATA_PAGAMENTO', 
		'DESCONTO_ATE', 
		'VALOR', 
		'TAXA_JURO', 
		'TAXA_MULTA', 
		'TAXA_DESCONTO', 
		'VALOR_JURO', 
		'VALOR_MULTA', 
		'VALOR_DESCONTO', 
		'VALOR_PAGO', 
		'HISTORICO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Número da Parcela', 
		'Data de Emissão', 
		'Data de Vencimento', 
		'Data de Pagamento', 
		'Desconto Ate', 
		'Valor', 
		'Taxa Juros', 
		'Taxa Multa', 
		'Taxa Desconto', 
		'Valor Juros', 
		'Valor Multa', 
		'Valor Desconto', 
		'Valor Pago', 
		'Histórico', 
	];

	FinParcelaPagar.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idFinLancamentoPagar = jsonDados['idFinLancamentoPagar'];
		idFinStatusParcela = jsonDados['idFinStatusParcela'];
		idFinTipoPagamento = jsonDados['idFinTipoPagamento'];
		idFinChequeEmitido = jsonDados['idFinChequeEmitido'];
		numeroParcela = jsonDados['numeroParcela'];
		dataEmissao = jsonDados['dataEmissao'] != null ? DateTime.tryParse(jsonDados['dataEmissao']) : null;
		dataVencimento = jsonDados['dataVencimento'] != null ? DateTime.tryParse(jsonDados['dataVencimento']) : null;
		dataPagamento = jsonDados['dataPagamento'] != null ? DateTime.tryParse(jsonDados['dataPagamento']) : null;
		descontoAte = jsonDados['descontoAte'] != null ? DateTime.tryParse(jsonDados['descontoAte']) : null;
		valor = jsonDados['valor']?.toDouble();
		taxaJuro = jsonDados['taxaJuro']?.toDouble();
		taxaMulta = jsonDados['taxaMulta']?.toDouble();
		taxaDesconto = jsonDados['taxaDesconto']?.toDouble();
		valorJuro = jsonDados['valorJuro']?.toDouble();
		valorMulta = jsonDados['valorMulta']?.toDouble();
		valorDesconto = jsonDados['valorDesconto']?.toDouble();
		valorPago = jsonDados['valorPago']?.toDouble();
		historico = jsonDados['historico'];
		finStatusParcela = jsonDados['finStatusParcela'] == null ? null : FinStatusParcela.fromJson(jsonDados['finStatusParcela']);
		finTipoPagamento = jsonDados['finTipoPagamento'] == null ? null : FinTipoPagamento.fromJson(jsonDados['finTipoPagamento']);
		finChequeEmitido = jsonDados['finChequeEmitido'] == null ? null : FinChequeEmitido.fromJson(jsonDados['finChequeEmitido']);
		finLancamentoPagar = jsonDados['finLancamentoPagar'] == null ? null : FinLancamentoPagar.fromJson(jsonDados['finLancamentoPagar']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idFinLancamentoPagar'] = idFinLancamentoPagar ?? 0;
		jsonDados['idFinStatusParcela'] = idFinStatusParcela ?? 0;
		jsonDados['idFinTipoPagamento'] = idFinTipoPagamento ?? 0;
		jsonDados['idFinChequeEmitido'] = idFinChequeEmitido ?? 0;
		jsonDados['numeroParcela'] = numeroParcela ?? 0;
		jsonDados['dataEmissao'] = dataEmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEmissao!) : null;
		jsonDados['dataVencimento'] = dataVencimento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataVencimento!) : null;
		jsonDados['dataPagamento'] = dataPagamento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataPagamento!) : null;
		jsonDados['descontoAte'] = descontoAte != null ? DateFormat('yyyy-MM-ddT00:00:00').format(descontoAte!) : null;
		jsonDados['valor'] = valor;
		jsonDados['taxaJuro'] = taxaJuro;
		jsonDados['taxaMulta'] = taxaMulta;
		jsonDados['taxaDesconto'] = taxaDesconto;
		jsonDados['valorJuro'] = valorJuro;
		jsonDados['valorMulta'] = valorMulta;
		jsonDados['valorDesconto'] = valorDesconto;
		jsonDados['valorPago'] = valorPago;
		jsonDados['historico'] = historico;
		jsonDados['finStatusParcela'] = finStatusParcela == null ? null : finStatusParcela!.toJson;
		jsonDados['finTipoPagamento'] = finTipoPagamento == null ? null : finTipoPagamento!.toJson;
		jsonDados['finChequeEmitido'] = finChequeEmitido == null ? null : finChequeEmitido!.toJson;
		jsonDados['finLancamentoPagar'] = finLancamentoPagar == null ? null : finLancamentoPagar!.toJson;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(FinParcelaPagar objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}