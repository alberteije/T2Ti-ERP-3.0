/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFSE_CABECALHO] 
                                                                                
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

class NfseCabecalho {
	int? id;
	int? idCliente;
	int? idOsAbertura;
	String? numero;
	String? codigoVerificacao;
	DateTime? dataHoraEmissao;
	String? competencia;
	String? numeroSubstituida;
	String? naturezaOperacao;
	String? regimeEspecialTributacao;
	String? optanteSimplesNacional;
	String? incentivadorCultural;
	String? numeroRps;
	String? serieRps;
	String? tipoRps;
	DateTime? dataEmissaoRps;
	String? outrasInformacoes;
	NfseIntermediario? nfseIntermediario;
	Cliente? cliente;
	OsAbertura? osAbertura;
	List<NfseDetalhe>? listaNfseDetalhe = [];

	NfseCabecalho({
			id,
			idCliente,
			idOsAbertura,
			numero,
			codigoVerificacao,
			dataHoraEmissao,
			competencia,
			numeroSubstituida,
			naturezaOperacao,
			regimeEspecialTributacao,
			optanteSimplesNacional,
			incentivadorCultural,
			numeroRps,
			serieRps,
			tipoRps,
			dataEmissaoRps,
			outrasInformacoes,
			nfseIntermediario,
			cliente,
			osAbertura,
			listaNfseDetalhe,
		});

	static List<String> campos = <String>[
		'ID', 
		'NUMERO', 
		'CODIGO_VERIFICACAO', 
		'DATA_HORA_EMISSAO', 
		'COMPETENCIA', 
		'NUMERO_SUBSTITUIDA', 
		'NATUREZA_OPERACAO', 
		'REGIME_ESPECIAL_TRIBUTACAO', 
		'OPTANTE_SIMPLES_NACIONAL', 
		'INCENTIVADOR_CULTURAL', 
		'NUMERO_RPS', 
		'SERIE_RPS', 
		'TIPO_RPS', 
		'DATA_EMISSAO_RPS', 
		'OUTRAS_INFORMACOES', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Número', 
		'Código Verificação', 
		'Data/Hora Emissão', 
		'Mês/Ano Competência', 
		'Número Substituída', 
		'Natureza Operação', 
		'Regime Especial Tributação', 
		'Optante Simples Nacional', 
		'Incentivador Cultural', 
		'Número RPS', 
		'Série RPS', 
		'Tipo RPS', 
		'Data de Emissão do RPS', 
		'Outras Informações', 
	];

	NfseCabecalho.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCliente = jsonDados['idCliente'];
		idOsAbertura = jsonDados['idOsAbertura'];
		numero = jsonDados['numero'];
		codigoVerificacao = jsonDados['codigoVerificacao'];
		dataHoraEmissao = jsonDados['dataHoraEmissao'] != null ? DateTime.tryParse(jsonDados['dataHoraEmissao']) : null;
		competencia = jsonDados['competencia'];
		numeroSubstituida = jsonDados['numeroSubstituida'];
		naturezaOperacao = getNaturezaOperacao(jsonDados['naturezaOperacao']);
		regimeEspecialTributacao = getRegimeEspecialTributacao(jsonDados['regimeEspecialTributacao']);
		optanteSimplesNacional = getOptanteSimplesNacional(jsonDados['optanteSimplesNacional']);
		incentivadorCultural = getIncentivadorCultural(jsonDados['incentivadorCultural']);
		numeroRps = jsonDados['numeroRps'];
		serieRps = jsonDados['serieRps'];
		tipoRps = getTipoRps(jsonDados['tipoRps']);
		dataEmissaoRps = jsonDados['dataEmissaoRps'] != null ? DateTime.tryParse(jsonDados['dataEmissaoRps']) : null;
		outrasInformacoes = jsonDados['outrasInformacoes'];
		nfseIntermediario = jsonDados['nfseIntermediario'] == null ? null : NfseIntermediario.fromJson(jsonDados['nfseIntermediario']);
		cliente = jsonDados['cliente'] == null ? null : Cliente.fromJson(jsonDados['cliente']);
		osAbertura = jsonDados['osAbertura'] == null ? null : OsAbertura.fromJson(jsonDados['osAbertura']);
		listaNfseDetalhe = (jsonDados['listaNfseDetalhe'] as Iterable?)?.map((m) => NfseDetalhe.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCliente'] = idCliente ?? 0;
		jsonDados['idOsAbertura'] = idOsAbertura ?? 0;
		jsonDados['numero'] = numero;
		jsonDados['codigoVerificacao'] = codigoVerificacao;
		jsonDados['dataHoraEmissao'] = dataHoraEmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataHoraEmissao!) : null;
		jsonDados['competencia'] = Biblioteca.removerMascara(competencia);
		jsonDados['numeroSubstituida'] = numeroSubstituida;
		jsonDados['naturezaOperacao'] = setNaturezaOperacao(naturezaOperacao);
		jsonDados['regimeEspecialTributacao'] = setRegimeEspecialTributacao(regimeEspecialTributacao);
		jsonDados['optanteSimplesNacional'] = setOptanteSimplesNacional(optanteSimplesNacional);
		jsonDados['incentivadorCultural'] = setIncentivadorCultural(incentivadorCultural);
		jsonDados['numeroRps'] = numeroRps;
		jsonDados['serieRps'] = serieRps;
		jsonDados['tipoRps'] = setTipoRps(tipoRps);
		jsonDados['dataEmissaoRps'] = dataEmissaoRps != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEmissaoRps!) : null;
		jsonDados['outrasInformacoes'] = outrasInformacoes;
		jsonDados['nfseIntermediario'] = nfseIntermediario == null ? null : nfseIntermediario!.toJson;
		jsonDados['cliente'] = cliente == null ? null : cliente!.toJson;
		jsonDados['osAbertura'] = osAbertura == null ? null : osAbertura!.toJson;
		

		var listaNfseDetalheLocal = [];
		for (NfseDetalhe objeto in listaNfseDetalhe ?? []) {
			listaNfseDetalheLocal.add(objeto.toJson);
		}
		jsonDados['listaNfseDetalhe'] = listaNfseDetalheLocal;
	
		return jsonDados;
	}
	
    getNaturezaOperacao(String? naturezaOperacao) {
    	switch (naturezaOperacao) {
    		case '1':
    			return '1=Tributação no município';
    		case '2':
    			return '2=Tributação fora do município';
    		case '3':
    			return '3=Isenção';
    		case '4':
    			return '4=Imune';
    		case '5':
    			return '5=Exigibilidade suspensa por decisão judicial';
    		case '6':
    			return '6=Exigibilidade suspensa por procedimento administrativo';
    		default:
    			return null;
    		}
    	}

    setNaturezaOperacao(String? naturezaOperacao) {
    	switch (naturezaOperacao) {
    		case '1=Tributação no município':
    			return '1';
    		case '2=Tributação fora do município':
    			return '2';
    		case '3=Isenção':
    			return '3';
    		case '4=Imune':
    			return '4';
    		case '5=Exigibilidade suspensa por decisão judicial':
    			return '5';
    		case '6=Exigibilidade suspensa por procedimento administrativo':
    			return '6';
    		default:
    			return null;
    		}
    	}

    getRegimeEspecialTributacao(String? regimeEspecialTributacao) {
    	switch (regimeEspecialTributacao) {
    		case '1':
    			return '1=Microempresa Municipal';
    		case '2':
    			return '2=Estimativa';
    		case '3':
    			return '3=Sociedade de Profissionais';
    		case '4':
    			return '4=Cooperativa';
    		default:
    			return null;
    		}
    	}

    setRegimeEspecialTributacao(String? regimeEspecialTributacao) {
    	switch (regimeEspecialTributacao) {
    		case '1=Microempresa Municipal':
    			return '1';
    		case '2=Estimativa':
    			return '2';
    		case '3=Sociedade de Profissionais':
    			return '3';
    		case '4=Cooperativa':
    			return '4';
    		default:
    			return null;
    		}
    	}

    getOptanteSimplesNacional(String? optanteSimplesNacional) {
    	switch (optanteSimplesNacional) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setOptanteSimplesNacional(String? optanteSimplesNacional) {
    	switch (optanteSimplesNacional) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getIncentivadorCultural(String? incentivadorCultural) {
    	switch (incentivadorCultural) {
    		case 'S':
    			return 'Sim';
    		case 'N':
    			return 'Não';
    		default:
    			return null;
    		}
    	}

    setIncentivadorCultural(String? incentivadorCultural) {
    	switch (incentivadorCultural) {
    		case 'Sim':
    			return 'S';
    		case 'Não':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getTipoRps(String? tipoRps) {
    	switch (tipoRps) {
    		case '1':
    			return '1=Recibo Provisório de Serviços';
    		case '2':
    			return '2=RPS  Nota Fiscal Conjugada (Mista)';
    		case '3':
    			return '3=Cupom';
    		default:
    			return null;
    		}
    	}

    setTipoRps(String? tipoRps) {
    	switch (tipoRps) {
    		case '1=Recibo Provisório de Serviços':
    			return '1';
    		case '2=RPS  Nota Fiscal Conjugada (Mista)':
    			return '2';
    		case '3=Cupom':
    			return '3';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(NfseCabecalho objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}