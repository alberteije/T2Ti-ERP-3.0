/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [VENDA_CONDICOES_PAGAMENTO] 
                                                                                
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

import 'package:fenix/src/infra/sessao.dart';
import 'package:fenix/src/infra/constantes.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/botoes.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/page/filtro_page.dart';
import 'package:fenix/src/view/shared/page/pdf_page.dart';

import 'venda_condicoes_pagamento_page.dart';

class VendaCondicoesPagamentoListaPage extends StatefulWidget {
  const VendaCondicoesPagamentoListaPage({Key? key}) : super(key: key);

  @override
  VendaCondicoesPagamentoListaPageState createState() => VendaCondicoesPagamentoListaPageState();
}

class VendaCondicoesPagamentoListaPageState extends State<VendaCondicoesPagamentoListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = VendaCondicoesPagamento.colunas;
  final _campos = VendaCondicoesPagamento.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<VendaCondicoesPagamentoViewModel>(context, listen: false).objetoJsonErro)
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
    final listaVendaCondicoesPagamento = Provider.of<VendaCondicoesPagamentoViewModel>(context).listaVendaCondicoesPagamento;
    final objetoJsonErro = Provider.of<VendaCondicoesPagamentoViewModel>(context).objetoJsonErro;

    if (listaVendaCondicoesPagamento == null && objetoJsonErro == null) {
      Provider.of<VendaCondicoesPagamentoViewModel>(context, listen: false).consultarLista();
    }

    final _VendaCondicoesPagamentoDataSource vendaCondicoesPagamentoDataSource = _VendaCondicoesPagamentoDataSource(listaVendaCondicoesPagamento, context);

    void sort<T>(Comparable<T>? Function(VendaCondicoesPagamento vendaCondicoesPagamento) getField, int columnIndex, bool ascending) {
      vendaCondicoesPagamentoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Venda Condicoes Pagamento'),
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
              shape: const CircularNotchedRectangle(),
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
                child: listaVendaCondicoesPagamento == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: const Text('Relação - Venda Condicoes Pagamento'),
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
                            sort<num>((VendaCondicoesPagamento vendaCondicoesPagamento) => vendaCondicoesPagamento.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Nome'),
                          tooltip: 'Nome',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCondicoesPagamento vendaCondicoesPagamento) => vendaCondicoesPagamento.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Descrição'),
                          tooltip: 'Descrição',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCondicoesPagamento vendaCondicoesPagamento) => vendaCondicoesPagamento.descricao, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Faturamento Mínimo'),
                          tooltip: 'Faturamento Mínimo',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCondicoesPagamento vendaCondicoesPagamento) => vendaCondicoesPagamento.faturamentoMinimo, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Faturamento Máximo'),
                          tooltip: 'Faturamento Máximo',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCondicoesPagamento vendaCondicoesPagamento) => vendaCondicoesPagamento.faturamentoMaximo, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Índice de Correção'),
                          tooltip: 'Índice de Correção',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCondicoesPagamento vendaCondicoesPagamento) => vendaCondicoesPagamento.indiceCorrecao, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Dias de Tolerância'),
                          tooltip: 'Dias de Tolerância',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCondicoesPagamento vendaCondicoesPagamento) => vendaCondicoesPagamento.diasTolerancia, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Tolerância'),
                          tooltip: 'Valor Tolerância',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCondicoesPagamento vendaCondicoesPagamento) => vendaCondicoesPagamento.valorTolerancia, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Prazo Médio'),
                          tooltip: 'Prazo Médio',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCondicoesPagamento vendaCondicoesPagamento) => vendaCondicoesPagamento.prazoMedio, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Vista ou Prazo'),
                          tooltip: 'Vista ou Prazo',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCondicoesPagamento vendaCondicoesPagamento) => vendaCondicoesPagamento.vistaPrazo, columnIndex, ascending),
                        ),
                      ],
                      source: vendaCondicoesPagamentoDataSource,
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
          VendaCondicoesPagamentoPage(vendaCondicoesPagamento: VendaCondicoesPagamento(), title: 'Venda Condicoes Pagamento - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<VendaCondicoesPagamentoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Venda Condicoes Pagamento - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<VendaCondicoesPagamentoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
	    await Provider.of<VendaCondicoesPagamentoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
	  } else {
        final arquivoPdf = await Provider.of<VendaCondicoesPagamentoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
		    builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Venda Condicoes Pagamento')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<VendaCondicoesPagamentoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _VendaCondicoesPagamentoDataSource extends DataTableSource {
  final List<VendaCondicoesPagamento>? listaVendaCondicoesPagamento;
  final BuildContext context;

  _VendaCondicoesPagamentoDataSource(this.listaVendaCondicoesPagamento, this.context);

  void sort<T>(Comparable<T>? Function(VendaCondicoesPagamento vendaCondicoesPagamento) getField, bool ascending) {
    listaVendaCondicoesPagamento!.sort((VendaCondicoesPagamento a, VendaCondicoesPagamento b) {
      if (!ascending) {
        final VendaCondicoesPagamento c = a;
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
    if (index >= listaVendaCondicoesPagamento!.length) return null;
    final VendaCondicoesPagamento vendaCondicoesPagamento = listaVendaCondicoesPagamento![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${vendaCondicoesPagamento.id ?? ''}'), onTap: () {
          _detalharVendaCondicoesPagamento(vendaCondicoesPagamento, context);
        }),
        DataCell(Text(vendaCondicoesPagamento.nome ?? ''), onTap: () {
          _detalharVendaCondicoesPagamento(vendaCondicoesPagamento, context);
        }),
        DataCell(Text(vendaCondicoesPagamento.descricao ?? ''), onTap: () {
          _detalharVendaCondicoesPagamento(vendaCondicoesPagamento, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaCondicoesPagamento.faturamentoMinimo ?? 0)), onTap: () {
          _detalharVendaCondicoesPagamento(vendaCondicoesPagamento, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaCondicoesPagamento.faturamentoMaximo ?? 0)), onTap: () {
          _detalharVendaCondicoesPagamento(vendaCondicoesPagamento, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaCondicoesPagamento.indiceCorrecao ?? 0)), onTap: () {
          _detalharVendaCondicoesPagamento(vendaCondicoesPagamento, context);
        }),
        DataCell(Text('${vendaCondicoesPagamento.diasTolerancia ?? ''}'), onTap: () {
          _detalharVendaCondicoesPagamento(vendaCondicoesPagamento, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaCondicoesPagamento.valorTolerancia ?? 0)), onTap: () {
          _detalharVendaCondicoesPagamento(vendaCondicoesPagamento, context);
        }),
        DataCell(Text('${vendaCondicoesPagamento.prazoMedio ?? ''}'), onTap: () {
          _detalharVendaCondicoesPagamento(vendaCondicoesPagamento, context);
        }),
        DataCell(Text(vendaCondicoesPagamento.vistaPrazo ?? ''), onTap: () {
          _detalharVendaCondicoesPagamento(vendaCondicoesPagamento, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaVendaCondicoesPagamento!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharVendaCondicoesPagamento(VendaCondicoesPagamento vendaCondicoesPagamento, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
        VendaCondicoesPagamentoPage(vendaCondicoesPagamento: vendaCondicoesPagamento, title: 'Venda Condicoes Pagamento - Editando', operacao: 'A')));
}