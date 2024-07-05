/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [BANCO_CONTA_CAIXA] 
Utilizada para fazer a conciliação bancária
                                                                                
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
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/view/shared/page/filtro_page.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';

import '../../page.dart';

class ConciliacaoBancariaGeralPage extends StatefulWidget {
  const ConciliacaoBancariaGeralPage({Key? key}) : super(key: key);

  @override
  ConciliacaoBancariaGeralPageState createState() => ConciliacaoBancariaGeralPageState();
}

class ConciliacaoBancariaGeralPageState extends State<ConciliacaoBancariaGeralPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  DateTime _mesAno = DateTime.now();
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<BancoContaCaixaViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<BancoContaCaixaViewModel>(context).listaBancoContaCaixa == null && Provider.of<BancoContaCaixaViewModel>(context).objetoJsonErro == null) {
      Provider.of<BancoContaCaixaViewModel>(context).consultarLista();
    }
    var listaBancoContaCaixa = Provider.of<BancoContaCaixaViewModel>(context).listaBancoContaCaixa;
    var colunas = BancoContaCaixa.colunas;
    var campos = BancoContaCaixa.campos;

    final ConciliacaoBancariaGeralDataSource conciliacaoBancariaGeralDataSource = ConciliacaoBancariaGeralDataSource(listaBancoContaCaixa, context, DateFormat('MM/yyyy').format(_mesAno));

    void sort<T>(Comparable<T>? Function(BancoContaCaixa bancoContaCaixa) getField, int columnIndex, bool ascending) {
      conciliacaoBancariaGeralDataSource.sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

      return Scaffold(
        appBar: AppBar(
          title: const Text('Financeiro - Conciliação Bancária'),
          actions: const <Widget>[],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          color: ViewUtilLib.getBottomAppBarColor(),
          shape: const CircularNotchedRectangle(),
          child: Row(
            children: <Widget>[
            Expanded(
              flex: 1,
              child: InputDecorator(
                decoration: getInputDecoration(
                  'Mês/Ano para o Filtro',
                  'Selecione um dia dentro do mês desejado',
                  true),
                // isEmpty: _mesAno == null,
                child: DatePickerItem(
                  mascara: 'MM/yyyy',
                  dateTime: _mesAno,
                  firstDate: DateTime.parse('1900-01-01'),
                  lastDate: DateTime.parse('2050-01-01'),
                  onChanged: (DateTime? value) {
                    setState(() {
                      _mesAno = value!;
                    });
                  },
                ),
              ),
            ),
              Expanded(
                flex: 0,
                child: IconButton(
                  icon: ViewUtilLib.getIconBotaoFiltro(),
                  onPressed: () async {
                    Filtro? filtro = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => FiltroPage(
                            title: 'Conta Caixa - Filtro',
                            colunas: colunas,
                            filtroPadrao: true,
                          ),
                          fullscreenDialog: true,
                        ));
                    if (!mounted) return;
                    if (filtro != null) {
                      if (filtro.campo != null) {
                        filtro.campo = campos[int.parse(filtro.campo!)];
                        await Provider.of<BancoContaCaixaViewModel>(context, listen: false).consultarLista(filtro: filtro);
                      }
                    }
                  },
                ),
              ),              
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refrescarTela,
          child: Scrollbar(
            child: listaBancoContaCaixa == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                    padding: const EdgeInsets.all(8.0),
                    children: <Widget>[
                      PaginatedDataTable(
                        header: const Text('Relação - Banco Conta Caixa'),
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
                              sort<num>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.id,
                                columnIndex, ascending),
                          ),
                          DataColumn(
                            label: const Text('Agência'),
                            tooltip: 'Agência',
                            onSort: (int columnIndex, bool ascending) =>
                              sort<String>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.bancoAgencia!.nome,
                              columnIndex, ascending),
                          ),
                          DataColumn(
                            label: const Text('Número'),
                            tooltip: 'Número',
                            onSort: (int columnIndex, bool ascending) =>
                              sort<String>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.numero,
                              columnIndex, ascending),
                          ),
                          DataColumn(
                            label: const Text('Dígito'),
                            tooltip: 'Dígito',
                            onSort: (int columnIndex, bool ascending) =>
                              sort<String>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.digito,
                              columnIndex, ascending),
                          ),
                          DataColumn(
                            label: const Text('Nome'),
                            tooltip: 'Nome',
                            onSort: (int columnIndex, bool ascending) =>
                              sort<String>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.nome,
                              columnIndex, ascending),
                          ),
                          DataColumn(
                            label: const Text('Tipo'),
                            tooltip: 'Tipo',
                            onSort: (int columnIndex, bool ascending) =>
                              sort<String>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.tipo,
                              columnIndex, ascending),
                          ),
                          DataColumn(
                            label: const Text('Descrição'),
                            tooltip: 'Descrição',
                            onSort: (int columnIndex, bool ascending) =>
                              sort<String>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.descricao,
                              columnIndex, ascending),
                          ),
                        ],
                        source: conciliacaoBancariaGeralDataSource,
                      ),
                    ],
                  ),
          ),
        ),
      );
    
  }

  Future _refrescarTela() async {
    await Provider.of<BancoContaCaixaViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class ConciliacaoBancariaGeralDataSource extends DataTableSource {
  final List<BancoContaCaixa>? listaBancoContaCaixa;
  final BuildContext context;
  final String mesAno;

  ConciliacaoBancariaGeralDataSource(this.listaBancoContaCaixa, this.context, this.mesAno);

  void sort<T>(Comparable<T>? Function(BancoContaCaixa bancoContaCaixa) getField, bool ascending) {
    listaBancoContaCaixa!.sort((BancoContaCaixa a, BancoContaCaixa b) {
      if (!ascending) {
        final BancoContaCaixa c = a;
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
    if (index >= listaBancoContaCaixa!.length) return null;
    final BancoContaCaixa bancoContaCaixa = listaBancoContaCaixa![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${ bancoContaCaixa.id ?? ''}'), onTap: () {
          chamarConciliacaoBancaria(bancoContaCaixa, context, mesAno);
        }),
        DataCell(Text(bancoContaCaixa.bancoAgencia?.nome ?? ''), onTap: () {
          chamarConciliacaoBancaria(bancoContaCaixa, context, mesAno);
        }),
        DataCell(Text(bancoContaCaixa.numero ?? ''), onTap: () {
          chamarConciliacaoBancaria(bancoContaCaixa, context, mesAno);
        }),
        DataCell(Text(bancoContaCaixa.digito ?? ''), onTap: () {
          chamarConciliacaoBancaria(bancoContaCaixa, context, mesAno);
        }),
        DataCell(Text(bancoContaCaixa.nome ?? ''), onTap: () {
          chamarConciliacaoBancaria(bancoContaCaixa, context, mesAno);
        }),
        DataCell(Text(bancoContaCaixa.tipo ?? ''), onTap: () {
          chamarConciliacaoBancaria(bancoContaCaixa, context, mesAno);
        }),
        DataCell(Text(bancoContaCaixa.descricao ?? ''), onTap: () {
          chamarConciliacaoBancaria(bancoContaCaixa, context, mesAno);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaBancoContaCaixa!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

chamarConciliacaoBancaria(BancoContaCaixa bancoContaCaixa, BuildContext context, String mesAno) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => ConciliacaoBancariaEspecificoPage(
            bancoContaCaixa: bancoContaCaixa,
            mesAno: mesAno,
          ))
        );
}