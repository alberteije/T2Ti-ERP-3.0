/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [TRIBUT_OPERACAO_FISCAL] 
                                                                                
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

part 'tribut_operacao_fiscal_dao.g.dart';

@DriftAccessor(tables: [
  TributOperacaoFiscals,
])
class TributOperacaoFiscalDao extends DatabaseAccessor<AppDatabase>
    with _$TributOperacaoFiscalDaoMixin {
  final AppDatabase db;

  List<TributOperacaoFiscal>?
      listaTributOperacaoFiscal; // será usada para popular a grid na janela da operação fiscal

  TributOperacaoFiscalDao(this.db) : super(db);

  Future<List<TributOperacaoFiscal>?> consultarLista() async {
    listaTributOperacaoFiscal = await select(tributOperacaoFiscals).get();
    return listaTributOperacaoFiscal;
  }

  Future<List<TributOperacaoFiscal>?> consultarListaFiltro(
      String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);

    listaTributOperacaoFiscal =
        await (select(tributOperacaoFiscals)..where((t) => expression)).get();

    return listaTributOperacaoFiscal;
  }

  Stream<List<TributOperacaoFiscal>> observarLista() =>
      select(tributOperacaoFiscals).watch();

  Future<TributOperacaoFiscal?> consultarObjeto(int pId) {
    return (select(tributOperacaoFiscals)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

  Future<int> ultimoId() async {
    final resultado = await customSelect(
            "select MAX(ID) as ULTIMO from TRIBUT_OPERACAO_FISCAL")
        .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(TributOperacaoFiscal pObjeto) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(tributOperacaoFiscals).insert(pObjeto);
      return idInserido;
    });
  }

  Future<bool> alterar(TributOperacaoFiscal pObjeto) {
    return transaction(() async {
      return update(tributOperacaoFiscals).replace(pObjeto);
    });
  }

  Future<int> excluir(TributOperacaoFiscal pObjeto) {
    return transaction(() async {
      return delete(tributOperacaoFiscals).delete(pObjeto);
    });
  }

  Future<void> sincronizar(ObjetoSincroniza objetoSincroniza) async {
    (delete(tributOperacaoFiscals)..where((t) => t.id.isNotNull())).go();
    var parsed = json.decode(objetoSincroniza.registros!) as List<dynamic>;
    for (var objetoJson in parsed) {
      final objetoDart = TributOperacaoFiscal.fromJson(objetoJson);
      into(tributOperacaoFiscals).insertOnConflictUpdate(objetoDart);
    }
  }

  static List<String> campos = <String>[
    'ID',
    'DESCRICAO',
    'OBSERVACAO',
  ];

  static List<String> colunas = <String>[
    'Id',
    'Descrição',
    'Observação',
  ];
}
