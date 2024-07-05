/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [VIEW_FIN_LANCAMENTO_PAGAR] 
                                                                                
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

class ViewFinLancamentoPagarListaPage extends StatefulWidget {
  const ViewFinLancamentoPagarListaPage({Key? key}) : super(key: key);

  @override
  ViewFinLancamentoPagarListaPageState createState() => ViewFinLancamentoPagarListaPageState();
}

class ViewFinLancamentoPagarListaPageState extends State<ViewFinLancamentoPagarListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  DateTime _dataInicial = DateTime.now();
  DateTime _dataFinal = DateTime.now();
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<ViewFinLancamentoPagarViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<ViewFinLancamentoPagarViewModel>(context).listaViewFinLancamentoPagar == null && Provider.of<ViewFinLancamentoPagarViewModel>(context).objetoJsonErro == null) {
      filtrar();
    }
    var listaViewFinLancamentoPagar = Provider.of<ViewFinLancamentoPagarViewModel>(context).listaViewFinLancamentoPagar;

    final ViewFinLancamentoPagarDataSource viewFinLancamentoPagarDataSource =
        ViewFinLancamentoPagarDataSource(listaViewFinLancamentoPagar, context);

    void sort<T>(Comparable<T>? Function(ViewFinLancamentoPagar viewFinLancamentoPagar) getField, int columnIndex, bool ascending) {
      viewFinLancamentoPagarDataSource.sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

      return Scaffold(
        appBar: AppBar(
          title: const Text('Financeiro - Pagamento de Parcelas'),
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
            child: listaViewFinLancamentoPagar == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                    padding: const EdgeInsets.all(8.0),
                    children: <Widget>[
                      PaginatedDataTable(
                        header: const Text('Pagamento de Parcelas'),
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
									sort<num>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.id,
										columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Descrição Situação'),
								tooltip: 'Descrição Situação',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.descricaoSituacaoParcela,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Quantidade de Parcelas'),
								tooltip: 'Quantidade de Parcelas',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.quantidadeParcela,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Valor Lançamento'),
								tooltip: 'Valor do Lançamento a Pagar',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.valorLancamento,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Valor Parcela'),
								tooltip: 'Valor da Parcela a Pagar',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.valorParcela,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Data de Lançamento'),
								tooltip: 'Data de Lançamento',
								onSort: (int columnIndex, bool ascending) =>
									sort<DateTime>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.dataLancamento,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Número do Documento'),
								tooltip: 'Número do Documento',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.numeroDocumento,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Número da Parcela'),
								tooltip: 'Número da Parcela',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.numeroParcela,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Data de Vencimento'),
								tooltip: 'Data de Vencimento',
								onSort: (int columnIndex, bool ascending) =>
									sort<DateTime>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.dataVencimento,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Data de Pagamento'),
								tooltip: 'Data de Pagamento',
								onSort: (int columnIndex, bool ascending) =>
									sort<DateTime>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.dataPagamento,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Taxa Juros'),
								tooltip: 'Taxa Juros',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.taxaJuro,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Valor Juros'),
								tooltip: 'Valor Juros',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.valorJuro,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Taxa Multa'),
								tooltip: 'Taxa Multa',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.taxaMulta,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Valor Multa'),
								tooltip: 'Valor Multa',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.valorMulta,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Taxa Desconto'),
								tooltip: 'Taxa Desconto',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.taxaDesconto,
									columnIndex, ascending),
							),
							DataColumn(
								numeric: true,
								label: const Text('Valor Desconto'),
								tooltip: 'Valor Desconto',
								onSort: (int columnIndex, bool ascending) =>
									sort<num>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.valorDesconto,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Sigla Documento'),
								tooltip: 'Sigla Documento',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.siglaDocumento,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Fornecedor'),
								tooltip: 'Nome do Fornecedor',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.nomeFornecedor,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Cód Situação'),
								tooltip: 'Código da Situação',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.situacaoParcela,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Nome Conta Caixa'),
								tooltip: 'Nome da Conta Caixa',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((ViewFinLancamentoPagar viewFinLancamentoPagar) => viewFinLancamentoPagar.nomeContaCaixa,
									columnIndex, ascending),
							),
                        ],
                        source: viewFinLancamentoPagarDataSource,
                      ),
                    ],
                  ),
          ),
        ),
      );
    
  }

  Future _refrescarTela() async {
    await Provider.of<ViewFinLancamentoPagarViewModel>(context).consultarLista(filtro: Sessao.filtroGlobal);
  }

  Future filtrar() async {
    Provider.of<ViewFinLancamentoPagarViewModel>(context).listaViewFinLancamentoPagar = null;
    Sessao.filtroGlobal.campo = 'DATA_VENCIMENTO';
    Sessao.filtroGlobal.dataInicial = DateFormat('yyyy-MM-dd').format(_dataInicial);
    Sessao.filtroGlobal.dataFinal = DateFormat('yyyy-MM-dd').format(_dataFinal);
    Sessao.filtroGlobal.condicao = 'between';
    _refrescarTela();
  }

}

/// codigo referente a fonte de dados
class ViewFinLancamentoPagarDataSource extends DataTableSource {
  final List<ViewFinLancamentoPagar>? listaViewFinLancamentoPagar;
  final BuildContext context;

  ViewFinLancamentoPagarDataSource(this.listaViewFinLancamentoPagar, this.context);

  void sort<T>(Comparable<T>? Function(ViewFinLancamentoPagar viewFinLancamentoPagar) getField, bool ascending) {
    listaViewFinLancamentoPagar!.sort((ViewFinLancamentoPagar a, ViewFinLancamentoPagar b) {
      if (!ascending) {
        final ViewFinLancamentoPagar c = a;
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
    if (index >= listaViewFinLancamentoPagar!.length) return null;
    final ViewFinLancamentoPagar viewFinLancamentoPagar = listaViewFinLancamentoPagar![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${ viewFinLancamentoPagar.id ?? ''}'), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.descricaoSituacaoParcela ?? ''), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text('${viewFinLancamentoPagar.quantidadeParcela ?? ''}'), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.valorLancamento != null ? Constantes.formatoDecimalValor.format(viewFinLancamentoPagar.valorLancamento) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.valorParcela != null ? Constantes.formatoDecimalValor.format(viewFinLancamentoPagar.valorParcela) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.dataLancamento != null ? DateFormat('dd/MM/yyyy').format(viewFinLancamentoPagar.dataLancamento!) : ''), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.numeroDocumento ?? ''), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text('${viewFinLancamentoPagar.numeroParcela ?? ''}'), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.dataVencimento != null ? DateFormat('dd/MM/yyyy').format(viewFinLancamentoPagar.dataVencimento!) : ''), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.dataPagamento != null ? DateFormat('dd/MM/yyyy').format(viewFinLancamentoPagar.dataPagamento!) : ''), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.taxaJuro != null ? Constantes.formatoDecimalTaxa.format(viewFinLancamentoPagar.taxaJuro) : 0.toStringAsFixed(Constantes.decimaisTaxa)), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.valorJuro != null ? Constantes.formatoDecimalValor.format(viewFinLancamentoPagar.valorJuro) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.taxaMulta != null ? Constantes.formatoDecimalTaxa.format(viewFinLancamentoPagar.taxaMulta) : 0.toStringAsFixed(Constantes.decimaisTaxa)), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.valorMulta != null ? Constantes.formatoDecimalValor.format(viewFinLancamentoPagar.valorMulta) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.taxaDesconto != null ? Constantes.formatoDecimalTaxa.format(viewFinLancamentoPagar.taxaDesconto) : 0.toStringAsFixed(Constantes.decimaisTaxa)), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.valorDesconto != null ? Constantes.formatoDecimalValor.format(viewFinLancamentoPagar.valorDesconto) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.siglaDocumento ?? ''), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.nomeFornecedor ?? ''), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.situacaoParcela ?? ''), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
        DataCell(Text(viewFinLancamentoPagar.nomeContaCaixa ?? ''), onTap: () {
          detalharViewFinLancamentoPagar(viewFinLancamentoPagar, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaViewFinLancamentoPagar!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

Future<void> detalharViewFinLancamentoPagar(ViewFinLancamentoPagar viewFinLancamentoPagar, BuildContext context) async {
  await Provider.of<FinParcelaPagarViewModel>(context).consultarObjeto(viewFinLancamentoPagar.idFinParcelaPagar);
  await Future<void>.microtask(() {
    Navigator.pushNamed(
      context, 
      '/finParcelaPagarDetalhe',
      arguments: Provider.of<FinParcelaPagarViewModel>(context).finParcelaPagar,
      ).then((_) async {
        await Provider.of<ViewFinLancamentoPagarViewModel>(context).consultarLista(filtro: Sessao.filtroGlobal);
      });
  });
}