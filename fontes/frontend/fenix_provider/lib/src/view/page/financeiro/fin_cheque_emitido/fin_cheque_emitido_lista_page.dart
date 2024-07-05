/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [FIN_CHEQUE_EMITIDO] 
                                                                                
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

import 'package:intl/intl.dart';
import 'fin_cheque_emitido_persiste_page.dart';

class FinChequeEmitidoListaPage extends StatefulWidget {
  const FinChequeEmitidoListaPage({Key? key}) : super(key: key);

  @override
  FinChequeEmitidoListaPageState createState() => FinChequeEmitidoListaPageState();
}

class FinChequeEmitidoListaPageState extends State<FinChequeEmitidoListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = FinChequeEmitido.colunas;
  final _campos = FinChequeEmitido.campos;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<FinChequeEmitidoViewModel>(context, listen: false).objetoJsonErro)
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
    if (Provider.of<FinChequeEmitidoViewModel>(context).listaFinChequeEmitido == null && Provider.of<FinChequeEmitidoViewModel>(context).objetoJsonErro == null) {
      Provider.of<FinChequeEmitidoViewModel>(context, listen: false).consultarLista();
    }
    var listaFinChequeEmitido = Provider.of<FinChequeEmitidoViewModel>(context).listaFinChequeEmitido;

    final _FinChequeEmitidoDataSource finChequeEmitidoDataSource = _FinChequeEmitidoDataSource(listaFinChequeEmitido, context);

    void sort<T>(Comparable<T>? Function(FinChequeEmitido finChequeEmitido) getField, int columnIndex, bool ascending) {
      finChequeEmitidoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Fin Cheque Emitido'),
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
                child: listaFinChequeEmitido == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(                        
                      header: const Text('Relação - Fin Cheque Emitido'),
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
                            sort<num>((FinChequeEmitido finChequeEmitido) => finChequeEmitido.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Cheque'),
                          tooltip: 'Cheque',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinChequeEmitido finChequeEmitido) => finChequeEmitido.cheque?.numero, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data do Status'),
                          tooltip: 'Data do Status',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinChequeEmitido finChequeEmitido) => finChequeEmitido.dataEmissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Cheque Bom Para'),
                          tooltip: 'Cheque Bom Para',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinChequeEmitido finChequeEmitido) => finChequeEmitido.bomPara, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data da Compensação'),
                          tooltip: 'Data da Compensação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinChequeEmitido finChequeEmitido) => finChequeEmitido.dataCompensacao, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor'),
                          tooltip: 'Valor',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinChequeEmitido finChequeEmitido) => finChequeEmitido.valor, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Nominal A'),
                          tooltip: 'Nominal A',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinChequeEmitido finChequeEmitido) => finChequeEmitido.nominalA, columnIndex, ascending),
                        ),
                      ],
                      source: finChequeEmitidoDataSource,
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
            FinChequeEmitidoPersistePage(finChequeEmitido: FinChequeEmitido(), title: 'Fin Cheque Emitido - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<FinChequeEmitidoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Fin Cheque Emitido - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<FinChequeEmitidoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<FinChequeEmitidoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<FinChequeEmitidoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(
              arquivoPdf: arquivoPdf, title: 'Relatório - Fin Cheque Emitido')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<FinChequeEmitidoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _FinChequeEmitidoDataSource extends DataTableSource {
  final List<FinChequeEmitido>? listaFinChequeEmitido;
  final BuildContext context;

  _FinChequeEmitidoDataSource(this.listaFinChequeEmitido, this.context);

  void sort<T>(Comparable<T>? Function(FinChequeEmitido finChequeEmitido) getField, bool ascending) {
    listaFinChequeEmitido!.sort((FinChequeEmitido a, FinChequeEmitido b) {
      if (!ascending) {
        final FinChequeEmitido c = a;
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
    if (index >= listaFinChequeEmitido!.length) return null;
    final FinChequeEmitido finChequeEmitido = listaFinChequeEmitido![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${finChequeEmitido.id ?? ''}'), onTap: () {
          _detalharFinChequeEmitido(finChequeEmitido, context);
        }),
        DataCell(Text('${finChequeEmitido.cheque?.numero ?? ''}'), onTap: () {
          _detalharFinChequeEmitido(finChequeEmitido, context);
        }),
        DataCell(Text(finChequeEmitido.dataEmissao != null ? DateFormat('dd/MM/yyyy').format(finChequeEmitido.dataEmissao!) : ''), onTap: () {
          _detalharFinChequeEmitido(finChequeEmitido, context);
        }),
        DataCell(Text(finChequeEmitido.bomPara != null ? DateFormat('dd/MM/yyyy').format(finChequeEmitido.bomPara!) : ''), onTap: () {
          _detalharFinChequeEmitido(finChequeEmitido, context);
        }),
        DataCell(Text(finChequeEmitido.dataCompensacao != null ? DateFormat('dd/MM/yyyy').format(finChequeEmitido.dataCompensacao!) : ''), onTap: () {
          _detalharFinChequeEmitido(finChequeEmitido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finChequeEmitido.valor ?? 0)), onTap: () {
          _detalharFinChequeEmitido(finChequeEmitido, context);
        }),
        DataCell(Text(finChequeEmitido.nominalA ?? ''), onTap: () {
          _detalharFinChequeEmitido(finChequeEmitido, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaFinChequeEmitido!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharFinChequeEmitido(FinChequeEmitido finChequeEmitido, BuildContext context) {
   Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => FinChequeEmitidoPersistePage(
          finChequeEmitido: finChequeEmitido,
          title: 'Fin Cheque Emitido - Editando',
          operacao: 'A')));

  /*Navigator.pushNamed(
    context,
    '/finChequeEmitidoDetalhe',
    arguments: finChequeEmitido,
  );*/
}