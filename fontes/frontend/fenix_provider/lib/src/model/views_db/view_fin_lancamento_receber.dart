/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VIEW_FIN_LANCAMENTO_RECEBER] 
                                                                                
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

class ViewFinLancamentoReceber {
	int? id;
	int? idFinLancamentoReceber;
	int? quantidadeParcela;
	double? valorLancamento;
	DateTime? dataLancamento;
	String? numeroDocumento;
	int? idFinParcelaReceber;
	int? numeroParcela;
	DateTime? dataVencimento;
	DateTime? dataRecebimento;
	double? valorParcela;
	double? taxaJuro;
	double? valorJuro;
	double? taxaMulta;
	double? valorMulta;
	double? taxaDesconto;
	double? valorDesconto;
	String? siglaDocumento;
	String? nomeCliente;
	int? idFinStatusParcela;
	String? situacaoParcela;
	String? descricaoSituacaoParcela;
	int? idBancoContaCaixa;
	String? nomeContaCaixa;

	ViewFinLancamentoReceber({
		id,
		idFinLancamentoReceber,
		quantidadeParcela,
		valorLancamento = 0.0,
		dataLancamento,
		numeroDocumento,
		idFinParcelaReceber,
		numeroParcela,
		dataVencimento,
		dataRecebimento,
		valorParcela = 0.0,
		taxaJuro = 0.0,
		valorJuro = 0.0,
		taxaMulta = 0.0,
		valorMulta = 0.0,
		taxaDesconto = 0.0,
		valorDesconto = 0.0,
		siglaDocumento,
		nomeCliente,
		idFinStatusParcela,
		situacaoParcela,
		descricaoSituacaoParcela,
		idBancoContaCaixa,
		nomeContaCaixa,
	});

	static List<String> campos = <String>[
		'ID', 
		'QUANTIDADE_PARCELA', 
		'VALOR_LANCAMENTO', 
		'DATA_LANCAMENTO', 
		'NUMERO_DOCUMENTO', 
		'NUMERO_PARCELA', 
		'DATA_VENCIMENTO', 
		'DATA_RECEBIMENTO', 
		'VALOR_PARCELA', 
		'TAXA_JURO', 
		'VALOR_JURO', 
		'TAXA_MULTA', 
		'VALOR_MULTA', 
		'TAXA_DESCONTO', 
		'VALOR_DESCONTO', 
		'SIGLA_DOCUMENTO', 
		'NOME_CLIENTE', 
		'SITUACAO_PARCELA', 
		'DESCRICAO_SITUACAO_PARCELA', 
		'NOME_CONTA_CAIXA', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Quantidade de Parcelas', 
		'Valor a Receber', 
		'Data de Lançamento', 
		'Número do Documento', 
		'Número da Parcela', 
		'Data de Vencimento', 
		'Data de Recebimento', 
		'Valor', 
		'Taxa Juros', 
		'Valor Juros', 
		'Taxa Multa', 
		'Valor Multa', 
		'Taxa Desconto', 
		'Valor Desconto', 
		'Sigla', 
		'Nome', 
		'Situação', 
		'Descrição', 
		'Nome', 
	];

	ViewFinLancamentoReceber.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idFinLancamentoReceber = jsonDados['idFinLancamentoReceber'];
		quantidadeParcela = jsonDados['quantidadeParcela'];
		valorLancamento = jsonDados['valorLancamento']?.toDouble();
		dataLancamento = jsonDados['dataLancamento'] != null ? DateTime.tryParse(jsonDados['dataLancamento']) : null;
		numeroDocumento = jsonDados['numeroDocumento'];
		idFinParcelaReceber = jsonDados['idFinParcelaReceber'];
		numeroParcela = jsonDados['numeroParcela'];
		dataVencimento = jsonDados['dataVencimento'] != null ? DateTime.tryParse(jsonDados['dataVencimento']) : null;
		dataRecebimento = jsonDados['dataRecebimento'] != null ? DateTime.tryParse(jsonDados['dataRecebimento']) : null;
		valorParcela = jsonDados['valorParcela']?.toDouble();
		taxaJuro = jsonDados['taxaJuro']?.toDouble();
		valorJuro = jsonDados['valorJuro']?.toDouble();
		taxaMulta = jsonDados['taxaMulta']?.toDouble();
		valorMulta = jsonDados['valorMulta']?.toDouble();
		taxaDesconto = jsonDados['taxaDesconto']?.toDouble();
		valorDesconto = jsonDados['valorDesconto']?.toDouble();
		siglaDocumento = jsonDados['siglaDocumento'];
		nomeCliente = jsonDados['nomeCliente'];
		idFinStatusParcela = jsonDados['idFinStatusParcela'];
		situacaoParcela = jsonDados['situacaoParcela'];
		descricaoSituacaoParcela = jsonDados['descricaoSituacaoParcela'];
		idBancoContaCaixa = jsonDados['idBancoContaCaixa'];
		nomeContaCaixa = jsonDados['nomeContaCaixa'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idFinLancamentoReceber'] = idFinLancamentoReceber ?? 0;
		jsonDados['quantidadeParcela'] = quantidadeParcela ?? 0;
		jsonDados['valorLancamento'] = valorLancamento;
		jsonDados['dataLancamento'] = dataLancamento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataLancamento!) : null;
		jsonDados['numeroDocumento'] = numeroDocumento;
		jsonDados['idFinParcelaReceber'] = idFinParcelaReceber ?? 0;
		jsonDados['numeroParcela'] = numeroParcela ?? 0;
		jsonDados['dataVencimento'] = dataVencimento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataVencimento!) : null;
		jsonDados['dataRecebimento'] = dataRecebimento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataRecebimento!) : null;
		jsonDados['valorParcela'] = valorParcela;
		jsonDados['taxaJuro'] = taxaJuro;
		jsonDados['valorJuro'] = valorJuro;
		jsonDados['taxaMulta'] = taxaMulta;
		jsonDados['valorMulta'] = valorMulta;
		jsonDados['taxaDesconto'] = taxaDesconto;
		jsonDados['valorDesconto'] = valorDesconto;
		jsonDados['siglaDocumento'] = siglaDocumento;
		jsonDados['nomeCliente'] = nomeCliente;
		jsonDados['idFinStatusParcela'] = idFinStatusParcela ?? 0;
		jsonDados['situacaoParcela'] = situacaoParcela;
		jsonDados['descricaoSituacaoParcela'] = descricaoSituacaoParcela;
		jsonDados['idBancoContaCaixa'] = idBancoContaCaixa ?? 0;
		jsonDados['nomeContaCaixa'] = nomeContaCaixa;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(ViewFinLancamentoReceber objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}