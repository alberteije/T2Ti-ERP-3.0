/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [COMPRA_PEDIDO_DETALHE] 
                                                                                
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

part 'nfe_detalhe_dao.g.dart';

@DriftAccessor(tables: [
  NfeDetalhes,
  NfeDetalheImpostoIcmss,
  NfeDetalheImpostoPiss,
  NfeDetalheImpostoCofinss,
])
class NfeDetalheDao extends DatabaseAccessor<AppDatabase>
    with _$NfeDetalheDaoMixin {
  final AppDatabase db;

  NfeDetalheDao(this.db) : super(db);

  Future<List<NfeDetalhe>> consultarLista() => select(nfeDetalhes).get();

  Future<List<NfeDetalhe>> consultarListaFiltro(
      String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    return await (select(nfeDetalhes)..where((t) => expression)).get();
  }

  Future<List<NfeDetalheMontado>> consultarListaComImpostos(int pId) {
    final consulta = select(nfeDetalhes).join([
      leftOuterJoin(nfeDetalheImpostoIcmss,
          nfeDetalhes.id.equalsExp(nfeDetalheImpostoIcmss.idNfeDetalhe))
    ]).join([
      leftOuterJoin(nfeDetalheImpostoPiss,
          nfeDetalhes.id.equalsExp(nfeDetalheImpostoPiss.idNfeDetalhe))
    ]).join([
      leftOuterJoin(nfeDetalheImpostoCofinss,
          nfeDetalhes.id.equalsExp(nfeDetalheImpostoCofinss.idNfeDetalhe))
    ]);

    consulta.where(nfeDetalhes.idNfeCabecalho.equals(pId));

    return consulta.map((row) {
      final nfeDetalhe = row.readTableOrNull(nfeDetalhes);
      final nfeDetalheImpostoIcms = row.readTableOrNull(nfeDetalheImpostoIcmss);
      final nfeDetalheImpostoPis = row.readTableOrNull(nfeDetalheImpostoPiss);
      final nfeDetalheImpostoCofins =
          row.readTableOrNull(nfeDetalheImpostoCofinss);

      return NfeDetalheMontado(
          nfeDetalhe: nfeDetalhe,
          nfeDetalheImpostoIcms: nfeDetalheImpostoIcms,
          nfeDetalheImpostoPis: nfeDetalheImpostoPis,
          nfeDetalheImpostoCofins: nfeDetalheImpostoCofins);
    }).get();
  }

  Stream<List<NfeDetalhe>> observarLista() => select(nfeDetalhes).watch();

  Future<NfeDetalhe?> consultarObjeto(int pId) {
    return (select(nfeDetalhes)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

  Future<int> ultimoId() async {
    final resultado =
        await customSelect("select MAX(ID) as ULTIMO from NFE_DETALHE")
            .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(NfeDetalhe pObjeto) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(nfeDetalhes).insert(pObjeto);
      return idInserido;
    });
  }

  Future<bool> alterar(NfeDetalhe pObjeto) {
    return transaction(() async {
      return update(nfeDetalhes).replace(pObjeto);
    });
  }

  Future<int> excluir(NfeDetalhe pObjeto) {
    return transaction(() async {
      return delete(nfeDetalhes).delete(pObjeto);
    });
  }
}
