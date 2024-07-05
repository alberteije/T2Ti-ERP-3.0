/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [VENDA_FRETE] 
                                                                                
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

class VendaFrete {
	int? id;
	int? idVendaCabecalho;
	int? idTransportadora;
	int? conhecimento;
	String? responsavel;
	String? placa;
	String? ufPlaca;
	int? seloFiscal;
	double? quantidadeVolume;
	String? marcaVolume;
	String? especieVolume;
	double? pesoBruto;
	double? pesoLiquido;
	VendaCabecalho? vendaCabecalho;
	Transportadora? transportadora;

	VendaFrete({
		id,
		idVendaCabecalho,
		idTransportadora,
		conhecimento,
		responsavel,
		placa,
		ufPlaca,
		seloFiscal,
		quantidadeVolume = 0.0,
		marcaVolume,
		especieVolume,
		pesoBruto = 0.0,
		pesoLiquido = 0.0,
		vendaCabecalho,
		transportadora,
	});

	static List<String> campos = <String>[
		'ID', 
		'CONHECIMENTO', 
		'RESPONSAVEL', 
		'PLACA', 
		'UF_PLACA', 
		'SELO_FISCAL', 
		'QUANTIDADE_VOLUME', 
		'MARCA_VOLUME', 
		'ESPECIE_VOLUME', 
		'PESO_BRUTO', 
		'PESO_LIQUIDO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Conhecimento', 
		'Responsável', 
		'Placa', 
		'UF', 
		'Selo Fiscal', 
		'Quantidade de Volumes', 
		'Marca Volume', 
		'Espécie do Volume', 
		'Peso Bruto', 
		'Peso Líquido', 
	];

	VendaFrete.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idVendaCabecalho = jsonDados['idVendaCabecalho'];
		idTransportadora = jsonDados['idTransportadora'];
		conhecimento = jsonDados['conhecimento'];
		responsavel = getResponsavel(jsonDados['responsavel']);
		placa = jsonDados['placa'];
		ufPlaca = jsonDados['ufPlaca'] == '' ? null : jsonDados['ufPlaca'];
		seloFiscal = jsonDados['seloFiscal'];
		quantidadeVolume = jsonDados['quantidadeVolume']?.toDouble();
		marcaVolume = jsonDados['marcaVolume'];
		especieVolume = jsonDados['especieVolume'];
		pesoBruto = jsonDados['pesoBruto']?.toDouble();
		pesoLiquido = jsonDados['pesoLiquido']?.toDouble();
		vendaCabecalho = jsonDados['vendaCabecalho'] == null ? null : VendaCabecalho.fromJson(jsonDados['vendaCabecalho']);
		transportadora = jsonDados['transportadora'] == null ? null : Transportadora.fromJson(jsonDados['transportadora']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idVendaCabecalho'] = idVendaCabecalho ?? 0;
		jsonDados['idTransportadora'] = idTransportadora ?? 0;
		jsonDados['conhecimento'] = conhecimento ?? 0;
		jsonDados['responsavel'] = setResponsavel(responsavel);
		jsonDados['placa'] = placa;
		jsonDados['ufPlaca'] = ufPlaca;
		jsonDados['seloFiscal'] = seloFiscal ?? 0;
		jsonDados['quantidadeVolume'] = quantidadeVolume;
		jsonDados['marcaVolume'] = marcaVolume;
		jsonDados['especieVolume'] = especieVolume;
		jsonDados['pesoBruto'] = pesoBruto;
		jsonDados['pesoLiquido'] = pesoLiquido;
		jsonDados['vendaCabecalho'] = vendaCabecalho == null ? null : vendaCabecalho!.toJson;
		jsonDados['transportadora'] = transportadora == null ? null : transportadora!.toJson;
	
		return jsonDados;
	}
	
    getResponsavel(String? responsavel) {
    	switch (responsavel) {
    		case '1':
    			return '1-Emitente';
    		case '2':
    			return '2-Destinatário';
    		default:
    			return null;
    		}
    	}

    setResponsavel(String? responsavel) {
    	switch (responsavel) {
    		case '1-Emitente':
    			return '1';
    		case '2-Destinatário':
    			return '2';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(VendaFrete objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}