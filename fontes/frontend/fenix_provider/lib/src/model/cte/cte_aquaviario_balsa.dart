/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_AQUAVIARIO_BALSA] 
                                                                                
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


class CteAquaviarioBalsa {
	int? id;
	int? idCteAquaviario;
	String? idBalsa;
	int? numeroViagem;
	String? direcao;
	String? portoEmbarque;
	String? portoTransbordo;
	String? portoDestino;
	String? tipoNavegacao;
	String? irin;

	CteAquaviarioBalsa({
		id,
		idCteAquaviario,
		idBalsa,
		numeroViagem,
		direcao,
		portoEmbarque,
		portoTransbordo,
		portoDestino,
		tipoNavegacao,
		irin,
	});

	static List<String> campos = <String>[
		'ID', 
		'NUMERO_VIAGEM', 
		'DIRECAO', 
		'PORTO_EMBARQUE', 
		'PORTO_TRANSBORDO', 
		'PORTO_DESTINO', 
		'TIPO_NAVEGACAO', 
		'IRIN', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Numero Viagem', 
		'Direcao', 
		'Porto Embarque', 
		'Porto Transbordo', 
		'Porto Destino', 
		'Tipo Navegacao', 
		'Irin', 
	];

	CteAquaviarioBalsa.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idCteAquaviario = jsonDados['idCteAquaviario'];
		idBalsa = jsonDados['idBalsa'];
		numeroViagem = jsonDados['numeroViagem'];
		direcao = jsonDados['direcao'];
		portoEmbarque = jsonDados['portoEmbarque'];
		portoTransbordo = jsonDados['portoTransbordo'];
		portoDestino = jsonDados['portoDestino'];
		tipoNavegacao = jsonDados['tipoNavegacao'];
		irin = jsonDados['irin'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idCteAquaviario'] = idCteAquaviario ?? 0;
		jsonDados['idBalsa'] = idBalsa;
		jsonDados['numeroViagem'] = numeroViagem ?? 0;
		jsonDados['direcao'] = direcao;
		jsonDados['portoEmbarque'] = portoEmbarque;
		jsonDados['portoTransbordo'] = portoTransbordo;
		jsonDados['portoDestino'] = portoDestino;
		jsonDados['tipoNavegacao'] = tipoNavegacao;
		jsonDados['irin'] = irin;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(CteAquaviarioBalsa objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}