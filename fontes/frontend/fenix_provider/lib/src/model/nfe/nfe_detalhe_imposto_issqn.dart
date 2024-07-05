/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ISSQN] 
                                                                                
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


class NfeDetalheImpostoIssqn {
	int? id;
	int? idNfeDetalhe;
	double? baseCalculoIssqn;
	double? aliquotaIssqn;
	double? valorIssqn;
	int? municipioIssqn;
	int? itemListaServicos;
	double? valorDeducao;
	double? valorOutrasRetencoes;
	double? valorDescontoIncondicionado;
	double? valorDescontoCondicionado;
	double? valorRetencaoIss;
	String? indicadorExigibilidadeIss;
	String? codigoServico;
	int? municipioIncidencia;
	int? paisSevicoPrestado;
	String? numeroProcesso;
	String? indicadorIncentivoFiscal;

	NfeDetalheImpostoIssqn({
		id,
		idNfeDetalhe,
		baseCalculoIssqn = 0.0,
		aliquotaIssqn = 0.0,
		valorIssqn = 0.0,
		municipioIssqn,
		itemListaServicos,
		valorDeducao = 0.0,
		valorOutrasRetencoes = 0.0,
		valorDescontoIncondicionado = 0.0,
		valorDescontoCondicionado = 0.0,
		valorRetencaoIss = 0.0,
		indicadorExigibilidadeIss,
		codigoServico,
		municipioIncidencia,
		paisSevicoPrestado,
		numeroProcesso,
		indicadorIncentivoFiscal,
	});

	static List<String> campos = <String>[
		'ID', 
		'BASE_CALCULO_ISSQN', 
		'ALIQUOTA_ISSQN', 
		'VALOR_ISSQN', 
		'MUNICIPIO_ISSQN', 
		'ITEM_LISTA_SERVICOS', 
		'VALOR_DEDUCAO', 
		'VALOR_OUTRAS_RETENCOES', 
		'VALOR_DESCONTO_INCONDICIONADO', 
		'VALOR_DESCONTO_CONDICIONADO', 
		'VALOR_RETENCAO_ISS', 
		'INDICADOR_EXIGIBILIDADE_ISS', 
		'CODIGO_SERVICO', 
		'MUNICIPIO_INCIDENCIA', 
		'PAIS_SEVICO_PRESTADO', 
		'NUMERO_PROCESSO', 
		'INDICADOR_INCENTIVO_FISCAL', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Valor BC ISSQN', 
		'Alíquota ISSQN', 
		'Valor ISSQN', 
		'Município IBGE', 
		'Item Lista Serviços', 
		'Valor Dedução', 
		'Valor Outras Deduções', 
		'Valor Desconto Incondicionado', 
		'Valor Desconto Condicionado', 
		'Valor Retenção ISS', 
		'Indicador Exibilidade', 
		'Código Serviço', 
		'Município IBGE', 
		'País BACEN', 
		'Número Processo', 
		'Número Processo', 
	];

	NfeDetalheImpostoIssqn.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeDetalhe = jsonDados['idNfeDetalhe'];
		baseCalculoIssqn = jsonDados['baseCalculoIssqn']?.toDouble();
		aliquotaIssqn = jsonDados['aliquotaIssqn']?.toDouble();
		valorIssqn = jsonDados['valorIssqn']?.toDouble();
		municipioIssqn = jsonDados['municipioIssqn'];
		itemListaServicos = jsonDados['itemListaServicos'];
		valorDeducao = jsonDados['valorDeducao']?.toDouble();
		valorOutrasRetencoes = jsonDados['valorOutrasRetencoes']?.toDouble();
		valorDescontoIncondicionado = jsonDados['valorDescontoIncondicionado']?.toDouble();
		valorDescontoCondicionado = jsonDados['valorDescontoCondicionado']?.toDouble();
		valorRetencaoIss = jsonDados['valorRetencaoIss']?.toDouble();
		indicadorExigibilidadeIss = getIndicadorExigibilidadeIss(jsonDados['indicadorExigibilidadeIss']);
		codigoServico = jsonDados['codigoServico'];
		municipioIncidencia = jsonDados['municipioIncidencia'];
		paisSevicoPrestado = jsonDados['paisSevicoPrestado'];
		numeroProcesso = jsonDados['numeroProcesso'];
		indicadorIncentivoFiscal = jsonDados['indicadorIncentivoFiscal'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeDetalhe'] = idNfeDetalhe ?? 0;
		jsonDados['baseCalculoIssqn'] = baseCalculoIssqn;
		jsonDados['aliquotaIssqn'] = aliquotaIssqn;
		jsonDados['valorIssqn'] = valorIssqn;
		jsonDados['municipioIssqn'] = municipioIssqn ?? 0;
		jsonDados['itemListaServicos'] = itemListaServicos ?? 0;
		jsonDados['valorDeducao'] = valorDeducao;
		jsonDados['valorOutrasRetencoes'] = valorOutrasRetencoes;
		jsonDados['valorDescontoIncondicionado'] = valorDescontoIncondicionado;
		jsonDados['valorDescontoCondicionado'] = valorDescontoCondicionado;
		jsonDados['valorRetencaoIss'] = valorRetencaoIss;
		jsonDados['indicadorExigibilidadeIss'] = setIndicadorExigibilidadeIss(indicadorExigibilidadeIss);
		jsonDados['codigoServico'] = codigoServico;
		jsonDados['municipioIncidencia'] = municipioIncidencia ?? 0;
		jsonDados['paisSevicoPrestado'] = paisSevicoPrestado ?? 0;
		jsonDados['numeroProcesso'] = numeroProcesso;
		jsonDados['indicadorIncentivoFiscal'] = indicadorIncentivoFiscal;
	
		return jsonDados;
	}
	
    getIndicadorExigibilidadeIss(String? indicadorExigibilidadeIss) {
    	switch (indicadorExigibilidadeIss) {
    		case '1':
    			return '1=Exigível';
    		case '2':
    			return '2=Não incidência';
    		case '3':
    			return '3=Isenção';
    		case '4':
    			return '4=Exportação';
    		case '5':
    			return '5=Imunidade';
    		case '6':
    			return '6=Exigibilidade Suspensa por Decisão Judicial';
    		case '7':
    			return '7=Exigibilidade Suspensa por Processo Administrativo';
    		default:
    			return null;
    		}
    	}

    setIndicadorExigibilidadeIss(String? indicadorExigibilidadeIss) {
    	switch (indicadorExigibilidadeIss) {
    		case '1=Exigível':
    			return '1';
    		case '2=Não incidência':
    			return '2';
    		case '3=Isenção':
    			return '3';
    		case '4=Exportação':
    			return '4';
    		case '5=Imunidade':
    			return '5';
    		case '6=Exigibilidade Suspensa por Decisão Judicial':
    			return '6';
    		case '7=Exigibilidade Suspensa por Processo Administrativo':
    			return '7';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}