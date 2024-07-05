/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFSE_DETALHE] 
                                                                                
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

class NfseDetalhe {
	int? id;
	int? idNfseListaServico;
	int? idNfseCabecalho;
	double? valorServicos;
	double? valorDeducoes;
	double? valorPis;
	double? valorCofins;
	double? valorInss;
	double? valorIr;
	double? valorCsll;
	String? codigoCnae;
	String? codigoTributacaoMunicipio;
	double? valorBaseCalculo;
	double? aliquota;
	double? valorIss;
	double? valorLiquido;
	double? outrasRetencoes;
	double? valorCredito;
	String? issRetido;
	double? valorIssRetido;
	double? valorDescontoCondicionado;
	double? valorDescontoIncondicionado;
	String? discriminacao;
	int? municipioPrestacao;
	NfseListaServico? nfseListaServico;

	NfseDetalhe({
		id,
		idNfseListaServico,
		idNfseCabecalho,
		valorServicos = 0.0,
		valorDeducoes = 0.0,
		valorPis = 0.0,
		valorCofins = 0.0,
		valorInss = 0.0,
		valorIr = 0.0,
		valorCsll = 0.0,
		codigoCnae,
		codigoTributacaoMunicipio,
		valorBaseCalculo = 0.0,
		aliquota = 0.0,
		valorIss = 0.0,
		valorLiquido = 0.0,
		outrasRetencoes = 0.0,
		valorCredito = 0.0,
		issRetido,
		valorIssRetido = 0.0,
		valorDescontoCondicionado = 0.0,
		valorDescontoIncondicionado = 0.0,
		discriminacao,
		municipioPrestacao,
		nfseListaServico,
	});

	static List<String> campos = <String>[
		'ID', 
		'VALOR_SERVICOS', 
		'VALOR_DEDUCOES', 
		'VALOR_PIS', 
		'VALOR_COFINS', 
		'VALOR_INSS', 
		'VALOR_IR', 
		'VALOR_CSLL', 
		'CODIGO_CNAE', 
		'CODIGO_TRIBUTACAO_MUNICIPIO', 
		'VALOR_BASE_CALCULO', 
		'ALIQUOTA', 
		'VALOR_ISS', 
		'VALOR_LIQUIDO', 
		'OUTRAS_RETENCOES', 
		'VALOR_CREDITO', 
		'ISS_RETIDO', 
		'VALOR_ISS_RETIDO', 
		'VALOR_DESCONTO_CONDICIONADO', 
		'VALOR_DESCONTO_INCONDICIONADO', 
		'DISCRIMINACAO', 
		'MUNICIPIO_PRESTACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Valor dos Serviços', 
		'Valor das Deduções', 
		'Valor do PIS', 
		'Valor do COFINS', 
		'Valor do INSS', 
		'Valor do IR', 
		'Valor do CSLL', 
		'CNAE', 
		'Código Tributação Município', 
		'Valor Base Cálculo', 
		'Alíquota', 
		'Valor do ISS', 
		'Valor Líquido', 
		'Valor Outras Retenções', 
		'Valor Crédito', 
		'ISS Retido', 
		'Valor ISS Retido', 
		'Valor Desconto Condicionado', 
		'Valor Desconto Incondicionado', 
		'Discriminação', 
		'Município IBGE', 
	];

	NfseDetalhe.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfseListaServico = jsonDados['idNfseListaServico'];
		idNfseCabecalho = jsonDados['idNfseCabecalho'];
		valorServicos = jsonDados['valorServicos']?.toDouble();
		valorDeducoes = jsonDados['valorDeducoes']?.toDouble();
		valorPis = jsonDados['valorPis']?.toDouble();
		valorCofins = jsonDados['valorCofins']?.toDouble();
		valorInss = jsonDados['valorInss']?.toDouble();
		valorIr = jsonDados['valorIr']?.toDouble();
		valorCsll = jsonDados['valorCsll']?.toDouble();
		codigoCnae = jsonDados['codigoCnae'];
		codigoTributacaoMunicipio = jsonDados['codigoTributacaoMunicipio'];
		valorBaseCalculo = jsonDados['valorBaseCalculo']?.toDouble();
		aliquota = jsonDados['aliquota']?.toDouble();
		valorIss = jsonDados['valorIss']?.toDouble();
		valorLiquido = jsonDados['valorLiquido']?.toDouble();
		outrasRetencoes = jsonDados['outrasRetencoes']?.toDouble();
		valorCredito = jsonDados['valorCredito']?.toDouble();
		issRetido = getIssRetido(jsonDados['issRetido']);
		valorIssRetido = jsonDados['valorIssRetido']?.toDouble();
		valorDescontoCondicionado = jsonDados['valorDescontoCondicionado']?.toDouble();
		valorDescontoIncondicionado = jsonDados['valorDescontoIncondicionado']?.toDouble();
		discriminacao = jsonDados['discriminacao'];
		municipioPrestacao = jsonDados['municipioPrestacao'];
		nfseListaServico = jsonDados['nfseListaServico'] == null ? null : NfseListaServico.fromJson(jsonDados['nfseListaServico']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfseListaServico'] = idNfseListaServico ?? 0;
		jsonDados['idNfseCabecalho'] = idNfseCabecalho ?? 0;
		jsonDados['valorServicos'] = valorServicos;
		jsonDados['valorDeducoes'] = valorDeducoes;
		jsonDados['valorPis'] = valorPis;
		jsonDados['valorCofins'] = valorCofins;
		jsonDados['valorInss'] = valorInss;
		jsonDados['valorIr'] = valorIr;
		jsonDados['valorCsll'] = valorCsll;
		jsonDados['codigoCnae'] = codigoCnae;
		jsonDados['codigoTributacaoMunicipio'] = codigoTributacaoMunicipio;
		jsonDados['valorBaseCalculo'] = valorBaseCalculo;
		jsonDados['aliquota'] = aliquota;
		jsonDados['valorIss'] = valorIss;
		jsonDados['valorLiquido'] = valorLiquido;
		jsonDados['outrasRetencoes'] = outrasRetencoes;
		jsonDados['valorCredito'] = valorCredito;
		jsonDados['issRetido'] = setIssRetido(issRetido);
		jsonDados['valorIssRetido'] = valorIssRetido;
		jsonDados['valorDescontoCondicionado'] = valorDescontoCondicionado;
		jsonDados['valorDescontoIncondicionado'] = valorDescontoIncondicionado;
		jsonDados['discriminacao'] = discriminacao;
		jsonDados['municipioPrestacao'] = municipioPrestacao ?? 0;
		jsonDados['nfseListaServico'] = nfseListaServico == null ? null : nfseListaServico!.toJson;
	
		return jsonDados;
	}
	
    getIssRetido(String? issRetido) {
    	switch (issRetido) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setIssRetido(String? issRetido) {
    	switch (issRetido) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(NfseDetalhe objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}