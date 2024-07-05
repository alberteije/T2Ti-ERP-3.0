/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [PRODUTO] 
                                                                                
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import 'package:fenix/src/infra/infra.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/botoes.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/page/filtro_page.dart';
import 'package:fenix/src/view/shared/page/pdf_page.dart';

import 'produto_persiste_page.dart';

class ProdutoListaPage extends StatefulWidget {
  const ProdutoListaPage({Key? key}) : super(key: key);

  @override
  ProdutoListaPageState createState() => ProdutoListaPageState();
}

class ProdutoListaPageState extends State<ProdutoListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = Produto.colunas;
  final _campos = Produto.campos;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void initState() {
    super.initState();
    _shortcutMap = getAtalhosListaPage();

    _actionMap = <Type, Action<Intent>>{
      AtalhoTelaIntent: CallbackAction<AtalhoTelaIntent>(
        onInvoke: _tratarAcoesAtalhos,
      ),
    };
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<ProdutoViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
  }
  
  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      case AtalhoTelaType.inserir:
        _inserir();
        break;
      case AtalhoTelaType.imprimir:
        _gerarRelatorio();
        break;
      case AtalhoTelaType.filtrar:
        _chamarFiltro();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final listaProduto = Provider.of<ProdutoViewModel>(context).listaProduto;
    final objetoJsonErro = Provider.of<ProdutoViewModel>(context).objetoJsonErro;

    if (listaProduto == null && objetoJsonErro == null) {
      Provider.of<ProdutoViewModel>(context, listen: false).consultarLista();
    }
  
    final _ProdutoDataSource produtoDataSource = _ProdutoDataSource(listaProduto, context);

    void sort<T>(Comparable<T>? Function(Produto produto) getField, int columnIndex, bool ascending) {
      produtoDataSource.sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }
	
    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        autofocus: true,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Cadastro - Produto'),
            actions: const <Widget>[],
          ),
          floatingActionButton: FloatingActionButton(
            focusColor: ViewUtilLib.getBotaoFocusColor(),
            tooltip: Constantes.botaoInserirDica,
            backgroundColor: ViewUtilLib.getBackgroundColorBotaoInserir(),
            child: ViewUtilLib.getIconBotaoInserir(),
            onPressed: () {
              _inserir();
            }),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BottomAppBar(
            color: ViewUtilLib.getBottomAppBarColor(),          
            // shape: const CircularNotchedRectangle(),
            child: Row(
              children: getBotoesNavigationBarListaPage(
                context: context, 
                chamarFiltro: _chamarFiltro, 
                gerarRelatorio: _gerarRelatorio,
              ),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: _refrescarTela,
            child: Scrollbar(
              controller: _scrollController,
              child: listaProduto == null
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                controller: _scrollController,                
                padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                children: <Widget>[
                  PaginatedDataTable(                        
                    header: const Text('Relação - Produto'),
                    rowsPerPage: _rowsPerPage!,
                    onRowsPerPageChanged: (int? value) {
                      setState(() {
                        _rowsPerPage = value;
                      });
                    },
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    columns: <DataColumn>[
                      DataColumn(
                        numeric: true,
                        label: const Text('Id'),
                        tooltip: 'Id',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<num>((Produto produto) => produto.id, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Subgrupo'),
                        tooltip: 'Subgrupo',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Produto produto) => produto.produtoSubgrupo?.nome, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Marca'),
                        tooltip: 'Marca',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Produto produto) => produto.produtoMarca?.nome, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Unidade'),
                        tooltip: 'Unidade',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Produto produto) => produto.produtoUnidade?.sigla, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('ICMS Customizado'),
                        tooltip: 'ICMS Customizado',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Produto produto) => produto.tributIcmsCustomCab?.descricao, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Grupo Tributário'),
                        tooltip: 'Grupo Tributário',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Produto produto) => produto.tributGrupoTributario?.descricao, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Nome'),
                        tooltip: 'Nome',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Produto produto) => produto.nome, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Descrição'),
                        tooltip: 'Descrição',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Produto produto) => produto.descricao, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('GTIN'),
                        tooltip: 'GTIN',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Produto produto) => produto.gtin, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Código Interno'),
                        tooltip: 'Código Interno',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Produto produto) => produto.codigoInterno, columnIndex, ascending),
                      ),
                      DataColumn(
                        numeric: true,
                        label: const Text('Valor Compra'),
                        tooltip: 'Valor Compra',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<num>((Produto produto) => produto.valorCompra, columnIndex, ascending),
                      ),
                      DataColumn(
                        numeric: true,
                        label: const Text('Valor Venda'),
                        tooltip: 'Valor Venda',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<num>((Produto produto) => produto.valorVenda, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Código NCM'),
                        tooltip: 'Código NCM',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Produto produto) => produto.codigoNcm, columnIndex, ascending),
                      ),
                      DataColumn(
                        numeric: true,
                        label: const Text('Estoque Mínimo'),
                        tooltip: 'Estoque Mínimo',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<num>((Produto produto) => produto.estoqueMinimo, columnIndex, ascending),
                      ),
                      DataColumn(
                        numeric: true,
                        label: const Text('Estoque Máximo'),
                        tooltip: 'Estoque Máximo',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<num>((Produto produto) => produto.estoqueMaximo, columnIndex, ascending),
                      ),
                      DataColumn(
                        numeric: true,
                        label: const Text('Quantidade em Estoque'),
                        tooltip: 'Quantidade em Estoque',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<num>((Produto produto) => produto.quantidadeEstoque, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Data de Cadastro'),
                        tooltip: 'Data de Cadastro',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<DateTime>((Produto produto) => produto.dataCadastro, columnIndex, ascending),
                      ),
                    ],
                    source: produtoDataSource,
                  ),
                ],
              ),
            ),
          ),          
        ),
      ),
    );
  }

  void _inserir() {
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) => 
          ProdutoPersistePage(produto: Produto(), title: 'Produto - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<ProdutoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Produto - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<ProdutoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<ProdutoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<ProdutoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Produto')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<ProdutoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _ProdutoDataSource extends DataTableSource {
  final List<Produto>? listaProduto;
  final BuildContext context;

  _ProdutoDataSource(this.listaProduto, this.context);

  void sort<T>(Comparable<T>? Function(Produto produto) getField, bool ascending) {
    listaProduto!.sort((Produto a, Produto b) {
      if (!ascending) {
        final Produto c = a;
        a = b;
        b = c;
      }
      Comparable<T>? aValue = getField(a);
      Comparable<T>? bValue = getField(b);

      aValue ??= '' as Comparable<T>;
      bValue ??= '' as Comparable<T>;

      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  final int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= listaProduto!.length) return null;
    final Produto produto = listaProduto![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(produto.id?.toString() ?? ''), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(produto.produtoSubgrupo?.nome?.toString() ?? ''), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(produto.produtoMarca?.nome?.toString() ?? ''), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(produto.produtoUnidade?.sigla?.toString() ?? ''), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(produto.tributIcmsCustomCab?.descricao?.toString() ?? ''), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(produto.tributGrupoTributario?.descricao?.toString() ?? ''), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(produto.nome ?? ''), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(produto.descricao ?? ''), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(produto.gtin ?? ''), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(produto.codigoInterno ?? ''), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(produto.valorCompra ?? 0)), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(produto.valorVenda ?? 0)), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(produto.codigoNcm ?? ''), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(Constantes.formatoDecimalQuantidade.format(produto.estoqueMinimo ?? 0)), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(Constantes.formatoDecimalQuantidade.format(produto.estoqueMaximo ?? 0)), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(Constantes.formatoDecimalQuantidade.format(produto.quantidadeEstoque ?? 0)), onTap: () {
          _detalharProduto(produto, context);
        }),
        DataCell(Text(Biblioteca.formatarData(produto.dataCadastro)), onTap: () {
          _detalharProduto(produto, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaProduto!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharProduto(Produto produto, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => 
        ProdutoPersistePage(produto: produto, title: 'Produto - Editando', operacao: 'A')));
}