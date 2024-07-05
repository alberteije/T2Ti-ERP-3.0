/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [PRODUTO_FICHA_TECNICA] 
                                                                                
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

part 'produto_ficha_tecnica_dao.g.dart';

@DriftAccessor(tables: [
  ProdutoFichaTecnicas,
])
class ProdutoFichaTecnicaDao extends DatabaseAccessor<AppDatabase>
    with _$ProdutoFichaTecnicaDaoMixin {
  final AppDatabase db;

  ProdutoFichaTecnicaDao(this.db) : super(db);

  List<ProdutoFichaTecnica> listaProdutoFichaTecnica = [];

  Future<List<ProdutoFichaTecnica>> consultarLista() async {
    listaProdutoFichaTecnica = await select(produtoFichaTecnicas).get();
    return listaProdutoFichaTecnica;
  }

  Future<List<ProdutoFichaTecnica>> consultarListaFiltro(
      String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    listaProdutoFichaTecnica =
        await (select(produtoFichaTecnicas)..where((t) => expression)).get();

    return listaProdutoFichaTecnica;
  }

  Future<ProdutoFichaTecnica?> consultarObjetoFiltro(
      String campo, String valor) async {
    final query = " $campo = '$valor'";
    final expression = CustomExpression<bool>(query);
    return await (select(produtoFichaTecnicas)..where((t) => expression))
        .getSingleOrNull();
  }

  Stream<List<ProdutoFichaTecnica>> observarLista() =>
      select(produtoFichaTecnicas).watch();

  Future<ProdutoFichaTecnica?> consultarObjeto(int pId) {
    return (select(produtoFichaTecnicas)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

  Future<int> ultimoId() async {
    final resultado = await customSelect(
            "select MAX(ID) as ULTIMO from PRODUTO_FICHA_TECNICA")
        .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(ProdutoFichaTecnica pObjeto) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(produtoFichaTecnicas).insert(pObjeto);
      return idInserido;
    });
  }

  Future<bool> alterar(ProdutoFichaTecnica pObjeto) {
    return transaction(() async {
      return update(produtoFichaTecnicas).replace(pObjeto);
    });
  }

  Future<int> excluir(ProdutoFichaTecnica pObjeto) {
    return transaction(() async {
      return delete(produtoFichaTecnicas).delete(pObjeto);
    });
  }

  Future<void> sincronizar(ObjetoSincroniza objetoSincroniza) async {
    (delete(produtoFichaTecnicas)..where((t) => t.id.isNotNull())).go();
    var parsed = json.decode(objetoSincroniza.registros!) as List<dynamic>;
    for (var objetoJson in parsed) {
      final objetoDart = ProdutoFichaTecnica.fromJson(objetoJson);
      into(produtoFichaTecnicas).insertOnConflictUpdate(objetoDart);
    }
  }

  static List<String> campos = <String>[
    'ID',
    'DESCRICAO',
    'QUANTIDADE',
    'VALOR_CUSTO',
    'PERCENTUAL_CUSTO',
  ];

  static List<String> colunas = <String>[
    'Id',
    'Descrição',
    'Quantidade',
    'Valor Custo',
    'Percentual Custo',
  ];
}
