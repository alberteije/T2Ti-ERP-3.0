/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FIN_CONFIGURACAO_BOLETO] 
                                                                                
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

class FinConfiguracaoBoleto {
	int? id;
	int? idBancoContaCaixa;
	String? instrucao01;
	String? instrucao02;
	String? caminhoArquivoRemessa;
	String? caminhoArquivoRetorno;
	String? caminhoArquivoLogotipo;
	String? caminhoArquivoPdf;
	String? mensagem;
	String? localPagamento;
	String? layoutRemessa;
	String? aceite;
	String? especie;
	String? carteira;
	String? codigoConvenio;
	String? codigoCedente;
	double? taxaMulta;
	double? taxaJuro;
	int? diasProtesto;
	String? nossoNumeroAnterior;
	BancoContaCaixa? bancoContaCaixa;

	FinConfiguracaoBoleto({
		id,
		idBancoContaCaixa,
		instrucao01,
		instrucao02,
		caminhoArquivoRemessa,
		caminhoArquivoRetorno,
		caminhoArquivoLogotipo,
		caminhoArquivoPdf,
		mensagem,
		localPagamento,
		layoutRemessa,
		aceite,
		especie,
		carteira,
		codigoConvenio,
		codigoCedente,
		taxaMulta = 0.0,
		taxaJuro = 0.0,
		diasProtesto,
		nossoNumeroAnterior,
		bancoContaCaixa,
	});

	static List<String> campos = <String>[
		'ID', 
		'INSTRUCAO01', 
		'INSTRUCAO02', 
		'CAMINHO_ARQUIVO_REMESSA', 
		'CAMINHO_ARQUIVO_RETORNO', 
		'CAMINHO_ARQUIVO_LOGOTIPO', 
		'CAMINHO_ARQUIVO_PDF', 
		'MENSAGEM', 
		'LOCAL_PAGAMENTO', 
		'LAYOUT_REMESSA', 
		'ACEITE', 
		'ESPECIE', 
		'CARTEIRA', 
		'CODIGO_CONVENIO', 
		'CODIGO_CEDENTE', 
		'TAXA_MULTA', 
		'TAXA_JURO', 
		'DIAS_PROTESTO', 
		'NOSSO_NUMERO_ANTERIOR', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Instrução 01', 
		'Instrução 02', 
		'Caminho Arquivo Remessa', 
		'Caminho Arquivo Retorno', 
		'Caminho Arquivo Logotipo', 
		'Caminho Arquivo PDF', 
		'Mensagem', 
		'Local Pagamento', 
		'Layout Remessa', 
		'Aceite', 
		'Espécie', 
		'Carteira', 
		'Código Convênio', 
		'Código Cedente', 
		'Taxa Multa', 
		'Taxa Juros', 
		'Dias Protesto', 
		'Nosso Número Anterior', 
	];

	FinConfiguracaoBoleto.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idBancoContaCaixa = jsonDados['idBancoContaCaixa'];
		instrucao01 = jsonDados['instrucao01'];
		instrucao02 = jsonDados['instrucao02'];
		caminhoArquivoRemessa = jsonDados['caminhoArquivoRemessa'];
		caminhoArquivoRetorno = jsonDados['caminhoArquivoRetorno'];
		caminhoArquivoLogotipo = jsonDados['caminhoArquivoLogotipo'];
		caminhoArquivoPdf = jsonDados['caminhoArquivoPdf'];
		mensagem = jsonDados['mensagem'];
		localPagamento = jsonDados['localPagamento'];
		layoutRemessa = getLayoutRemessa(jsonDados['layoutRemessa']);
		aceite = getAceite(jsonDados['aceite']);
		especie = getEspecie(jsonDados['especie']);
		carteira = jsonDados['carteira'];
		codigoConvenio = jsonDados['codigoConvenio'];
		codigoCedente = jsonDados['codigoCedente'];
		taxaMulta = jsonDados['taxaMulta']?.toDouble();
		taxaJuro = jsonDados['taxaJuro']?.toDouble();
		diasProtesto = jsonDados['diasProtesto'];
		nossoNumeroAnterior = jsonDados['nossoNumeroAnterior'];
		bancoContaCaixa = jsonDados['bancoContaCaixa'] == null ? null : BancoContaCaixa.fromJson(jsonDados['bancoContaCaixa']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idBancoContaCaixa'] = idBancoContaCaixa ?? 0;
		jsonDados['instrucao01'] = instrucao01;
		jsonDados['instrucao02'] = instrucao02;
		jsonDados['caminhoArquivoRemessa'] = caminhoArquivoRemessa;
		jsonDados['caminhoArquivoRetorno'] = caminhoArquivoRetorno;
		jsonDados['caminhoArquivoLogotipo'] = caminhoArquivoLogotipo;
		jsonDados['caminhoArquivoPdf'] = caminhoArquivoPdf;
		jsonDados['mensagem'] = mensagem;
		jsonDados['localPagamento'] = localPagamento;
		jsonDados['layoutRemessa'] = setLayoutRemessa(layoutRemessa);
		jsonDados['aceite'] = setAceite(aceite);
		jsonDados['especie'] = setEspecie(especie);
		jsonDados['carteira'] = carteira;
		jsonDados['codigoConvenio'] = codigoConvenio;
		jsonDados['codigoCedente'] = codigoCedente;
		jsonDados['taxaMulta'] = taxaMulta;
		jsonDados['taxaJuro'] = taxaJuro;
		jsonDados['diasProtesto'] = diasProtesto ?? 0;
		jsonDados['nossoNumeroAnterior'] = nossoNumeroAnterior;
		jsonDados['bancoContaCaixa'] = bancoContaCaixa == null ? null : bancoContaCaixa!.toJson;
	
		return jsonDados;
	}
	
    getLayoutRemessa(String? layoutRemessa) {
    	switch (layoutRemessa) {
    		case '0':
    			return 'CNAB 240';
    		case '1':
    			return 'CNAB 400';
    		default:
    			return null;
    		}
    	}

    setLayoutRemessa(String? layoutRemessa) {
    	switch (layoutRemessa) {
    		case 'CNAB 240':
    			return '0';
    		case 'CNAB 400':
    			return '1';
    		default:
    			return null;
    		}
    	}

    getAceite(String? aceite) {
    	switch (aceite) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setAceite(String? aceite) {
    	switch (aceite) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getEspecie(String? especie) {
    	switch (especie) {
    		case '0':
    			return 'DM-Duplicata Mercantil';
    		case '1':
    			return 'DS-Duplicata de Serviços';
    		case '2':
    			return 'RC-Recibo';
    		case '3':
    			return 'NP-Nota Promissória';
    		default:
    			return null;
    		}
    	}

    setEspecie(String? especie) {
    	switch (especie) {
    		case 'DM-Duplicata Mercantil':
    			return '0';
    		case 'DS-Duplicata de Serviços':
    			return '1';
    		case 'RC-Recibo':
    			return '2';
    		case 'NP-Nota Promissória':
    			return '3';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(FinConfiguracaoBoleto objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}