/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_DET_ESPECIFICO_VEICULO] 
                                                                                
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


class NfeDetEspecificoVeiculo {
	int? id;
	int? idNfeDetalhe;
	String? tipoOperacao;
	String? chassi;
	String? cor;
	String? descricaoCor;
	String? potenciaMotor;
	String? cilindradas;
	String? pesoLiquido;
	String? pesoBruto;
	String? numeroSerie;
	String? tipoCombustivel;
	String? numeroMotor;
	String? capacidadeMaximaTracao;
	String? distanciaEixos;
	String? anoModelo;
	String? anoFabricacao;
	String? tipoPintura;
	String? tipoVeiculo;
	String? especieVeiculo;
	String? condicaoVin;
	String? condicaoVeiculo;
	String? codigoMarcaModelo;
	String? codigoCorDenatran;
	int? lotacaoMaxima;
	String? restricao;

	NfeDetEspecificoVeiculo({
		id,
		idNfeDetalhe,
		tipoOperacao,
		chassi,
		cor,
		descricaoCor,
		potenciaMotor,
		cilindradas,
		pesoLiquido,
		pesoBruto,
		numeroSerie,
		tipoCombustivel,
		numeroMotor,
		capacidadeMaximaTracao,
		distanciaEixos,
		anoModelo,
		anoFabricacao,
		tipoPintura,
		tipoVeiculo,
		especieVeiculo,
		condicaoVin,
		condicaoVeiculo,
		codigoMarcaModelo,
		codigoCorDenatran,
		lotacaoMaxima,
		restricao,
	});

	static List<String> campos = <String>[
		'ID', 
		'TIPO_OPERACAO', 
		'CHASSI', 
		'COR', 
		'DESCRICAO_COR', 
		'POTENCIA_MOTOR', 
		'CILINDRADAS', 
		'PESO_LIQUIDO', 
		'PESO_BRUTO', 
		'NUMERO_SERIE', 
		'TIPO_COMBUSTIVEL', 
		'NUMERO_MOTOR', 
		'CAPACIDADE_MAXIMA_TRACAO', 
		'DISTANCIA_EIXOS', 
		'ANO_MODELO', 
		'ANO_FABRICACAO', 
		'TIPO_PINTURA', 
		'TIPO_VEICULO', 
		'ESPECIE_VEICULO', 
		'CONDICAO_VIN', 
		'CONDICAO_VEICULO', 
		'CODIGO_MARCA_MODELO', 
		'CODIGO_COR_DENATRAN', 
		'LOTACAO_MAXIMA', 
		'RESTRICAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Tipo Operação', 
		'Chassi', 
		'Cor', 
		'Descrição Cor', 
		'Potência Motor', 
		'Cilindradas', 
		'Peso Líquido', 
		'Peso Bruto', 
		'Número de Série', 
		'Tipo Combustível', 
		'Número do Motor', 
		'Capacidade Máxima Tração', 
		'Distância Entre Eixos', 
		'Ano Modelo', 
		'Ano Fabricação', 
		'Tipo Pintura', 
		'Tipo Veículo', 
		'Espécie Veículo', 
		'VIN', 
		'Condição Veículo', 
		'Código Marca Modelo', 
		'Cor DENATRAN', 
		'Lotação Máxima', 
		'Restrição', 
	];

	NfeDetEspecificoVeiculo.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeDetalhe = jsonDados['idNfeDetalhe'];
		tipoOperacao = getTipoOperacao(jsonDados['tipoOperacao']);
		chassi = jsonDados['chassi'];
		cor = jsonDados['cor'];
		descricaoCor = jsonDados['descricaoCor'];
		potenciaMotor = jsonDados['potenciaMotor'];
		cilindradas = jsonDados['cilindradas'];
		pesoLiquido = jsonDados['pesoLiquido'];
		pesoBruto = jsonDados['pesoBruto'];
		numeroSerie = jsonDados['numeroSerie'];
		tipoCombustivel = jsonDados['tipoCombustivel'] == '' ? null : jsonDados['tipoCombustivel'];
		numeroMotor = jsonDados['numeroMotor'];
		capacidadeMaximaTracao = jsonDados['capacidadeMaximaTracao'];
		distanciaEixos = jsonDados['distanciaEixos'];
		anoModelo = jsonDados['anoModelo'];
		anoFabricacao = jsonDados['anoFabricacao'];
		tipoPintura = jsonDados['tipoPintura'];
		tipoVeiculo = jsonDados['tipoVeiculo'] == '' ? null : jsonDados['tipoVeiculo'];
		especieVeiculo = getEspecieVeiculo(jsonDados['especieVeiculo']);
		condicaoVin = getCondicaoVin(jsonDados['condicaoVin']);
		condicaoVeiculo = getCondicaoVeiculo(jsonDados['condicaoVeiculo']);
		codigoMarcaModelo = jsonDados['codigoMarcaModelo'];
		codigoCorDenatran = jsonDados['codigoCorDenatran'] == '' ? null : jsonDados['codigoCorDenatran'];
		lotacaoMaxima = jsonDados['lotacaoMaxima'];
		restricao = getRestricao(jsonDados['restricao']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeDetalhe'] = idNfeDetalhe ?? 0;
		jsonDados['tipoOperacao'] = setTipoOperacao(tipoOperacao);
		jsonDados['chassi'] = chassi;
		jsonDados['cor'] = cor;
		jsonDados['descricaoCor'] = descricaoCor;
		jsonDados['potenciaMotor'] = potenciaMotor;
		jsonDados['cilindradas'] = cilindradas;
		jsonDados['pesoLiquido'] = pesoLiquido;
		jsonDados['pesoBruto'] = pesoBruto;
		jsonDados['numeroSerie'] = numeroSerie;
		jsonDados['tipoCombustivel'] = tipoCombustivel;
		jsonDados['numeroMotor'] = numeroMotor;
		jsonDados['capacidadeMaximaTracao'] = capacidadeMaximaTracao;
		jsonDados['distanciaEixos'] = distanciaEixos;
		jsonDados['anoModelo'] = anoModelo;
		jsonDados['anoFabricacao'] = anoFabricacao;
		jsonDados['tipoPintura'] = tipoPintura;
		jsonDados['tipoVeiculo'] = tipoVeiculo;
		jsonDados['especieVeiculo'] = setEspecieVeiculo(especieVeiculo);
		jsonDados['condicaoVin'] = setCondicaoVin(condicaoVin);
		jsonDados['condicaoVeiculo'] = setCondicaoVeiculo(condicaoVeiculo);
		jsonDados['codigoMarcaModelo'] = codigoMarcaModelo;
		jsonDados['codigoCorDenatran'] = codigoCorDenatran;
		jsonDados['lotacaoMaxima'] = lotacaoMaxima ?? 0;
		jsonDados['restricao'] = setRestricao(restricao);
	
		return jsonDados;
	}
	
    getTipoOperacao(String? tipoOperacao) {
    	switch (tipoOperacao) {
    		case '1':
    			return '1=Venda concessionária';
    		case '2':
    			return '2=Faturamento direto para consumidor final';
    		case '3':
    			return '3=Venda direta para grandes consumidores';
    		case '0':
    			return '0=Outros';
    		default:
    			return null;
    		}
    	}

    setTipoOperacao(String? tipoOperacao) {
    	switch (tipoOperacao) {
    		case '1=Venda concessionária':
    			return '1';
    		case '2=Faturamento direto para consumidor final':
    			return '2';
    		case '3=Venda direta para grandes consumidores':
    			return '3';
    		case '0=Outros':
    			return '0';
    		default:
    			return null;
    		}
    	}

    getEspecieVeiculo(String? especieVeiculo) {
    	switch (especieVeiculo) {
    		case '1':
    			return '1=PASSAGEIRO';
    		case '2':
    			return '2=CARGA';
    		case '3':
    			return '3=MISTO';
    		case '4':
    			return '4=CORRIDA';
    		case '5':
    			return '5=TRAÇÃO';
    		case '6':
    			return '6=ESPECIAL';
    		default:
    			return null;
    		}
    	}

    setEspecieVeiculo(String? especieVeiculo) {
    	switch (especieVeiculo) {
    		case '1=PASSAGEIRO':
    			return '1';
    		case '2=CARGA':
    			return '2';
    		case '3=MISTO':
    			return '3';
    		case '4=CORRIDA':
    			return '4';
    		case '5=TRAÇÃO':
    			return '5';
    		case '6=ESPECIAL':
    			return '6';
    		default:
    			return null;
    		}
    	}

    getCondicaoVin(String? condicaoVin) {
    	switch (condicaoVin) {
    		case 'R':
    			return 'R-Remarcado';
    		case 'N':
    			return 'N-Normal';
    		default:
    			return null;
    		}
    	}

    setCondicaoVin(String? condicaoVin) {
    	switch (condicaoVin) {
    		case 'R-Remarcado':
    			return 'R';
    		case 'N-Normal':
    			return 'N';
    		default:
    			return null;
    		}
    	}

    getCondicaoVeiculo(String? condicaoVeiculo) {
    	switch (condicaoVeiculo) {
    		case '1':
    			return '1=Acabado';
    		case '2':
    			return '2=Inacabado';
    		case '3':
    			return '3=Semiacabado';
    		default:
    			return null;
    		}
    	}

    setCondicaoVeiculo(String? condicaoVeiculo) {
    	switch (condicaoVeiculo) {
    		case '1=Acabado':
    			return '1';
    		case '2=Inacabado':
    			return '2';
    		case '3=Semiacabado':
    			return '3';
    		default:
    			return null;
    		}
    	}

    getRestricao(String? restricao) {
    	switch (restricao) {
    		case '0':
    			return '0=Não há';
    		case '1':
    			return '1=Alienação Fiduciária';
    		case '2':
    			return '2=Arrendamento Mercantil';
    		case '3':
    			return '3=Reserva de Domínio';
    		case '4':
    			return '4=Penhor de Veículos';
    		case '9':
    			return '9=Outras';
    		default:
    			return null;
    		}
    	}

    setRestricao(String? restricao) {
    	switch (restricao) {
    		case '0=Não há':
    			return '0';
    		case '1=Alienação Fiduciária':
    			return '1';
    		case '2=Arrendamento Mercantil':
    			return '2';
    		case '3=Reserva de Domínio':
    			return '3';
    		case '4=Penhor de Veículos':
    			return '4';
    		case '9=Outras':
    			return '9';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}