/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [TRIBUT_ISS] 
                                                                                
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

class TributIss {
	int? id;
	int? idTributOperacaoFiscal;
	String? modalidadeBaseCalculo;
	double? porcentoBaseCalculo;
	double? aliquotaPorcento;
	double? aliquotaUnidade;
	double? valorPrecoMaximo;
	double? valorPautaFiscal;
	int? itemListaServico;
	String? codigoTributacao;
	TributOperacaoFiscal? tributOperacaoFiscal;

	TributIss({
		id,
		idTributOperacaoFiscal,
		modalidadeBaseCalculo,
		porcentoBaseCalculo = 0.0,
		aliquotaPorcento = 0.0,
		aliquotaUnidade = 0.0,
		valorPrecoMaximo = 0.0,
		valorPautaFiscal = 0.0,
		itemListaServico,
		codigoTributacao,
		tributOperacaoFiscal,
	});

	static List<String> campos = <String>[
		'ID', 
		'MODALIDADE_BASE_CALCULO', 
		'PORCENTO_BASE_CALCULO', 
		'ALIQUOTA_PORCENTO', 
		'ALIQUOTA_UNIDADE', 
		'VALOR_PRECO_MAXIMO', 
		'VALOR_PAUTA_FISCAL', 
		'ITEM_LISTA_SERVICO', 
		'CODIGO_TRIBUTACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Modalidade Base Cálculo', 
		'Porcento Base Cálculo', 
		'Alíquota Porcento', 
		'Alíquota Unidade', 
		'Valor Preço Máximo', 
		'Valor Pauta Fiscal', 
		'Item Lista Serviço', 
		'Código Tributação', 
	];

	TributIss.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idTributOperacaoFiscal = jsonDados['idTributOperacaoFiscal'];
		modalidadeBaseCalculo = getModalidadeBaseCalculo(jsonDados['modalidadeBaseCalculo']);
		porcentoBaseCalculo = jsonDados['porcentoBaseCalculo']?.toDouble();
		aliquotaPorcento = jsonDados['aliquotaPorcento']?.toDouble();
		aliquotaUnidade = jsonDados['aliquotaUnidade']?.toDouble();
		valorPrecoMaximo = jsonDados['valorPrecoMaximo']?.toDouble();
		valorPautaFiscal = jsonDados['valorPautaFiscal']?.toDouble();
		itemListaServico = jsonDados['itemListaServico'];
		codigoTributacao = getCodigoTributacao(jsonDados['codigoTributacao']);
		tributOperacaoFiscal = jsonDados['tributOperacaoFiscal'] == null ? null : TributOperacaoFiscal.fromJson(jsonDados['tributOperacaoFiscal']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idTributOperacaoFiscal'] = idTributOperacaoFiscal ?? 0;
		jsonDados['modalidadeBaseCalculo'] = setModalidadeBaseCalculo(modalidadeBaseCalculo);
		jsonDados['porcentoBaseCalculo'] = porcentoBaseCalculo;
		jsonDados['aliquotaPorcento'] = aliquotaPorcento;
		jsonDados['aliquotaUnidade'] = aliquotaUnidade;
		jsonDados['valorPrecoMaximo'] = valorPrecoMaximo;
		jsonDados['valorPautaFiscal'] = valorPautaFiscal;
		jsonDados['itemListaServico'] = itemListaServico ?? 0;
		jsonDados['codigoTributacao'] = setCodigoTributacao(codigoTributacao);
		jsonDados['tributOperacaoFiscal'] = tributOperacaoFiscal == null ? null : tributOperacaoFiscal!.toJson;
	
		return jsonDados;
	}
	
    getModalidadeBaseCalculo(String? modalidadeBaseCalculo) {
    	switch (modalidadeBaseCalculo) {
    		case '0':
    			return '0-Valor Operação';
    		case '9':
    			return '9-Outros';
    		default:
    			return null;
    		}
    	}

    setModalidadeBaseCalculo(String? modalidadeBaseCalculo) {
    	switch (modalidadeBaseCalculo) {
    		case '0-Valor Operação':
    			return '0';
    		case '9-Outros':
    			return '9';
    		default:
    			return null;
    		}
    	}

    getCodigoTributacao(String? codigoTributacao) {
    	switch (codigoTributacao) {
    		case 'N':
    			return 'Normal';
    		case 'R':
    			return 'Retida';
    		case 'S':
    			return 'Substituta';
    		case 'I':
    			return 'Isenta';
    		default:
    			return null;
    		}
    	}

    setCodigoTributacao(String? codigoTributacao) {
    	switch (codigoTributacao) {
    		case 'Normal':
    			return 'N';
    		case 'Retida':
    			return 'R';
    		case 'Substituta':
    			return 'S';
    		case 'Isenta':
    			return 'I';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(TributIss objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}