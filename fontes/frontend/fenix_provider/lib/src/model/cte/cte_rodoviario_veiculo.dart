/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_RODOVIARIO_VEICULO] 
                                                                                
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


class CteRodoviarioVeiculo {
	int? id;
	int? idCteRodoviario;
	String? codigoInterno;
	String? renavam;
	String? placa;
	int? tara;
	int? capacidadeKg;
	int? capacidadeM3;
	String? tipoPropriedade;
	String? tipoVeiculo;
	String? tipoRodado;
	String? tipoCarroceria;
	String? uf;
	String? proprietarioCpf;
	String? proprietarioCnpj;
	String? proprietarioRntrc;
	String? proprietarioNome;
	String? proprietarioIe;
	String? proprietarioUf;
	String? proprietarioTipo;

	CteRodoviarioVeiculo({
		id,
		idCteRodoviario,
		codigoInterno,
		renavam,
		placa,
		tara,
		capacidadeKg,
		capacidadeM3,
		tipoPropriedade,
		tipoVeiculo,
		tipoRodado,
		tipoCarroceria,
		uf,
		proprietarioCpf,
		proprietarioCnpj,
		proprietarioRntrc,
		proprietarioNome,
		proprietarioIe,
		proprietarioUf,
		proprietarioTipo,
	});

	static List<String> campos = <String>[
		'ID', 
		'CODIGO_INTERNO', 
		'RENAVAM', 
		'PLACA', 
		'TARA', 
		'CAPACIDADE_KG', 
		'CAPACIDADE_M3', 
		'TIPO_PROPRIEDADE', 
		'TIPO_VEICULO', 
		'TIPO_RODADO', 
		'TIPO_CARROCERIA', 
		'UF', 
		'PROPRIETARIO_CPF', 
		'PROPRIETARIO_CNPJ', 
		'PROPRIETARIO_RNTRC', 
		'PROPRIETARIO_NOME', 
		'PROPRIETARIO_IE', 
		'PROPRIETARIO_UF', 
		'PROPRIETARIO_TIPO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Codigo Interno', 
		'Renavam', 
		'Placa', 
		'Tara', 
		'Capacidade Kg', 
		'Capacidade M 3', 
		'Tipo Propriedade', 
		'Tipo Veiculo', 
		'Tipo Rodado', 
		'Tipo Carroceria', 
		'Uf', 
		'Proprietario Cpf', 
		'Proprietario Cnpj', 
		'Proprietario Rntrc', 
		'Proprietario Nome', 
		'Proprietario Ie', 
		'Proprietario Uf', 
		'Proprietario Tipo', 
	];

	CteRodoviarioVeiculo.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteRodoviario = jsonDados['idCteRodoviario'];
		codigoInterno = jsonDados['codigoInterno'];
		renavam = jsonDados['renavam'];
		placa = jsonDados['placa'];
		tara = jsonDados['tara'];
		capacidadeKg = jsonDados['capacidadeKg'];
		capacidadeM3 = jsonDados['capacidadeM3'];
		tipoPropriedade = jsonDados['tipoPropriedade'];
		tipoVeiculo = jsonDados['tipoVeiculo'];
		tipoRodado = jsonDados['tipoRodado'];
		tipoCarroceria = jsonDados['tipoCarroceria'];
		uf = jsonDados['uf'];
		proprietarioCpf = jsonDados['proprietarioCpf'];
		proprietarioCnpj = jsonDados['proprietarioCnpj'];
		proprietarioRntrc = jsonDados['proprietarioRntrc'];
		proprietarioNome = jsonDados['proprietarioNome'];
		proprietarioIe = jsonDados['proprietarioIe'];
		proprietarioUf = jsonDados['proprietarioUf'];
		proprietarioTipo = jsonDados['proprietarioTipo'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteRodoviario'] = idCteRodoviario ?? 0;
		jsonDados['codigoInterno'] = codigoInterno;
		jsonDados['renavam'] = renavam;
		jsonDados['placa'] = placa;
		jsonDados['tara'] = tara ?? 0;
		jsonDados['capacidadeKg'] = capacidadeKg ?? 0;
		jsonDados['capacidadeM3'] = capacidadeM3 ?? 0;
		jsonDados['tipoPropriedade'] = tipoPropriedade;
		jsonDados['tipoVeiculo'] = tipoVeiculo;
		jsonDados['tipoRodado'] = tipoRodado;
		jsonDados['tipoCarroceria'] = tipoCarroceria;
		jsonDados['uf'] = uf;
		jsonDados['proprietarioCpf'] = proprietarioCpf;
		jsonDados['proprietarioCnpj'] = proprietarioCnpj;
		jsonDados['proprietarioRntrc'] = proprietarioRntrc;
		jsonDados['proprietarioNome'] = proprietarioNome;
		jsonDados['proprietarioIe'] = proprietarioIe;
		jsonDados['proprietarioUf'] = proprietarioUf;
		jsonDados['proprietarioTipo'] = proprietarioTipo;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CteRodoviarioVeiculo objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}