/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [PDV_VENDA_CABECALHO] 
                                                                                
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
import 'dart:async';

import 'package:drift/drift.dart';
import 'package:pegasus_pdv/src/database/database.dart';
import 'package:pegasus_pdv/src/database/database_classes.dart';

part 'pdv_venda_cabecalho_dao.g.dart';

@DriftAccessor(tables: [
  PdvVendaCabecalhos,
  PdvVendaDetalhes,
  PdvTotalTipoPagamentos,
])
class PdvVendaCabecalhoDao extends DatabaseAccessor<AppDatabase>
    with _$PdvVendaCabecalhoDaoMixin {
  final AppDatabase db;

  List<PdvVendaCabecalho>?
      listaPdvVendaCabecalho; // será usada para popular a grid na janela do resumo das vendas

  //PdvVendaCabecalho? pdvVendaCabecalho;

  PdvVendaCabecalhoDao(this.db) : super(db);

  Future<List<PdvVendaCabecalho>?> consultarLista() async {
    listaPdvVendaCabecalho = await select(pdvVendaCabecalhos).get();
    return listaPdvVendaCabecalho;
  }

  Future<int> consultarTotalRegistros() async {
    final lista = await select(pdvVendaCabecalhos).get();
    return (lista.length);
  }

  Future<List<PdvVendaCabecalho>?> consultarListaFiltro(
      String campo, String valor,
      {String? filtroAdicional}) async {
    String sql = " $campo like '%$valor%' ";
    if (filtroAdicional != null) {
      sql += " AND $filtroAdicional";
    }
    final expression = CustomExpression<bool>(sql);
    listaPdvVendaCabecalho =
        await (select(pdvVendaCabecalhos)..where((t) => expression)).get();

    return listaPdvVendaCabecalho;
  }

  Future<List<PdvVendaCabecalho>?> consultarVendasPorPeriodoEStatus(
      {String? mes, int? ano, String? status}) async {
    var sql = " ";

    if (status != null) {
      switch (status) {
        case 'Fechadas':
          sql = "$sql STATUS_VENDA = 'F' ";
          break;
        case 'Abertas':
          sql = "$sql STATUS_VENDA = 'A' ";
          break;
        case 'Canceladas':
          sql = "$sql STATUS_VENDA = 'C' ";
          break;
        case 'Todas':
          sql = "$sql STATUS_VENDA LIKE '%' ";
          break;
        default:
      }
    } else {
      sql = "$sql STATUS_VENDA LIKE '%' ";
    }

    if (mes != null && ano != null) {
      sql = "$sql and   strftime('%m', date(DATA_VENDA, 'unixepoch')) = '$mes' and   strftime('%Y', date(DATA_VENDA, 'unixepoch')) = '$ano'";
    }

    final expression = CustomExpression<bool>(sql);

    listaPdvVendaCabecalho =
        await (select(pdvVendaCabecalhos)..where((t) => expression)).get();

    return listaPdvVendaCabecalho;
  }

  Future<PdvVendaCabecalho?> consultarTotaisDiaOld(int idMovimento) async {
    return (select(pdvVendaCabecalhos)
          ..where((t) => t.idPdvMovimento.equals(idMovimento)))
        .getSingleOrNull();
  }

  Future<PdvVendaCabecalho?> consultarTotaisDia(int idMovimento) async {
    double valorVenda = 0;
    double valorDesconto = 0;
    double valorFinal = 0;
    double valorRecebido = 0;
    double valorTroco = 0;
    double valorCancelado = 0;

    final sql =
        "SELECT  sum(VALOR_VENDA) as VALOR_VENDA,  sum(VALOR_DESCONTO) as VALOR_DESCONTO,  sum(VALOR_FINAL) as VALOR_FINAL,  sum(VALOR_RECEBIDO) as VALOR_RECEBIDO,  sum(VALOR_TROCO) as VALOR_TROCO,  sum(VALOR_CANCELADO) as VALOR_CANCELADO  FROM PDV_VENDA_CABECALHO  WHERE ID_PDV_MOVIMENTO = '$idMovimento'";

    final resultado = await customSelect(sql).get();

    for (QueryRow registro in resultado) {
      valorVenda = valorVenda + (registro.data["VALOR_VENDA"] ?? 0);
      valorDesconto = valorDesconto + (registro.data["VALOR_DESCONTO"] ?? 0);
      valorFinal = valorFinal + (registro.data["VALOR_FINAL"] ?? 0);
      valorRecebido = valorRecebido + (registro.data["VALOR_RECEBIDO"] ?? 0);
      valorTroco = valorTroco + (registro.data["VALOR_TROCO"] ?? 0);
      valorCancelado = valorCancelado + (registro.data["VALOR_CANCELADO"] ?? 0);
    }
    PdvVendaCabecalho pdvVendaCabecalhoCalculado = PdvVendaCabecalho(
        valorVenda: valorVenda,
        valorDesconto: valorDesconto,
        valorFinal: valorFinal,
        valorRecebido: valorRecebido,
        valorTroco: valorTroco,
        valorCancelado: valorCancelado);

    return pdvVendaCabecalhoCalculado;
  }

  Future<double> consultarVendas({required String periodo}) async {
    late String diasPeriodo;
    if (periodo.contains('Semana')) {
      diasPeriodo = '7';
    } else if (periodo.contains('Mês')) {
      diasPeriodo = '30';
    } else if (periodo.contains('Ano')) {
      diasPeriodo = '360';
    }

    final sql =
        "select SUM(VALOR_FINAL) AS TOTAL from PDV_VENDA_CABECALHO where STATUS_VENDA='F' and ( date(DATA_VENDA, 'unixepoch') between date('now','-$diasPeriodo day') AND date('now') )";
    final resultado = await customSelect(sql).getSingleOrNull();
    return resultado?.data["TOTAL"] ?? 0;
  }

  Future<List<double>> consultarVendasParaGrafico(
      {required String periodo}) async {
    List<double> listaRetorno = [];
    late String diasPeriodo;
    if (periodo.contains('Semana')) {
      diasPeriodo = '7';
    } else if (periodo.contains('Mês')) {
      diasPeriodo = '30';
    } else if (periodo.contains('Ano')) {
      diasPeriodo = '360';
    }

    final sql =
        "select DATA_VENDA, SUM(VALOR_FINAL) AS TOTAL from PDV_VENDA_CABECALHO where STATUS_VENDA='F' and ( date(DATA_VENDA, 'unixepoch') between date('now','-$diasPeriodo day') AND date('now') ) GROUP BY DATA_VENDA ORDER BY DATA_VENDA";
    final resultado = await customSelect(sql).get();

    for (QueryRow registro in resultado) {
      listaRetorno.add(registro.data["TOTAL"]);
    }
    if (listaRetorno.isEmpty) {
      listaRetorno.add(0);
    }
    return listaRetorno;
  }

  Stream<List<PdvVendaCabecalho>> observarLista() =>
      select(pdvVendaCabecalhos).watch();

  Future<PdvVendaCabecalho?> consultarObjeto(int pId) {
    return (select(pdvVendaCabecalhos)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

  // Future<PdvVendaCabecalho?> consultarCabecalhoVenda(int pId) async {
  //   pdvVendaCabecalho = await (select(pdvVendaCabecalhos)
  //         ..where((t) => t.id.equals(pId)))
  //       .getSingleOrNull();
  //   return (select(pdvVendaCabecalhos)..where((t) => t.id.equals(pId)))
  //       .getSingleOrNull();
  // }

  Future<int> ultimoId() async {
    final resultado =
        await customSelect("select MAX(ID) as ULTIMO from PDV_VENDA_CABECALHO")
            .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(PdvVendaCabecalho pObjeto) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(pdvVendaCabecalhos).insert(pObjeto);
      return idInserido;
    });
  }

  Future<bool> alterar(
      PdvVendaCabecalho pObjeto, List<VendaDetalhe> listaVendaDetalhe,
      {List<PdvTotalTipoPagamento>? listaDadosPagamento}) {
    return transaction(() async {
      await excluirFilhos(pObjeto);
      await inserirFilhos(pObjeto, listaVendaDetalhe, listaDadosPagamento);
      if (pObjeto.statusVenda == 'F') {
        await db.produtoDao
            .decrementarEstoque(listaVendaDetalhe: listaVendaDetalhe);
      }
      return update(pdvVendaCabecalhos).replace(pObjeto);
    });
  }

  Future<bool> cancelarVenda(PdvVendaCabecalho pdvVendaCabecalho) {
    return transaction(() async {
      final listaVendaDetalhe = await db.pdvVendaDetalheDao
          .consultarListaComProduto(pdvVendaCabecalho.id!);
      await db.produtoDao
          .incrementarEstoque(listaVendaDetalhe: listaVendaDetalhe);
      await db.contasReceberDao
          .excluirReceitasDeUmaVenda(pdvVendaCabecalho.id!);
      return update(pdvVendaCabecalhos).replace(pdvVendaCabecalho);
    });
  }

  Future<int> excluir(Insertable<PdvVendaCabecalho> pObjeto) {
    return transaction(() async {
      await excluirFilhos(pObjeto as PdvVendaCabecalho);
      return delete(pdvVendaCabecalhos).delete(pObjeto);
    });
  }

  Future<void> inserirFilhos(
      PdvVendaCabecalho pdvVendaCabecalho,
      List<VendaDetalhe> listaVendaDetalhe,
      List<PdvTotalTipoPagamento>? listaDadosPagamento) async {
    // items da venda
    for (var objeto in listaVendaDetalhe) {
      final maxId = await db.pdvVendaDetalheDao.ultimoId();
      objeto.pdvVendaDetalhe = objeto.pdvVendaDetalhe!.copyWith(
          id: Value(maxId + 1),
          idPdvVendaCabecalho: Value(pdvVendaCabecalho.id!));
      await into(pdvVendaDetalhes).insert(objeto.pdvVendaDetalhe!);
    }
    // pagamentos
    if (listaDadosPagamento != null) {
      for (var objeto in listaDadosPagamento) {
        final maxId = await db.pdvTotalTipoPagamentoDao.ultimoId();
        objeto = objeto.copyWith(
            id: Value(maxId + 1),
            idPdvVendaCabecalho: Value(pdvVendaCabecalho.id!));
        await into(pdvTotalTipoPagamentos).insert(objeto);
      }
    }
  }

  Future<void> excluirFilhos(PdvVendaCabecalho pdvVendaCabecalho) async {
    await (delete(pdvVendaDetalhes)
          ..where((t) => t.idPdvVendaCabecalho.equals(pdvVendaCabecalho.id!)))
        .go();
    await (delete(pdvTotalTipoPagamentos)
          ..where((t) => t.idPdvVendaCabecalho.equals(pdvVendaCabecalho.id!)))
        .go();
  }

  static List<String> campos = <String>[
    'ID',
    'DATA_VENDA',
    'HORA_VENDA',
    'VALOR_VENDA',
    'TAXA_DESCONTO',
    'VALOR_DESCONTO',
    'VALOR_FINAL',
    'VALOR_RECEBIDO',
    'VALOR_TROCO',
    'STATUS_VENDA',
    'NOME_CLIENTE',
    'CPF_CNPJ_CLIENTE',
  ];

  static List<String> colunas = <String>[
    'Id',
    'Data Venda',
    'Hora Venda',
    'Valor Venda',
    'Taxa Desconto',
    'Valor Desconto',
    'Valor Final',
    'Valor Recebido',
    'Valor Troco',
    'Status Venda',
    'Nome Cliente',
    'Cpf Cnpj Cliente',
  ];
}
