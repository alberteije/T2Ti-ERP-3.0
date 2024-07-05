/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [NFE_TRANSPORTE] 
                                                                                
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

import 'package:fenix/src/infra/biblioteca.dart';
import 'package:fenix/src/model/model.dart';

class NfeTransporte {
	int? id;
	int? idNfeCabecalho;
	int? idTransportadora;
	String? modalidadeFrete;
	String? cnpj;
	String? cpf;
	String? nome;
	String? inscricaoEstadual;
	String? endereco;
	String? nomeMunicipio;
	String? uf;
	double? valorServico;
	double? valorBcRetencaoIcms;
	double? aliquotaRetencaoIcms;
	double? valorIcmsRetido;
	int? cfop;
	int? municipio;
	String? placaVeiculo;
	String? ufVeiculo;
	String? rntcVeiculo;
	Transportadora? transportadora;

	NfeTransporte({
		id,
		idNfeCabecalho,
		idTransportadora,
		modalidadeFrete,
		cnpj,
		cpf,
		nome,
		inscricaoEstadual,
		endereco,
		nomeMunicipio,
		uf,
		valorServico = 0.0,
		valorBcRetencaoIcms = 0.0,
		aliquotaRetencaoIcms = 0.0,
		valorIcmsRetido = 0.0,
		cfop,
		municipio,
		placaVeiculo,
		ufVeiculo,
		rntcVeiculo,
		transportadora,
	});

	static List<String> campos = <String>[
		'ID', 
		'MODALIDADE_FRETE', 
		'CNPJ', 
		'CPF', 
		'NOME', 
		'INSCRICAO_ESTADUAL', 
		'ENDERECO', 
		'NOME_MUNICIPIO', 
		'UF', 
		'VALOR_SERVICO', 
		'VALOR_BC_RETENCAO_ICMS', 
		'ALIQUOTA_RETENCAO_ICMS', 
		'VALOR_ICMS_RETIDO', 
		'CFOP', 
		'MUNICIPIO', 
		'PLACA_VEICULO', 
		'UF_VEICULO', 
		'RNTC_VEICULO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Modalidade Frete', 
		'CNPJ', 
		'CPF', 
		'Nome', 
		'Incrição Estadual', 
		'Endereço', 
		'Nome Município', 
		'UF', 
		'Valor Serviço', 
		'Valor BC Retenção ICMS', 
		'Alíquota Retenção ICMS', 
		'Valor ICMS Retido', 
		'CFOP', 
		'Município IBGE', 
		'Placa Veículo', 
		'UF', 
		'RNTC Veículo', 
	];

	NfeTransporte.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idNfeCabecalho = jsonDados['idNfeCabecalho'];
		idTransportadora = jsonDados['idTransportadora'];
		modalidadeFrete = getModalidadeFrete(jsonDados['modalidadeFrete']);
		cnpj = jsonDados['cnpj'];
		cpf = jsonDados['cpf'];
		nome = jsonDados['nome'];
		inscricaoEstadual = jsonDados['inscricaoEstadual'];
		endereco = jsonDados['endereco'];
		nomeMunicipio = jsonDados['nomeMunicipio'];
		uf = jsonDados['uf'] == '' ? null : jsonDados['uf'];
		valorServico = jsonDados['valorServico']?.toDouble();
		valorBcRetencaoIcms = jsonDados['valorBcRetencaoIcms']?.toDouble();
		aliquotaRetencaoIcms = jsonDados['aliquotaRetencaoIcms']?.toDouble();
		valorIcmsRetido = jsonDados['valorIcmsRetido']?.toDouble();
		cfop = jsonDados['cfop'];
		municipio = jsonDados['municipio'];
		placaVeiculo = jsonDados['placaVeiculo'];
		ufVeiculo = jsonDados['ufVeiculo'] == '' ? null : jsonDados['ufVeiculo'];
		rntcVeiculo = jsonDados['rntcVeiculo'];
		transportadora = jsonDados['transportadora'] == null ? null : Transportadora.fromJson(jsonDados['transportadora']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idNfeCabecalho'] = idNfeCabecalho ?? 0;
		jsonDados['idTransportadora'] = idTransportadora ?? 0;
		jsonDados['modalidadeFrete'] = setModalidadeFrete(modalidadeFrete);
		jsonDados['cnpj'] = Biblioteca.removerMascara(cnpj);
		jsonDados['cpf'] = Biblioteca.removerMascara(cpf);
		jsonDados['nome'] = nome;
		jsonDados['inscricaoEstadual'] = inscricaoEstadual;
		jsonDados['endereco'] = endereco;
		jsonDados['nomeMunicipio'] = nomeMunicipio;
		jsonDados['uf'] = uf;
		jsonDados['valorServico'] = valorServico;
		jsonDados['valorBcRetencaoIcms'] = valorBcRetencaoIcms;
		jsonDados['aliquotaRetencaoIcms'] = aliquotaRetencaoIcms;
		jsonDados['valorIcmsRetido'] = valorIcmsRetido;
		jsonDados['cfop'] = cfop ?? 0;
		jsonDados['municipio'] = municipio ?? 0;
		jsonDados['placaVeiculo'] = placaVeiculo;
		jsonDados['ufVeiculo'] = ufVeiculo;
		jsonDados['rntcVeiculo'] = rntcVeiculo;
		jsonDados['transportadora'] = transportadora == null ? null : transportadora!.toJson;
	
		return jsonDados;
	}
	
    getModalidadeFrete(String? modalidadeFrete) {
    	switch (modalidadeFrete) {
    		case '0':
    			return '0=Contratação do Frete por conta do Remetente (CIF)';
    		case '1':
    			return '1=Contratação do Frete por conta do Destinatário (FOB)';
    		case '2':
    			return '2=Contratação do Frete por conta de Terceiros';
    		case '3':
    			return '3=Transporte Próprio por conta do Remetente';
    		case '4':
    			return '4=Transporte Próprio por conta do Destinatário';
    		case '9':
    			return '9=Sem Ocorrência de Transporte';
    		default:
    			return null;
    		}
    	}

    setModalidadeFrete(String? modalidadeFrete) {
    	switch (modalidadeFrete) {
    		case '0=Contratação do Frete por conta do Remetente (CIF)':
    			return '0';
    		case '1=Contratação do Frete por conta do Destinatário (FOB)':
    			return '1';
    		case '2=Contratação do Frete por conta de Terceiros':
    			return '2';
    		case '3=Transporte Próprio por conta do Remetente':
    			return '3';
    		case '4=Transporte Próprio por conta do Destinatário':
    			return '4';
    		case '9=Sem Ocorrência de Transporte':
    			return '9';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(NfeTransporte objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}