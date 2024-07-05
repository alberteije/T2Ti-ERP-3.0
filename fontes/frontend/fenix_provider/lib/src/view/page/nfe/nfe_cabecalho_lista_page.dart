/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [NFE_CABECALHO] 
                                                                                
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
import 'package:fenix/src/infra/biblioteca.dart';
import 'package:fenix/src/infra/sessao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

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
import 'nfe_cabecalho_page.dart';

class NfeCabecalhoListaPage extends StatefulWidget {
  const NfeCabecalhoListaPage({Key? key}) : super(key: key);

  @override
  NfeCabecalhoListaPageState createState() => NfeCabecalhoListaPageState();
}

class NfeCabecalhoListaPageState extends State<NfeCabecalhoListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = NfeCabecalho.colunas;
  final _campos = NfeCabecalho.campos;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<NfeCabecalhoViewModel>(context, listen: false).objetoJsonErro)
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

    Sessao.filtroGlobal.condicao = 'eq';
    Sessao.filtroGlobal.campo = 'TIPO_OPERACAO';
    Sessao.filtroGlobal.valor = '1';     
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
    if (Provider.of<NfeCabecalhoViewModel>(context).listaNfeCabecalho == null && Provider.of<NfeCabecalhoViewModel>(context).objetoJsonErro == null) {
      Provider.of<NfeCabecalhoViewModel>(context, listen: false).consultarLista(filtro: Sessao.filtroGlobal);
    }     
    var listaNfeCabecalho = Provider.of<NfeCabecalhoViewModel>(context).listaNfeCabecalho;

    final _NfeCabecalhoDataSource nfeCabecalhoDataSource = _NfeCabecalhoDataSource(listaNfeCabecalho, context);

    void sort<T>(Comparable<T>? Function(NfeCabecalho nfeCabecalho) getField, int columnIndex, bool ascending) {
      nfeCabecalhoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - NF-e'),
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
                child: listaNfeCabecalho == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: const Text('Relação - NF-e'),
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
                          label: const Text('Cliente'),
                          tooltip: 'Cliente',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NfeCabecalho nfeCabecalho) => nfeCabecalho.cliente?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Operação Fiscal'),
                          tooltip: 'Operação Fiscal',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NfeCabecalho nfeCabecalho) => nfeCabecalho.tributOperacaoFiscal?.descricao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Natureza da Operação'),
                          tooltip: 'Natureza da Operação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NfeCabecalho nfeCabecalho) => nfeCabecalho.naturezaOperacao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Série'),
                          tooltip: 'Série',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NfeCabecalho nfeCabecalho) => nfeCabecalho.serie, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Número'),
                          tooltip: 'Número',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((NfeCabecalho nfeCabecalho) => nfeCabecalho.numero, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data/Hora Emissão'),
                          tooltip: 'Data/Hora Emissão',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((NfeCabecalho nfeCabecalho) => nfeCabecalho.dataHoraEmissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Total NF'),
                          tooltip: 'Valor Total NF',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((NfeCabecalho nfeCabecalho) => nfeCabecalho.valorTotal, columnIndex, ascending),
                        ),
                        // DataColumn(
                        //   label: const Text('Status Nota'),
                        //   tooltip: 'Status Nota',
                        //   onSort: (int columnIndex, bool ascending) =>
                        //     sort<String>((NfeCabecalho nfeCabecalho) => nfeCabecalho.statusNota, columnIndex, ascending),
                        // ),
                      ],
                      source: nfeCabecalhoDataSource,
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
          NfeCabecalhoPage(nfeCabecalho: NfeCabecalho(), title: 'NF-e - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<NfeCabecalhoViewModel>(context, listen: false).consultarLista(filtro: Sessao.filtroGlobal);
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'NF-e - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<NfeCabecalhoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
        context, Constantes.perguntaGerarRelatorio, () async {
        Navigator.of(context).pop();

        if (kIsWeb) {
          await Provider.of<NfeCabecalhoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
        } else {
          final arquivoPdf = await Provider.of<NfeCabecalhoViewModel>(context).visualizarPdf(filtro: _filtro);
          if (!mounted) return;
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (BuildContext context) => PdfPage(
                      arquivoPdf: arquivoPdf, title: 'Relatório - NF-e')));
        }
      });
  }

  Future _refrescarTela() async {
    await Provider.of<NfeCabecalhoViewModel>(context, listen: false).consultarLista(filtro: Sessao.filtroGlobal);
    return null;
  }
}

/// codigo referente a fonte de dados
class _NfeCabecalhoDataSource extends DataTableSource {
  final List<NfeCabecalho>? listaNfeCabecalho;
  final BuildContext context;

  _NfeCabecalhoDataSource(this.listaNfeCabecalho, this.context);

  void sort<T>(Comparable<T>? Function(NfeCabecalho nfeCabecalho) getField, bool ascending) {
    listaNfeCabecalho!.sort((NfeCabecalho a, NfeCabecalho b) {
      if (!ascending) {
        final NfeCabecalho c = a;
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
    if (index >= listaNfeCabecalho!.length) return null;
    final NfeCabecalho nfeCabecalho = listaNfeCabecalho![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(nfeCabecalho.cliente?.pessoa?.nome ?? ''), onTap: () {
          _detalharNfeCabecalho(nfeCabecalho, context);
        }),
        DataCell(Text(nfeCabecalho.tributOperacaoFiscal?.descricao ?? ''), onTap: () {
          _detalharNfeCabecalho(nfeCabecalho, context);
        }),
        DataCell(Text(nfeCabecalho.naturezaOperacao ?? ''), onTap: () {
          _detalharNfeCabecalho(nfeCabecalho, context);
        }),
        DataCell(Text(nfeCabecalho.serie ?? ''), onTap: () {
          _detalharNfeCabecalho(nfeCabecalho, context);
        }),
        DataCell(Text(nfeCabecalho.numero ?? ''), onTap: () {
          _detalharNfeCabecalho(nfeCabecalho, context);
        }),
        DataCell(Text(Biblioteca.formatarData(nfeCabecalho.dataHoraEmissao)), onTap: () {
          _detalharNfeCabecalho(nfeCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(nfeCabecalho.valorTotal ?? 0)), onTap: () {
          _detalharNfeCabecalho(nfeCabecalho, context);
        }),
        // DataCell(Text(nfeCabecalho.statusNota ?? ''), onTap: () {
        //   _detalharNfeCabecalho(nfeCabecalho, context);
        // }),
      ],
    );
  }

  @override
  int get rowCount => listaNfeCabecalho!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharNfeCabecalho(NfeCabecalho nfeCabecalho, BuildContext context) {
  Navigator.of(context)
    .push(MaterialPageRoute(
        builder: (BuildContext context) =>
        NfeCabecalhoPage(nfeCabecalho: nfeCabecalho, title: 'Nf-e - Editando', operacao: 'A')));
	
  /*Navigator.pushNamed(
    context,
    '/nfeCabecalhoDetalhe',
    arguments: nfeCabecalho,
  );*/
}