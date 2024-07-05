/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [REQUISICAO_INTERNA_CABECALHO] 
                                                                                
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

import 'requisicao_interna_cabecalho_page.dart';

class RequisicaoInternaCabecalhoListaPage extends StatefulWidget {
  const RequisicaoInternaCabecalhoListaPage({Key? key}) : super(key: key);

  @override
  RequisicaoInternaCabecalhoListaPageState createState() => RequisicaoInternaCabecalhoListaPageState();
}

class RequisicaoInternaCabecalhoListaPageState extends State<RequisicaoInternaCabecalhoListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = RequisicaoInternaCabecalho.colunas;
  final _campos = RequisicaoInternaCabecalho.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<RequisicaoInternaCabecalhoViewModel>(context, listen: false).objetoJsonErro)
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
    final listaRequisicaoInternaCabecalho = Provider.of<RequisicaoInternaCabecalhoViewModel>(context).listaRequisicaoInternaCabecalho;
    final objetoJsonErro = Provider.of<RequisicaoInternaCabecalhoViewModel>(context).objetoJsonErro;

    if (listaRequisicaoInternaCabecalho == null && objetoJsonErro == null) {
      Provider.of<RequisicaoInternaCabecalhoViewModel>(context, listen: false).consultarLista();
    }

    final _RequisicaoInternaCabecalhoDataSource requisicaoInternaCabecalhoDataSource = _RequisicaoInternaCabecalhoDataSource(listaRequisicaoInternaCabecalho, context);

	void sort<T>(Comparable<T>? Function(RequisicaoInternaCabecalho requisicaoInternaCabecalho) getField, int columnIndex, bool ascending) {
      requisicaoInternaCabecalhoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Requisicao Interna Cabecalho'),
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
                child: listaRequisicaoInternaCabecalho == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                  controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: const Text('Relação - Requisicao Interna Cabecalho'),
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
                            sort<num>((RequisicaoInternaCabecalho requisicaoInternaCabecalho) => requisicaoInternaCabecalho.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Colaborador'),
                          tooltip: 'Colaborador',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((RequisicaoInternaCabecalho requisicaoInternaCabecalho) => requisicaoInternaCabecalho.colaborador?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data da Requisição'),
                          tooltip: 'Data da Requisição',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((RequisicaoInternaCabecalho requisicaoInternaCabecalho) => requisicaoInternaCabecalho.dataRequisicao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Situação da Requisição'),
                          tooltip: 'Situação da Requisição',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((RequisicaoInternaCabecalho requisicaoInternaCabecalho) => requisicaoInternaCabecalho.situacao, columnIndex, ascending),
                        ),
                      ],
                      source: requisicaoInternaCabecalhoDataSource,
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
          RequisicaoInternaCabecalhoPage(requisicaoInternaCabecalho: RequisicaoInternaCabecalho(), title: 'Requisicao Interna Cabecalho - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<RequisicaoInternaCabecalhoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Requisicao Interna Cabecalho - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<RequisicaoInternaCabecalhoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
	    await Provider.of<RequisicaoInternaCabecalhoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
	  } else {
        final arquivoPdf = await Provider.of<RequisicaoInternaCabecalhoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
		    builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Requisicao Interna Cabecalho')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<RequisicaoInternaCabecalhoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _RequisicaoInternaCabecalhoDataSource extends DataTableSource {
  final List<RequisicaoInternaCabecalho>? listaRequisicaoInternaCabecalho;
  final BuildContext context;

  _RequisicaoInternaCabecalhoDataSource(this.listaRequisicaoInternaCabecalho, this.context);

  void sort<T>(Comparable<T>? Function(RequisicaoInternaCabecalho requisicaoInternaCabecalho) getField, bool ascending) {
    listaRequisicaoInternaCabecalho!.sort((RequisicaoInternaCabecalho a, RequisicaoInternaCabecalho b) {
      if (!ascending) {
        final RequisicaoInternaCabecalho c = a;
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
    if (index >= listaRequisicaoInternaCabecalho!.length) return null;
    final RequisicaoInternaCabecalho requisicaoInternaCabecalho = listaRequisicaoInternaCabecalho![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(requisicaoInternaCabecalho.id?.toString() ?? ''), onTap: () {
          _detalharRequisicaoInternaCabecalho(requisicaoInternaCabecalho, context);
        }),
        DataCell(Text(requisicaoInternaCabecalho.colaborador?.pessoa?.nome?.toString() ?? ''), onTap: () {
          _detalharRequisicaoInternaCabecalho(requisicaoInternaCabecalho, context);
        }),
        DataCell(Text(Biblioteca.formatarData(requisicaoInternaCabecalho.dataRequisicao)), onTap: () {
          _detalharRequisicaoInternaCabecalho(requisicaoInternaCabecalho, context);
        }),
        DataCell(Text(requisicaoInternaCabecalho.situacao ?? ''), onTap: () {
          _detalharRequisicaoInternaCabecalho(requisicaoInternaCabecalho, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaRequisicaoInternaCabecalho!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharRequisicaoInternaCabecalho(RequisicaoInternaCabecalho requisicaoInternaCabecalho, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
        RequisicaoInternaCabecalhoPage(requisicaoInternaCabecalho: requisicaoInternaCabecalho, title: 'Requisicao Interna Cabecalho - Editando', operacao: 'A')));
}