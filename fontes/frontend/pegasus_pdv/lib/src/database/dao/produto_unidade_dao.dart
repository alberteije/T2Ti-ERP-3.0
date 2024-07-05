/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [PRODUTO_UNIDADE] 
                                                                                
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

part 'produto_unidade_dao.g.dart';

@DriftAccessor(tables: [
  ProdutoUnidades,
])
class ProdutoUnidadeDao extends DatabaseAccessor<AppDatabase>
    with _$ProdutoUnidadeDaoMixin {
  final AppDatabase db;

  ProdutoUnidadeDao(this.db) : super(db);

  List<ProdutoUnidade>? listaProdutoUnidade;

  Future<List<ProdutoUnidade>?> consultarLista() async {
    listaProdutoUnidade = await select(produtoUnidades).get();
    return listaProdutoUnidade;
  }

  Future<List<ProdutoUnidade>?> consultarListaFiltro(
      String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    listaProdutoUnidade =
        await (select(produtoUnidades)..where((t) => expression)).get();

    return listaProdutoUnidade;
  }

  Future<ProdutoUnidade?> consultarObjetoFiltro(
      String campo, String valor) async {
    final query = " $campo = '$valor'";
    final expression = CustomExpression<bool>(query);
    return await (select(produtoUnidades)..where((t) => expression))
        .getSingleOrNull();
  }

  Stream<List<ProdutoUnidade>> observarLista() =>
      select(produtoUnidades).watch();

  Future<ProdutoUnidade?> consultarObjeto(int pId) {
    return (select(produtoUnidades)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

  Future<int> ultimoId() async {
    final resultado =
        await customSelect("select MAX(ID) as ULTIMO from PRODUTO_UNIDADE")
            .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(ProdutoUnidade pObjeto) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(produtoUnidades).insert(pObjeto);
      return idInserido;
    });
  }

  Future<bool> alterar(ProdutoUnidade pObjeto) {
    return transaction(() async {
      return update(produtoUnidades).replace(pObjeto);
    });
  }

  Future<int> excluir(ProdutoUnidade pObjeto) {
    return transaction(() async {
      return delete(produtoUnidades).delete(pObjeto);
    });
  }

  Future<void> sincronizar(ObjetoSincroniza objetoSincroniza) async {
    (delete(produtoUnidades)..where((t) => t.id.isNotNull())).go();
    var parsed = json.decode(objetoSincroniza.registros!) as List<dynamic>;
    for (var objetoJson in parsed) {
      final objetoDart = ProdutoUnidade.fromJson(objetoJson);
      into(produtoUnidades).insertOnConflictUpdate(objetoDart);
    }
  }

  static List<String> campos = <String>[
    'ID',
    'SIGLA',
    'DESCRICAO',
    'PODE_FRACIONAR',
  ];

  static List<String> colunas = <String>[
    'Id',
    'Sigla',
    'Descricao',
    'Pode Fracionar',
  ];
}
