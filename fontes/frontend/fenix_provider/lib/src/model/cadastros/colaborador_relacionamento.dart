/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [COLABORADOR_RELACIONAMENTO] 
                                                                                
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

class ColaboradorRelacionamento {
	int? id;
	int? idTipoRelacionamento;
	int? idColaborador;
	String? nome;
	DateTime? dataNascimento;
	String? cpf;
	String? registroMatricula;
	String? registroCartorio;
	String? registroCartorioNumero;
	String? registroNumeroLivro;
	String? registroNumeroFolha;
	DateTime? dataEntregaDocumento;
	String? salarioFamilia;
	int? salarioFamiliaIdadeLimite;
	DateTime? salarioFamiliaDataFim;
	int? impostoRendaIdadeLimite;
	int? impostoRendaDataFim;

	ColaboradorRelacionamento({
		id,
		idTipoRelacionamento,
		idColaborador,
		nome,
		dataNascimento,
		cpf,
		registroMatricula,
		registroCartorio,
		registroCartorioNumero,
		registroNumeroLivro,
		registroNumeroFolha,
		dataEntregaDocumento,
		salarioFamilia,
		salarioFamiliaIdadeLimite,
		salarioFamiliaDataFim,
		impostoRendaIdadeLimite,
		impostoRendaDataFim,
	});

	static List<String> campos = <String>[
		'ID', 
		'NOME', 
		'DATA_NASCIMENTO', 
		'CPF', 
		'REGISTRO_MATRICULA', 
		'REGISTRO_CARTORIO', 
		'REGISTRO_CARTORIO_NUMERO', 
		'REGISTRO_NUMERO_LIVRO', 
		'REGISTRO_NUMERO_FOLHA', 
		'DATA_ENTREGA_DOCUMENTO', 
		'SALARIO_FAMILIA', 
		'SALARIO_FAMILIA_IDADE_LIMITE', 
		'SALARIO_FAMILIA_DATA_FIM', 
		'IMPOSTO_RENDA_IDADE_LIMITE', 
		'IMPOSTO_RENDA_DATA_FIM', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Nome', 
		'Data Nascimento', 
		'Cpf', 
		'Registro Matricula', 
		'Registro Cartorio', 
		'Registro Cartorio Numero', 
		'Registro Numero Livro', 
		'Registro Numero Folha', 
		'Data Entrega Documento', 
		'Salario Familia', 
		'Salario Familia Idade Limite', 
		'Salario Familia Data Fim', 
		'Imposto Renda Idade Limite', 
		'Imposto Renda Data Fim', 
	];

	ColaboradorRelacionamento.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idTipoRelacionamento = jsonDados['idTipoRelacionamento'];
		idColaborador = jsonDados['idColaborador'];
		nome = jsonDados['nome'];
		dataNascimento = jsonDados['dataNascimento'] != null ? DateTime.tryParse(jsonDados['dataNascimento']) : null;
		cpf = jsonDados['cpf'];
		registroMatricula = jsonDados['registroMatricula'];
		registroCartorio = jsonDados['registroCartorio'];
		registroCartorioNumero = jsonDados['registroCartorioNumero'];
		registroNumeroLivro = jsonDados['registroNumeroLivro'];
		registroNumeroFolha = jsonDados['registroNumeroFolha'];
		dataEntregaDocumento = jsonDados['dataEntregaDocumento'] != null ? DateTime.tryParse(jsonDados['dataEntregaDocumento']) : null;
		salarioFamilia = jsonDados['salarioFamilia'];
		salarioFamiliaIdadeLimite = jsonDados['salarioFamiliaIdadeLimite'];
		salarioFamiliaDataFim = jsonDados['salarioFamiliaDataFim'] != null ? DateTime.tryParse(jsonDados['salarioFamiliaDataFim']) : null;
		impostoRendaIdadeLimite = jsonDados['impostoRendaIdadeLimite'];
		impostoRendaDataFim = jsonDados['impostoRendaDataFim'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idTipoRelacionamento'] = idTipoRelacionamento ?? 0;
		jsonDados['idColaborador'] = idColaborador ?? 0;
		jsonDados['nome'] = nome;
		jsonDados['dataNascimento'] = dataNascimento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataNascimento!) : null;
		jsonDados['cpf'] = cpf;
		jsonDados['registroMatricula'] = registroMatricula;
		jsonDados['registroCartorio'] = registroCartorio;
		jsonDados['registroCartorioNumero'] = registroCartorioNumero;
		jsonDados['registroNumeroLivro'] = registroNumeroLivro;
		jsonDados['registroNumeroFolha'] = registroNumeroFolha;
		jsonDados['dataEntregaDocumento'] = dataEntregaDocumento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEntregaDocumento!) : null;
		jsonDados['salarioFamilia'] = salarioFamilia;
		jsonDados['salarioFamiliaIdadeLimite'] = salarioFamiliaIdadeLimite ?? 0;
		jsonDados['salarioFamiliaDataFim'] = salarioFamiliaDataFim != null ? DateFormat('yyyy-MM-ddT00:00:00').format(salarioFamiliaDataFim!) : null;
		jsonDados['impostoRendaIdadeLimite'] = impostoRendaIdadeLimite ?? 0;
		jsonDados['impostoRendaDataFim'] = impostoRendaDataFim ?? 0;
	
		return jsonDados;
	}
	

	String objetoEncodeJson(ColaboradorRelacionamento objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}