/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [NOTA_FISCAL_TIPO] 
                                                                                
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

import 'nota_fiscal_tipo_persiste_page.dart';

class NotaFiscalTipoListaPage extends StatefulWidget {
  const NotaFiscalTipoListaPage({Key? key}) : super(key: key);

  @override
  NotaFiscalTipoListaPageState createState() => NotaFiscalTipoListaPageState();
}

class NotaFiscalTipoListaPageState extends State<NotaFiscalTipoListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = NotaFiscalTipo.colunas;
  final _campos = NotaFiscalTipo.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<NotaFiscalTipoViewModel>(context, listen: false).objetoJsonErro)
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
    final listaNotaFiscalTipo = Provider.of<NotaFiscalTipoViewModel>(context).listaNotaFiscalTipo;
    final objetoJsonErro = Provider.of<NotaFiscalTipoViewModel>(context).objetoJsonErro;

    if (listaNotaFiscalTipo == null && objetoJsonErro == null) {
      Provider.of<NotaFiscalTipoViewModel>(context, listen: false).consultarLista();
    }
  
    final _NotaFiscalTipoDataSource notaFiscalTipoDataSource = _NotaFiscalTipoDataSource(listaNotaFiscalTipo, context);

    void sort<T>(Comparable<T>? Function(NotaFiscalTipo notaFiscalTipo) getField, int columnIndex, bool ascending) {
      notaFiscalTipoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Nota Fiscal Tipo'),
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
                child: listaNotaFiscalTipo == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(                        
                      header: const Text('Relação - Nota Fiscal Tipo'),
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
                            sort<num>((NotaFiscalTipo notaFiscalTipo) => notaFiscalTipo.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Modelo NF'),
                          tooltip: 'Modelo Nota Fiscal',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NotaFiscalTipo notaFiscalTipo) => notaFiscalTipo.notaFiscalModelo?.descricao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Nome'),
                          tooltip: 'Nome',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NotaFiscalTipo notaFiscalTipo) => notaFiscalTipo.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Descrição'),
                          tooltip: 'Descrição',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NotaFiscalTipo notaFiscalTipo) => notaFiscalTipo.descricao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Série'),
                          tooltip: 'Série',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NotaFiscalTipo notaFiscalTipo) => notaFiscalTipo.serie, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Série SCAN'),
                          tooltip: 'Série SCAN',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NotaFiscalTipo notaFiscalTipo) => notaFiscalTipo.serieScan, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Último Número'),
                          tooltip: 'Último Número',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((NotaFiscalTipo notaFiscalTipo) => notaFiscalTipo.ultimoNumero, columnIndex, ascending),
                        ),
                      ],
                      source: notaFiscalTipoDataSource,
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
          NotaFiscalTipoPersistePage(notaFiscalTipo: NotaFiscalTipo(), title: 'Nota Fiscal Tipo - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<NotaFiscalTipoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Nota Fiscal Tipo - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<NotaFiscalTipoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<NotaFiscalTipoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<NotaFiscalTipoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Nota Fiscal Tipo')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<NotaFiscalTipoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _NotaFiscalTipoDataSource extends DataTableSource {
  final List<NotaFiscalTipo>? listaNotaFiscalTipo;
  final BuildContext context;

  _NotaFiscalTipoDataSource(this.listaNotaFiscalTipo, this.context);

  void sort<T>(Comparable<T>? Function(NotaFiscalTipo notaFiscalTipo) getField, bool ascending) {
    listaNotaFiscalTipo!.sort((NotaFiscalTipo a, NotaFiscalTipo b) {
      if (!ascending) {
        final NotaFiscalTipo c = a;
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
    if (index >= listaNotaFiscalTipo!.length) return null;
    final NotaFiscalTipo notaFiscalTipo = listaNotaFiscalTipo![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${notaFiscalTipo.id ?? ''}'), onTap: () {
          _detalharNotaFiscalTipo(notaFiscalTipo, context);
        }),
        DataCell(Text(notaFiscalTipo.notaFiscalModelo?.descricao ?? ''), onTap: () {
          _detalharNotaFiscalTipo(notaFiscalTipo, context);
        }),
        DataCell(Text(notaFiscalTipo.nome ?? ''), onTap: () {
          _detalharNotaFiscalTipo(notaFiscalTipo, context);
        }),
        DataCell(Text(notaFiscalTipo.descricao ?? ''), onTap: () {
          _detalharNotaFiscalTipo(notaFiscalTipo, context);
        }),
        DataCell(Text(notaFiscalTipo.serie ?? ''), onTap: () {
          _detalharNotaFiscalTipo(notaFiscalTipo, context);
        }),
        DataCell(Text(notaFiscalTipo.serieScan ?? ''), onTap: () {
          _detalharNotaFiscalTipo(notaFiscalTipo, context);
        }),
        DataCell(Text('${notaFiscalTipo.ultimoNumero ?? ''}'), onTap: () {
          _detalharNotaFiscalTipo(notaFiscalTipo, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaNotaFiscalTipo!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharNotaFiscalTipo(NotaFiscalTipo notaFiscalTipo, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => 
        NotaFiscalTipoPersistePage(notaFiscalTipo: notaFiscalTipo, title: 'Nota Fiscal Tipo - Editando', operacao: 'A')));
}