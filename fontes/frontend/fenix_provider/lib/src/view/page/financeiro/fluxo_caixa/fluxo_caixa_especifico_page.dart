/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [VIEW_FIN_FLUXO_CAIXA] 
Fluxo de Caixa Específico filtrado pelo período e pela conta-caixa

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
import 'package:backdrop/backdrop.dart';
import 'package:fenix/src/infra/sessao.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';
import 'package:fenix/src/infra/constantes.dart';
import 'package:intl/intl.dart';

class FluxoCaixaEspecificoPage extends StatefulWidget {
  final ViewFinFluxoCaixa? viewFinFluxoCaixa;

  const FluxoCaixaEspecificoPage({Key? key, this.viewFinFluxoCaixa}) : super(key: key);

  @override
  FluxoCaixaEspecificoPageState createState() => FluxoCaixaEspecificoPageState();
}

class FluxoCaixaEspecificoPageState  extends State<FluxoCaixaEspecificoPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  String _aReceber = '';
  String _aPagar = '';
  String _saldo = '';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => filtrar());
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<ViewFinFluxoCaixaViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    String nomeContaCaixa = widget.viewFinFluxoCaixa!.nomeContaCaixa ?? '';

    var listaViewFinFluxoCaixa = Provider.of<ViewFinFluxoCaixaViewModel>(context).listaViewFinFluxoCaixa;

    final FluxoCaixaEspecificoDataSource resumoFluxoCaixaEspecificoDataSource = FluxoCaixaEspecificoDataSource(listaViewFinFluxoCaixa, context);

    void sort<T>(
        Comparable<T>? Function(
            ViewFinFluxoCaixa viewFinFluxoCaixa) getField,
        int columnIndex,
        bool ascending) {
      resumoFluxoCaixaEspecificoDataSource.sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

      return BackdropScaffold( 
        appBar: BackdropAppBar(
          title: const Text("Fluxo de Caixa Conta/Caixa"),
          actions: const <Widget>[
            BackdropToggleButton(
              icon: AnimatedIcons.list_view,
            ),
          ],
        ),        
        backLayer: getResumoTotais(context),
        frontLayer: Scrollbar(
          child: listaViewFinFluxoCaixa == null
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(8.0),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: Text(nomeContaCaixa),
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
                              label: const Text('Operacao'),
                              tooltip: 'Operacao',
                              onSort: (int columnIndex, bool ascending) =>
                                sort<String>((ViewFinFluxoCaixa viewFinFluxoCaixa) => viewFinFluxoCaixa.operacao,
                                columnIndex, ascending),
                            ),
                            DataColumn(
                              label: const Text('Nome Cliente/Fornecedor'),
                              tooltip: 'Nome Cliente/Fornecedor',
                              onSort: (int columnIndex, bool ascending) =>
                                sort<String>((ViewFinFluxoCaixa viewFinFluxoCaixa) => viewFinFluxoCaixa.nomePessoa,
                                columnIndex, ascending),
                            ),
                            DataColumn(
                              label: const Text('Data Lancamento'),
                              tooltip: 'Data Lancamento',
                              onSort: (int columnIndex, bool ascending) =>
                                sort<DateTime>((ViewFinFluxoCaixa viewFinFluxoCaixa) => viewFinFluxoCaixa.dataLancamento,
                                columnIndex, ascending),
                            ),
                            DataColumn(
                              label: const Text('Data Vencimento'),
                              tooltip: 'Data Vencimento',
                              onSort: (int columnIndex, bool ascending) =>
                                sort<DateTime>((ViewFinFluxoCaixa viewFinFluxoCaixa) => viewFinFluxoCaixa.dataVencimento,
                                columnIndex, ascending),
                            ),
                            DataColumn(
                              numeric: true,
                              label: const Text('Valor'),
                              tooltip: 'Valor',
                              onSort: (int columnIndex, bool ascending) =>
                                sort<num>((ViewFinFluxoCaixa viewFinFluxoCaixa) => viewFinFluxoCaixa.valor,
                                columnIndex, ascending),
                            ),
                            DataColumn(
                              label: const Text('Codigo Situacao'),
                              tooltip: 'Codigo Situacao',
                              onSort: (int columnIndex, bool ascending) =>
                                sort<String>((ViewFinFluxoCaixa viewFinFluxoCaixa) => viewFinFluxoCaixa.codigoSituacao,
                                columnIndex, ascending),
                            ),
                            DataColumn(
                              label: const Text('Descricao Situacao'),
                              tooltip: 'Descricao Situacao',
                              onSort: (int columnIndex, bool ascending) =>
                                sort<String>((ViewFinFluxoCaixa viewFinFluxoCaixa) => viewFinFluxoCaixa.descricaoSituacao,
                                columnIndex, ascending),
                            ),
                      ],
                      source: resumoFluxoCaixaEspecificoDataSource,
                    ),
                  ],
                ),
              ),
            );         
    
  }

  Future filtrar() async {
    // pega os lançamentos filtrados por mes/ano e por conta/caixa
    String montaWhere = '';
    montaWhere = '$montaWhere?filter=DATA_VENCIMENTO||\$between||${Sessao.filtroGlobal.dataInicial!},${Sessao.filtroGlobal.dataFinal!}';
    montaWhere = '$montaWhere&filter=ID_CONTA_CAIXA||\$eq||${widget.viewFinFluxoCaixa!.idContaCaixa}';
    Sessao.filtroGlobal.condicao = 'where';
    Sessao.filtroGlobal.where = montaWhere;
    await Provider.of<ViewFinFluxoCaixaViewModel>(context).consultarLista(filtro: Sessao.filtroGlobal);
    await calcularTotais();
  }

  Future calcularTotais() async {
    double aReceber = 0;
    double aPagar = 0;
    double saldo = 0;
    List<ViewFinFluxoCaixa> listaLancamentos = Provider.of<ViewFinFluxoCaixaViewModel>(context).listaViewFinFluxoCaixa!;
    try {
      for (ViewFinFluxoCaixa objeto in listaLancamentos) {
        if (objeto.operacao == 'Saída') {
          aPagar = aPagar + objeto.valor!;
        }
        else if (objeto.operacao == 'Entrada') {
          aReceber = aReceber + objeto.valor!;
        }
      }     
      saldo = aReceber - aPagar;
      _aReceber = 'A Receber: ${Constantes.formatoDecimalValor.format(aReceber)}';
      _aPagar = 'A Pagar: ${Constantes.formatoDecimalValor.format(aPagar)}';
      _saldo = 'Saldo: ${Constantes.formatoDecimalValor.format(saldo)}';
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Widget getResumoTotais(BuildContext context) {
    return Scrollbar(
    child: SingleChildScrollView(
      dragStartBehavior: DragStartBehavior.down,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: Colors.white,
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 10.0),
            Card(
              color: Colors.blue.shade100,
              elevation: 10,
              child: Container (
                padding: const EdgeInsets.all(8.0),
                height: 35,
                child: Text(
                _aReceber,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontFamily: Constantes.ralewayFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              color: Colors.red.shade100,
              elevation: 10,
              child: Container (
                padding: const EdgeInsets.all(8.0),
                height: 35,
                child: Text(
                _aPagar,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontFamily: Constantes.ralewayFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              color: Colors.green.shade100,
              elevation: 10,
              child: Container (
                padding: const EdgeInsets.all(8.0),
                height: 35,
                child: Text(
                _saldo,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontFamily: Constantes.ralewayFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
          ],),
        ),
      ),
    );    
  }  

}

/// codigo referente a fonte de dados
class FluxoCaixaEspecificoDataSource extends DataTableSource {
  final List<ViewFinFluxoCaixa>? listaViewFinFluxoCaixa;
  final BuildContext context;

  FluxoCaixaEspecificoDataSource(this.listaViewFinFluxoCaixa, this.context);

  void sort<T>(
      Comparable<T>? Function(ViewFinFluxoCaixa viewFinFluxoCaixa) getField,
      bool ascending) {
    listaViewFinFluxoCaixa!
        .sort((ViewFinFluxoCaixa a, ViewFinFluxoCaixa b) {
      if (!ascending) {
        final ViewFinFluxoCaixa c = a;
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
    if (index >= listaViewFinFluxoCaixa!.length) return null;
    final ViewFinFluxoCaixa viewFinFluxoCaixa =
        listaViewFinFluxoCaixa![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(viewFinFluxoCaixa.operacao ?? ''), onTap: () {
        }),
        DataCell(Text(viewFinFluxoCaixa.nomePessoa ?? ''), onTap: () {
        }),
        DataCell(Text(viewFinFluxoCaixa.dataLancamento != null ? DateFormat('dd/MM/yyyy').format(viewFinFluxoCaixa.dataLancamento!) : ''), onTap: () {
        }),
        DataCell(Text(viewFinFluxoCaixa.dataVencimento != null ? DateFormat('dd/MM/yyyy').format(viewFinFluxoCaixa.dataVencimento!) : ''), onTap: () {
        }),
        DataCell(Text(viewFinFluxoCaixa.valor != null ? Constantes.formatoDecimalValor.format(viewFinFluxoCaixa.valor) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
        }),
        DataCell(Text(viewFinFluxoCaixa.codigoSituacao ?? ''), onTap: () {
        }),
        DataCell(Text(viewFinFluxoCaixa.descricaoSituacao ?? ''), onTap: () {
        }),
      ],
    );
  }

  @override
  int get rowCount => listaViewFinFluxoCaixa!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

}