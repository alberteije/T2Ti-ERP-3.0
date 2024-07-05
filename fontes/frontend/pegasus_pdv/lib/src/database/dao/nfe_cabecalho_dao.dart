/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [NFE_CABECALHO] 
                                                                                
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
import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart';
import 'package:pegasus_pdv/src/database/database.dart';
import 'package:pegasus_pdv/src/database/database_classes.dart';

part 'nfe_cabecalho_dao.g.dart';

@DriftAccessor(tables: [
  NfeCabecalhos,
  NfeDestinatarios,
  NfeDetalhes,
  NfeDetalheImpostoIcmss,
  NfeDetalheImpostoPiss,
  NfeDetalheImpostoCofinss,
  NfeInformacaoPagamentos,
])
class NfeCabecalhoDao extends DatabaseAccessor<AppDatabase>
    with _$NfeCabecalhoDaoMixin {
  final AppDatabase db;

  NfeCabecalhoDao(this.db) : super(db);

  List<NfeCabecalho>? listaNfeCabecalho;

  List<NfeCabecalhoMontado>? listaNfeCabecalhoMontado;

  Future<List<NfeCabecalho>?> consultarLista() async {
    listaNfeCabecalho = await select(nfeCabecalhos).get();
    aplicarDomainsTipoOperacao();
    aplicarDomainsFinalidadeEmissao();
    return listaNfeCabecalho;
  }

  Future<List<NfeCabecalho>?> consultarListaFiltro(
      String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    listaNfeCabecalho =
        await (select(nfeCabecalhos)..where((t) => expression)).get();

    aplicarDomainsTipoOperacao();
    aplicarDomainsFinalidadeEmissao();
    return listaNfeCabecalho;
  }

  Future<List<NfeCabecalhoMontado>?> consultarListaMontado(
      {int? mes, int? ano}) async {
    final consulta = select(nfeCabecalhos).join([
      leftOuterJoin(nfeDestinatarios,
          nfeDestinatarios.idNfeCabecalho.equalsExp(nfeCabecalhos.id)),
    ]);

    if (mes != null && ano != null) {
      consulta.where(nfeCabecalhos.dataHoraEmissao.month.equals(mes));
      consulta.where(nfeCabecalhos.dataHoraEmissao.year.equals(ano));
    }

    listaNfeCabecalhoMontado = await consulta.map((row) {
      final nfeCabecalho = row.readTableOrNull(nfeCabecalhos);
      final nfeDestinatario = row.readTableOrNull(nfeDestinatarios);

      return NfeCabecalhoMontado(
        nfeCabecalho: nfeCabecalho,
        nfeDestinatario: nfeDestinatario,
      );
    }).get();
    if (listaNfeCabecalhoMontado!.isNotEmpty) {
      List<NfeCabecalho> nfeCabecalhoLista = [];
      for (var element in listaNfeCabecalhoMontado!) {
        nfeCabecalhoLista.add(element.nfeCabecalho!);
        listaNfeCabecalho = nfeCabecalhoLista;
      }
    }

    aplicarDomainsTipoOperacao();
    aplicarDomainsFinalidadeEmissao();

    return listaNfeCabecalhoMontado;
  }

  Future<Stream<List<NfeCabecalho>?>>
      consultarNotasContingenciadasParaInutilizacao() async {
    // retorna a lista de notas que foram contingenciadas, já foram autorizadas, mas por algum erro de comunicação
    // a nota original não teve seu número inutilizado ou cancelado
//TODO:APLICAR O ALIAS AQUI
    return customSelect(
      "select *, ID_PDV_VENDA_CABECALHO as idvenda from NFE_CABECALHO where STATUS_NOTA='9' "
      " and idvenda in (select ID_PDV_VENDA_CABECALHO from NFE_CABECALHO where status_nota='4' and ID_PDV_VENDA_CABECALHO=idvenda)",
      readsFrom: {nfeCabecalhos},
    ).watch().map((rows) {
      return rows.map((row) => nfeCabecalhos.map(row.data)).toList();
    });
  }

  Future<NfeCabecalho?> consultarObjetoFiltro(String campo, String valor,
      {String? complemento}) async {
    var sql = " $campo = '$valor'";
    if (complemento != null && complemento != '') {
      sql = sql + complemento;
    }
    final expression = CustomExpression<bool>(sql);
    final retorno = (await (select(nfeCabecalhos)..where((t) => expression))
        .getSingleOrNull());

    return retorno;
  }

  Future<NfeCabecalho?> consultarNotaPorVenda(int idVenda,
      {String? status}) async {
    String sql;
    if (status == null) {
      // não retorna as notas com status CONTINGENCIA (será transmitida e passada para 4) E OFFLINE (será cancelada ou inutilizada)
      sql =
          " ID_PDV_VENDA_CABECALHO = '$idVenda' AND  (STATUS_NOTA <> '6' AND STATUS_NOTA <> '9')";
    } else {
      sql = " ID_PDV_VENDA_CABECALHO = '$idVenda' AND  STATUS_NOTA = '$status'";
    }
    final expression = CustomExpression<bool>(sql);
    final retorno = await (select(nfeCabecalhos)..where((t) => expression))
        .getSingleOrNull(); // (await customSelect(sql).getSingleOrNull()) as NfeCabecalho;

    return retorno;
  }

  Future<NfeCabecalhoMontado?> consultarObjetoMontado(
      String campo, String valor) async {
    return transaction(() async {
      final objetoNfeCabecalhoMontado = NfeCabecalhoMontado();
      try {
        // pega o cabeçalho
        const complemento = " AND STATUS_NOTA = '4'";
        objetoNfeCabecalhoMontado.nfeCabecalho =
            await consultarObjetoFiltro(campo, valor, complemento: complemento);
        if (objetoNfeCabecalhoMontado.nfeCabecalho != null) {
          // pega o destinatário

          // código anterior:
          // (await customSelect(
          //         "SELECT * FROM NFE_DESTINATARIO WHERE ID_NFE_CABECALHO = '${objetoNfeCabecalhoMontado.nfeCabecalho!.id}'")
          //     .getSingleOrNull()) as NfeDestinatario;

          objetoNfeCabecalhoMontado
              .nfeDestinatario = await (select(nfeDestinatarios)
                ..where((t) => CustomExpression<bool>(
                    " 'ID_NFE_CABECALHO' = '${objetoNfeCabecalhoMontado.nfeCabecalho!.id}' ")))
              .getSingleOrNull();

          // pega os detalhes
          objetoNfeCabecalhoMontado.listaNfeDetalheMontado = [];
          final query =
              " 'ID_NFE_CABECALHO' = '${objetoNfeCabecalhoMontado.nfeCabecalho!.id}'";
          final expression = CustomExpression<bool>(query);
          final detalhes =
              await (select(nfeDetalhes)..where((t) => expression)).get();

          // pega os impostos de cada detalhe
          for (var detalhe in detalhes) {
            // ICMS

            // código anterior:
            // (await customSelect(
            //         "SELECT * FROM NFE_DETALHE_IMPOSTO_ICMS WHERE ID_NFE_DETALHE = '${detalhe.id}'")
            //     .getSingleOrNull()) as NfeDetalheImpostoIcms;
            final icms = await (select(nfeDetalheImpostoIcmss)
                  ..where((t) => CustomExpression<bool>(
                      " 'ID_NFE_DETALHE' = '${detalhe.id}' ")))
                .getSingleOrNull();

            // PIS

            //código anterior:
            // (await customSelect(
            //         "SELECT * FROM NFE_DETALHE_IMPOSTO_PIS WHERE ID_NFE_DETALHE = '${detalhe.id}'")
            //     .getSingleOrNull()) as NfeDetalheImpostoPis;
            final pis = await (select(nfeDetalheImpostoPiss)
                  ..where((t) => CustomExpression<bool>(
                      " 'ID_NFE_DETALHE' = '${detalhe.id}' ")))
                .getSingleOrNull();

            // COFINS

            //código anterior:
            // (await customSelect(
            //         "SELECT * FROM NFE_DETALHE_IMPOSTO_COFINS WHERE ID_NFE_DETALHE = '${detalhe.id}'")
            //     .getSingleOrNull()) as NfeDetalheImpostoCofins;
            final cofins = await (select(nfeDetalheImpostoCofinss)
                  ..where((t) => CustomExpression<bool>(
                      " 'ID_NFE_DETALHE' = '${detalhe.id}' ")))
                .getSingleOrNull();

            // monta tudo
            NfeDetalheMontado nfeDetalheMontado = NfeDetalheMontado(
              nfeDetalhe: detalhe,
              nfeDetalheImpostoIcms: icms,
              nfeDetalheImpostoPis: pis,
              nfeDetalheImpostoCofins: cofins,
            );
            objetoNfeCabecalhoMontado.listaNfeDetalheMontado!
                .add(nfeDetalheMontado);
          }
        }
        return objetoNfeCabecalhoMontado;
      } catch (e) {
        debugPrint('Ocorreu um problema ao tentar emitir a NFC-e: $e');
        return null;
      }
    });
  }

  Stream<List<NfeCabecalho>> observarLista() => select(nfeCabecalhos).watch();

  Future<NfeCabecalho?> consultarObjeto(int pId) {
    return (select(nfeCabecalhos)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

  Future<int> inserir(NfeCabecalhoMontado nfeCabecalhoMontado,
      List<NfeDetalheMontado> listaNfeDetalheMontado) {
    return transaction(() async {
      nfeCabecalhoMontado.nfeCabecalho =
          removerDomains(nfeCabecalhoMontado.nfeCabecalho!);

      final maxId = await ultimoId();

      nfeCabecalhoMontado.nfeCabecalho = nfeCabecalhoMontado.nfeCabecalho!
          .copyWith(id: Value(maxId + 1), statusNota: const Value('1'));

      final idInserido =
          await into(nfeCabecalhos).insert(nfeCabecalhoMontado.nfeCabecalho!);

      await inserirFilhos(
          idInserido, listaNfeDetalheMontado, nfeCabecalhoMontado);
      await db.nfeNumeroDao.atualizarNumero();
      return idInserido;
    });
  }

  Future<int> inserirSemLista(NfeCabecalhoMontado nfeCabecalhoMontado) {
    return transaction(() async {
      nfeCabecalhoMontado.nfeCabecalho =
          removerDomains(nfeCabecalhoMontado.nfeCabecalho!);

      final maxId = await ultimoId();
      nfeCabecalhoMontado.nfeCabecalho =
          nfeCabecalhoMontado.nfeCabecalho!.copyWith(id: Value(maxId + 1));
      final idInserido =
          await into(nfeCabecalhos).insert(nfeCabecalhoMontado.nfeCabecalho!);
      await inserirFilhosSemListas(nfeCabecalhoMontado, idInserido);
      await db.nfeNumeroDao.atualizarNumero();
      return idInserido;
    });
  }

  Future<bool> alterar(NfeCabecalhoMontado nfeCabecalhoMontado,
      List<NfeDetalheMontado> listaNfeDetalheMontado) {
    return transaction(() async {
      nfeCabecalhoMontado.nfeCabecalho =
          removerDomains(nfeCabecalhoMontado.nfeCabecalho!);
      await excluirFilhos(nfeCabecalhoMontado);
      await inserirFilhos(nfeCabecalhoMontado.nfeCabecalho!.id!,
          listaNfeDetalheMontado, nfeCabecalhoMontado);

      return update(nfeCabecalhos).replace(nfeCabecalhoMontado.nfeCabecalho!);
    });
  }

  //alterar sem a lista passada como parâmetro
  Future<bool> alterarSemLista(NfeCabecalhoMontado nfeCabecalhoMontado,
      {bool? atualizaFilhos}) {
    return transaction(() async {
      nfeCabecalhoMontado.nfeCabecalho =
          removerDomains(nfeCabecalhoMontado.nfeCabecalho!);
      if (atualizaFilhos!) {
        await excluirFilhos(nfeCabecalhoMontado);
        await inserirFilhosSemListas(
            nfeCabecalhoMontado, nfeCabecalhoMontado.nfeCabecalho!.id!);
      }
      return update(nfeCabecalhos).replace(nfeCabecalhoMontado.nfeCabecalho!);
    });
  }

  Future<void> excluirFilhos(NfeCabecalhoMontado pObjeto) async {
    await (delete(nfeDestinatarios)
          ..where((t) => t.idNfeCabecalho.equals(pObjeto.nfeCabecalho!.id!)))
        .go();
    await (delete(nfeInformacaoPagamentos)
          ..where((t) => t.idNfeCabecalho.equals(pObjeto.nfeCabecalho!.id!)))
        .go();
    for (var detalhe in pObjeto.listaNfeDetalheMontado!) {
      await (delete(nfeDetalheImpostoIcmss)
            ..where((t) => t.idNfeDetalhe.equals(detalhe.nfeDetalhe!.id!)))
          .go();
      await (delete(nfeDetalheImpostoPiss)
            ..where((t) => t.idNfeDetalhe.equals(detalhe.nfeDetalhe!.id!)))
          .go();
      await (delete(nfeDetalheImpostoCofinss)
            ..where((t) => t.idNfeDetalhe.equals(detalhe.nfeDetalhe!.id!)))
          .go();
    }
    await (delete(nfeDetalhes)
          ..where((t) => t.idNfeCabecalho.equals(pObjeto.nfeCabecalho!.id!)))
        .go();
  }

  Future<void> inserirFilhosSemListas(
      NfeCabecalhoMontado nfeCabecalhoMontado, int idMestre) async {
    var maxId = await ultimoIdNfeDestinatario();
    nfeCabecalhoMontado.nfeDestinatario = nfeCabecalhoMontado.nfeDestinatario!
        .copyWith(id: Value(maxId + 1), idNfeCabecalho: Value(idMestre));
    await into(nfeDestinatarios).insert(nfeCabecalhoMontado.nfeDestinatario!);

    for (var pagamento in nfeCabecalhoMontado.listaNfeInformacaoPagamento!) {
      maxId = await ultimoIdNfeInformacaoPagamento();
      pagamento = pagamento.copyWith(
          id: Value(maxId + 1), idNfeCabecalho: Value(idMestre));
      await into(nfeInformacaoPagamentos).insert(pagamento);
    }

    for (var detalhe in nfeCabecalhoMontado.listaNfeDetalheMontado!) {
      maxId = await ultimoIdNfeDetalhe();
      detalhe.nfeDetalhe = detalhe.nfeDetalhe!
          .copyWith(id: Value(maxId + 1), idNfeCabecalho: Value(idMestre));
      final idDetalhe = await into(nfeDetalhes).insert(detalhe.nfeDetalhe!);

      maxId = await ultimoIdNfeDetalheImpostoIcms();
      detalhe.nfeDetalheImpostoIcms = detalhe.nfeDetalheImpostoIcms!
          .copyWith(id: Value(maxId + 1), idNfeDetalhe: Value(idDetalhe));
      await into(nfeDetalheImpostoIcmss).insert(detalhe.nfeDetalheImpostoIcms!);

      maxId = await ultimoIdNfeDetalheImpostoPis();
      detalhe.nfeDetalheImpostoPis = detalhe.nfeDetalheImpostoPis!
          .copyWith(id: Value(maxId + 1), idNfeDetalhe: Value(idDetalhe));
      await into(nfeDetalheImpostoPiss).insert(detalhe.nfeDetalheImpostoPis!);

      maxId = await ultimoIdNfeDetalheImpostoCofins();
      detalhe.nfeDetalheImpostoCofins = detalhe.nfeDetalheImpostoCofins!
          .copyWith(id: Value(maxId + 1), idNfeDetalhe: Value(idDetalhe));
      await into(nfeDetalheImpostoCofinss)
          .insert(detalhe.nfeDetalheImpostoCofins!);
    }
  }

  Future<void> inserirFilhos(
      int idMestre,
      List<NfeDetalheMontado> listaNfeDetalheMontado,
      NfeCabecalhoMontado nfeCabecalhoMontado) async {
    var maxId = await ultimoIdNfeDestinatario();
    nfeCabecalhoMontado.nfeDestinatario = nfeCabecalhoMontado.nfeDestinatario!
        .copyWith(id: Value(maxId + 1), idNfeCabecalho: Value(idMestre));
    await into(nfeDestinatarios).insert(nfeCabecalhoMontado.nfeDestinatario!);

    //TODO: PERSISTIR AS INFORMAÇÕES DE PAGAMENTO

    /*   for (var pagamento in nfeCabecalhoMontado.listaNfeInformacaoPagamento!) {
      maxId = await ultimoIdNfeInformacaoPagamento();
      pagamento = pagamento.copyWith(id: Value(maxId + 1), idNfeCabecalho: idMestre);
      await into(nfeInformacaoPagamentos).insert(pagamento);
    }
 */
    for (var detalhe in listaNfeDetalheMontado) {
      maxId = await ultimoIdNfeDetalhe();
      detalhe.nfeDetalhe = detalhe.nfeDetalhe!
          .copyWith(id: Value(maxId + 1), idNfeCabecalho: Value(idMestre));
      final idDetalhe = await into(nfeDetalhes).insert(detalhe.nfeDetalhe!);

      maxId = await ultimoIdNfeDetalheImpostoIcms();
      detalhe.nfeDetalheImpostoIcms = detalhe.nfeDetalheImpostoIcms!
          .copyWith(id: Value(maxId + 1), idNfeDetalhe: Value(idDetalhe));
      await into(nfeDetalheImpostoIcmss).insert(detalhe.nfeDetalheImpostoIcms!);

      maxId = await ultimoIdNfeDetalheImpostoPis();
      detalhe.nfeDetalheImpostoPis = detalhe.nfeDetalheImpostoPis!
          .copyWith(id: Value(maxId + 1), idNfeDetalhe: Value(idDetalhe));
      await into(nfeDetalheImpostoPiss).insert(detalhe.nfeDetalheImpostoPis!);

      maxId = await ultimoIdNfeDetalheImpostoCofins();
      detalhe.nfeDetalheImpostoCofins = detalhe.nfeDetalheImpostoCofins!
          .copyWith(id: Value(maxId + 1), idNfeDetalhe: Value(idDetalhe));
      await into(nfeDetalheImpostoCofinss)
          .insert(detalhe.nfeDetalheImpostoCofins!);
    }
  }

  Future<int> ultimoId() async {
    final resultado =
        await customSelect("select MAX(ID) as ULTIMO from NFE_CABECALHO")
            .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> ultimoIdNfeDestinatario() async {
    final resultado =
        await customSelect("select MAX(ID) as ULTIMO from NFE_DESTINATARIO")
            .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> ultimoIdNfeInformacaoPagamento() async {
    final resultado = await customSelect(
            "select MAX(ID) as ULTIMO from NFE_INFORMACAO_PAGAMENTO")
        .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> ultimoIdNfeDetalhe() async {
    final resultado =
        await customSelect("select MAX(ID) as ULTIMO from NFE_DETALHE")
            .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> ultimoIdNfeDetalheImpostoIcms() async {
    final resultado = await customSelect(
            "select MAX(ID) as ULTIMO from NFE_DETALHE_IMPOSTO_ICMS")
        .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> ultimoIdNfeDetalheImpostoPis() async {
    final resultado = await customSelect(
            "select MAX(ID) as ULTIMO from NFE_DETALHE_IMPOSTO_PIS")
        .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> ultimoIdNfeDetalheImpostoCofins() async {
    final resultado = await customSelect(
            "select MAX(ID) as ULTIMO from NFE_DETALHE_IMPOSTO_COFINS")
        .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> marcaItemDevolvido(List<int> listaIdNfeDetalhe) {
    String idItens = "(";
    for (var item in listaIdNfeDetalhe) {
      idItens += "$item,";
    }
    idItens = "${idItens.substring(0, idItens.length - 1)})";
    return customUpdate(
        "UPDATE NFE_DETALHE SET PERCENTUAL_DEVOLVIDO = 100 WHERE ID IN $idItens");
  }

  void aplicarDomainsTipoOperacao() {
    for (var i = 0; i < listaNfeCabecalhoMontado!.length; i++) {
      switch (listaNfeCabecalhoMontado![i].nfeCabecalho!.tipoOperacao) {
        case '0':
          listaNfeCabecalhoMontado![i].nfeCabecalho =
              listaNfeCabecalhoMontado![i].nfeCabecalho!.copyWith(
                    tipoOperacao: const Value('0=Entrada'),
                  );
          break;
        case '1':
          listaNfeCabecalhoMontado![i].nfeCabecalho =
              listaNfeCabecalhoMontado![i].nfeCabecalho!.copyWith(
                    tipoOperacao: const Value('1=Saída'),
                  );
          break;
        default:
      }
    }
  }

  NfeCabecalho removerDomains(NfeCabecalho nfeCabecalho) {
    nfeCabecalho = nfeCabecalho.copyWith(
        tipoOperacao: Value(nfeCabecalho.tipoOperacao!.substring(0, 1)),
        finalidadeEmissao:
            Value(nfeCabecalho.finalidadeEmissao!.substring(0, 1)));

    return nfeCabecalho;
  }

  void aplicarDomainsFinalidadeEmissao() {
    for (var i = 0; i < listaNfeCabecalhoMontado!.length; i++) {
      switch (listaNfeCabecalhoMontado![i].nfeCabecalho!.finalidadeEmissao!) {
        case '1':
          listaNfeCabecalhoMontado![i].nfeCabecalho =
              listaNfeCabecalhoMontado![i].nfeCabecalho!.copyWith(
                    finalidadeEmissao: const Value('1=NORMAL'),
                  );
          break;
        case '2':
          listaNfeCabecalhoMontado![i].nfeCabecalho =
              listaNfeCabecalhoMontado![i].nfeCabecalho!.copyWith(
                    finalidadeEmissao: const Value('2=COMPLEMENTAR'),
                  );
          break;
        case '3':
          listaNfeCabecalhoMontado![i].nfeCabecalho =
              listaNfeCabecalhoMontado![i].nfeCabecalho!.copyWith(
                    finalidadeEmissao: const Value('3=AJUSTE'),
                  );
          break;
        case '4':
          listaNfeCabecalhoMontado![i].nfeCabecalho =
              listaNfeCabecalhoMontado![i].nfeCabecalho!.copyWith(
                    finalidadeEmissao: const Value('4=DEVOLUÇÃO'),
                  );
          break;
        default:
      }
    }
  }
}
