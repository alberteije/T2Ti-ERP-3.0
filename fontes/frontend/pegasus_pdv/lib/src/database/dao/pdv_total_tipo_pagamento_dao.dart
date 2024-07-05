/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [PDV_TOTAL_TIPO_PAGAMENTO] 
                                                                                
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

part 'pdv_total_tipo_pagamento_dao.g.dart';

@DriftAccessor(tables: [
  PdvTotalTipoPagamentos,
])
class PdvTotalTipoPagamentoDao extends DatabaseAccessor<AppDatabase>
    with _$PdvTotalTipoPagamentoDaoMixin {
  final AppDatabase db;

  PdvTotalTipoPagamentoDao(this.db) : super(db);

  Future<List<PdvTotalTipoPagamento>> consultarLista() =>
      select(pdvTotalTipoPagamentos).get();

  Future<List<PdvTotalTipoPagamento>> consultarListaFiltro(
      String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    return await (select(pdvTotalTipoPagamentos)..where((t) => expression))
        .get();
  }

  Future<List<PdvTotalTipoPagamento>> consultarPagamentosDeUmaVenda(
      int idVenda) async {
    final query = " id_pdv_venda_cabecalho = '$idVenda'";
    final expression = CustomExpression<bool>(query);
    return await (select(pdvTotalTipoPagamentos)..where((t) => expression))
        .get();
  }

  Stream<List<PdvTotalTipoPagamento>> observarLista() =>
      select(pdvTotalTipoPagamentos).watch();

  Future<PdvTotalTipoPagamento?> consultarObjeto(int pId) {
    return (select(pdvTotalTipoPagamentos)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

// código anterior:
//  Future<List<PdvTotalTipoPagamento>> consultarListaTotaisAgrupado(
//       int idMovimento) async {
//     return customSelect(
//       "SELECT ID_PDV_TIPO_PAGAMENTO, sum(VALOR) as VALOR  FROM PDV_TOTAL_TIPO_PAGAMENTO  where ID_PDV_VENDA_CABECALHO in  (select ID from PDV_VENDA_CABECALHO where ID_PDV_MOVIMENTO= '$idMovimento') group by ID_PDV_TIPO_PAGAMENTO",
//     ).get() as Future<List<PdvTotalTipoPagamento>>;
//   }
  Future<List<PdvTotalTipoPagamento>> consultarListaTotaisAgrupado(
      int idMovimento) async {
    final query =
        " ID_PDV_VENDA_CABECALHO in  (select ID from PDV_VENDA_CABECALHO where ID_PDV_MOVIMENTO= '$idMovimento') group by ID_PDV_TIPO_PAGAMENTO";
    final expression = CustomExpression<bool>(query);
    return await (select(pdvTotalTipoPagamentos)..where((t) => expression))
        .get();
  }

  Future<int> ultimoId() async {
    final resultado = await customSelect(
            "select MAX(ID) as ULTIMO from PDV_TOTAL_TIPO_PAGAMENTO")
        .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(PdvTotalTipoPagamento pObjeto) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(pdvTotalTipoPagamentos).insert(pObjeto);
      return idInserido;
    });
  }

  Future<bool> alterar(PdvTotalTipoPagamento pObjeto) {
    return transaction(() async {
      return update(pdvTotalTipoPagamentos).replace(pObjeto);
    });
  }

  Future<int> excluir(PdvTotalTipoPagamento pObjeto) {
    return transaction(() async {
      return delete(pdvTotalTipoPagamentos).delete(pObjeto);
    });
  }
}
