/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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

part 'tribut_configura_of_gt_dao.g.dart';

@DriftAccessor(tables: [
  TributConfiguraOfGts,
  TributIcmsUfs,
  TributCofins,
  TributPis,
  TributIpi,
  TributGrupoTributario,
  TributOperacaoFiscal,
])
class TributConfiguraOfGtDao extends DatabaseAccessor<AppDatabase>
    with _$TributConfiguraOfGtDaoMixin {
  final AppDatabase db;

  TributConfiguraOfGtDao(this.db) : super(db);

  List<TributConfiguraOfGt>? listaTributConfiguraOfGt;
  List<TributConfiguraOfGtMontado>? listaTributConfiguraOfGtMontado;

  Future<List<TributConfiguraOfGt>?> consultarLista() async {
    listaTributConfiguraOfGt = await select(tributConfiguraOfGts).get();
    return listaTributConfiguraOfGt;
  }

  Future<List<TributCofins>> consultarListaCofins() =>
      select(tributCofinss).get();

  Future<List<TributIcmsUf>> consultarListaIcms() =>
      select(tributIcmsUfs).get();

  Future<List<TributIpi>> consultarListaIpi() => select(tributIpis).get();

  Future<List<TributPis>> consultarListaPis() => select(tributPiss).get();

  Future<List<TributConfiguraOfGt>?> consultarListaFiltro(
      String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);

    listaTributConfiguraOfGt =
        await (select(tributConfiguraOfGts)..where((t) => expression)).get();

    return listaTributConfiguraOfGt;
  }

  Future<List<TributConfiguraOfGtMontado>?> consultarListaMontado() async {
    final consulta = select(tributConfiguraOfGts).join([
      leftOuterJoin(
          tributGrupoTributarios,
          tributGrupoTributarios.id
              .equalsExp(tributConfiguraOfGts.idTributGrupoTributario)),
    ]).join([
      leftOuterJoin(
          tributOperacaoFiscals,
          tributOperacaoFiscals.id
              .equalsExp(tributConfiguraOfGts.idTributOperacaoFiscal)),
    ]).join([
      leftOuterJoin(
          tributIcmsUfs,
          tributIcmsUfs.idTributConfiguraOfGt
              .equalsExp(tributConfiguraOfGts.id)),
    ]).join([
      leftOuterJoin(
          tributCofinss,
          tributCofinss.idTributConfiguraOfGt
              .equalsExp(tributConfiguraOfGts.id)),
    ]).join([
      leftOuterJoin(tributPiss,
          tributPiss.idTributConfiguraOfGt.equalsExp(tributConfiguraOfGts.id)),
    ]);

    listaTributConfiguraOfGtMontado = await consulta.map((row) {
      final tributConfiguraOfGt = row.readTableOrNull(tributConfiguraOfGts);
      final tributIcmsUf = row.readTableOrNull(tributIcmsUfs);
      final tributCofins = row.readTableOrNull(tributCofinss);
      final tributPis = row.readTableOrNull(tributPiss);
      final tributGrupoTributario = row.readTableOrNull(tributGrupoTributarios);
      final tributOperacaoFiscal = row.readTableOrNull(tributOperacaoFiscals);

      return TributConfiguraOfGtMontado(
        tributConfiguraOfGt: tributConfiguraOfGt,
        tributIcmsUf: tributIcmsUf,
        tributCofins: tributCofins,
        tributPis: tributPis,
        tributGrupoTributario: tributGrupoTributario,
        tributOperacaoFiscal: tributOperacaoFiscal,
      );
    }).get();
    aplicarDomains();
    return listaTributConfiguraOfGtMontado;
  }

  Stream<List<TributConfiguraOfGt>> observarLista() =>
      select(tributConfiguraOfGts).watch();

  Future<TributConfiguraOfGt?> consultarObjeto(int pId) {
    return (select(tributConfiguraOfGts)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

  Future<TributConfiguraOfGtMontado?> consultarObjetoMontado(
      int pIdOperacaoFiscal, int pIdGrupoTributario) async {
    final consulta = select(tributConfiguraOfGts).join([
      leftOuterJoin(
          tributGrupoTributarios,
          tributGrupoTributarios.id
              .equalsExp(tributConfiguraOfGts.idTributGrupoTributario)),
    ]).join([
      leftOuterJoin(
          tributOperacaoFiscals,
          tributOperacaoFiscals.id
              .equalsExp(tributConfiguraOfGts.idTributOperacaoFiscal)),
    ]).join([
      leftOuterJoin(
          tributIcmsUfs,
          tributIcmsUfs.idTributConfiguraOfGt
              .equalsExp(tributConfiguraOfGts.id)),
    ]).join([
      leftOuterJoin(
          tributCofinss,
          tributCofinss.idTributConfiguraOfGt
              .equalsExp(tributConfiguraOfGts.id)),
    ]).join([
      leftOuterJoin(tributPiss,
          tributPiss.idTributConfiguraOfGt.equalsExp(tributConfiguraOfGts.id)),
    ]);

    consulta.where(tributConfiguraOfGts.idTributGrupoTributario
        .equals(pIdGrupoTributario));
    consulta.where(
        tributConfiguraOfGts.idTributOperacaoFiscal.equals(pIdOperacaoFiscal));

    final retorno = await consulta.map((row) {
      final tributConfiguraOfGt = row.readTableOrNull(tributConfiguraOfGts);
      final tributIcmsUf = row.readTableOrNull(tributIcmsUfs);
      final tributCofins = row.readTableOrNull(tributCofinss);
      final tributPis = row.readTableOrNull(tributPiss);
      final tributGrupoTributario = row.readTableOrNull(tributGrupoTributarios);
      final tributOperacaoFiscal = row.readTableOrNull(tributOperacaoFiscals);

      return TributConfiguraOfGtMontado(
        tributConfiguraOfGt: tributConfiguraOfGt,
        tributIcmsUf: tributIcmsUf,
        tributCofins: tributCofins,
        tributPis: tributPis,
        tributGrupoTributario: tributGrupoTributario,
        tributOperacaoFiscal: tributOperacaoFiscal,
      );
    }).getSingleOrNull();
    return retorno;
  }

  Future<int> ultimoId() async {
    final resultado = await customSelect(
            "select MAX(ID) as ULTIMO from TRIBUT_CONFIGURA_OF_GT")
        .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(TributConfiguraOfGtMontado? pObjeto) {
    return transaction(() async {
      final tributacao = removerDomains(pObjeto!);
      final maxId = await ultimoId();
      tributacao.tributConfiguraOfGt =
          tributacao.tributConfiguraOfGt!.copyWith(id: Value(maxId + 1));
      final idInserido = await into(tributConfiguraOfGts)
          .insert(tributacao.tributConfiguraOfGt!);
      tributacao.tributConfiguraOfGt =
          tributacao.tributConfiguraOfGt!.copyWith(id: Value(idInserido));
      await inserirFilhos(tributacao);
      return idInserido;
    });
  }

  Future<bool> alterar(TributConfiguraOfGtMontado? pObjeto) {
    return transaction(() async {
      final tributacao = removerDomains(pObjeto!);
      await excluirFilhos(tributacao);
      await inserirFilhos(tributacao);
      return update(tributConfiguraOfGts)
          .replace(tributacao.tributConfiguraOfGt!);
    });
  }

  Future<int> excluir(TributConfiguraOfGtMontado pObjeto) {
    return transaction(() async {
      await excluirFilhos(pObjeto);
      return delete(tributConfiguraOfGts).delete(pObjeto.tributConfiguraOfGt!);
    });
  }

  Future<void> inserirFilhos(TributConfiguraOfGtMontado pObjeto) async {
    var maxId = await db.tributIcmsUfDao.ultimoId();
    pObjeto.tributIcmsUf = pObjeto.tributIcmsUf!.copyWith(
        id: Value(maxId + 1),
        idTributConfiguraOfGt: Value(pObjeto.tributConfiguraOfGt!.id!));
    await into(tributIcmsUfs).insert(pObjeto.tributIcmsUf!);

    maxId = await db.tributPisDao.ultimoId();
    pObjeto.tributPis = pObjeto.tributPis!.copyWith(
        id: Value(maxId + 1),
        idTributConfiguraOfGt: Value(pObjeto.tributConfiguraOfGt!.id!));
    await into(tributPiss).insert(pObjeto.tributPis!);

    maxId = await db.tributCofinsDao.ultimoId();
    pObjeto.tributCofins = pObjeto.tributCofins!.copyWith(
        id: Value(maxId + 1),
        idTributConfiguraOfGt: Value(pObjeto.tributConfiguraOfGt!.id!));
    await into(tributCofinss).insert(pObjeto.tributCofins!);
  }

  Future<void> excluirFilhos(TributConfiguraOfGtMontado pObjeto) async {
    await (delete(tributIcmsUfs)
          ..where((t) =>
              t.idTributConfiguraOfGt.equals(pObjeto.tributConfiguraOfGt!.id!)))
        .go();
    await (delete(tributPiss)
          ..where((t) =>
              t.idTributConfiguraOfGt.equals(pObjeto.tributConfiguraOfGt!.id!)))
        .go();
    await (delete(tributCofinss)
          ..where((t) =>
              t.idTributConfiguraOfGt.equals(pObjeto.tributConfiguraOfGt!.id!)))
        .go();
  }

  Future<void> sincronizar(ObjetoSincroniza objetoSincroniza) async {
    (delete(tributConfiguraOfGts)..where((t) => t.id.isNotNull())).go();
    var parsed = json.decode(objetoSincroniza.registros!) as List<dynamic>;
    for (var objetoJson in parsed) {
      final objetoDart = TributConfiguraOfGt.fromJson(objetoJson);
      into(tributConfiguraOfGts).insertOnConflictUpdate(objetoDart);
    }
  }

  Future<void> sincronizarCofins(ObjetoSincroniza objetoSincroniza) async {
    (delete(tributCofinss)..where((t) => t.id.isNotNull())).go();
    var parsed = json.decode(objetoSincroniza.registros!) as List<dynamic>;
    for (var objetoJson in parsed) {
      final objetoDart = TributCofins.fromJson(objetoJson);
      into(tributCofinss).insertOnConflictUpdate(objetoDart);
    }
  }

  Future<void> sincronizarIcms(ObjetoSincroniza objetoSincroniza) async {
    (delete(tributIcmsUfs)..where((t) => t.id.isNotNull())).go();
    var parsed = json.decode(objetoSincroniza.registros!) as List<dynamic>;
    for (var objetoJson in parsed) {
      final objetoDart = TributIcmsUf.fromJson(objetoJson);
      into(tributIcmsUfs).insertOnConflictUpdate(objetoDart);
    }
  }

  Future<void> sincronizarIpi(ObjetoSincroniza objetoSincroniza) async {
    (delete(tributIpis)..where((t) => t.id.isNotNull())).go();
    var parsed = json.decode(objetoSincroniza.registros!) as List<dynamic>;
    for (var objetoJson in parsed) {
      final objetoDart = TributIpi.fromJson(objetoJson);
      into(tributIpis).insertOnConflictUpdate(objetoDart);
    }
  }

  Future<void> sincronizarPis(ObjetoSincroniza objetoSincroniza) async {
    (delete(tributPiss)..where((t) => t.id.isNotNull())).go();
    var parsed = json.decode(objetoSincroniza.registros!) as List<dynamic>;
    for (var objetoJson in parsed) {
      final objetoDart = TributPis.fromJson(objetoJson);
      into(tributPiss).insertOnConflictUpdate(objetoDart);
    }
  }

  TributConfiguraOfGtMontado removerDomains(
      TributConfiguraOfGtMontado tributacao) {
    if (tributacao.tributIcmsUf!.modalidadeBc != null) {
      tributacao.tributIcmsUf = tributacao.tributIcmsUf!.copyWith(
          modalidadeBc:
              Value(tributacao.tributIcmsUf!.modalidadeBc!.substring(0, 1)));
    }
    if (tributacao.tributCofins!.modalidadeBaseCalculo != null) {
      tributacao.tributCofins = tributacao.tributCofins!.copyWith(
          modalidadeBaseCalculo: Value(
              tributacao.tributCofins!.modalidadeBaseCalculo!.substring(0, 1)));
    }
    if (tributacao.tributPis!.modalidadeBaseCalculo != null) {
      tributacao.tributPis = tributacao.tributPis!.copyWith(
          modalidadeBaseCalculo: Value(
              tributacao.tributPis!.modalidadeBaseCalculo!.substring(0, 1)));
    }
    return tributacao;
  }

  void aplicarDomains() {
    for (var i = 0; i < listaTributConfiguraOfGtMontado!.length; i++) {
      // modalidade base calculo ICMS
      switch (listaTributConfiguraOfGtMontado![i].tributIcmsUf!.modalidadeBc) {
        case '0':
          listaTributConfiguraOfGtMontado![i].tributIcmsUf =
              listaTributConfiguraOfGtMontado![i].tributIcmsUf!.copyWith(
                    modalidadeBc: const Value('0-Margem Valor Agregado (%)'),
                  );
          break;
        case '1':
          listaTributConfiguraOfGtMontado![i].tributIcmsUf =
              listaTributConfiguraOfGtMontado![i].tributIcmsUf!.copyWith(
                    modalidadeBc: const Value('1-Pauta (Valor)'),
                  );
          break;
        case '2':
          listaTributConfiguraOfGtMontado![i].tributIcmsUf =
              listaTributConfiguraOfGtMontado![i].tributIcmsUf!.copyWith(
                    modalidadeBc: const Value('2-Preço Tabelado Máx. (valor)'),
                  );
          break;
        case '3':
          listaTributConfiguraOfGtMontado![i].tributIcmsUf =
              listaTributConfiguraOfGtMontado![i].tributIcmsUf!.copyWith(
                    modalidadeBc: const Value('3-Valor da Operação'),
                  );
          break;
        default:
      }
      // modalidade base calculo PIS
      switch (listaTributConfiguraOfGtMontado![i]
          .tributPis!
          .modalidadeBaseCalculo) {
        case '0':
          listaTributConfiguraOfGtMontado![i].tributPis =
              listaTributConfiguraOfGtMontado![i].tributPis!.copyWith(
                    modalidadeBaseCalculo: const Value('0-Percentual'),
                  );
          break;
        case '1':
          listaTributConfiguraOfGtMontado![i].tributPis =
              listaTributConfiguraOfGtMontado![i].tributPis!.copyWith(
                    modalidadeBaseCalculo: const Value('1-Unidade'),
                  );
          break;
        default:
      }
      // modalidade base calculo PIS
      switch (listaTributConfiguraOfGtMontado![i]
          .tributCofins!
          .modalidadeBaseCalculo) {
        case '0':
          listaTributConfiguraOfGtMontado![i].tributCofins =
              listaTributConfiguraOfGtMontado![i].tributCofins!.copyWith(
                    modalidadeBaseCalculo: const Value('0-Percentual'),
                  );
          break;
        case '1':
          listaTributConfiguraOfGtMontado![i].tributCofins =
              listaTributConfiguraOfGtMontado![i].tributCofins!.copyWith(
                    modalidadeBaseCalculo: const Value('1-Unidade'),
                  );
          break;
        default:
      }
    }
  }
}
