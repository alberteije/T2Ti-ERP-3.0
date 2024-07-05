/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS_UFDEST] 
                                                                                
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


class NfeDetalheImpostoIcmsUfdest {
	int? id;
	int? idNfeDetalhe;
	double? valorBcIcmsUfDestino;
	double? valorBcFcpUfDestino;
	double? percentualFcpUfDestino;
	double? aliquotaInternaUfDestino;
	double? aliquotaInteresdatualUfEnvolvidas;
	double? percentualProvisorioPartilhaIcms;
	double? valorIcmsFcpUfDestino;
	double? valorInterestadualUfDestino;
	double? valorInterestadualUfRemetente;

	NfeDetalheImpostoIcmsUfdest({
		id,
		idNfeDetalhe,
		valorBcIcmsUfDestino = 0.0,
		valorBcFcpUfDestino = 0.0,
		percentualFcpUfDestino = 0.0,
		aliquotaInternaUfDestino = 0.0,
		aliquotaInteresdatualUfEnvolvidas = 0.0,
		percentualProvisorioPartilhaIcms = 0.0,
		valorIcmsFcpUfDestino = 0.0,
		valorInterestadualUfDestino = 0.0,
		valorInterestadualUfRemetente = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'VALOR_BC_ICMS_UF_DESTINO', 
		'VALOR_BC_FCP_UF_DESTINO', 
		'PERCENTUAL_FCP_UF_DESTINO', 
		'ALIQUOTA_INTERNA_UF_DESTINO', 
		'ALIQUOTA_INTERESDATUAL_UF_ENVOLVIDAS', 
		'PERCENTUAL_PROVISORIO_PARTILHA_ICMS', 
		'VALOR_ICMS_FCP_UF_DESTINO', 
		'VALOR_INTERESTADUAL_UF_DESTINO', 
		'VALOR_INTERESTADUAL_UF_REMETENTE', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Valor BC ICMS UF Destino', 
		'Valor BC FCP UF Destino', 
		'Percentual FCP UF Destino', 
		'Alíquota Interna UF Destino', 
		'Alíquota Interestadual UF Envolvidas', 
		'Percentual Provisório Partilha ICMS', 
		'Valor ICMS FCP UF Destino', 
		'Valor Interestadual UF Destino', 
		'Valor Interestadual UF Remetente', 
	];

	NfeDetalheImpostoIcmsUfdest.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeDetalhe = jsonDados['idNfeDetalhe'];
		valorBcIcmsUfDestino = jsonDados['valorBcIcmsUfDestino']?.toDouble();
		valorBcFcpUfDestino = jsonDados['valorBcFcpUfDestino']?.toDouble();
		percentualFcpUfDestino = jsonDados['percentualFcpUfDestino']?.toDouble();
		aliquotaInternaUfDestino = jsonDados['aliquotaInternaUfDestino']?.toDouble();
		aliquotaInteresdatualUfEnvolvidas = jsonDados['aliquotaInteresdatualUfEnvolvidas']?.toDouble();
		percentualProvisorioPartilhaIcms = jsonDados['percentualProvisorioPartilhaIcms']?.toDouble();
		valorIcmsFcpUfDestino = jsonDados['valorIcmsFcpUfDestino']?.toDouble();
		valorInterestadualUfDestino = jsonDados['valorInterestadualUfDestino']?.toDouble();
		valorInterestadualUfRemetente = jsonDados['valorInterestadualUfRemetente']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeDetalhe'] = idNfeDetalhe ?? 0;
		jsonDados['valorBcIcmsUfDestino'] = valorBcIcmsUfDestino;
		jsonDados['valorBcFcpUfDestino'] = valorBcFcpUfDestino;
		jsonDados['percentualFcpUfDestino'] = percentualFcpUfDestino;
		jsonDados['aliquotaInternaUfDestino'] = aliquotaInternaUfDestino;
		jsonDados['aliquotaInteresdatualUfEnvolvidas'] = aliquotaInteresdatualUfEnvolvidas;
		jsonDados['percentualProvisorioPartilhaIcms'] = percentualProvisorioPartilhaIcms;
		jsonDados['valorIcmsFcpUfDestino'] = valorIcmsFcpUfDestino;
		jsonDados['valorInterestadualUfDestino'] = valorInterestadualUfDestino;
		jsonDados['valorInterestadualUfRemetente'] = valorInterestadualUfRemetente;
	
		return jsonDados;
	}
	

	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}