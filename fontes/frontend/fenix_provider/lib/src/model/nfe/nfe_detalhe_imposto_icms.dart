/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS] 
                                                                                
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


class NfeDetalheImpostoIcms {
	int? id;
	int? idNfeDetalhe;
	String? origemMercadoria;
	String? cstIcms;
	String? csosn;
	String? modalidadeBcIcms;
	double? percentualReducaoBcIcms;
	double? valorBcIcms;
	double? aliquotaIcms;
	double? valorIcmsOperacao;
	double? percentualDiferimento;
	double? valorIcmsDiferido;
	double? valorIcms;
	double? baseCalculoFcp;
	double? percentualFcp;
	double? valorFcp;
	String? modalidadeBcIcmsSt;
	double? percentualMvaIcmsSt;
	double? percentualReducaoBcIcmsSt;
	double? valorBaseCalculoIcmsSt;
	double? aliquotaIcmsSt;
	double? valorIcmsSt;
	double? baseCalculoFcpSt;
	double? percentualFcpSt;
	double? valorFcpSt;
	String? ufSt;
	double? percentualBcOperacaoPropria;
	double? valorBcIcmsStRetido;
	double? aliquotaSuportadaConsumidor;
	double? valorIcmsSubstituto;
	double? valorIcmsStRetido;
	double? baseCalculoFcpStRetido;
	double? percentualFcpStRetido;
	double? valorFcpStRetido;
	String? motivoDesoneracaoIcms;
	double? valorIcmsDesonerado;
	double? aliquotaCreditoIcmsSn;
	double? valorCreditoIcmsSn;
	double? valorBcIcmsStDestino;
	double? valorIcmsStDestino;
	double? percentualReducaoBcEfetivo;
	double? valorBcEfetivo;
	double? aliquotaIcmsEfetivo;
	double? valorIcmsEfetivo;

	NfeDetalheImpostoIcms({
		id,
		idNfeDetalhe,
		origemMercadoria,
		cstIcms,
		csosn,
		modalidadeBcIcms,
		percentualReducaoBcIcms = 0.0,
		valorBcIcms = 0.0,
		aliquotaIcms = 0.0,
		valorIcmsOperacao = 0.0,
		percentualDiferimento = 0.0,
		valorIcmsDiferido = 0.0,
		valorIcms = 0.0,
		baseCalculoFcp = 0.0,
		percentualFcp = 0.0,
		valorFcp = 0.0,
		modalidadeBcIcmsSt,
		percentualMvaIcmsSt = 0.0,
		percentualReducaoBcIcmsSt = 0.0,
		valorBaseCalculoIcmsSt = 0.0,
		aliquotaIcmsSt = 0.0,
		valorIcmsSt = 0.0,
		baseCalculoFcpSt = 0.0,
		percentualFcpSt = 0.0,
		valorFcpSt = 0.0,
		ufSt,
		percentualBcOperacaoPropria = 0.0,
		valorBcIcmsStRetido = 0.0,
		aliquotaSuportadaConsumidor = 0.0,
		valorIcmsSubstituto = 0.0,
		valorIcmsStRetido = 0.0,
		baseCalculoFcpStRetido = 0.0,
		percentualFcpStRetido = 0.0,
		valorFcpStRetido = 0.0,
		motivoDesoneracaoIcms,
		valorIcmsDesonerado = 0.0,
		aliquotaCreditoIcmsSn = 0.0,
		valorCreditoIcmsSn = 0.0,
		valorBcIcmsStDestino = 0.0,
		valorIcmsStDestino = 0.0,
		percentualReducaoBcEfetivo = 0.0,
		valorBcEfetivo = 0.0,
		aliquotaIcmsEfetivo = 0.0,
		valorIcmsEfetivo = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'ORIGEM_MERCADORIA', 
		'CST_ICMS', 
		'CSOSN', 
		'MODALIDADE_BC_ICMS', 
		'PERCENTUAL_REDUCAO_BC_ICMS', 
		'VALOR_BC_ICMS', 
		'ALIQUOTA_ICMS', 
		'VALOR_ICMS_OPERACAO', 
		'PERCENTUAL_DIFERIMENTO', 
		'VALOR_ICMS_DIFERIDO', 
		'VALOR_ICMS', 
		'BASE_CALCULO_FCP', 
		'PERCENTUAL_FCP', 
		'VALOR_FCP', 
		'MODALIDADE_BC_ICMS_ST', 
		'PERCENTUAL_MVA_ICMS_ST', 
		'PERCENTUAL_REDUCAO_BC_ICMS_ST', 
		'VALOR_BASE_CALCULO_ICMS_ST', 
		'ALIQUOTA_ICMS_ST', 
		'VALOR_ICMS_ST', 
		'BASE_CALCULO_FCP_ST', 
		'PERCENTUAL_FCP_ST', 
		'VALOR_FCP_ST', 
		'UF_ST', 
		'PERCENTUAL_BC_OPERACAO_PROPRIA', 
		'VALOR_BC_ICMS_ST_RETIDO', 
		'ALIQUOTA_SUPORTADA_CONSUMIDOR', 
		'VALOR_ICMS_SUBSTITUTO', 
		'VALOR_ICMS_ST_RETIDO', 
		'BASE_CALCULO_FCP_ST_RETIDO', 
		'PERCENTUAL_FCP_ST_RETIDO', 
		'VALOR_FCP_ST_RETIDO', 
		'MOTIVO_DESONERACAO_ICMS', 
		'VALOR_ICMS_DESONERADO', 
		'ALIQUOTA_CREDITO_ICMS_SN', 
		'VALOR_CREDITO_ICMS_SN', 
		'VALOR_BC_ICMS_ST_DESTINO', 
		'VALOR_ICMS_ST_DESTINO', 
		'PERCENTUAL_REDUCAO_BC_EFETIVO', 
		'VALOR_BC_EFETIVO', 
		'ALIQUOTA_ICMS_EFETIVO', 
		'VALOR_ICMS_EFETIVO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Origem da Mercadoria', 
		'CST', 
		'CSOSN', 
		'Modalidade Base Cálculo', 
		'Percentual Redução BC ICMS', 
		'Valor BC ICMS', 
		'Alíquota ICMS', 
		'Valor ICMS Operação', 
		'Percentual Diferimento', 
		'Valor ICMS Diferido', 
		'Valor ICMS', 
		'Valor BC FCP', 
		'Percentual FCP', 
		'Valor FCP', 
		'Indicador Exibilidade', 
		'Percentual MVA ICMS ST', 
		'Percentual Redução BC ICMS ST', 
		'Valor BC ICMS ST', 
		'Alíquota ICMS ST', 
		'Valor ICMS ST', 
		'Valor BC FCP ST', 
		'Percentual FCP ST', 
		'Valor FCP ST', 
		'UF', 
		'Percentual BC Operação Própria', 
		'Valor BC ICMS ST Retido', 
		'Alíquota Suportada Consumidor', 
		'Valor ICMS Substituto', 
		'Valor ICMS ST Retido', 
		'Valor BC FCP ST Retido', 
		'Percentual FCP ST Retido', 
		'Valor FCP ST Retido', 
		'UF', 
		'Valor ICMS Desonerado', 
		'Alíquota Crédito ICMS SN', 
		'Valor Crédito ICMS SN', 
		'Valor BC ICMS ST Destino', 
		'Valor ICMS ST Destino', 
		'Percentual Redução BC Efetivo', 
		'Valor BC Efetivo', 
		'Alíquota ICMS Efetivo', 
		'Valor ICMS Efetivo', 
	];

	NfeDetalheImpostoIcms.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeDetalhe = jsonDados['idNfeDetalhe'];
		origemMercadoria = jsonDados['origemMercadoria'] == '' ? null : jsonDados['origemMercadoria'];
		cstIcms = jsonDados['cstIcms'];
		csosn = jsonDados['csosn'];
		modalidadeBcIcms = getModalidadeBcIcms(jsonDados['modalidadeBcIcms']);
		percentualReducaoBcIcms = jsonDados['percentualReducaoBcIcms']?.toDouble();
		valorBcIcms = jsonDados['valorBcIcms']?.toDouble();
		aliquotaIcms = jsonDados['aliquotaIcms']?.toDouble();
		valorIcmsOperacao = jsonDados['valorIcmsOperacao']?.toDouble();
		percentualDiferimento = jsonDados['percentualDiferimento']?.toDouble();
		valorIcmsDiferido = jsonDados['valorIcmsDiferido']?.toDouble();
		valorIcms = jsonDados['valorIcms']?.toDouble();
		baseCalculoFcp = jsonDados['baseCalculoFcp']?.toDouble();
		percentualFcp = jsonDados['percentualFcp']?.toDouble();
		valorFcp = jsonDados['valorFcp']?.toDouble();
		modalidadeBcIcmsSt = getModalidadeBcIcmsSt(jsonDados['modalidadeBcIcmsSt']);
		percentualMvaIcmsSt = jsonDados['percentualMvaIcmsSt']?.toDouble();
		percentualReducaoBcIcmsSt = jsonDados['percentualReducaoBcIcmsSt']?.toDouble();
		valorBaseCalculoIcmsSt = jsonDados['valorBaseCalculoIcmsSt']?.toDouble();
		aliquotaIcmsSt = jsonDados['aliquotaIcmsSt']?.toDouble();
		valorIcmsSt = jsonDados['valorIcmsSt']?.toDouble();
		baseCalculoFcpSt = jsonDados['baseCalculoFcpSt']?.toDouble();
		percentualFcpSt = jsonDados['percentualFcpSt']?.toDouble();
		valorFcpSt = jsonDados['valorFcpSt']?.toDouble();
		ufSt = jsonDados['ufSt'] == '' ? null : jsonDados['ufSt'];
		percentualBcOperacaoPropria = jsonDados['percentualBcOperacaoPropria']?.toDouble();
		valorBcIcmsStRetido = jsonDados['valorBcIcmsStRetido']?.toDouble();
		aliquotaSuportadaConsumidor = jsonDados['aliquotaSuportadaConsumidor']?.toDouble();
		valorIcmsSubstituto = jsonDados['valorIcmsSubstituto']?.toDouble();
		valorIcmsStRetido = jsonDados['valorIcmsStRetido']?.toDouble();
		baseCalculoFcpStRetido = jsonDados['baseCalculoFcpStRetido']?.toDouble();
		percentualFcpStRetido = jsonDados['percentualFcpStRetido']?.toDouble();
		valorFcpStRetido = jsonDados['valorFcpStRetido']?.toDouble();
		motivoDesoneracaoIcms = jsonDados['motivoDesoneracaoIcms'] == '' ? null : jsonDados['motivoDesoneracaoIcms'];
		valorIcmsDesonerado = jsonDados['valorIcmsDesonerado']?.toDouble();
		aliquotaCreditoIcmsSn = jsonDados['aliquotaCreditoIcmsSn']?.toDouble();
		valorCreditoIcmsSn = jsonDados['valorCreditoIcmsSn']?.toDouble();
		valorBcIcmsStDestino = jsonDados['valorBcIcmsStDestino']?.toDouble();
		valorIcmsStDestino = jsonDados['valorIcmsStDestino']?.toDouble();
		percentualReducaoBcEfetivo = jsonDados['percentualReducaoBcEfetivo']?.toDouble();
		valorBcEfetivo = jsonDados['valorBcEfetivo']?.toDouble();
		aliquotaIcmsEfetivo = jsonDados['aliquotaIcmsEfetivo']?.toDouble();
		valorIcmsEfetivo = jsonDados['valorIcmsEfetivo']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeDetalhe'] = idNfeDetalhe ?? 0;
		jsonDados['origemMercadoria'] = origemMercadoria;
		jsonDados['cstIcms'] = cstIcms;
		jsonDados['csosn'] = csosn;
		jsonDados['modalidadeBcIcms'] = setModalidadeBcIcms(modalidadeBcIcms);
		jsonDados['percentualReducaoBcIcms'] = percentualReducaoBcIcms;
		jsonDados['valorBcIcms'] = valorBcIcms;
		jsonDados['aliquotaIcms'] = aliquotaIcms;
		jsonDados['valorIcmsOperacao'] = valorIcmsOperacao;
		jsonDados['percentualDiferimento'] = percentualDiferimento;
		jsonDados['valorIcmsDiferido'] = valorIcmsDiferido;
		jsonDados['valorIcms'] = valorIcms;
		jsonDados['baseCalculoFcp'] = baseCalculoFcp;
		jsonDados['percentualFcp'] = percentualFcp;
		jsonDados['valorFcp'] = valorFcp;
		jsonDados['modalidadeBcIcmsSt'] = setModalidadeBcIcmsSt(modalidadeBcIcmsSt);
		jsonDados['percentualMvaIcmsSt'] = percentualMvaIcmsSt;
		jsonDados['percentualReducaoBcIcmsSt'] = percentualReducaoBcIcmsSt;
		jsonDados['valorBaseCalculoIcmsSt'] = valorBaseCalculoIcmsSt;
		jsonDados['aliquotaIcmsSt'] = aliquotaIcmsSt;
		jsonDados['valorIcmsSt'] = valorIcmsSt;
		jsonDados['baseCalculoFcpSt'] = baseCalculoFcpSt;
		jsonDados['percentualFcpSt'] = percentualFcpSt;
		jsonDados['valorFcpSt'] = valorFcpSt;
		jsonDados['ufSt'] = ufSt;
		jsonDados['percentualBcOperacaoPropria'] = percentualBcOperacaoPropria;
		jsonDados['valorBcIcmsStRetido'] = valorBcIcmsStRetido;
		jsonDados['aliquotaSuportadaConsumidor'] = aliquotaSuportadaConsumidor;
		jsonDados['valorIcmsSubstituto'] = valorIcmsSubstituto;
		jsonDados['valorIcmsStRetido'] = valorIcmsStRetido;
		jsonDados['baseCalculoFcpStRetido'] = baseCalculoFcpStRetido;
		jsonDados['percentualFcpStRetido'] = percentualFcpStRetido;
		jsonDados['valorFcpStRetido'] = valorFcpStRetido;
		jsonDados['motivoDesoneracaoIcms'] = motivoDesoneracaoIcms;
		jsonDados['valorIcmsDesonerado'] = valorIcmsDesonerado;
		jsonDados['aliquotaCreditoIcmsSn'] = aliquotaCreditoIcmsSn;
		jsonDados['valorCreditoIcmsSn'] = valorCreditoIcmsSn;
		jsonDados['valorBcIcmsStDestino'] = valorBcIcmsStDestino;
		jsonDados['valorIcmsStDestino'] = valorIcmsStDestino;
		jsonDados['percentualReducaoBcEfetivo'] = percentualReducaoBcEfetivo;
		jsonDados['valorBcEfetivo'] = valorBcEfetivo;
		jsonDados['aliquotaIcmsEfetivo'] = aliquotaIcmsEfetivo;
		jsonDados['valorIcmsEfetivo'] = valorIcmsEfetivo;
	
		return jsonDados;
	}
	
    getModalidadeBcIcms(String? modalidadeBcIcms) {
    	switch (modalidadeBcIcms) {
    		case '0':
    			return '0=Margem Valor Agregado (%)';
    		case '1':
    			return '1=Pauta (valor)';
    		case '2':
    			return '2=Preço Tabelado Máximo (valor)';
    		case '3':
    			return '3=Valor da Operação';
    		default:
    			return null;
    		}
    	}

    setModalidadeBcIcms(String? modalidadeBcIcms) {
      if (modalidadeBcIcms?.length == 1) {
        return modalidadeBcIcms;
      }      
    	switch (modalidadeBcIcms) {
    		case '0=Margem Valor Agregado (%)':
    			return '0';
    		case '1=Pauta (valor)':
    			return '1';
    		case '2=Preço Tabelado Máximo (valor)':
    			return '2';
    		case '3=Valor da Operação':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getModalidadeBcIcmsSt(String? modalidadeBcIcmsSt) {
    	switch (modalidadeBcIcmsSt) {
    		case '0':
    			return '0=Preço tabelado ou máximo sugerido';
    		case '1':
    			return '1=Lista Negativa (valor)';
    		case '2':
    			return '2=Lista Positiva (valor)';
    		case '3':
    			return '3=Lista Neutra (valor)';
    		case '4':
    			return '4=Margem Valor Agregado (%)';
    		case '5':
    			return '5=Pauta (valor)';
    		default:
    			return null;
    		}
    	}

    setModalidadeBcIcmsSt(String? modalidadeBcIcmsSt) {
      if (modalidadeBcIcmsSt?.length == 1) {
        return modalidadeBcIcmsSt;
      }        
    	switch (modalidadeBcIcmsSt) {
    		case '0=Preço tabelado ou máximo sugerido':
    			return '0';
    		case '1=Lista Negativa (valor)':
    			return '1';
    		case '2=Lista Positiva (valor)':
    			return '2';
    		case '3=Lista Neutra (valor)':
    			return '3';
    		case '4=Margem Valor Agregado (%)':
    			return '4';
    		case '5=Pauta (valor)':
    			return '5';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}