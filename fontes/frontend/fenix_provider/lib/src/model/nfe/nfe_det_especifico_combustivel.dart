/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_COMBUSTIVEL] 
                                                                                
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


class NfeDetEspecificoCombustivel {
	int? id;
	int? idNfeDetalhe;
	int? codigoAnp;
	String? descricaoAnp;
	double? percentualGlp;
	double? percentualGasNacional;
	double? percentualGasImportado;
	double? valorPartida;
	String? codif;
	double? quantidadeTempAmbiente;
	String? ufConsumo;
	double? cideBaseCalculo;
	double? cideAliquota;
	double? cideValor;
	int? encerranteBico;
	int? encerranteBomba;
	int? encerranteTanque;
	double? encerranteValorInicio;
	double? encerranteValorFim;

	NfeDetEspecificoCombustivel({
		id,
		idNfeDetalhe,
		codigoAnp,
		descricaoAnp,
		percentualGlp = 0.0,
		percentualGasNacional = 0.0,
		percentualGasImportado = 0.0,
		valorPartida = 0.0,
		codif,
		quantidadeTempAmbiente = 0.0,
		ufConsumo,
		cideBaseCalculo = 0.0,
		cideAliquota = 0.0,
		cideValor = 0.0,
		encerranteBico,
		encerranteBomba,
		encerranteTanque,
		encerranteValorInicio = 0.0,
		encerranteValorFim = 0.0,
	});

	static List<String> campos = <String>[
		'ID', 
		'CODIGO_ANP', 
		'DESCRICAO_ANP', 
		'PERCENTUAL_GLP', 
		'PERCENTUAL_GAS_NACIONAL', 
		'PERCENTUAL_GAS_IMPORTADO', 
		'VALOR_PARTIDA', 
		'CODIF', 
		'QUANTIDADE_TEMP_AMBIENTE', 
		'UF_CONSUMO', 
		'CIDE_BASE_CALCULO', 
		'CIDE_ALIQUOTA', 
		'CIDE_VALOR', 
		'ENCERRANTE_BICO', 
		'ENCERRANTE_BOMBA', 
		'ENCERRANTE_TANQUE', 
		'ENCERRANTE_VALOR_INICIO', 
		'ENCERRANTE_VALOR_FIM', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Código ANP', 
		'Descrição ANP', 
		'Percentual GLP', 
		'Percentual Gás Nacional', 
		'Percentual Gás Importado', 
		'Valor Partida', 
		'CODIF', 
		'Quantidade Temperatura Ambiente', 
		'UF', 
		'Base Cálculo CIDE', 
		'Alíquota CIDE', 
		'Valor CIDE', 
		'Encerrante - Número do Bico', 
		'Encerrante - Número da Bomba', 
		'Encerrante - Número do Tanque', 
		'Valor Encerrante Início Abastecimento', 
		'Valor Encerrante Fim Abastecimento', 
	];

	NfeDetEspecificoCombustivel.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeDetalhe = jsonDados['idNfeDetalhe'];
		codigoAnp = jsonDados['codigoAnp'];
		descricaoAnp = jsonDados['descricaoAnp'];
		percentualGlp = jsonDados['percentualGlp']?.toDouble();
		percentualGasNacional = jsonDados['percentualGasNacional']?.toDouble();
		percentualGasImportado = jsonDados['percentualGasImportado']?.toDouble();
		valorPartida = jsonDados['valorPartida']?.toDouble();
		codif = jsonDados['codif'];
		quantidadeTempAmbiente = jsonDados['quantidadeTempAmbiente']?.toDouble();
		ufConsumo = jsonDados['ufConsumo'] == '' ? null : jsonDados['ufConsumo'];
		cideBaseCalculo = jsonDados['cideBaseCalculo']?.toDouble();
		cideAliquota = jsonDados['cideAliquota']?.toDouble();
		cideValor = jsonDados['cideValor']?.toDouble();
		encerranteBico = jsonDados['encerranteBico'];
		encerranteBomba = jsonDados['encerranteBomba'];
		encerranteTanque = jsonDados['encerranteTanque'];
		encerranteValorInicio = jsonDados['encerranteValorInicio']?.toDouble();
		encerranteValorFim = jsonDados['encerranteValorFim']?.toDouble();
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeDetalhe'] = idNfeDetalhe ?? 0;
		jsonDados['codigoAnp'] = codigoAnp ?? 0;
		jsonDados['descricaoAnp'] = descricaoAnp;
		jsonDados['percentualGlp'] = percentualGlp;
		jsonDados['percentualGasNacional'] = percentualGasNacional;
		jsonDados['percentualGasImportado'] = percentualGasImportado;
		jsonDados['valorPartida'] = valorPartida;
		jsonDados['codif'] = codif;
		jsonDados['quantidadeTempAmbiente'] = quantidadeTempAmbiente;
		jsonDados['ufConsumo'] = ufConsumo;
		jsonDados['cideBaseCalculo'] = cideBaseCalculo;
		jsonDados['cideAliquota'] = cideAliquota;
		jsonDados['cideValor'] = cideValor;
		jsonDados['encerranteBico'] = encerranteBico ?? 0;
		jsonDados['encerranteBomba'] = encerranteBomba ?? 0;
		jsonDados['encerranteTanque'] = encerranteTanque ?? 0;
		jsonDados['encerranteValorInicio'] = encerranteValorInicio;
		jsonDados['encerranteValorFim'] = encerranteValorFim;
	
		return jsonDados;
	}
	

	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}