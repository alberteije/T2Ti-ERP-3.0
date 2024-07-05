/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [FIN_TIPO_PAGAMENTO] 
                                                                                
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
import 'package:fenix/src/infra/sessao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import 'package:fenix/src/infra/constantes.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';
import 'package:fenix/src/view/shared/botoes.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/page/filtro_page.dart';
import 'package:fenix/src/view/shared/page/pdf_page.dart';

import 'fin_tipo_pagamento_persiste_page.dart';

class FinTipoPagamentoListaPage extends StatefulWidget {
  const FinTipoPagamentoListaPage({Key? key}) : super(key: key);

  @override
  FinTipoPagamentoListaPageState createState() => FinTipoPagamentoListaPageState();
}

class FinTipoPagamentoListaPageState extends State<FinTipoPagamentoListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = FinTipoPagamento.colunas;
  final _campos = FinTipoPagamento.campos;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<FinTipoPagamentoViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
  }


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
    if (Provider.of<FinTipoPagamentoViewModel>(context).listaFinTipoPagamento == null && Provider.of<FinTipoPagamentoViewModel>(context).objetoJsonErro == null) {
      Provider.of<FinTipoPagamentoViewModel>(context, listen: false).consultarLista();
    }
    var listaFinTipoPagamento = Provider.of<FinTipoPagamentoViewModel>(context).listaFinTipoPagamento;

    final _FinTipoPagamentoDataSource finTipoPagamentoDataSource = _FinTipoPagamentoDataSource(listaFinTipoPagamento, context);

    void sort<T>(Comparable<T>? Function(FinTipoPagamento finTipoPagamento) getField, int columnIndex, bool ascending) {
      finTipoPagamentoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Fin Tipo Pagamento'),
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
                child: listaFinTipoPagamento == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(                        
                      header: const Text('Relação - Fin Tipo Pagamento'),
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
                            sort<num>((FinTipoPagamento finTipoPagamento) => finTipoPagamento.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Código Pagamento'),
                          tooltip: 'Código Pagamento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinTipoPagamento finTipoPagamento) => finTipoPagamento.codigo, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Descrição'),
                          tooltip: 'Descrição',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinTipoPagamento finTipoPagamento) => finTipoPagamento.descricao, columnIndex, ascending),
                        ),
                      ],
                      source: finTipoPagamentoDataSource,
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
            FinTipoPagamentoPersistePage(finTipoPagamento: FinTipoPagamento(), title: 'Fin Tipo Pagamento - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<FinTipoPagamentoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Fin Tipo Pagamento - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<FinTipoPagamentoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<FinTipoPagamentoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<FinTipoPagamentoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(
              arquivoPdf: arquivoPdf, title: 'Relatório - Fin Tipo Pagamento')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<FinTipoPagamentoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _FinTipoPagamentoDataSource extends DataTableSource {
  final List<FinTipoPagamento>? listaFinTipoPagamento;
  final BuildContext context;

  _FinTipoPagamentoDataSource(this.listaFinTipoPagamento, this.context);

  void sort<T>(Comparable<T>? Function(FinTipoPagamento finTipoPagamento) getField, bool ascending) {
    listaFinTipoPagamento!.sort((FinTipoPagamento a, FinTipoPagamento b) {
      if (!ascending) {
        final FinTipoPagamento c = a;
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
    if (index >= listaFinTipoPagamento!.length) return null;
    final FinTipoPagamento finTipoPagamento = listaFinTipoPagamento![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${finTipoPagamento.id ?? ''}'), onTap: () {
          _detalharFinTipoPagamento(finTipoPagamento, context);
        }),
        DataCell(Text(finTipoPagamento.codigo ?? ''), onTap: () {
          _detalharFinTipoPagamento(finTipoPagamento, context);
        }),
        DataCell(Text(finTipoPagamento.descricao ?? ''), onTap: () {
          _detalharFinTipoPagamento(finTipoPagamento, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaFinTipoPagamento!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharFinTipoPagamento(FinTipoPagamento finTipoPagamento, BuildContext context) {
   Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => FinTipoPagamentoPersistePage(
          finTipoPagamento: finTipoPagamento,
          title: 'Fin Tipo Pagamento - Editando',
          operacao: 'A')));

  /*Navigator.pushNamed(
    context,
    '/finTipoPagamentoDetalhe',
    arguments: finTipoPagamento,
  );*/
}