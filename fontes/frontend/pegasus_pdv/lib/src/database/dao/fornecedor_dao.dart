/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [FORNECEDOR] 
                                                                                
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

import 'package:drift/drift.dart';

import 'package:pegasus_pdv/src/database/database.dart';
import 'package:pegasus_pdv/src/database/database_classes.dart';
import 'package:pegasus_pdv/src/model/model.dart';

part 'fornecedor_dao.g.dart';

@DriftAccessor(tables: [
  Fornecedors,
])
class FornecedorDao extends DatabaseAccessor<AppDatabase>
    with _$FornecedorDaoMixin {
  final AppDatabase db;

  List<Fornecedor>?
      listaFornecedor; // será usada para popular a grid na janela do fornecedor

  FornecedorDao(this.db) : super(db);

  Future<List<Fornecedor>?> consultarLista() async {
    listaFornecedor = await select(fornecedors).get();
    aplicarDomainsTipoPessoa();
    return listaFornecedor;
  }

  Future<List<Fornecedor>?> consultarListaFiltro(String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    listaFornecedor = await (select(fornecedors)..where((t) => expression)).get();
    aplicarDomainsTipoPessoa();
    return listaFornecedor;
  }

  Stream<List<Fornecedor>> observarLista() => select(fornecedors).watch();

  Future<Fornecedor?> consultarObjeto(int pId) {
    return (select(fornecedors)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

  Future<int> ultimoId() async {
    final resultado =
        await customSelect("select MAX(ID) as ULTIMO from FORNECEDOR")
            .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(Fornecedor pObjeto) {
    return transaction(() async {
      final fornecedor = removerDomains(pObjeto);
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(fornecedors).insert(fornecedor);
      return idInserido;
    });
  }

  Future<bool> alterar(Fornecedor pObjeto) {
    return transaction(() async {
      final fornecedor = removerDomains(pObjeto);
      return update(fornecedors).replace(fornecedor);
    });
  }

  Future<int> excluir(Fornecedor pObjeto) {
    return transaction(() async {
      return delete(fornecedors).delete(pObjeto);
    });
  }

  Future<void> sincronizar(ObjetoSincroniza objetoSincroniza) async {
    (delete(fornecedors)..where((t) => t.id.isNotNull())).go();
    var parsed = json.decode(objetoSincroniza.registros!) as List<dynamic>;
    for (var objetoJson in parsed) {
      final objetoDart = Fornecedor.fromJson(objetoJson);
      into(fornecedors).insertOnConflictUpdate(objetoDart);
    }
  }

  Fornecedor removerDomains(Fornecedor fornecedor) {
    fornecedor = fornecedor.copyWith(
        tipoPessoa: Value(fornecedor.tipoPessoa!.substring(0, 1)));
    return fornecedor;
  }

  void aplicarDomainsTipoPessoa() {
    for (var i = 0; i < listaFornecedor!.length; i++) {
      switch (listaFornecedor![i].tipoPessoa) {
        case 'F':
          listaFornecedor![i] = listaFornecedor![i].copyWith(
            tipoPessoa: const Value('Física'),
          );
          break;
        case 'J':
          listaFornecedor![i] = listaFornecedor![i].copyWith(
            tipoPessoa: const Value('Jurídica'),
          );
          break;
        default:
      }
    }
  }

  static List<String> campos = <String>[
    'ID',
    'NOME',
    'FANTASIA',
    'EMAIL',
    'URL',
    'CPF_CNPJ',
    'RG',
    'ORGAO_RG',
    'DATA_EMISSAO_RG',
    'SEXO',
    'INSCRICAO_ESTADUAL',
    'INSCRICAO_MUNICIPAL',
    'TIPO_PESSOA',
    'DATA_CADASTRO',
    'LOGRADOURO',
    'NUMERO',
    'COMPLEMENTO',
    'CEP',
    'BAIRRO',
    'CIDADE',
    'UF',
    'TELEFONE',
    'CELULAR',
    'CONTATO',
  ];

  static List<String> colunas = <String>[
    'Id',
    'Nome',
    'Fantasia',
    'Email',
    'Url',
    'Cpf Cnpj',
    'Rg',
    'Orgao Rg',
    'Data Emissao Rg',
    'Sexo',
    'Inscricao Estadual',
    'Inscricao Municipal',
    'Tipo Pessoa',
    'Data Cadastro',
    'Logradouro',
    'Numero',
    'Complemento',
    'Cep',
    'Bairro',
    'Cidade',
    'Uf',
    'Telefone',
    'Celular',
    'Contato',
  ];
}
