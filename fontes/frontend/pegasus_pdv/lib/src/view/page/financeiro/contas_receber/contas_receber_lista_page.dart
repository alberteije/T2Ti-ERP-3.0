/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [CONTAS_RECEBER] 
                                                                                
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
import 'package:backdrop/backdrop.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';

import 'package:pegasus_pdv/src/database/database_classes.dart';
import 'package:pegasus_pdv/src/database/database.dart';

import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:pegasus_pdv/src/infra/atalhos_desktop_web.dart';

import 'package:pegasus_pdv/src/model/model.dart';

import 'package:pegasus_pdv/src/view/shared/view_util_lib.dart';
import 'package:pegasus_pdv/src/view/shared/caixas_de_dialogo.dart';
import 'package:pegasus_pdv/src/view/shared/page/filtro_page.dart';
import 'package:pegasus_pdv/src/view/shared/widgets_caixa.dart';
import 'package:pegasus_pdv/src/view/shared/widgets_input.dart';

import 'contas_receber_persiste_page.dart';

class ContasReceberListaPage extends StatefulWidget {
  const ContasReceberListaPage({Key? key}) : super(key: key);

  @override
  ContasReceberListaPageState createState() => ContasReceberListaPageState();
}

class ContasReceberListaPageState extends State<ContasReceberListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? sortColumnIndex;
  bool sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = ContasReceberDao.colunas;
  final _campos = ContasReceberDao.campos;

  DateTime _dataIni = DateTime.now();
  DateTime _dataFim = DateTime.now();

  String? _statusRecebimento = 'Todos';
  double _totalReceber = 0;
  double _totalRecebido = 0;
  double _totalGeral = 0;
  List<ContasReceberMontado>? _listaContasReceberMontado;

  Map<LogicalKeySet, Intent>? _shortcutMap;
  Map<Type, Action<Intent>>? _actionMap;

  final ScrollController controllerScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _shortcutMap = getAtalhosListaPage();

    _actionMap = <Type, Action<Intent>>{
      AtalhoTelaIntent: CallbackAction<AtalhoTelaIntent>(
        onInvoke: _tratarAcoesAtalhos,
      ),
    };

    WidgetsBinding.instance.addPostFrameCallback((_) => _refrescarTela());
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
    _listaContasReceberMontado = Sessao.db.contasReceberDao.listaContasReceberMontado;

    final _ContasReceberDataSource contasReceberDataSource = _ContasReceberDataSource(_listaContasReceberMontado, context, _refrescarTela);

    void sort<T>(Comparable<T>? Function(ContasReceberMontado contasReceberMontado) getField, int columnIndex, bool ascending) {
      contasReceberDataSource.sort<T>(getField, ascending);
      setState(() {
        sortColumnIndex = columnIndex;
        sortAscending = ascending;
      });
    }

    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        autofocus: true,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Contas a Receber'),
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 90, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: InputDecorator(
                      decoration: getInputDecoration('Data inicial para o Filtro', 'Data inicial para o Filtro', true),
                      child: DatePickerItem(
                        mascara: 'dd/MM/yyyy',
                        dateTime: _dataIni,
                        firstDate: DateTime.parse('1900-01-01'),
                        lastDate: DateTime.parse('2050-01-01'),
                        onChanged: (DateTime? value) {
                          _dataIni = value!;
                          _refrescarTela();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: InputDecorator(
                      decoration: getInputDecoration('Data final para o Filtro', 'Data final para o Filtro', true),
                      child: DatePickerItem(
                        mascara: 'dd/MM/yyyy',
                        dateTime: _dataFim,
                        firstDate: DateTime.parse('1900-01-01'),
                        lastDate: DateTime.parse('2050-01-01'),
                        onChanged: (DateTime? value) {
                          _dataFim = value!;
                          _refrescarTela();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: InputDecorator(
                      decoration: getInputDecoration('Status Recebimento', 'Status Recebimento', true, paddingVertical: 1),
                      isEmpty: _statusRecebimento == null,
                      child: getDropDownButton(_statusRecebimento, (String? newValue) {
                        _statusRecebimento = newValue;
                        _refrescarTela();
                      }, <String>[
                        'Todos',
                        'Receber',
                        'Recebido',
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: _refrescarTela,
            child: BackdropScaffold(
              appBar: BackdropAppBar(
                title: const Text("Relação - Contas Receber"),
                actions: const <Widget>[
                  BackdropToggleButton(
                    icon: AnimatedIcons.list_view,
                  ),
                ],
              ),
              stickyFrontLayer: true,
              backLayer: getResumoTotais(context),
              frontLayer: Scrollbar(
                child: _listaContasReceberMontado == null
                    ? const Center(child: CircularProgressIndicator())
                    : ListView(
                        controller: controllerScroll,
                        padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                        children: <Widget>[
                          PaginatedDataTable(
                            // header: const Text('Relação - Contas Receber'),
                            rowsPerPage: _rowsPerPage!,
                            onRowsPerPageChanged: (int? value) {
                              setState(() {
                                _rowsPerPage = value;
                              });
                            },
                            sortColumnIndex: sortColumnIndex,
                            sortAscending: sortAscending,
                            columns: <DataColumn>[
                              DataColumn(
                                numeric: true,
                                label: const Text('Id'),
                                tooltip: 'Id',
                                onSort: (int columnIndex, bool ascending) => sort<num>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.id, columnIndex, ascending),
                              ),
                              DataColumn(
                                label: const Text('Cliente'),
                                tooltip: 'Conteúdo para o campo Cliente',
                                onSort: (int columnIndex, bool ascending) => sort<String>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.cliente?.nome, columnIndex, ascending),
                              ),
                              DataColumn(
                                label: const Text('Data de Lançamento'),
                                tooltip: 'Data de Lançamento',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<DateTime>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.dataLancamento, columnIndex, ascending),
                              ),
                              DataColumn(
                                label: const Text('Data de Vencimento'),
                                tooltip: 'Data de Vencimento',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<DateTime>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.dataVencimento, columnIndex, ascending),
                              ),
                              DataColumn(
                                label: const Text('Data de Recebimento'),
                                tooltip: 'Data de Recebimento',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<DateTime>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.dataRecebimento, columnIndex, ascending),
                              ),
                              DataColumn(
                                numeric: true,
                                label: const Text('Valor a Receber'),
                                tooltip: 'Valor a Receber',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<num>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.valorAReceber, columnIndex, ascending),
                              ),
                              DataColumn(
                                numeric: true,
                                label: const Text('Taxa Juros'),
                                tooltip: 'Taxa Juros',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<num>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.taxaJuro, columnIndex, ascending),
                              ),
                              DataColumn(
                                numeric: true,
                                label: const Text('Taxa Multa'),
                                tooltip: 'Taxa Multa',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<num>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.taxaMulta, columnIndex, ascending),
                              ),
                              DataColumn(
                                numeric: true,
                                label: const Text('Taxa Desconto'),
                                tooltip: 'Taxa Desconto',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<num>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.taxaDesconto, columnIndex, ascending),
                              ),
                              DataColumn(
                                numeric: true,
                                label: const Text('Valor Juros'),
                                tooltip: 'Valor Juros',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<num>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.valorJuro, columnIndex, ascending),
                              ),
                              DataColumn(
                                numeric: true,
                                label: const Text('Valor Multa'),
                                tooltip: 'Valor Multa',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<num>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.valorMulta, columnIndex, ascending),
                              ),
                              DataColumn(
                                numeric: true,
                                label: const Text('Valor Desconto'),
                                tooltip: 'Valor Desconto',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<num>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.valorDesconto, columnIndex, ascending),
                              ),
                              DataColumn(
                                numeric: true,
                                label: const Text('Valor Recebido'),
                                tooltip: 'Valor Recebido',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<num>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.valorRecebido, columnIndex, ascending),
                              ),
                              DataColumn(
                                label: const Text('Número do Documento'),
                                tooltip: 'Número do Documento',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<String>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.numeroDocumento, columnIndex, ascending),
                              ),
                              DataColumn(
                                label: const Text('Histórico'),
                                tooltip: 'Histórico',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<String>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.historico, columnIndex, ascending),
                              ),
                              DataColumn(
                                label: const Text('Status Recebimento'),
                                tooltip: 'Conteúdo para o campo Status Recebimento',
                                onSort: (int columnIndex, bool ascending) =>
                                    sort<String>((ContasReceberMontado contasReceberMontado) => contasReceberMontado.contasReceber!.statusRecebimento, columnIndex, ascending),
                              ),
                            ],
                            source: contasReceberDataSource,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getResumoTotais(BuildContext context) {
    // _refrescarTela();
    return Scrollbar(
      child: SingleChildScrollView(
        controller: ScrollController(),
        dragStartBehavior: DragStartBehavior.down,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          color: Colors.amber.shade500,
          elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 10.0),
              getItemResumoValor(
                descricao: 'Total a Receber: ',
                valor: 'R\$ ${Constantes.formatoDecimalValor.format(_totalReceber)}',
                corFundo: Colors.blue.shade100,
              ),
              getItemResumoValor(
                descricao: 'Total Recebido: ',
                valor: 'R\$ ${Constantes.formatoDecimalValor.format(_totalRecebido)}',
                corFundo: Colors.red.shade100,
              ),
              getItemResumoValor(
                descricao: 'Total Geral: ',
                valor: 'R\$ ${Constantes.formatoDecimalValor.format(_totalGeral)}',
                corFundo: Colors.green.shade100,
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  void _inserir() {
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (BuildContext context) => ContasReceberPersistePage(
                contasReceberMontado: ContasReceberMontado(
                  cliente: const Cliente(
                    id: null,
                  ),
                  contasReceber: ContasReceber(
                    id: null,
                    dataVencimento: DateTime.now(),
                  ),
                ),
                title: 'Contas a Receber - Inserindo',
                operacao: 'I')))
        .then((_) async {
      await _refrescarTela();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'ContasReceber - Filtro',
            colunas: _colunas,
            campoPesquisaPadrao: 'Nome',
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Sessao.db.contasReceberDao.consultarListaFiltro(_filtro!.campo!, _filtro!.valor!);
        setState(() {});
      }
    }
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxInformacao(context, 'Essa janela não possui relatório implementado');
  }

  Future _refrescarTela() async {
    _listaContasReceberMontado = await Sessao.db.contasReceberDao.consultarListaMontado(dataIni: _dataIni, dataFim: _dataFim, status: _statusRecebimento);
    _atualizarTotais();
    setState(() {});
  }

  _atualizarTotais() {
    _totalReceber = 0;
    _totalRecebido = 0;
    _totalGeral = 0;
    for (ContasReceberMontado contasReceberMontado in _listaContasReceberMontado!) {
      if (contasReceberMontado.contasReceber!.statusRecebimento == 'A') {
        _totalReceber = _totalReceber + (contasReceberMontado.contasReceber!.valorAReceber ?? 0);
      } else if (contasReceberMontado.contasReceber!.statusRecebimento == 'R') {
        _totalRecebido = _totalRecebido + (contasReceberMontado.contasReceber!.valorRecebido ?? 0);
      }
      _totalGeral = _totalGeral + (contasReceberMontado.contasReceber!.valorAReceber ?? 0);
    }
  }
}

/// codigo referente a fonte de dados
class _ContasReceberDataSource extends DataTableSource {
  final List<ContasReceberMontado>? listaContasReceber;
  final BuildContext context;
  final Function refrescarTela;

  _ContasReceberDataSource(this.listaContasReceber, this.context, this.refrescarTela);

  void sort<T>(Comparable<T>? Function(ContasReceberMontado contasReceber) getField, bool ascending) {
    listaContasReceber!.sort((ContasReceberMontado a, ContasReceberMontado b) {
      if (!ascending) {
        final ContasReceberMontado c = a;
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
    if (index >= listaContasReceber!.length) return null;
    final ContasReceberMontado contasReceberMontado = listaContasReceber![index];
    final ContasReceber contasReceber = contasReceberMontado.contasReceber!;
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${contasReceber.id}'), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceberMontado.cliente?.nome ?? ''), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.dataLancamento != null ? DateFormat('dd/MM/yyyy').format(contasReceber.dataLancamento!) : ''), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.dataVencimento != null ? DateFormat('dd/MM/yyyy').format(contasReceber.dataVencimento!) : ''), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.dataRecebimento != null ? DateFormat('dd/MM/yyyy').format(contasReceber.dataRecebimento!) : ''), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.valorAReceber != null ? Constantes.formatoDecimalValor.format(contasReceber.valorAReceber) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.taxaJuro != null ? Constantes.formatoDecimalTaxa.format(contasReceber.taxaJuro) : 0.toStringAsFixed(Constantes.decimaisTaxa)), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.taxaMulta != null ? Constantes.formatoDecimalTaxa.format(contasReceber.taxaMulta) : 0.toStringAsFixed(Constantes.decimaisTaxa)), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.taxaDesconto != null ? Constantes.formatoDecimalTaxa.format(contasReceber.taxaDesconto) : 0.toStringAsFixed(Constantes.decimaisTaxa)), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.valorJuro != null ? Constantes.formatoDecimalValor.format(contasReceber.valorJuro) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.valorMulta != null ? Constantes.formatoDecimalValor.format(contasReceber.valorMulta) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.valorDesconto != null ? Constantes.formatoDecimalValor.format(contasReceber.valorDesconto) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.valorRecebido != null ? Constantes.formatoDecimalValor.format(contasReceber.valorRecebido) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.numeroDocumento ?? ''), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.historico ?? ''), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
        DataCell(Text(contasReceber.statusRecebimento ?? ''), onTap: () {
          _detalharContasReceber(contasReceberMontado, context, refrescarTela);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaContasReceber!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharContasReceber(ContasReceberMontado contasReceberMontado, BuildContext context, Function refrescarTela) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) => ContasReceberPersistePage(contasReceberMontado: contasReceberMontado, title: 'Contas a Receber - Editando', operacao: 'A')))
      .then((_) async {
    await refrescarTela();
  });
}
