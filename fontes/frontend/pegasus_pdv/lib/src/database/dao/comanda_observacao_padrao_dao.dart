/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [COMANDA_OBSERVACAO_PADRAO] 
                                                                                
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
import 'package:drift/drift.dart';

import 'package:pegasus_pdv/src/database/database.dart';
import 'package:pegasus_pdv/src/database/database_classes.dart';

part 'comanda_observacao_padrao_dao.g.dart';

@DriftAccessor(tables: [
  ComandaObservacaoPadraos,
])
class ComandaObservacaoPadraoDao extends DatabaseAccessor<AppDatabase> with _$ComandaObservacaoPadraoDaoMixin {
  final AppDatabase db;

  ComandaObservacaoPadraoDao(this.db) : super(db);

  List<ComandaObservacaoPadrao> listaComandaObservacaoPadrao = [];

  Future<List<ComandaObservacaoPadrao>?> consultarLista() async {
    listaComandaObservacaoPadrao = await select(comandaObservacaoPadraos).get();
    return listaComandaObservacaoPadrao;
  }

  Future<List<ComandaObservacaoPadrao>?> consultarListaFiltro(String campo, String valor) async {
    final query = " SELECT * FROM COMANDA_OBSERVACAO_PADRAO WHERE $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    final listaComandaObservacaoPadrao = await (select(comandaObservacaoPadraos)..where((t) => expression)).get();
    return listaComandaObservacaoPadrao;
  }

  Future<ComandaObservacaoPadrao?> consultarObjetoFiltro(String campo, String valor) async {
    final query = " $campo = '$valor'";
    final expression = CustomExpression<bool>(query);
    return await (select(comandaObservacaoPadraos)..where((t) => expression)).getSingleOrNull();
  }

  Stream<List<ComandaObservacaoPadrao>> observarLista() => select(comandaObservacaoPadraos).watch();

  Future<ComandaObservacaoPadrao?> consultarObjeto(int pId) {
    return (select(comandaObservacaoPadraos)..where((t) => t.id.equals(pId))).getSingleOrNull();
  }

  Future<int> ultimoId() async {
    final resultado = await customSelect("select MAX(ID) as ULTIMO from COMANDA_OBSERVACAO_PADRAO").getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(ComandaObservacaoPadrao pObjeto) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(comandaObservacaoPadraos).insert(pObjeto);
      return idInserido;
    });
  }

  Future<bool> alterar(ComandaObservacaoPadrao pObjeto) {
    return transaction(() async {
      return update(comandaObservacaoPadraos).replace(pObjeto);
    });
  }

  Future<int> excluir(ComandaObservacaoPadrao pObjeto) {
    return transaction(() async {
      return delete(comandaObservacaoPadraos).delete(pObjeto);
    });
  }

  static List<String> campos = <String>[
    'ID',
    'CODIGO',
    'DESCRICAO',
  ];

  static List<String> colunas = <String>[
    'Id',
    'Código',
    'Descrição',
  ];
}
