/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [TRIBUT_OPERACAO_FISCAL] 
                                                                                
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

import 'package:pegasus_pdv/src/database/database.dart';
import 'package:pegasus_pdv/src/database/database_classes.dart';

import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:pegasus_pdv/src/infra/atalhos_desktop_web.dart';

import 'package:pegasus_pdv/src/model/model.dart';

import 'package:pegasus_pdv/src/view/shared/view_util_lib.dart';
import 'package:pegasus_pdv/src/view/shared/botoes.dart';
import 'package:pegasus_pdv/src/view/shared/caixas_de_dialogo.dart';
import 'package:pegasus_pdv/src/view/shared/page/filtro_page.dart';

import 'tribut_operacao_fiscal_persiste_page.dart';

class TributOperacaoFiscalListaPage extends StatefulWidget {
  const TributOperacaoFiscalListaPage({Key? key}) : super(key: key);

  @override
  TributOperacaoFiscalListaPageState createState() => TributOperacaoFiscalListaPageState();
}

class TributOperacaoFiscalListaPageState extends State<TributOperacaoFiscalListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = TributOperacaoFiscalDao.colunas;
  final _campos = TributOperacaoFiscalDao.campos;
  final ScrollController controllerScroll = ScrollController();

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
    final listaTributOperacaoFiscal = Sessao.db.tributOperacaoFiscalDao.listaTributOperacaoFiscal;
  
    final _TributOperacaoFiscalDataSource tributOperacaoFiscalDataSource = _TributOperacaoFiscalDataSource(listaTributOperacaoFiscal, context, _refrescarTela);

    void sort<T>(Comparable<T>? Function(TributOperacaoFiscal tributOperacaoFiscal) getField, int columnIndex, bool ascending) {
      tributOperacaoFiscalDataSource.sort<T>(getField, ascending);
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
            title: const Text('Cadastro - Operação Fiscal'),
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
              controller: controllerScroll,
              child: listaTributOperacaoFiscal == null
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                controller: controllerScroll,
                padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                children: <Widget>[
                  PaginatedDataTable(                        
                    header: const Text('Relação - Operação Fiscal'),
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
                          sort<num>((TributOperacaoFiscal tributOperacaoFiscal) => tributOperacaoFiscal.id, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Descrição'),
                        tooltip: 'Descrição',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((TributOperacaoFiscal tributOperacaoFiscal) => tributOperacaoFiscal.descricao, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Observação'),
                        tooltip: 'Observação',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((TributOperacaoFiscal tributOperacaoFiscal) => tributOperacaoFiscal.observacao, columnIndex, ascending),
                      ),
                    ],
                    source: tributOperacaoFiscalDataSource,
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
          const TributOperacaoFiscalPersistePage(tributOperacaoFiscal: TributOperacaoFiscal(id: null,), title: 'Operação Fiscal - Inserindo', operacao: 'I')))
      .then((_) async {
        await _refrescarTela();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Operação Fiscal - Filtro',
            colunas: _colunas,
            campoPesquisaPadrao: 'Descrição',
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Sessao.db.tributOperacaoFiscalDao.consultarListaFiltro(_filtro!.campo!, _filtro!.valor!);
        setState(() {
        });
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxInformacao(context, 'Essa janela não possui relatório implementado');
  }

  Future _refrescarTela() async {
    await Sessao.db.tributOperacaoFiscalDao.consultarLista();
    setState(() {
    });
  }
}

/// codigo referente a fonte de dados
class _TributOperacaoFiscalDataSource extends DataTableSource {
  final List<TributOperacaoFiscal>? listaTributOperacaoFiscal;
  final BuildContext context;
  final Function refrescarTela;

  _TributOperacaoFiscalDataSource(this.listaTributOperacaoFiscal, this.context, this.refrescarTela);

  void sort<T>(Comparable<T>? Function(TributOperacaoFiscal tributOperacaoFiscal) getField, bool ascending) {
    listaTributOperacaoFiscal!.sort((TributOperacaoFiscal a, TributOperacaoFiscal b) {
      if (!ascending) {
        final TributOperacaoFiscal c = a;
        a = b;
        b = c;
      }
      Comparable<T>? aValue = getField(a);
      Comparable<T>? bValue = getField(b);

      aValue ??= '' as Comparable<T>;
      bValue ??= '' as Comparable<T>;

      return Comparable.compare(aValue, bValue);
    });
  }

  final int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= listaTributOperacaoFiscal!.length) return null;
    final TributOperacaoFiscal tributOperacaoFiscal = listaTributOperacaoFiscal![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${tributOperacaoFiscal.id}'), onTap: () {
          _detalharTributOperacaoFiscal(tributOperacaoFiscal, context, refrescarTela);
        }),
        DataCell(Text(tributOperacaoFiscal.descricao ?? ''), onTap: () {
          _detalharTributOperacaoFiscal(tributOperacaoFiscal, context, refrescarTela);
        }),
        DataCell(Text(tributOperacaoFiscal.observacao ?? ''), onTap: () {
          _detalharTributOperacaoFiscal(tributOperacaoFiscal, context, refrescarTela);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaTributOperacaoFiscal!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharTributOperacaoFiscal(TributOperacaoFiscal tributOperacaoFiscal, BuildContext context, Function refrescarTela) {
  Navigator.of(context)
    .push(MaterialPageRoute(
      builder: (BuildContext context) => TributOperacaoFiscalPersistePage(
      tributOperacaoFiscal: tributOperacaoFiscal, title: 'Operação Fiscal - Editando', operacao: 'A')))
    .then((_) async {    
      await refrescarTela();
   });

}