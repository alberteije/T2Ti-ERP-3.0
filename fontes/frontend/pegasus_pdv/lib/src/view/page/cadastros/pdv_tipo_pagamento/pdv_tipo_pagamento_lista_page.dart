/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [PDV_TIPO_PAGAMENTO] 
                                                                                
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

import 'package:pegasus_pdv/src/database/database_classes.dart';

import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:pegasus_pdv/src/infra/atalhos_desktop_web.dart';

import 'package:pegasus_pdv/src/model/model.dart';
import 'package:pegasus_pdv/src/database/database.dart';

import 'package:pegasus_pdv/src/view/shared/view_util_lib.dart';
import 'package:pegasus_pdv/src/view/shared/botoes.dart';
import 'package:pegasus_pdv/src/view/shared/caixas_de_dialogo.dart';
import 'package:pegasus_pdv/src/view/shared/page/filtro_page.dart';

import 'pdv_tipo_pagamento_persiste_page.dart';

class PdvTipoPagamentoListaPage extends StatefulWidget {
  const PdvTipoPagamentoListaPage({Key? key}) : super(key: key);

  @override
  PdvTipoPagamentoListaPageState createState() => PdvTipoPagamentoListaPageState();
}

class PdvTipoPagamentoListaPageState extends State<PdvTipoPagamentoListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = PdvTipoPagamentoDao.colunas;
  final _campos = PdvTipoPagamentoDao.campos;
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
    final listaPdvTipoPagamento = Sessao.db.pdvTipoPagamentoDao.listaPdvTipoPagamento;

    final _PdvTipoPagamentoDataSource pdvTipoPagamentoDataSource = _PdvTipoPagamentoDataSource(listaPdvTipoPagamento, context, _refrescarTela);

    void sort<T>(Comparable<T>? Function(PdvTipoPagamento pdvTipoPagamento) getField, int columnIndex, bool ascending) {
      pdvTipoPagamentoDataSource.sort<T>(getField, ascending);
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
            title: const Text('Cadastro - Tipo Pagamento'),
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
              child: listaPdvTipoPagamento == null
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                controller: controllerScroll,
                padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                children: <Widget>[
                  PaginatedDataTable(                        
                    header: const Text('Relação - Tipo Pagamento'),
                    rowsPerPage: _rowsPerPage!,
                    onRowsPerPageChanged: (int? value) {
                      setState(() {
                        _rowsPerPage = value;
                      });
                    },
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    columns: _pegarColunas(sort),                    
                    source: pdvTipoPagamentoDataSource,
                  ),
                ],
              ),
            ),
          ),          
        ),
      ),
    );
  }

  List<DataColumn> _pegarColunas(Function sort) {
    final List<DataColumn> colunas = [];
    colunas.add(
      DataColumn(
        numeric: true,
        label: const Text('Id'),
        tooltip: 'Id',
        onSort: (int columnIndex, bool ascending) =>
          sort<num>((PdvTipoPagamento pdvTipoPagamento) => pdvTipoPagamento.id, columnIndex, ascending),
      ),
    );
    colunas.add(
      DataColumn(
        label: const Text('Codigo'),
        tooltip: 'Conteúdo para o campo Codigo',
        onSort: (int columnIndex, bool ascending) =>
          sort<String>((PdvTipoPagamento pdvTipoPagamento) => pdvTipoPagamento.codigo, columnIndex, ascending),
      ),
    );
    if (Sessao.configuracaoPdv!.moduloFiscalPrincipal == 'NFC') {
      colunas.add(   
        DataColumn(
          label: const Text('Código NFC-e'),
          tooltip: 'Conteúdo para o campo Código da NFC-e',
          onSort: (int columnIndex, bool ascending) =>
            sort<String>((PdvTipoPagamento pdvTipoPagamento) => pdvTipoPagamento.codigoPagamentoNfce, columnIndex, ascending),
        ),
      );
    }
    colunas.add(
      DataColumn(
        label: const Text('Descricao'),
        tooltip: 'Conteúdo para o campo Descricao',
        onSort: (int columnIndex, bool ascending) =>
          sort<String>((PdvTipoPagamento pdvTipoPagamento) => pdvTipoPagamento.descricao, columnIndex, ascending),
      ),
    );
    colunas.add(
      DataColumn(
        label: const Text('Gera Parcelas'),
        tooltip: 'Conteúdo para o campo Gera Parcelas',
        onSort: (int columnIndex, bool ascending) =>
          sort<String>((PdvTipoPagamento pdvTipoPagamento) => pdvTipoPagamento.geraParcelas, columnIndex, ascending),
      ),
    );
    return colunas;
  }
  void _inserir() {
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) => 
            const PdvTipoPagamentoPersistePage(pdvTipoPagamento: PdvTipoPagamento(id: null,), title: 'PdvTipoPagamento - Inserindo', operacao: 'I')))
      .then((_) async {
        await _refrescarTela();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'PdvTipoPagamento - Filtro',
            colunas: _colunas,
            campoPesquisaPadrao: 'Codigo',
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Sessao.db.pdvTipoPagamentoDao.consultarListaFiltro(_filtro!.campo!, _filtro!.valor!);
        setState(() {
        });
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxInformacao(
      context, 'Essa janela não possui relatório implementado');
  }

  Future _refrescarTela() async {
    await Sessao.db.pdvTipoPagamentoDao.consultarLista();
    setState(() {
    });
  }
}


/// codigo referente a fonte de dados
class _PdvTipoPagamentoDataSource extends DataTableSource {
  final List<PdvTipoPagamento>? listaPdvTipoPagamento;
  final BuildContext context;
  final Function refrescarTela;
 
  _PdvTipoPagamentoDataSource(this.listaPdvTipoPagamento, this.context, this.refrescarTela);

  void sort<T>(Comparable<T>? Function(PdvTipoPagamento pdvTipoPagamento) getField, bool ascending) {
    listaPdvTipoPagamento!.sort((PdvTipoPagamento a, PdvTipoPagamento b) {
      if (!ascending) {
        final PdvTipoPagamento c = a;
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
    if (index >= listaPdvTipoPagamento!.length) return null;
    return DataRow.byIndex(
      index: index,
      cells: _pegarCelulas(index),
    );
  }

  List<DataCell> _pegarCelulas(int index) {
    final PdvTipoPagamento pdvTipoPagamento = listaPdvTipoPagamento![index];
    List<DataCell> celulas = [];
    celulas.add(
        DataCell(Text('${pdvTipoPagamento.id}'), onTap: () {
          _detalharPdvTipoPagamento(pdvTipoPagamento, context, refrescarTela);
        }),
    );
    celulas.add(
        DataCell(Text(pdvTipoPagamento.codigo ?? ''), onTap: () {
          _detalharPdvTipoPagamento(pdvTipoPagamento, context, refrescarTela);
        }),
    );
    if (Sessao.configuracaoPdv!.moduloFiscalPrincipal == 'NFC') {
      celulas.add(
        DataCell(Text(pdvTipoPagamento.codigoPagamentoNfce ?? ''), onTap: () {
          _detalharPdvTipoPagamento(pdvTipoPagamento, context, refrescarTela);
        }),
      );
    }
    celulas.add(
        DataCell(Text(pdvTipoPagamento.descricao ?? ''), onTap: () {
          _detalharPdvTipoPagamento(pdvTipoPagamento, context, refrescarTela);
        }),
    );
    celulas.add(
        DataCell(Text(pdvTipoPagamento.geraParcelas ?? ''), onTap: () {
          _detalharPdvTipoPagamento(pdvTipoPagamento, context, refrescarTela);
        }),
    );
  
    return celulas;
  }

  @override
  int get rowCount => listaPdvTipoPagamento!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharPdvTipoPagamento(PdvTipoPagamento pdvTipoPagamento, BuildContext context, Function refrescarTela) {
  if (pdvTipoPagamento.id != 1 && pdvTipoPagamento.codigo != '99') {
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) => PdvTipoPagamentoPersistePage(
        pdvTipoPagamento: pdvTipoPagamento, title: 'Tipo Pagamento - Editando', operacao: 'A')))
      .then((_) async {    
        await refrescarTela();
    });
  } else {
    showInSnackBar("Esse tipo de pagamento não pode ser editado ou excluído.", context);          
  }
}