/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FIN_CHEQUE_RECEBIDO] 
                                                                                
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

class FinChequeRecebido {
	int? id;
	int? idPessoa;
	String? cpf;
	String? cnpj;
	String? nome;
	String? codigoBanco;
	String? codigoAgencia;
	String? conta;
	int? numero;
	DateTime? dataEmissao;
	DateTime? bomPara;
	DateTime? dataCompensacao;
	double? valor;
	DateTime? custodiaData;
	double? custodiaTarifa;
	double? custodiaComissao;
	DateTime? descontoData;
	double? descontoTarifa;
	double? descontoComissao;
	double? valorRecebido;
	Pessoa? pessoa;

	FinChequeRecebido({
		id,
		idPessoa,
		cpf,
		cnpj,
		nome,
		codigoBanco,
		codigoAgencia,
		conta,
		numero,
		dataEmissao,
		bomPara,
		dataCompensacao,
		valor = 0.0,
		custodiaData,
		custodiaTarifa = 0.0,
		custodiaComissao = 0.0,
		descontoData,
		descontoTarifa = 0.0,
		descontoComissao = 0.0,
		valorRecebido = 0.0,
		pessoa,
	});

	static List<String> campos = <String>[
		'ID', 
		'CPF', 
		'CNPJ', 
		'NOME', 
		'CODIGO_BANCO', 
		'CODIGO_AGENCIA', 
		'CONTA', 
		'NUMERO', 
		'DATA_EMISSAO', 
		'BOM_PARA', 
		'DATA_COMPENSACAO', 
		'VALOR', 
		'CUSTODIA_DATA', 
		'CUSTODIA_TARIFA', 
		'CUSTODIA_COMISSAO', 
		'DESCONTO_DATA', 
		'DESCONTO_TARIFA', 
		'DESCONTO_COMISSAO', 
		'VALOR_RECEBIDO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'CPF', 
		'CNPJ', 
		'Nome', 
		'Código Banco', 
		'Código Agência', 
		'Conta', 
		'Número do Cheque', 
		'Data de Emissão', 
		'Cheque Bom Para', 
		'Data de Compensação', 
		'Valor', 
		'Data da Custódia', 
		'Tarifa Custódia', 
		'Custódia Comissão', 
		'Data de Desconto', 
		'Tarifa Desconto', 
		'Desconto Comissão', 
		'Valor Recebido', 
	];

	FinChequeRecebido.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idPessoa = jsonDados['idPessoa'];
		cpf = jsonDados['cpf'];
		cnpj = jsonDados['cnpj'];
		nome = jsonDados['nome'];
		codigoBanco = jsonDados['codigoBanco'];
		codigoAgencia = jsonDados['codigoAgencia'];
		conta = jsonDados['conta'];
		numero = jsonDados['numero'];
		dataEmissao = jsonDados['dataEmissao'] != null ? DateTime.tryParse(jsonDados['dataEmissao']) : null;
		bomPara = jsonDados['bomPara'] != null ? DateTime.tryParse(jsonDados['bomPara']) : null;
		dataCompensacao = jsonDados['dataCompensacao'] != null ? DateTime.tryParse(jsonDados['dataCompensacao']) : null;
		valor = jsonDados['valor']?.toDouble();
		custodiaData = jsonDados['custodiaData'] != null ? DateTime.tryParse(jsonDados['custodiaData']) : null;
		custodiaTarifa = jsonDados['custodiaTarifa']?.toDouble();
		custodiaComissao = jsonDados['custodiaComissao']?.toDouble();
		descontoData = jsonDados['descontoData'] != null ? DateTime.tryParse(jsonDados['descontoData']) : null;
		descontoTarifa = jsonDados['descontoTarifa']?.toDouble();
		descontoComissao = jsonDados['descontoComissao']?.toDouble();
		valorRecebido = jsonDados['valorRecebido']?.toDouble();
		pessoa = jsonDados['pessoa'] == null ? null : Pessoa.fromJson(jsonDados['pessoa']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idPessoa'] = idPessoa ?? 0;
		jsonDados['cpf'] = Biblioteca.removerMascara(cpf);
		jsonDados['cnpj'] = Biblioteca.removerMascara(cnpj);
		jsonDados['nome'] = nome;
		jsonDados['codigoBanco'] = codigoBanco;
		jsonDados['codigoAgencia'] = codigoAgencia;
		jsonDados['conta'] = conta;
		jsonDados['numero'] = numero ?? 0;
		jsonDados['dataEmissao'] = dataEmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEmissao!) : null;
		jsonDados['bomPara'] = bomPara != null ? DateFormat('yyyy-MM-ddT00:00:00').format(bomPara!) : null;
		jsonDados['dataCompensacao'] = dataCompensacao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataCompensacao!) : null;
		jsonDados['valor'] = valor;
		jsonDados['custodiaData'] = custodiaData != null ? DateFormat('yyyy-MM-ddT00:00:00').format(custodiaData!) : null;
		jsonDados['custodiaTarifa'] = custodiaTarifa;
		jsonDados['custodiaComissao'] = custodiaComissao;
		jsonDados['descontoData'] = descontoData != null ? DateFormat('yyyy-MM-ddT00:00:00').format(descontoData!) : null;
		jsonDados['descontoTarifa'] = descontoTarifa;
		jsonDados['descontoComissao'] = descontoComissao;
		jsonDados['valorRecebido'] = valorRecebido;
		jsonDados['pessoa'] = pessoa == null ? null : pessoa!.toJson;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(FinChequeRecebido objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}