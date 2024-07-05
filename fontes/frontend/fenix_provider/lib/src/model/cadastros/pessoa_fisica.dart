/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [PESSOA_FISICA] 
                                                                                
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

class PessoaFisica {
	int? id;
	int? idPessoa;
	int? idNivelFormacao;
	int? idEstadoCivil;
	String? cpf;
	String? rg;
	String? orgaoRg;
	DateTime? dataEmissaoRg;
	DateTime? dataNascimento;
	String? sexo;
	String? raca;
	String? nacionalidade;
	String? naturalidade;
	String? nomePai;
	String? nomeMae;
	NivelFormacao? nivelFormacao;
	EstadoCivil? estadoCivil;

	PessoaFisica({
			id,
			idPessoa,
			idNivelFormacao,
			idEstadoCivil,
			cpf,
			rg,
			orgaoRg,
			dataEmissaoRg,
			dataNascimento,
			sexo,
			raca,
			nacionalidade,
			naturalidade,
			nomePai,
			nomeMae,
			nivelFormacao,
			estadoCivil,
		});

	static List<String> campos = <String>[
		'ID', 
		'CPF', 
		'RG', 
		'ORGAO_RG', 
		'DATA_EMISSAO_RG', 
		'DATA_NASCIMENTO', 
		'SEXO', 
		'RACA', 
		'NACIONALIDADE', 
		'NATURALIDADE', 
		'NOME_PAI', 
		'NOME_MAE', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'CPF', 
		'RG', 
		'Órgão RG', 
		'Data Emissão', 
		'Data Nascimento', 
		'Sexo', 
		'Raça', 
		'Nacionalidade', 
		'Naturalidade', 
		'Nome Pai', 
		'Nome Mãe', 
	];

	PessoaFisica.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idPessoa = jsonDados['idPessoa'];
		idNivelFormacao = jsonDados['idNivelFormacao'];
		idEstadoCivil = jsonDados['idEstadoCivil'];
		cpf = jsonDados['cpf'];
		rg = jsonDados['rg'];
		orgaoRg = jsonDados['orgaoRg'];
		dataEmissaoRg = jsonDados['dataEmissaoRg'] != null ? DateTime.tryParse(jsonDados['dataEmissaoRg']) : null;
		dataNascimento = jsonDados['dataNascimento'] != null ? DateTime.tryParse(jsonDados['dataNascimento']) : null;
		sexo = getSexo(jsonDados['sexo']);
		raca = getRaca(jsonDados['raca']);
		nacionalidade = jsonDados['nacionalidade'];
		naturalidade = jsonDados['naturalidade'];
		nomePai = jsonDados['nomePai'];
		nomeMae = jsonDados['nomeMae'];
		nivelFormacao = jsonDados['nivelFormacao'] == null ? null : NivelFormacao.fromJson(jsonDados['nivelFormacao']);
		estadoCivil = jsonDados['estadoCivil'] == null ? null : EstadoCivil.fromJson(jsonDados['estadoCivil']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idPessoa'] = idPessoa ?? 0;
		jsonDados['idNivelFormacao'] = idNivelFormacao ?? 0;
		jsonDados['idEstadoCivil'] = idEstadoCivil ?? 0;
		jsonDados['cpf'] = Biblioteca.removerMascara(cpf);
		jsonDados['rg'] = rg;
		jsonDados['orgaoRg'] = orgaoRg;
		jsonDados['dataEmissaoRg'] = dataEmissaoRg != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEmissaoRg!) : null;
		jsonDados['dataNascimento'] = dataNascimento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataNascimento!) : null;
		jsonDados['sexo'] = setSexo(sexo);
		jsonDados['raca'] = setRaca(raca);
		jsonDados['nacionalidade'] = nacionalidade;
		jsonDados['naturalidade'] = naturalidade;
		jsonDados['nomePai'] = nomePai;
		jsonDados['nomeMae'] = nomeMae;
		jsonDados['nivelFormacao'] = nivelFormacao == null ? null : nivelFormacao!.toJson;
		jsonDados['estadoCivil'] = estadoCivil == null ? null : estadoCivil!.toJson;
	
		return jsonDados;
	}
	
    getSexo(String? sexo) {
    	switch (sexo) {
    		case 'M':
    			return 'Masculino';
    		case 'F':
    			return 'Feminino';
    		default:
    			return null;
    		}
    	}

    setSexo(String? sexo) {
    	switch (sexo) {
    		case 'Masculino':
    			return 'M';
    		case 'Feminino':
    			return 'F';
    		default:
    			return null;
    		}
    	}

    getRaca(String? raca) {
    	switch (raca) {
    		case 'B':
    			return 'Branco';
    		case 'M':
    			return 'Moreno';
    		case 'N':
    			return 'Negro';
    		case 'P':
    			return 'Pardo';
    		case 'A':
    			return 'Amarelo';
    		case 'I':
    			return 'Indígena';
    		case 'O':
    			return 'Outro';
    		default:
    			return null;
    		}
    	}

    setRaca(String? raca) {
    	switch (raca) {
    		case 'Branco':
    			return 'B';
    		case 'Moreno':
    			return 'M';
    		case 'Negro':
    			return 'N';
    		case 'Pardo':
    			return 'P';
    		case 'Amarelo':
    			return 'A';
    		case 'Indígena':
    			return 'I';
    		case 'Outro':
    			return 'O';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(PessoaFisica objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}