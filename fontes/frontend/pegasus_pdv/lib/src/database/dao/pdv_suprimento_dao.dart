/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [PDV_SUPRIMENTO] 
                                                                                
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

part 'pdv_suprimento_dao.g.dart';

@DriftAccessor(tables: [
  PdvSuprimentos,
])
class PdvSuprimentoDao extends DatabaseAccessor<AppDatabase>
    with _$PdvSuprimentoDaoMixin {
  final AppDatabase db;

  PdvSuprimentoDao(this.db) : super(db);

  Future<List<PdvSuprimento>> consultarLista() => select(pdvSuprimentos).get();

  Future<List<PdvSuprimento>> consultarListaFiltro(
      String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    return await (select(pdvSuprimentos)..where((t) => expression)).get();
  }

  // código anterior
  // Future<PdvSuprimento?> consultarTotaisDia(int? idMovimento) async {
  //   return (await customSelect(
  //           "SELECT  sum(VALOR) as VALOR  FROM PDV_SUPRIMENTO  WHERE ID_PDV_MOVIMENTO = '$idMovimento'")
  //       .getSingleOrNull()) as PdvSuprimento;
  // }

  Future<PdvSuprimento?> consultarTotaisDia(int idMovimento) async {
    double valor = 0;

    final sql =
        "SELECT  sum(VALOR) as VALOR  FROM PDV_SUPRIMENTO  WHERE ID_PDV_MOVIMENTO = '$idMovimento'";

    final resultado = await customSelect(sql).get();

    for (QueryRow registro in resultado) {
      valor = valor + (registro.data["VALOR"] ?? 0);
    }
    PdvSuprimento pdvVendaSuprimentoCalculado = PdvSuprimento(
      valor: valor,
    );

    return pdvVendaSuprimentoCalculado;
  }

//CÓDIGO ANTERIOR
  Future<PdvSuprimento?> consultarTotaisDiaOld(int? idMovimento) async {
    final query = " ID_PDV_MOVIMENTO = '$idMovimento'";
    final expression = CustomExpression<bool>(query);
    return await (select(pdvSuprimentos)..where((t) => expression))
        .getSingleOrNull();
  }

  Stream<List<PdvSuprimento>> observarLista() => select(pdvSuprimentos).watch();

  Future<PdvSuprimento?> consultarObjeto(int pId) {
    return (select(pdvSuprimentos)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

  Future<int> ultimoId() async {
    final resultado =
        await customSelect("select MAX(ID) as ULTIMO from PDV_SUPRIMENTO")
            .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(PdvSuprimento pObjeto) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(pdvSuprimentos).insert(pObjeto);
      return idInserido;
    });
  }

  Future<bool> alterar(PdvSuprimento pObjeto) {
    return transaction(() async {
      return update(pdvSuprimentos).replace(pObjeto);
    });
  }

  Future<int> excluir(PdvSuprimento pObjeto) {
    return transaction(() async {
      return delete(pdvSuprimentos).delete(pObjeto);
    });
  }
}
