/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [PRODUTO] 
                                                                                
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
import 'dart:convert';

import 'package:drift/drift.dart';

import 'package:pegasus_pdv/src/database/database.dart';
import 'package:pegasus_pdv/src/database/database_classes.dart';
import 'package:pegasus_pdv/src/model/model.dart';

part 'produto_dao.g.dart';

@DriftAccessor(tables: [
  Produtos,
  ProdutoUnidades,
  TributGrupoTributarios,
  ProdutoTipos,
  ProdutoSubgrupos,
  ProdutoFichaTecnicas,
  ProdutoImagems,
  Cardapios,
  CardapioPerguntaPadraos,
  CardapioRespostaPadraos,
])
class ProdutoDao extends DatabaseAccessor<AppDatabase> with _$ProdutoDaoMixin {
  final AppDatabase db;

  List<Produto>?
      listaProduto; // será usada para popular a grid na janela do produto
  List<ProdutoMontado>?
      listaProdutoMontado; // será usada para popular a grid na janela do produto, pois leva a unidade

  ProdutoDao(this.db) : super(db);

  Future<List<Produto>?> consultarLista() async {
    listaProduto =
        await (select(produtos)..where((t) => t.situacao.equals('A'))).get();
    return listaProduto;
  }

  Future<List<Produto>?> consultarListaFiltro(
      String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    listaProduto = await (select(produtos)..where((t) => expression)).get();

    return listaProduto;
  }

  Future<List<Produto>?> consultarProdutoSemGrupoTributario() async {
    const query = " 'id_tribut_grupo_tributario' like 'null' and SITUACAO='A' ";
    const expression = CustomExpression<bool>(query);

    listaProduto = await (select(produtos)..where((t) => expression)).get();

    return listaProduto;
  }

  // código anterior
  // Future<Produto?> consultarObjetoFiltro(String campo, String valor) async {
  //   return (await customSelect(
  //           "SELECT * FROM PRODUTO WHERE $campo = '$valor' and SITUACAO='A'")
  //       .getSingleOrNull()) as Produto;
  // }
  Future<Produto?> consultarObjetoFiltro(String campo, String valor) async {
    final query = " $campo = '$valor' and SITUACAO='A'";
    final expression = CustomExpression<bool>(query);
    return await (select(produtos)..where((t) => expression)).getSingleOrNull();
  }

  Future<ProdutoMontado?> consultarObjetoMontado(
      {int? pId, String? campo, dynamic valor}) async {
    final consulta = select(produtos).join([
      leftOuterJoin(produtoUnidades,
          produtoUnidades.id.equalsExp(produtos.idProdutoUnidade)),
    ]).join([
      leftOuterJoin(
          tributGrupoTributarios,
          tributGrupoTributarios.id
              .equalsExp(produtos.idTributGrupoTributario)),
    ]).join([
      leftOuterJoin(produtoSubgrupos,
          produtoSubgrupos.id.equalsExp(produtos.idProdutoSubgrupo)),
    ]).join([
      leftOuterJoin(cardapios, cardapios.idProduto.equalsExp(produtos.id)),
    ]).join([
      leftOuterJoin(
          produtoTipos, produtoTipos.id.equalsExp(produtos.idProdutoTipo)),
    ]);

    if (pId != null) {
      consulta.where(produtos.id.equals(pId));
    }

    if (campo != null && campo != '') {
      final coluna =
          produtos.$columns.where(((coluna) => coluna.$name == campo)).first;
      if (coluna is TextColumn) {
        consulta.where((coluna as TextColumn).like('%$valor%'));
      } else if (coluna is IntColumn) {
        consulta.where(coluna.equals(Value(int.tryParse(valor))));
      } else if (coluna is RealColumn) {
        consulta.where(coluna.equals(Value(double.tryParse(valor))));
      }
    }

    consulta.where(produtos.situacao.equals('A'));

    final retorno = await consulta.map((row) {
      final produtoUnidade = row.readTableOrNull(produtoUnidades);
      final produto = row.readTableOrNull(produtos);
      final tributGrupoTributario = row.readTableOrNull(tributGrupoTributarios);
      final produtoTipo = row.readTableOrNull(produtoTipos);
      final produtoSubgrupo = row.readTableOrNull(produtoSubgrupos);
      final cardapio = row.readTableOrNull(cardapios);

      return ProdutoMontado(
        produtoUnidade: produtoUnidade,
        produto: produto,
        tributGrupoTributario: tributGrupoTributario,
        produtoTipo: produtoTipo,
        produtoSubgrupo: produtoSubgrupo,
        cardapio: cardapio,
      );
    }).get();

    if (retorno.length != 1) {
      return null;
    } else {
      return retorno[0];
    }
  }

  Future<List<ProdutoMontado>?> consultarListaMontado(
      {String? campo, dynamic valor, String? status}) async {
    final consulta = select(produtos).join([
      leftOuterJoin(produtoUnidades,
          produtoUnidades.id.equalsExp(produtos.idProdutoUnidade)),
    ]).join([
      leftOuterJoin(
          tributGrupoTributarios,
          tributGrupoTributarios.id
              .equalsExp(produtos.idTributGrupoTributario)),
    ]).join([
      leftOuterJoin(produtoSubgrupos,
          produtoSubgrupos.id.equalsExp(produtos.idProdutoSubgrupo)),
    ]).join([
      leftOuterJoin(cardapios, cardapios.idProduto.equalsExp(produtos.id)),
    ]).join([
      leftOuterJoin(
          produtoTipos, produtoTipos.id.equalsExp(produtos.idProdutoTipo)),
    ]);

    if (campo != null && campo != '') {
      final coluna =
          produtos.$columns.where(((coluna) => coluna.$name == campo)).first;
      if (coluna is TextColumn) {
        consulta.where((coluna as TextColumn).like('%$valor%'));
      } else if (coluna is IntColumn) {
        consulta.where(coluna.equals(Value(int.tryParse(valor))));
      } else if (coluna is RealColumn) {
        consulta.where(coluna.equals(Value(double.tryParse(valor))));
      }
    }

    consulta.where(produtos.situacao.equals('A'));

    if (status != null) {
      switch (status) {
        case 'Crítico':
          consulta.where(
              produtos.quantidadeEstoque.isSmallerThan(produtos.estoqueMinimo));
          break;
        default:
      }
    }

    listaProdutoMontado = await consulta.map((row) {
      final produtoUnidade = row.readTableOrNull(produtoUnidades);
      final produto = row.readTableOrNull(produtos);
      final tributGrupoTributario = row.readTableOrNull(tributGrupoTributarios);
      final produtoTipo = row.readTableOrNull(produtoTipos);
      final produtoSubgrupo = row.readTableOrNull(produtoSubgrupos);
      final cardapio = row.readTableOrNull(cardapios);

      return ProdutoMontado(
        produtoUnidade: produtoUnidade,
        produto: produto,
        tributGrupoTributario: tributGrupoTributario,
        produtoTipo: produtoTipo,
        produtoSubgrupo: produtoSubgrupo,
        cardapio: cardapio,
      );
    }).get();
    return listaProdutoMontado;
  }

  Future<int> consultarEstoqueCritico() async {
    final resultado = await customSelect(
            "select count(*) as QUANTIDADE from produto where QUANTIDADE_ESTOQUE<ESTOQUE_MINIMO and SITUACAO='A'")
        .getSingleOrNull();
    return resultado?.data["QUANTIDADE"] ?? 0;
  }

  Future<bool> incrementarEstoque(
      {List<VendaDetalhe>? listaVendaDetalhe,
      List<CompraDetalhe>? listaCompraDetalhe}) {
    return transaction(() async {
      if (listaCompraDetalhe != null) {
        for (var objeto in listaCompraDetalhe) {
          Produto? produto =
              await consultarObjeto(objeto.compraPedidoDetalhe!.idProduto!);
          produto = produto?.copyWith(
            quantidadeEstoque: Value((produto.quantidadeEstoque ?? 0) +
                objeto.compraPedidoDetalhe!.quantidade!),
            valorCompra: Value(objeto.compraPedidoDetalhe!.valorUnitario),
          );
          await update(produtos).replace(produto!);
        }
      } else if (listaVendaDetalhe != null) {
        for (var objeto in listaVendaDetalhe) {
          Produto? produto =
              await consultarObjeto(objeto.pdvVendaDetalhe!.idProduto!);
          produto = produto?.copyWith(
            quantidadeEstoque: Value((produto.quantidadeEstoque ?? 0) +
                objeto.pdvVendaDetalhe!.quantidade!),
          );
          await update(produtos).replace(produto!);
        }
      }
      return true;
    });
  }

  Future<bool> decrementarEstoque(
      {List<VendaDetalhe>? listaVendaDetalhe,
      List<CompraDetalhe>? listaCompraDetalhe}) {
    return transaction(() async {
      if (listaVendaDetalhe != null) {
        for (var objeto in listaVendaDetalhe) {
          Produto? produto =
              await consultarObjeto(objeto.pdvVendaDetalhe!.idProduto!);
          if (produto?.ippt == 'T') {
            produto = produto!.copyWith(
                quantidadeEstoque: Value((produto.quantidadeEstoque ?? 0) -
                    objeto.pdvVendaDetalhe!.quantidade!));
            await update(produtos).replace(produto);
          } else if (produto?.ippt == 'P') {
            final listaProdutoFichaTecnica = await db.produtoFichaTecnicaDao
                .consultarListaFiltro('ID_PRODUTO', produto!.id.toString());
            for (var produtoFichaTecnica in listaProdutoFichaTecnica) {
              Produto? produtoEstoque =
                  await consultarObjeto(produtoFichaTecnica.idProdutoFilho!);
              produtoEstoque = produtoEstoque!.copyWith(
                  quantidadeEstoque: Value(
                      (produtoEstoque.quantidadeEstoque ?? 0) -
                          produtoFichaTecnica.quantidade!));
              await update(produtos).replace(produtoEstoque);
            }
          }
        }
      } else if (listaCompraDetalhe != null) {
        for (var objeto in listaCompraDetalhe) {
          Produto? produto =
              await consultarObjeto(objeto.compraPedidoDetalhe!.idProduto!);
          if (produto?.ippt == 'T') {
            produto = produto?.copyWith(
                quantidadeEstoque: Value((produto.quantidadeEstoque ?? 0) -
                    objeto.compraPedidoDetalhe!.quantidade!));
            await update(produtos).replace(produto!);
          } else if (produto?.ippt == 'P') {
            final listaProdutoFichaTecnica = await db.produtoFichaTecnicaDao
                .consultarListaFiltro('ID_PRODUTO', produto!.id.toString());
            for (var produtoFichaTecnica in listaProdutoFichaTecnica) {
              Produto? produtoEstoque =
                  await consultarObjeto(produtoFichaTecnica.idProdutoFilho!);
              produtoEstoque = produtoEstoque!.copyWith(
                  quantidadeEstoque: Value(
                      (produtoEstoque.quantidadeEstoque ?? 0) -
                          produtoFichaTecnica.quantidade!));
              await update(produtos).replace(produtoEstoque);
            }
          }
        }
      }
      return true;
    });
  }

  Future<int> atualizarGrupoTributario(int? idGrupoTributario) async {
    return customUpdate(
        "update PRODUTO set ID_TRIBUT_GRUPO_TRIBUTARIO = '$idGrupoTributario'");
  }

  Stream<List<Produto>> observarLista() => select(produtos).watch();

  Future<Produto?> consultarObjeto(int pId) {
    return (select(produtos)..where((t) => t.id.equals(pId))).getSingleOrNull();
  }

  Future<bool> excluir(ProdutoMontado pObjeto) {
    return transaction(() async {
      // await excluirFilhos(pObjeto);
      // return delete(produtos).delete(pObjeto.produto!);
      return update(produtos).replace(pObjeto.produto!);
    });
  }

  Future<int> ultimoId() async {
    final resultado =
        await customSelect("select MAX(ID) as ULTIMO from PRODUTO")
            .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(
      ProdutoMontado pObjeto,
      List<ProdutoFichaTecnica> listaProdutoFichaTecnica,
      List<ProdutoImagem> listaProdutoImagem,
      List<CardapioPerguntaPadraoMontado> listaCardapioPerguntaPadraoMontado) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto.produto = pObjeto.produto!.copyWith(id: Value(maxId + 1));
      final idInserido = await into(produtos).insert(pObjeto.produto!);
      pObjeto.produto = pObjeto.produto!.copyWith(id: Value(idInserido));
      await inserirFilhos(pObjeto, listaProdutoFichaTecnica, listaProdutoImagem,
          listaCardapioPerguntaPadraoMontado);
      return idInserido;
    });
  }

  Future<int> inserirProdutoSimples(Produto pObjeto) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(produtos).insert(pObjeto);
      return idInserido;
    });
  }

  Future<bool> alterar(
      ProdutoMontado pObjeto,
      List<ProdutoFichaTecnica> listaProdutoFichaTecnica,
      List<ProdutoImagem> listaProdutoImagem,
      List<CardapioPerguntaPadraoMontado> listaCardapioPerguntaPadraoMontado) {
    return transaction(() async {
      await excluirFilhos(pObjeto);
      await inserirFilhos(pObjeto, listaProdutoFichaTecnica, listaProdutoImagem,
          listaCardapioPerguntaPadraoMontado);
      return update(produtos).replace(pObjeto.produto!);
    });
  }

  Future<void> inserirFilhos(
      ProdutoMontado produtoMontado,
      List<ProdutoFichaTecnica> listaProdutoFichaTecnica,
      List<ProdutoImagem> listaProdutoImagem,
      List<CardapioPerguntaPadraoMontado>
          listaCardapioPerguntaPadraoMontado) async {
    for (var objeto in listaProdutoFichaTecnica) {
      final maxId = await db.produtoFichaTecnicaDao.ultimoId();
      objeto = objeto.copyWith(
          id: Value(maxId + 1), idProduto: Value(produtoMontado.produto!.id!));
      await into(produtoFichaTecnicas).insert(objeto);
    }
    for (var objeto in listaProdutoImagem) {
      final maxId = await db.produtoImagemDao.ultimoId();
      objeto = objeto.copyWith(
          id: Value(maxId + 1), idProduto: Value(produtoMontado.produto!.id!));
      await into(produtoImagems).insert(objeto);
    }
    // cardápio
    if (produtoMontado.cardapio != null) {
      final maxId = await db.cardapioDao.ultimoId();
      produtoMontado.cardapio = produtoMontado.cardapio!.copyWith(
          id: Value(maxId + 1), idProduto: Value(produtoMontado.produto!.id!));
      final idCardapio = await into(cardapios).insert(produtoMontado.cardapio!);

      // perguntas e respostas
      for (var perguntaMontado in listaCardapioPerguntaPadraoMontado) {
        final maxId = await db.cardapioPerguntaPadraoDao.ultimoId();
        perguntaMontado.cardapioPerguntaPadrao = perguntaMontado
            .cardapioPerguntaPadrao!
            .copyWith(id: Value(maxId + 1), idCardapio: Value(idCardapio));
        final idPerguntaPadrao = await into(cardapioPerguntaPadraos)
            .insert(perguntaMontado.cardapioPerguntaPadrao!);

        for (var resposta in perguntaMontado.listaCardapioRespostaPadrao) {
          final maxId = await db.cardapioRespostaPadraoDao.ultimoId();
          resposta = resposta.copyWith(
              id: Value(maxId + 1),
              idCardapioPerguntaPadrao: Value(idPerguntaPadrao));
          await into(cardapioRespostaPadraos).insert(resposta);
        }
      }
    }
  }

  Future<void> excluirFilhos(
    ProdutoMontado produtoMontado,
  ) async {
    await (delete(produtoFichaTecnicas)
          ..where((t) => t.idProduto.equals(produtoMontado.produto!.id!)))
        .go();
    await (delete(produtoImagems)
          ..where((t) => t.idProduto.equals(produtoMontado.produto!.id!)))
        .go();

    final query =
        " 'ID_CARDAPIO' = '%${produtoMontado.cardapio?.id.toString()}%'";
    final expression = CustomExpression<bool>(query);

    final listaPerguntas =
        await (select(cardapioPerguntaPadraos)..where((t) => expression)).get();

    for (var pergunta in listaPerguntas) {
      await (delete(cardapioRespostaPadraos)
            ..where((t) => t.idCardapioPerguntaPadrao.equals(pergunta.id!)))
          .go();
      await (delete(cardapioPerguntaPadraos)
            ..where((t) => t.id.equals(pergunta.id!)))
          .go();
    }

    await (delete(cardapios)
          ..where((t) => t.idProduto.equals(produtoMontado.produto!.id!)))
        .go();
  }

  Future<void> sincronizar(ObjetoSincroniza objetoSincroniza) async {
    (delete(produtos)..where((t) => t.id.isNotNull())).go();
    var parsed = json.decode(objetoSincroniza.registros!) as List<dynamic>;
    for (var objetoJson in parsed) {
      final objetoDart = Produto.fromJson(objetoJson);
      into(produtos).insertOnConflictUpdate(objetoDart);
    }
  }

  static List<String> campos = <String>[
    'ID',
    'GTIN',
    'CODIGO_INTERNO',
    'NOME',
    'DESCRICAO',
    'VALOR_COMPRA',
    'VALOR_VENDA',
    'QUANTIDADE_ESTOQUE',
    'ESTOQUE_MINIMO',
    'ESTOQUE_MAXIMO',
    'CODIGO_NCM',
    'CODIGO_CEST',
    'IPPT',
    'SITUACAO',
  ];

  static List<String> colunas = <String>[
    'Id',
    'Gtin',
    'Codigo Interno',
    'Nome',
    'Descricao',
    'Valor Compra',
    'Valor Venda',
    'Quantidade Estoque',
    'Estoque Minimo',
    'Estoque Maximo',
    'Codigo Ncm',
    'Codigo Cest',
    'Ippt',
    'Situacao',
  ];
}
