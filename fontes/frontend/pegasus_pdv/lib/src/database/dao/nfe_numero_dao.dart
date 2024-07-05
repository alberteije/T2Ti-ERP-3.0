/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [NFE_NUMERO] 
                                                                                
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

part 'nfe_numero_dao.g.dart';

@DriftAccessor(tables: [
  NfeNumeros,
])
class NfeNumeroDao extends DatabaseAccessor<AppDatabase>
    with _$NfeNumeroDaoMixin {
  final AppDatabase db;

  NfeNumeroDao(this.db) : super(db);

  Future<List<NfeNumero>> consultarLista() => select(nfeNumeros).get();

  Future<List<NfeNumero>> consultarListaFiltro(
      String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    return await (select(nfeNumeros)..where((t) => expression)).get();
  }

  Stream<List<NfeNumero>> observarLista() => select(nfeNumeros).watch();

  Future<NfeNumero?> consultarObjeto(int pId) {
    return (select(nfeNumeros)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

  Future<int> ultimoId() async {
    final resultado =
        await customSelect("select MAX(ID) as ULTIMO from NFE_NUMERO")
            .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(NfeNumero pObjeto) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(nfeNumeros).insert(pObjeto);
      return idInserido;
    });
  }

  Future<bool> alterar(NfeNumero pObjeto) {
    return transaction(() async {
      return update(nfeNumeros).replace(pObjeto);
    });
  }

  Future<int> atualizarNumero() async {
    return customUpdate("update NFE_NUMERO set NUMERO = NUMERO + 1");
  }

  Future<int> excluir(NfeNumero pObjeto) {
    return transaction(() async {
      return delete(nfeNumeros).delete(pObjeto);
    });
  }
}
