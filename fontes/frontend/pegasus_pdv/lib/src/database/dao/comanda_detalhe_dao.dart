/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [COMANDA_DETALHE] 
                                                                                
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

part 'comanda_detalhe_dao.g.dart';

@DriftAccessor(tables: [
  ComandaDetalhes,
  ComandaDetalheComplementos,
  Produtos,
])
class ComandaDetalheDao extends DatabaseAccessor<AppDatabase> with _$ComandaDetalheDaoMixin {
  final AppDatabase db;

  ComandaDetalheDao(this.db) : super(db);

  Future<List<ComandaDetalhe>?> consultarLista() => select(comandaDetalhes).get();

  Future<List<ComandaDetalhe>?> consultarListaFiltro(String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    final comandaList = await (select(comandaDetalhes)..where((t) => expression)).get();
    return comandaList;
  }

  Future<ComandaDetalhe?> consultarObjetoFiltro(String campo, String valor) async {
    final query = " $campo = '$valor'";
    final expression = CustomExpression<bool>(query);
    return await (select(comandaDetalhes)..where((t) => expression)).getSingleOrNull();
  }

  Future<List<ComandaDetalheMontado>?> consultarListaMontado(int idComanda) async {
    final List<ComandaDetalheMontado> listaComandaDetalheMontado = [];

    final query = " 'ID_COMANDA' = '%$idComanda%'";
    final expression = CustomExpression<bool>(query);

    final listaComandaDetalhe = await (select(comandaDetalhes)..where((t) => expression)).get();

    for (var comandaDetalhe in listaComandaDetalhe) {
      final query = " 'ID_COMANDA_DETALHE' = '${comandaDetalhe.id}'";
      final expression = CustomExpression<bool>(query);

      var listaComandaDetalheComplemento = await (select(comandaDetalheComplementos)..where((t) => expression)).get();

      ComandaDetalheMontado comandaDetalheMontado = ComandaDetalheMontado(
        comandaDetalhe: comandaDetalhe,
        produtoMontado: await db.produtoDao.consultarObjetoMontado(pId: comandaDetalhe.idProduto!),
        listaComandaDetalheComplemento: listaComandaDetalheComplemento,
      );
      listaComandaDetalheMontado.add(comandaDetalheMontado);
    }

    return listaComandaDetalheMontado;
  }

  Stream<List<ComandaDetalhe>> observarLista() => select(comandaDetalhes).watch();

  Future<ComandaDetalhe?> consultarObjeto(int pId) {
    return (select(comandaDetalhes)..where((t) => t.id.equals(pId))).getSingleOrNull();
  }

  Future<int> ultimoId() async {
    final resultado = await customSelect("select MAX(ID) as ULTIMO from COMANDA_DETALHE").getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(
    ComandaDetalhe pObjeto,
    List<ComandaDetalheComplemento> listaComandaDetalheComplemento,
  ) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(comandaDetalhes).insert(pObjeto);

      for (var complemento in listaComandaDetalheComplemento) {
        complemento = complemento.copyWith(idComandaDetalhe: Value(idInserido));
        await db.comandaDetalheComplementoDao.inserir(complemento);
      }

      return idInserido;
    });
  }

  Future<bool> alterar(ComandaDetalhe pObjeto) {
    return transaction(() async {
      return update(comandaDetalhes).replace(pObjeto);
    });
  }

  Future<int> excluir(ComandaDetalhe pObjeto) {
    return transaction(() async {
      return delete(comandaDetalhes).delete(pObjeto);
    });
  }
}
