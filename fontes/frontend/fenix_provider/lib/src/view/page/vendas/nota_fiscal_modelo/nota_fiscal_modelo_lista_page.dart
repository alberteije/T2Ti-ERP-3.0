/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [NOTA_FISCAL_MODELO] 
                                                                                
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

import 'nota_fiscal_modelo_persiste_page.dart';

class NotaFiscalModeloListaPage extends StatefulWidget {
  const NotaFiscalModeloListaPage({Key? key}) : super(key: key);

  @override
  NotaFiscalModeloListaPageState createState() => NotaFiscalModeloListaPageState();
}

class NotaFiscalModeloListaPageState extends State<NotaFiscalModeloListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = NotaFiscalModelo.colunas;
  final _campos = NotaFiscalModelo.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<NotaFiscalModeloViewModel>(context, listen: false).objetoJsonErro)
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
    final listaNotaFiscalModelo = Provider.of<NotaFiscalModeloViewModel>(context).listaNotaFiscalModelo;
    final objetoJsonErro = Provider.of<NotaFiscalModeloViewModel>(context).objetoJsonErro;

    if (listaNotaFiscalModelo == null && objetoJsonErro == null) {
      Provider.of<NotaFiscalModeloViewModel>(context, listen: false).consultarLista();
    }
  
    final _NotaFiscalModeloDataSource notaFiscalModeloDataSource = _NotaFiscalModeloDataSource(listaNotaFiscalModelo, context);

    void sort<T>(Comparable<T>? Function(NotaFiscalModelo notaFiscalModelo) getField, int columnIndex, bool ascending) {
      notaFiscalModeloDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Nota Fiscal Modelo'),
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
                child: listaNotaFiscalModelo == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(                        
                      header: const Text('Relação - Nota Fiscal Modelo'),
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
                            sort<num>((NotaFiscalModelo notaFiscalModelo) => notaFiscalModelo.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Código do Modelo'),
                          tooltip: 'Código do Modelo',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NotaFiscalModelo notaFiscalModelo) => notaFiscalModelo.codigo, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Descrição'),
                          tooltip: 'Descrição',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NotaFiscalModelo notaFiscalModelo) => notaFiscalModelo.descricao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Modelo'),
                          tooltip: 'Modelo',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NotaFiscalModelo notaFiscalModelo) => notaFiscalModelo.modelo, columnIndex, ascending),
                        ),
                      ],
                      source: notaFiscalModeloDataSource,
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
          NotaFiscalModeloPersistePage(notaFiscalModelo: NotaFiscalModelo(), title: 'Nota Fiscal Modelo - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<NotaFiscalModeloViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Nota Fiscal Modelo - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<NotaFiscalModeloViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<NotaFiscalModeloViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<NotaFiscalModeloViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Nota Fiscal Modelo')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<NotaFiscalModeloViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _NotaFiscalModeloDataSource extends DataTableSource {
  final List<NotaFiscalModelo>? listaNotaFiscalModelo;
  final BuildContext context;

  _NotaFiscalModeloDataSource(this.listaNotaFiscalModelo, this.context);

  void sort<T>(Comparable<T>? Function(NotaFiscalModelo notaFiscalModelo) getField, bool ascending) {
    listaNotaFiscalModelo!.sort((NotaFiscalModelo a, NotaFiscalModelo b) {
      if (!ascending) {
        final NotaFiscalModelo c = a;
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
    if (index >= listaNotaFiscalModelo!.length) return null;
    final NotaFiscalModelo notaFiscalModelo = listaNotaFiscalModelo![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${notaFiscalModelo.id ?? ''}'), onTap: () {
          _detalharNotaFiscalModelo(notaFiscalModelo, context);
        }),
        DataCell(Text(notaFiscalModelo.codigo ?? ''), onTap: () {
          _detalharNotaFiscalModelo(notaFiscalModelo, context);
        }),
        DataCell(Text(notaFiscalModelo.descricao ?? ''), onTap: () {
          _detalharNotaFiscalModelo(notaFiscalModelo, context);
        }),
        DataCell(Text(notaFiscalModelo.modelo ?? ''), onTap: () {
          _detalharNotaFiscalModelo(notaFiscalModelo, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaNotaFiscalModelo!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharNotaFiscalModelo(NotaFiscalModelo notaFiscalModelo, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => 
        NotaFiscalModeloPersistePage(notaFiscalModelo: notaFiscalModelo, title: 'Nota Fiscal Modelo - Editando', operacao: 'A')));
}