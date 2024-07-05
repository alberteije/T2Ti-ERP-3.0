/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_INFORMACAO_NF_OUTROS] 
                                                                                
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

class CteInformacaoNfOutros {
	int? id;
	int? idCteCabecalho;
	String? numeroRomaneio;
	String? numeroPedido;
	String? chaveAcessoNfe;
	String? codigoModelo;
	String? serie;
	String? numero;
	DateTime? dataEmissao;
	int? ufEmitente;
	double? baseCalculoIcms;
	double? valorIcms;
	double? baseCalculoIcmsSt;
	double? valorIcmsSt;
	double? valorTotalProdutos;
	double? valorTotal;
	int? cfopPredominante;
	double? pesoTotalKg;
	int? pinSuframa;
	DateTime? dataPrevistaEntrega;
	String? outroTipoDocOrig;
	String? outroDescricao;
	double? outroValorDocumento;

	CteInformacaoNfOutros({
		id,
		idCteCabecalho,
		numeroRomaneio,
		numeroPedido,
		chaveAcessoNfe,
		codigoModelo,
		serie,
		numero,
		dataEmissao,
		ufEmitente,
		baseCalculoIcms = 0.0,
		valorIcms = 0.0,
		baseCalculoIcmsSt = 0.0,
		valorIcmsSt = 0.0,
		valorTotalProdutos = 0.0,
		valorTotal = 0.0,
		cfopPredominante,
		pesoTotalKg = 0.0,
		pinSuframa,
		dataPrevistaEntrega,
		outroTipoDocOrig,
		outroDescricao,
		outroValorDocumento = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'NUMERO_ROMANEIO', 
		'NUMERO_PEDIDO', 
		'CHAVE_ACESSO_NFE', 
		'CODIGO_MODELO', 
		'SERIE', 
		'NUMERO', 
		'DATA_EMISSAO', 
		'UF_EMITENTE', 
		'BASE_CALCULO_ICMS', 
		'VALOR_ICMS', 
		'BASE_CALCULO_ICMS_ST', 
		'VALOR_ICMS_ST', 
		'VALOR_TOTAL_PRODUTOS', 
		'VALOR_TOTAL', 
		'CFOP_PREDOMINANTE', 
		'PESO_TOTAL_KG', 
		'PIN_SUFRAMA', 
		'DATA_PREVISTA_ENTREGA', 
		'OUTRO_TIPO_DOC_ORIG', 
		'OUTRO_DESCRICAO', 
		'OUTRO_VALOR_DOCUMENTO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Numero Romaneio', 
		'Numero Pedido', 
		'Chave NF-e', 
		'Tipo Medida', 
		'Série', 
		'Número', 
		'Data de Emissão', 
		'Data de Emissão', 
		'Base Cálculo ICMS', 
		'Valor do ICMS', 
		'Base Cálculo ICMS ST', 
		'Valor do ICMS ST', 
		'Valor Total Produtos', 
		'Valor Total', 
		'CFOP Predominante', 
		'Peso Total(Kg)', 
		'Peso Total(Kg)', 
		'Peso Total(Kg)', 
		'Peso Total(Kg)', 
		'Peso Total(Kg)', 
		'Peso Total(Kg)', 
	];

	CteInformacaoNfOutros.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteCabecalho = jsonDados['idCteCabecalho'];
		numeroRomaneio = jsonDados['numeroRomaneio'];
		numeroPedido = jsonDados['numeroPedido'];
		chaveAcessoNfe = jsonDados['chaveAcessoNfe'];
		codigoModelo = getCodigoModelo(jsonDados['codigoModelo']);
		serie = jsonDados['serie'];
		numero = jsonDados['numero'];
		dataEmissao = jsonDados['dataEmissao'] != null ? DateTime.tryParse(jsonDados['dataEmissao']) : null;
		ufEmitente = jsonDados['ufEmitente'];
		baseCalculoIcms = jsonDados['baseCalculoIcms']?.toDouble();
		valorIcms = jsonDados['valorIcms']?.toDouble();
		baseCalculoIcmsSt = jsonDados['baseCalculoIcmsSt']?.toDouble();
		valorIcmsSt = jsonDados['valorIcmsSt']?.toDouble();
		valorTotalProdutos = jsonDados['valorTotalProdutos']?.toDouble();
		valorTotal = jsonDados['valorTotal']?.toDouble();
		cfopPredominante = jsonDados['cfopPredominante'];
		pesoTotalKg = jsonDados['pesoTotalKg']?.toDouble();
		pinSuframa = jsonDados['pinSuframa'];
		dataPrevistaEntrega = jsonDados['dataPrevistaEntrega'] != null ? DateTime.tryParse(jsonDados['dataPrevistaEntrega']) : null;
		outroTipoDocOrig = jsonDados['outroTipoDocOrig'];
		outroDescricao = jsonDados['outroDescricao'];
		outroValorDocumento = jsonDados['outroValorDocumento']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteCabecalho'] = idCteCabecalho ?? 0;
		jsonDados['numeroRomaneio'] = numeroRomaneio;
		jsonDados['numeroPedido'] = numeroPedido;
		jsonDados['chaveAcessoNfe'] = chaveAcessoNfe;
		jsonDados['codigoModelo'] = setCodigoModelo(codigoModelo);
		jsonDados['serie'] = serie;
		jsonDados['numero'] = numero;
		jsonDados['dataEmissao'] = dataEmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEmissao!) : null;
		jsonDados['ufEmitente'] = ufEmitente ?? 0;
		jsonDados['baseCalculoIcms'] = baseCalculoIcms;
		jsonDados['valorIcms'] = valorIcms;
		jsonDados['baseCalculoIcmsSt'] = baseCalculoIcmsSt;
		jsonDados['valorIcmsSt'] = valorIcmsSt;
		jsonDados['valorTotalProdutos'] = valorTotalProdutos;
		jsonDados['valorTotal'] = valorTotal;
		jsonDados['cfopPredominante'] = cfopPredominante ?? 0;
		jsonDados['pesoTotalKg'] = pesoTotalKg;
		jsonDados['pinSuframa'] = Biblioteca.removerMascara(pinSuframa);
		jsonDados['dataPrevistaEntrega'] = Biblioteca.removerMascara(dataPrevistaEntrega);
		jsonDados['outroTipoDocOrig'] = Biblioteca.removerMascara(outroTipoDocOrig);
		jsonDados['outroDescricao'] = Biblioteca.removerMascara(outroDescricao);
		jsonDados['outroValorDocumento'] = outroValorDocumento;
	
		return jsonDados;
	}
	
    getCodigoModelo(String? codigoModelo) {
    	switch (codigoModelo) {
    		case '0':
    			return '01 - NF Modelo 01/1A e Avulsa';
    		case '1':
    			return '04 - NF de Produtor';
    		default:
    			return null;
    		}
    	}

    setCodigoModelo(String? codigoModelo) {
    	switch (codigoModelo) {
    		case '01 - NF Modelo 01/1A e Avulsa':
    			return '0';
    		case '04 - NF de Produtor':
    			return '0';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(CteInformacaoNfOutros objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}