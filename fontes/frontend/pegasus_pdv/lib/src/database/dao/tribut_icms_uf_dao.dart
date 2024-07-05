/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [TRIBUT_ICMS_UF] 
                                                                                
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

part 'tribut_icms_uf_dao.g.dart';

@DriftAccessor(tables: [
  TributIcmsUfs,
])
class TributIcmsUfDao extends DatabaseAccessor<AppDatabase>
    with _$TributIcmsUfDaoMixin {
  final AppDatabase db;

  TributIcmsUfDao(this.db) : super(db);

  Future<List<TributIcmsUf>> consultarLista() => select(tributIcmsUfs).get();

  Future<List<TributIcmsUf>> consultarListaFiltro(
      String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    return await (select(tributIcmsUfs)..where((t) => expression)).get();
  }

  Stream<List<TributIcmsUf>> observarLista() => select(tributIcmsUfs).watch();

  Future<TributIcmsUf?> consultarObjeto(int pId) {
    return (select(tributIcmsUfs)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

  Future<int> ultimoId() async {
    final resultado =
        await customSelect("select MAX(ID) as ULTIMO from TRIBUT_ICMS_UF")
            .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(TributIcmsUf pObjeto) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(tributIcmsUfs).insert(pObjeto);
      return idInserido;
    });
  }

  Future<bool> alterar(TributIcmsUf pObjeto) {
    return transaction(() async {
      return update(tributIcmsUfs).replace(pObjeto);
    });
  }

  Future<int> atualizarUf(String uf) {
    return customUpdate("update TRIBUT_ICMS_UF set UF_DESTINO = '$uf'");
  }

  Future<int> excluir(TributIcmsUf pObjeto) {
    return transaction(() async {
      return delete(tributIcmsUfs).delete(pObjeto);
    });
  }
}
