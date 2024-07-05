/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [TRIBUT_ICMS_CUSTOM_CAB] 
                                                                                
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

import 'tribut_icms_custom_cab_page.dart';

class TributIcmsCustomCabListaPage extends StatefulWidget {
  const TributIcmsCustomCabListaPage({Key? key}) : super(key: key);

  @override
  TributIcmsCustomCabListaPageState createState() => TributIcmsCustomCabListaPageState();
}

class TributIcmsCustomCabListaPageState extends State<TributIcmsCustomCabListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = TributIcmsCustomCab.colunas;
  final _campos = TributIcmsCustomCab.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<TributIcmsCustomCabViewModel>(context, listen: false).objetoJsonErro)
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
    final listaTributIcmsCustomCab = Provider.of<TributIcmsCustomCabViewModel>(context).listaTributIcmsCustomCab;
    final objetoJsonErro = Provider.of<TributIcmsCustomCabViewModel>(context).objetoJsonErro;

    if (listaTributIcmsCustomCab == null && objetoJsonErro == null) {
      Provider.of<TributIcmsCustomCabViewModel>(context, listen: false).consultarLista();
    }

    final _TributIcmsCustomCabDataSource tributIcmsCustomCabDataSource = _TributIcmsCustomCabDataSource(listaTributIcmsCustomCab, context);

    void sort<T>(Comparable<T>? Function(TributIcmsCustomCab tributIcmsCustomCab) getField, int columnIndex, bool ascending) {
      tributIcmsCustomCabDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Tribut Icms Custom Cab'),
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
                child: listaTributIcmsCustomCab == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: const Text('Relação - Tribut Icms Custom Cab'),
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
                            sort<num>((TributIcmsCustomCab tributIcmsCustomCab) => tributIcmsCustomCab.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Descrição'),
                          tooltip: 'Descrição',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((TributIcmsCustomCab tributIcmsCustomCab) => tributIcmsCustomCab.descricao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Origem da Mercadoria'),
                          tooltip: 'Origem da Mercadoria',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((TributIcmsCustomCab tributIcmsCustomCab) => tributIcmsCustomCab.origemMercadoria, columnIndex, ascending),
                        ),
                      ],
                      source: tributIcmsCustomCabDataSource,
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
          TributIcmsCustomCabPage(tributIcmsCustomCab: TributIcmsCustomCab(), title: 'Tribut Icms Custom Cab - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<TributIcmsCustomCabViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Tribut Icms Custom Cab - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<TributIcmsCustomCabViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
	    await Provider.of<TributIcmsCustomCabViewModel>(context).visualizarPdfWeb(filtro: _filtro);
	  } else {
        final arquivoPdf = await Provider.of<TributIcmsCustomCabViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
		    builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Tribut Icms Custom Cab')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<TributIcmsCustomCabViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _TributIcmsCustomCabDataSource extends DataTableSource {
  final List<TributIcmsCustomCab>? listaTributIcmsCustomCab;
  final BuildContext context;

  _TributIcmsCustomCabDataSource(this.listaTributIcmsCustomCab, this.context);

  void sort<T>(Comparable<T>? Function(TributIcmsCustomCab tributIcmsCustomCab) getField, bool ascending) {
    listaTributIcmsCustomCab!.sort((TributIcmsCustomCab a, TributIcmsCustomCab b) {
      if (!ascending) {
        final TributIcmsCustomCab c = a;
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
    if (index >= listaTributIcmsCustomCab!.length) return null;
    final TributIcmsCustomCab tributIcmsCustomCab = listaTributIcmsCustomCab![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${tributIcmsCustomCab.id ?? ''}'), onTap: () {
          _detalharTributIcmsCustomCab(tributIcmsCustomCab, context);
        }),
        DataCell(Text(tributIcmsCustomCab.descricao ?? ''), onTap: () {
          _detalharTributIcmsCustomCab(tributIcmsCustomCab, context);
        }),
        DataCell(Text(tributIcmsCustomCab.origemMercadoria ?? ''), onTap: () {
          _detalharTributIcmsCustomCab(tributIcmsCustomCab, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaTributIcmsCustomCab!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharTributIcmsCustomCab(TributIcmsCustomCab tributIcmsCustomCab, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
        TributIcmsCustomCabPage(tributIcmsCustomCab: tributIcmsCustomCab, title: 'Tribut Icms Custom Cab - Editando', operacao: 'A')));
}