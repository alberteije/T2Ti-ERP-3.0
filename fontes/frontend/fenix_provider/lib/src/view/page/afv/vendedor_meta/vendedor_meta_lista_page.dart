/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [VENDEDOR_META] 
                                                                                
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

import 'package:intl/intl.dart';
import 'vendedor_meta_persiste_page.dart';

class VendedorMetaListaPage extends StatefulWidget {
  const VendedorMetaListaPage({Key? key}) : super(key: key);

  @override
  VendedorMetaListaPageState createState() => VendedorMetaListaPageState();
}

class VendedorMetaListaPageState extends State<VendedorMetaListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = VendedorMeta.colunas;
  final _campos = VendedorMeta.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<VendedorMetaViewModel>(context, listen: false).objetoJsonErro)
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
    final listaVendedorMeta = Provider.of<VendedorMetaViewModel>(context).listaVendedorMeta;
    final objetoJsonErro = Provider.of<VendedorMetaViewModel>(context).objetoJsonErro;

    if (listaVendedorMeta == null && objetoJsonErro == null) {
      Provider.of<VendedorMetaViewModel>(context, listen: false).consultarLista();
    }
  
    final _VendedorMetaDataSource vendedorMetaDataSource = _VendedorMetaDataSource(listaVendedorMeta, context);

    void sort<T>(Comparable<T>? Function(VendedorMeta vendedorMeta) getField, int columnIndex, bool ascending) {
      vendedorMetaDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Vendedor Meta'),
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
                child: listaVendedorMeta == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(                        
                      header: const Text('Relação - Vendedor Meta'),
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
                            sort<num>((VendedorMeta vendedorMeta) => vendedorMeta.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Vendedor'),
                          tooltip: 'Vendedor',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendedorMeta vendedorMeta) => vendedorMeta.vendedor?.colaborador?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Cliente'),
                          tooltip: 'Cliente',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendedorMeta vendedorMeta) => vendedorMeta.cliente?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Período'),
                          tooltip: 'Período',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendedorMeta vendedorMeta) => vendedorMeta.periodoMeta, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Meta Orçada'),
                          tooltip: 'Meta Orçada',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendedorMeta vendedorMeta) => vendedorMeta.metaOrcada, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Meta Realizada'),
                          tooltip: 'Meta Realizada',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendedorMeta vendedorMeta) => vendedorMeta.metaRealizada, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data Inicial'),
                          tooltip: 'Data Inicial',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((VendedorMeta vendedorMeta) => vendedorMeta.dataInicio, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data Final'),
                          tooltip: 'Data Final',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((VendedorMeta vendedorMeta) => vendedorMeta.dataFim, columnIndex, ascending),
                        ),
                      ],
                      source: vendedorMetaDataSource,
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
          VendedorMetaPersistePage(vendedorMeta: VendedorMeta(), title: 'Vendedor Meta - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<VendedorMetaViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Vendedor Meta - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<VendedorMetaViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<VendedorMetaViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<VendedorMetaViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Vendedor Meta')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<VendedorMetaViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _VendedorMetaDataSource extends DataTableSource {
  final List<VendedorMeta>? listaVendedorMeta;
  final BuildContext context;

  _VendedorMetaDataSource(this.listaVendedorMeta, this.context);

  void sort<T>(Comparable<T>? Function(VendedorMeta vendedorMeta) getField, bool ascending) {
    listaVendedorMeta!.sort((VendedorMeta a, VendedorMeta b) {
      if (!ascending) {
        final VendedorMeta c = a;
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
    if (index >= listaVendedorMeta!.length) return null;
    final VendedorMeta vendedorMeta = listaVendedorMeta![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${vendedorMeta.id ?? ''}'), onTap: () {
          _detalharVendedorMeta(vendedorMeta, context);
        }),
        DataCell(Text(vendedorMeta.vendedor?.colaborador?.pessoa?.nome ?? ''), onTap: () {
          _detalharVendedorMeta(vendedorMeta, context);
        }),
        DataCell(Text(vendedorMeta.cliente?.pessoa?.nome ?? ''), onTap: () {
          _detalharVendedorMeta(vendedorMeta, context);
        }),
        DataCell(Text(vendedorMeta.periodoMeta ?? ''), onTap: () {
          _detalharVendedorMeta(vendedorMeta, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendedorMeta.metaOrcada ?? 0)), onTap: () {
          _detalharVendedorMeta(vendedorMeta, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendedorMeta.metaRealizada ?? 0)), onTap: () {
          _detalharVendedorMeta(vendedorMeta, context);
        }),
        DataCell(Text(vendedorMeta.dataInicio != null ? DateFormat('dd/MM/yyyy').format(vendedorMeta.dataInicio!) : ''), onTap: () {
          _detalharVendedorMeta(vendedorMeta, context);
        }),
        DataCell(Text(vendedorMeta.dataFim != null ? DateFormat('dd/MM/yyyy').format(vendedorMeta.dataFim!) : ''), onTap: () {
          _detalharVendedorMeta(vendedorMeta, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaVendedorMeta!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharVendedorMeta(VendedorMeta vendedorMeta, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => 
        VendedorMetaPersistePage(vendedorMeta: vendedorMeta, title: 'Vendedor Meta - Editando', operacao: 'A')));
}