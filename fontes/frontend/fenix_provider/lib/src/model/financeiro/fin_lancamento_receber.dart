/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FIN_LANCAMENTO_RECEBER] 
                                                                                
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

class FinLancamentoReceber {
	int? id;
	int? idFinDocumentoOrigem;
	int? idFinNaturezaFinanceira;
	int? idCliente;
	int? idBancoContaCaixa;
	int? quantidadeParcela;
	double? valorAReceber;
	DateTime? dataLancamento;
	String? numeroDocumento;
	DateTime? primeiroVencimento;
	double? taxaComissao;
	double? valorComissao;
	int? intervaloEntreParcelas;
	String? diaFixo;
	FinDocumentoOrigem? finDocumentoOrigem;
	FinNaturezaFinanceira? finNaturezaFinanceira;
	Cliente? cliente;
	BancoContaCaixa? bancoContaCaixa;
	List<FinParcelaReceber>? listaFinParcelaReceber = [];

	FinLancamentoReceber({
			id,
			idFinDocumentoOrigem,
			idFinNaturezaFinanceira,
			idCliente,
			idBancoContaCaixa,
			quantidadeParcela,
			valorAReceber,
			dataLancamento,
			numeroDocumento,
			primeiroVencimento,
			taxaComissao,
			valorComissao,
			intervaloEntreParcelas,
			diaFixo,
			finDocumentoOrigem,
			finNaturezaFinanceira,
			cliente,
			bancoContaCaixa,
			listaFinParcelaReceber,
		});

	static List<String> campos = <String>[
		'ID', 
		'QUANTIDADE_PARCELA', 
		'VALOR_A_RECEBER', 
		'DATA_LANCAMENTO', 
		'NUMERO_DOCUMENTO', 
		'PRIMEIRO_VENCIMENTO', 
		'TAXA_COMISSAO', 
		'VALOR_COMISSAO', 
		'INTERVALO_ENTRE_PARCELAS', 
		'DIA_FIXO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Quantidade de Parcelas', 
		'Valor a Receber', 
		'Data de Lançamento', 
		'Número do Documento', 
		'Data do Primeiro Vencimento', 
		'Taxa de Comissão', 
		'Valor Comissão', 
		'Intervalo Entre Parcelas', 
		'Dia Fixo', 
	];

	FinLancamentoReceber.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idFinDocumentoOrigem = jsonDados['idFinDocumentoOrigem'];
		idFinNaturezaFinanceira = jsonDados['idFinNaturezaFinanceira'];
		idCliente = jsonDados['idCliente'];
		idBancoContaCaixa = jsonDados['idBancoContaCaixa'];
		quantidadeParcela = jsonDados['quantidadeParcela'];
		valorAReceber = jsonDados['valorAReceber']?.toDouble();
		dataLancamento = jsonDados['dataLancamento'] != null ? DateTime.tryParse(jsonDados['dataLancamento']) : null;
		numeroDocumento = jsonDados['numeroDocumento'];
		primeiroVencimento = jsonDados['primeiroVencimento'] != null ? DateTime.tryParse(jsonDados['primeiroVencimento']) : null;
		taxaComissao = jsonDados['taxaComissao']?.toDouble();
		valorComissao = jsonDados['valorComissao']?.toDouble();
		intervaloEntreParcelas = jsonDados['intervaloEntreParcelas'];
		diaFixo = jsonDados['diaFixo'];
		finDocumentoOrigem = jsonDados['finDocumentoOrigem'] == null ? null : FinDocumentoOrigem.fromJson(jsonDados['finDocumentoOrigem']);
		finNaturezaFinanceira = jsonDados['finNaturezaFinanceira'] == null ? null : FinNaturezaFinanceira.fromJson(jsonDados['finNaturezaFinanceira']);
		cliente = jsonDados['cliente'] == null ? null : Cliente.fromJson(jsonDados['cliente']);
		bancoContaCaixa = jsonDados['bancoContaCaixa'] == null ? null : BancoContaCaixa.fromJson(jsonDados['bancoContaCaixa']);
		listaFinParcelaReceber = (jsonDados['listaFinParcelaReceber'] as Iterable?)?.map((m) => FinParcelaReceber.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idFinDocumentoOrigem'] = idFinDocumentoOrigem ?? 0;
		jsonDados['idFinNaturezaFinanceira'] = idFinNaturezaFinanceira ?? 0;
		jsonDados['idCliente'] = idCliente ?? 0;
		jsonDados['idBancoContaCaixa'] = idBancoContaCaixa ?? 0;
		jsonDados['quantidadeParcela'] = quantidadeParcela ?? 0;
		jsonDados['valorAReceber'] = valorAReceber;
		jsonDados['dataLancamento'] = dataLancamento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataLancamento!) : null;
		jsonDados['numeroDocumento'] = numeroDocumento;
		jsonDados['primeiroVencimento'] = primeiroVencimento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(primeiroVencimento!) : null;
		jsonDados['taxaComissao'] = taxaComissao;
		jsonDados['valorComissao'] = valorComissao;
		jsonDados['intervaloEntreParcelas'] = intervaloEntreParcelas ?? 0;
		jsonDados['diaFixo'] = diaFixo;
		jsonDados['finDocumentoOrigem'] = finDocumentoOrigem == null ? null : finDocumentoOrigem!.toJson;
		jsonDados['finNaturezaFinanceira'] = finNaturezaFinanceira == null ? null : finNaturezaFinanceira!.toJson;
		jsonDados['cliente'] = cliente == null ? null : cliente!.toJson;
		jsonDados['bancoContaCaixa'] = bancoContaCaixa == null ? null : bancoContaCaixa!.toJson;
		

		var listaFinParcelaReceberLocal = [];
		for (FinParcelaReceber objeto in listaFinParcelaReceber ?? []) {
			listaFinParcelaReceberLocal.add(objeto.toJson);
		}
		jsonDados['listaFinParcelaReceber'] = listaFinParcelaReceberLocal;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(FinLancamentoReceber objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}