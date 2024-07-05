// ignore_for_file: use_build_context_synchronously

/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [VIEW_FIN_LANCAMENTO_RECEBER] 
                                                                                
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
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/infra/constantes.dart';
import 'package:intl/intl.dart';

class ViewFinLancamentoReceberListaPage extends StatefulWidget {
  const ViewFinLancamentoReceberListaPage({Key? key}) : super(key: key);

  @override
  ViewFinLancamentoReceberListaPageState createState() => ViewFinLancamentoReceberListaPageState();
}

class ViewFinLancamentoReceberListaPageState extends State<ViewFinLancamentoReceberListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  DateTime _dataInicial = DateTime.now();
  DateTime _dataFinal = DateTime.now();
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<ViewFinLancamentoReceberViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<ViewFinLancamentoReceberViewModel>(context).listaViewFinLancamentoReceber == null && Provider.of<ViewFinLancamentoReceberViewModel>(context).objetoJsonErro == null) {
      filtrar();
    }
    var listaViewFinLancamentoReceber = Provider.of<ViewFinLancamentoReceberViewModel>(context).listaViewFinLancamentoReceber;

    final ViewFinLancamentoReceberDataSource viewFinLancamentoReceberDataSource =
        ViewFinLancamentoReceberDataSource(listaViewFinLancamentoReceber, context);

    void sort<T>(Comparable<T>? Function(ViewFinLancamentoReceber viewFinLancamentoReceber) getField, int columnIndex, bool ascending) {
      viewFinLancamentoReceberDataSource.sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

      return Scaffold(
        appBar: AppBar(
          title: const Text('Financeiro - Recebimento de Parcelas'),
          actions: const <Widget>[],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          color: ViewUtilLib.getBottomAppBarFiltroLocalColor(),
          shape: const CircularNotchedRectangle(),
          child: Row(
            children: <Widget>[
              Expanded(
				  			flex: 1,
              	child: InputDecorator(
                  decoration: getInputDecoration(
                    'Informe a Data Inicial do Vencimento',
                    'Primeiro Vencimento',
                    true),
                  //isEmpty: _dataInicial == null,
                  child: DatePickerItem(
                    mascara: 'dd/MM/yyyy',
                    dateTime: _dataInicial,
                    firstDate: DateTime.parse('1900-01-01'),
                    lastDate: DateTime.parse('2050-01-01'),
                    onChanged: (DateTime? value) {
                      setState(() {
                        _dataInicial = value!;
                        filtrar();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
				  			flex: 1,
              	child: InputDecorator(
                  decoration: getInputDecoration(
                    'Informe a Data Final do Vencimento',
                    'Último Vencimento',
                    true),
                  //isEmpty: _dataFinal == null,
                  child: DatePickerItem(
                    mascara: 'dd/MM/yyyy',
                    dateTime: _dataFinal,
                    firstDate: DateTime.parse('1900-01-01'),
                    lastDate: DateTime.parse('2050-01-01'),
                    onChanged: (DateTime? value) {
                      setState(() {
                        _dataFinal = value!;
                        filtrar();
                      });
                    },
                  ),
                ),
              ),
				  		Expanded(
				  			flex: 0,
				  			child: IconButton(
				  				tooltip: 'Filtrar',
				  				icon: const Icon(Icons.search),
				  				onPressed: () async {				  					
                    await filtrar();
				  			},
				  		),
				  		),
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refrescarTela,
          child: Scrollbar(
            child: listaViewFinLancamentoReceber == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                    padding: const EdgeInsets.all(8.0),
                    children: <Widget>[
                      PaginatedDataTable(
                        header: const Text('Recebimento de Parcelas'),
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
								label: const Text('Id'),
								numeric: true,
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.id,
										columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Descrição Situação'),
								tooltip: 'Descrição Situação',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.descricaoSituacaoParcela,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Quantidade de Parcelas'),
								tooltip: 'Quantidade de Parcelas',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.quantidadeParcela,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Valor Lançamento'),
								tooltip: 'Valor do Lançamento a Receber',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.valorLancamento,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Valor Parcela'),
								tooltip: 'Valor da Parcela a Receber',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.valorParcela,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Data de Lançamento'),
								tooltip: 'Data de Lançamento',
								onSort: (int columnIndex, bool ascending) =>
									sort<DateTime>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.dataLancamento,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Número do Documento'),
								tooltip: 'Número do Documento',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.numeroDocumento,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Número da Parcela'),
								tooltip: 'Número da Parcela',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.numeroParcela,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Data de Vencimento'),
								tooltip: 'Data de Vencimento',
								onSort: (int columnIndex, bool ascending) =>
									sort<DateTime>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.dataVencimento,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Data de Recebimento'),
								tooltip: 'Data de Recebimento',
								onSort: (int columnIndex, bool ascending) =>
									sort<DateTime>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.dataRecebimento,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Taxa Juros'),
								tooltip: 'Taxa Juros',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.taxaJuro,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Valor Juros'),
								tooltip: 'Valor Juros',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.valorJuro,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Taxa Multa'),
								tooltip: 'Taxa Multa',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.taxaMulta,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Valor Multa'),
								tooltip: 'Valor Multa',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.valorMulta,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Taxa Desconto'),
								tooltip: 'Taxa Desconto',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.taxaDesconto,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Valor Desconto'),
								tooltip: 'Valor Desconto',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.valorDesconto,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Sigla Documento'),
								tooltip: 'Sigla Documento',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.siglaDocumento,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Fornecedor'),
								tooltip: 'Nome do Fornecedor',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.nomeCliente,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Cód Situação'),
								tooltip: 'Código da Situação',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.situacaoParcela,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Nome Conta Caixa'),
								tooltip: 'Nome da Conta Caixa',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((ViewFinLancamentoReceber viewFinLancamentoReceber) => viewFinLancamentoReceber.nomeContaCaixa,
									columnIndex, ascending),
							),
                        ],
                        source: viewFinLancamentoReceberDataSource,
                      ),
                    ],
                  ),
          ),
        ),
      );
    
  }

  Future _refrescarTela() async {
    await Provider.of<ViewFinLancamentoReceberViewModel>(context).consultarLista(filtro: Sessao.filtroGlobal);
  }

  Future filtrar() async {
    Provider.of<ViewFinLancamentoReceberViewModel>(context).listaViewFinLancamentoReceber = null;
    Sessao.filtroGlobal.campo = 'DATA_VENCIMENTO';
    Sessao.filtroGlobal.dataInicial = DateFormat('yyyy-MM-dd').format(_dataInicial);
    Sessao.filtroGlobal.dataFinal = DateFormat('yyyy-MM-dd').format(_dataFinal);
    Sessao.filtroGlobal.condicao = 'between';
    _refrescarTela();
  }

}

/// codigo referente a fonte de dados
class ViewFinLancamentoReceberDataSource extends DataTableSource {
  final List<ViewFinLancamentoReceber>? listaViewFinLancamentoReceber;
  final BuildContext context;


  ViewFinLancamentoReceberDataSource(this.listaViewFinLancamentoReceber, this.context);

  void sort<T>(Comparable<T>? Function(ViewFinLancamentoReceber viewFinLancamentoReceber) getField, bool ascending) {
    listaViewFinLancamentoReceber!.sort((ViewFinLancamentoReceber a, ViewFinLancamentoReceber b) {
      if (!ascending) {
        final ViewFinLancamentoReceber c = a;
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
    if (index >= listaViewFinLancamentoReceber!.length) return null;
    final ViewFinLancamentoReceber viewFinLancamentoReceber = listaViewFinLancamentoReceber![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${ viewFinLancamentoReceber.id ?? ''}'), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.descricaoSituacaoParcela ?? ''), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text('${viewFinLancamentoReceber.quantidadeParcela ?? ''}'), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.valorLancamento != null ? Constantes.formatoDecimalValor.format(viewFinLancamentoReceber.valorLancamento) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.valorParcela != null ? Constantes.formatoDecimalValor.format(viewFinLancamentoReceber.valorParcela) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.dataLancamento != null ? DateFormat('dd/MM/yyyy').format(viewFinLancamentoReceber.dataLancamento!) : ''), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.numeroDocumento ?? ''), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text('${viewFinLancamentoReceber.numeroParcela ?? ''}'), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.dataVencimento != null ? DateFormat('dd/MM/yyyy').format(viewFinLancamentoReceber.dataVencimento!) : ''), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.dataRecebimento != null ? DateFormat('dd/MM/yyyy').format(viewFinLancamentoReceber.dataRecebimento!) : ''), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.taxaJuro != null ? Constantes.formatoDecimalTaxa.format(viewFinLancamentoReceber.taxaJuro) : 0.toStringAsFixed(Constantes.decimaisTaxa)), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.valorJuro != null ? Constantes.formatoDecimalValor.format(viewFinLancamentoReceber.valorJuro) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.taxaMulta != null ? Constantes.formatoDecimalTaxa.format(viewFinLancamentoReceber.taxaMulta) : 0.toStringAsFixed(Constantes.decimaisTaxa)), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.valorMulta != null ? Constantes.formatoDecimalValor.format(viewFinLancamentoReceber.valorMulta) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.taxaDesconto != null ? Constantes.formatoDecimalTaxa.format(viewFinLancamentoReceber.taxaDesconto) : 0.toStringAsFixed(Constantes.decimaisTaxa)), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.valorDesconto != null ? Constantes.formatoDecimalValor.format(viewFinLancamentoReceber.valorDesconto) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.siglaDocumento ?? ''), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.nomeCliente ?? ''), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.situacaoParcela ?? ''), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
        DataCell(Text(viewFinLancamentoReceber.nomeContaCaixa ?? ''), onTap: () {
          detalharViewFinLancamentoReceber(viewFinLancamentoReceber, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaViewFinLancamentoReceber!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

Future detalharViewFinLancamentoReceber(ViewFinLancamentoReceber viewFinLancamentoReceber, BuildContext context) async {
  await Provider.of<FinParcelaReceberViewModel>(context).consultarObjeto(viewFinLancamentoReceber.idFinParcelaReceber);
  Navigator.pushNamed(
    context,
    '/finParcelaReceberDetalhe',
    arguments: Provider.of<FinParcelaReceberViewModel>(context).finParcelaReceber,
  ).then((_) async {
    await Provider.of<ViewFinLancamentoReceberViewModel>(context).consultarLista(filtro: Sessao.filtroGlobal);
 });
}