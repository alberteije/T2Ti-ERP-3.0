/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [VIEW_FIN_MOVIMENTO_CAIXA_BANCO] 
Resumo da Tesouraria Específico filtrado  pelo período e pela conta-caixa

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

class ResumoTesourariaEspecificoPage extends StatefulWidget {
  final ViewFinMovimentoCaixaBanco? viewFinMovimentoCaixaBanco;

  const ResumoTesourariaEspecificoPage({Key? key, this.viewFinMovimentoCaixaBanco}) : super(key: key);

  @override
  ResumoTesourariaEspecificoPageState createState() => ResumoTesourariaEspecificoPageState();
}

class ResumoTesourariaEspecificoPageState  extends State<ResumoTesourariaEspecificoPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  String _recebimentos = '';
  String _pagamentos = '';
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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<ViewFinMovimentoCaixaBancoViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    String nomeContaCaixa = widget.viewFinMovimentoCaixaBanco!.nomeContaCaixa ?? '';

    var listaViewFinMovimentoCaixaBanco = Provider.of<ViewFinMovimentoCaixaBancoViewModel>(context).listaViewFinMovimentoCaixaBanco;

    final ResumoTesourariaEspecificoDataSource resumoTesourariaEspecificoDataSource = ResumoTesourariaEspecificoDataSource(listaViewFinMovimentoCaixaBanco, context);

    void sort<T>(
        Comparable<T>? Function(
            ViewFinMovimentoCaixaBanco viewFinMovimentoCaixaBanco) getField,
        int columnIndex,
        bool ascending) {
      resumoTesourariaEspecificoDataSource.sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

      return BackdropScaffold( 
        appBar: BackdropAppBar(
          title: const Text("Resumo Tesouraria Conta Caixa"),
          actions: const <Widget>[
            BackdropToggleButton(
              icon: AnimatedIcons.list_view,
            ),
          ],
        ),        
        backLayer: getResumoTotais(context),
        frontLayer: Scrollbar(
          child: listaViewFinMovimentoCaixaBanco == null
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
                              sort<String>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco.operacao,
                                  columnIndex,
                                  ascending),
                        ),
                        DataColumn(
                          label: const Text('Nome Cliente / Fornecedor'),
                          tooltip: 'Nome Cliente / Fornecedor',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<String>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco.nomePessoa,
                                  columnIndex,
                                  ascending),
                        ),
                        DataColumn(
                          label: const Text('Data Lancamento'),
                          tooltip: 'Data Lancamento',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<DateTime>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco
                                          .dataLancamento,
                                  columnIndex,
                                  ascending),
                        ),
                        DataColumn(
                          label: const Text('Data Pago Recebido'),
                          tooltip: 'Data Pago Recebido',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<DateTime>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco
                                          .dataPagoRecebido,
                                  columnIndex,
                                  ascending),
                        ),
                        DataColumn(
                          label: const Text('Historico'),
                          tooltip: 'Historico',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<String>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco.historico,
                                  columnIndex,
                                  ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor'),
                          tooltip: 'Valor',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<num>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco.valor,
                                  columnIndex,
                                  ascending),
                        ),
                        DataColumn(
                          label: const Text('Descricao Documento Origem'),
                          tooltip: 'Descricao Documento Origem',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<String>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco
                                          .descricaoDocumentoOrigem,
                                  columnIndex,
                                  ascending),
                        ),
                      ],
                      source: resumoTesourariaEspecificoDataSource,
                    ),
                  ],
                ),
              ),
            );         
    
  }

  Future filtrar() async {
    // pega os lançamentos filtrados por mes/ano e por conta/caixa
    String montaWhere = '';
    montaWhere = '$montaWhere?filter=DATA_PAGO_RECEBIDO||\$between||${Sessao.filtroGlobal.dataInicial!},${Sessao.filtroGlobal.dataFinal!}';
    montaWhere = '$montaWhere&filter=ID_CONTA_CAIXA||\$eq||${widget.viewFinMovimentoCaixaBanco!.idContaCaixa}';
    Sessao.filtroGlobal.condicao = 'where';
    Sessao.filtroGlobal.where = montaWhere;
    await Provider.of<ViewFinMovimentoCaixaBancoViewModel>(context).consultarLista(filtro: Sessao.filtroGlobal);
    await calcularTotais();
  }

  Future calcularTotais() async {
    double recebimentos = 0;
    double pagamentos = 0;
    double saldo = 0;
    List<ViewFinMovimentoCaixaBanco> listaLancamentos = Provider.of<ViewFinMovimentoCaixaBancoViewModel>(context).listaViewFinMovimentoCaixaBanco!;
    try {
      for (ViewFinMovimentoCaixaBanco objeto in listaLancamentos) {
        if (objeto.operacao == 'Saída') {
          pagamentos = pagamentos + objeto.valor!;
        }
        else if (objeto.operacao == 'Entrada') {
          recebimentos = recebimentos + objeto.valor!;
        }
      }     
      saldo = recebimentos - pagamentos;
      _recebimentos = 'Recebimentos: ${Constantes.formatoDecimalValor.format(recebimentos)}';
      _pagamentos = 'Pagamentos: ${Constantes.formatoDecimalValor.format(pagamentos)}';
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
                _recebimentos,
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
                _pagamentos,
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
class ResumoTesourariaEspecificoDataSource extends DataTableSource {
  final List<ViewFinMovimentoCaixaBanco>? listaViewFinMovimentoCaixaBanco;
  final BuildContext context;

  ResumoTesourariaEspecificoDataSource(this.listaViewFinMovimentoCaixaBanco, this.context);

  void sort<T>(
      Comparable<T>? Function(ViewFinMovimentoCaixaBanco viewFinMovimentoCaixaBanco) getField,
      bool ascending) {
    listaViewFinMovimentoCaixaBanco!
        .sort((ViewFinMovimentoCaixaBanco a, ViewFinMovimentoCaixaBanco b) {
      if (!ascending) {
        final ViewFinMovimentoCaixaBanco c = a;
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
    if (index >= listaViewFinMovimentoCaixaBanco!.length) return null;
    final ViewFinMovimentoCaixaBanco viewFinMovimentoCaixaBanco =
        listaViewFinMovimentoCaixaBanco![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(viewFinMovimentoCaixaBanco.operacao ?? ''),
            onTap: () {
        }),
        DataCell(Text(viewFinMovimentoCaixaBanco.nomePessoa ?? ''),
            onTap: () {
        }),
        DataCell(
            Text(
                viewFinMovimentoCaixaBanco.dataLancamento != null ? DateFormat('dd/MM/yyyy').format(viewFinMovimentoCaixaBanco.dataLancamento!) : ''),
            onTap: () {
        }),
        DataCell(
            Text(
                viewFinMovimentoCaixaBanco.dataPagoRecebido != null ? DateFormat('dd/MM/yyyy').format(viewFinMovimentoCaixaBanco.dataPagoRecebido!) : ''),
            onTap: () {
        }),
        DataCell(Text(viewFinMovimentoCaixaBanco.historico ?? ''),
            onTap: () {
        }),
        DataCell(
            Text(
                viewFinMovimentoCaixaBanco.valor != null ? Constantes.formatoDecimalValor.format(viewFinMovimentoCaixaBanco.valor) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
        }),
        DataCell(
            Text(
                viewFinMovimentoCaixaBanco.descricaoDocumentoOrigem ?? ''),
            onTap: () {
        }),
      ],
    );
  }

  @override
  int get rowCount => listaViewFinMovimentoCaixaBanco!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

}