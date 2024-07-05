/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [OS_ABERTURA] 
                                                                                
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
import 'package:extended_masked_text/extended_masked_text.dart';
import 'os_abertura_page.dart';

class OsAberturaListaPage extends StatefulWidget {
  const OsAberturaListaPage({Key? key}) : super(key: key);

  @override
  OsAberturaListaPageState createState() => OsAberturaListaPageState();
}

class OsAberturaListaPageState extends State<OsAberturaListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = OsAbertura.colunas;
  final _campos = OsAbertura.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<OsAberturaViewModel>(context, listen: false).objetoJsonErro)
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
    final listaOsAbertura = Provider.of<OsAberturaViewModel>(context).listaOsAbertura;
    final objetoJsonErro = Provider.of<OsAberturaViewModel>(context).objetoJsonErro;

    if (listaOsAbertura == null && objetoJsonErro == null) {
      Provider.of<OsAberturaViewModel>(context, listen: false).consultarLista();
    }

    final _OsAberturaDataSource osAberturaDataSource = _OsAberturaDataSource(listaOsAbertura, context);

    void sort<T>(Comparable<T>? Function(OsAbertura osAbertura) getField, int columnIndex, bool ascending) {
      osAberturaDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Os Abertura'),
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
                child: listaOsAbertura == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: const Text('Relação - Os Abertura'),
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
                            sort<num>((OsAbertura osAbertura) => osAbertura.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Status'),
                          tooltip: 'Status',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((OsAbertura osAbertura) => osAbertura.osStatus?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Cliente'),
                          tooltip: 'Cliente',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((OsAbertura osAbertura) => osAbertura.cliente?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Colaborador'),
                          tooltip: 'Colaborador',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((OsAbertura osAbertura) => osAbertura.colaborador?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Número'),
                          tooltip: 'Número',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((OsAbertura osAbertura) => osAbertura.numero, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data Inicial'),
                          tooltip: 'Data Inicial',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((OsAbertura osAbertura) => osAbertura.dataInicio, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Hora Inicial'),
                          tooltip: 'Hora Inicial',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((OsAbertura osAbertura) => osAbertura.horaInicio, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data Prevista'),
                          tooltip: 'Data Prevista',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((OsAbertura osAbertura) => osAbertura.dataPrevisao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Hora Prevista'),
                          tooltip: 'Hora Prevista',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((OsAbertura osAbertura) => osAbertura.horaPrevisao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data Final'),
                          tooltip: 'Data Final',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((OsAbertura osAbertura) => osAbertura.dataFim, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Hora Final'),
                          tooltip: 'Hora Final',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((OsAbertura osAbertura) => osAbertura.horaFim, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Nome do Contato'),
                          tooltip: 'Nome do Contato',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((OsAbertura osAbertura) => osAbertura.nomeContato, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Telefone do Contato'),
                          tooltip: 'Telefone do Contato',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((OsAbertura osAbertura) => osAbertura.foneContato, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Observação Cliente'),
                          tooltip: 'Observação Cliente',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((OsAbertura osAbertura) => osAbertura.observacaoCliente, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Observação Abertura'),
                          tooltip: 'Observação Abertura',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((OsAbertura osAbertura) => osAbertura.observacaoAbertura, columnIndex, ascending),
                        ),
                      ],
                      source: osAberturaDataSource,
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
          OsAberturaPage(osAbertura: OsAbertura(), title: 'Os Abertura - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<OsAberturaViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Os Abertura - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<OsAberturaViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
	    await Provider.of<OsAberturaViewModel>(context).visualizarPdfWeb(filtro: _filtro);
	  } else {
        final arquivoPdf = await Provider.of<OsAberturaViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
		    builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Os Abertura')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<OsAberturaViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _OsAberturaDataSource extends DataTableSource {
  final List<OsAbertura>? listaOsAbertura;
  final BuildContext context;

  _OsAberturaDataSource(this.listaOsAbertura, this.context);

  void sort<T>(Comparable<T>? Function(OsAbertura osAbertura) getField, bool ascending) {
    listaOsAbertura!.sort((OsAbertura a, OsAbertura b) {
      if (!ascending) {
        final OsAbertura c = a;
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
    if (index >= listaOsAbertura!.length) return null;
    final OsAbertura osAbertura = listaOsAbertura![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${osAbertura.id ?? ''}'), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(osAbertura.osStatus?.nome ?? ''), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(osAbertura.cliente?.pessoa?.nome ?? ''), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(osAbertura.colaborador?.pessoa?.nome ?? ''), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(osAbertura.numero ?? ''), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(osAbertura.dataInicio != null ? DateFormat('dd/MM/yyyy').format(osAbertura.dataInicio!) : ''), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(MaskedTextController(text: osAbertura.horaInicio, mask: Constantes.mascaraHORA).text), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(osAbertura.dataPrevisao != null ? DateFormat('dd/MM/yyyy').format(osAbertura.dataPrevisao!) : ''), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(MaskedTextController(text: osAbertura.horaPrevisao, mask: Constantes.mascaraHORA).text), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(osAbertura.dataFim != null ? DateFormat('dd/MM/yyyy').format(osAbertura.dataFim!) : ''), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(MaskedTextController(text: osAbertura.horaFim, mask: Constantes.mascaraHORA).text), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(osAbertura.nomeContato ?? ''), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(MaskedTextController(text: osAbertura.foneContato, mask: Constantes.mascaraTELEFONE).text), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(osAbertura.observacaoCliente ?? ''), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
        DataCell(Text(osAbertura.observacaoAbertura ?? ''), onTap: () {
          _detalharOsAbertura(osAbertura, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaOsAbertura!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharOsAbertura(OsAbertura osAbertura, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
        OsAberturaPage(osAbertura: osAbertura, title: 'Os Abertura - Editando', operacao: 'A')));
}