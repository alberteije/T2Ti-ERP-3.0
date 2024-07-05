/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_AEREO] 
                                                                                
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

class CteAereo {
	int? id;
	int? idCteCabecalho;
	int? numeroMinuta;
	int? numeroConhecimento;
	DateTime? dataPrevistaEntrega;
	String? idEmissor;
	String? idInternaTomador;
	String? tarifaClasse;
	String? tarifaCodigo;
	double? tarifaValor;
	String? cargaDimensao;
	String? cargaInformacaoManuseio;
	String? cargaEspecial;

	CteAereo({
		id,
		idCteCabecalho,
		numeroMinuta,
		numeroConhecimento,
		dataPrevistaEntrega,
		idEmissor,
		idInternaTomador,
		tarifaClasse,
		tarifaCodigo,
		tarifaValor = 0.0,
		cargaDimensao,
		cargaInformacaoManuseio,
		cargaEspecial,
	});

	static List<String> campos = <String>[
		'ID', 
		'NUMERO_MINUTA', 
		'NUMERO_CONHECIMENTO', 
		'DATA_PREVISTA_ENTREGA', 
		'TARIFA_CLASSE', 
		'TARIFA_CODIGO', 
		'TARIFA_VALOR', 
		'CARGA_DIMENSAO', 
		'CARGA_INFORMACAO_MANUSEIO', 
		'CARGA_ESPECIAL', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Numero Minuta', 
		'Numero Conhecimento', 
		'Data Prevista Entrega', 
		'Tarifa Classe', 
		'Tarifa Codigo', 
		'Tarifa Valor', 
		'Carga Dimensao', 
		'Carga Informacao Manuseio', 
		'Carga Especial', 
	];

	CteAereo.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteCabecalho = jsonDados['idCteCabecalho'];
		numeroMinuta = jsonDados['numeroMinuta'];
		numeroConhecimento = jsonDados['numeroConhecimento'];
		dataPrevistaEntrega = jsonDados['dataPrevistaEntrega'] != null ? DateTime.tryParse(jsonDados['dataPrevistaEntrega']) : null;
		idEmissor = jsonDados['idEmissor'];
		idInternaTomador = jsonDados['idInternaTomador'];
		tarifaClasse = jsonDados['tarifaClasse'];
		tarifaCodigo = jsonDados['tarifaCodigo'];
		tarifaValor = jsonDados['tarifaValor']?.toDouble();
		cargaDimensao = jsonDados['cargaDimensao'];
		cargaInformacaoManuseio = jsonDados['cargaInformacaoManuseio'];
		cargaEspecial = jsonDados['cargaEspecial'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteCabecalho'] = idCteCabecalho ?? 0;
		jsonDados['numeroMinuta'] = numeroMinuta ?? 0;
		jsonDados['numeroConhecimento'] = numeroConhecimento ?? 0;
		jsonDados['dataPrevistaEntrega'] = dataPrevistaEntrega != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataPrevistaEntrega!) : null;
		jsonDados['idEmissor'] = idEmissor;
		jsonDados['idInternaTomador'] = idInternaTomador;
		jsonDados['tarifaClasse'] = tarifaClasse;
		jsonDados['tarifaCodigo'] = tarifaCodigo;
		jsonDados['tarifaValor'] = tarifaValor;
		jsonDados['cargaDimensao'] = cargaDimensao;
		jsonDados['cargaInformacaoManuseio'] = cargaInformacaoManuseio;
		jsonDados['cargaEspecial'] = cargaEspecial;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CteAereo objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}