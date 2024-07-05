/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [FIN_EXTRATO_CONTA_BANCO] 
                                                                                
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
import 'package:extended_masked_text/extended_masked_text.dart';
import 'fin_extrato_conta_banco_persiste_page.dart';

class FinExtratoContaBancoListaPage extends StatefulWidget {
  const FinExtratoContaBancoListaPage({Key? key}) : super(key: key);

  @override
  FinExtratoContaBancoListaPageState createState() => FinExtratoContaBancoListaPageState();
}

class FinExtratoContaBancoListaPageState extends State<FinExtratoContaBancoListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = FinExtratoContaBanco.colunas;
  final _campos = FinExtratoContaBanco.campos;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<FinExtratoContaBancoViewModel>(context, listen: false).objetoJsonErro)
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
    if (Provider.of<FinExtratoContaBancoViewModel>(context).listaFinExtratoContaBanco == null && Provider.of<FinExtratoContaBancoViewModel>(context).objetoJsonErro == null) {
      Provider.of<FinExtratoContaBancoViewModel>(context, listen: false).consultarLista();
    }
    var listaFinExtratoContaBanco = Provider.of<FinExtratoContaBancoViewModel>(context).listaFinExtratoContaBanco;

    final _FinExtratoContaBancoDataSource finExtratoContaBancoDataSource = _FinExtratoContaBancoDataSource(listaFinExtratoContaBanco, context);

    void sort<T>(Comparable<T>? Function(FinExtratoContaBanco finExtratoContaBanco) getField, int columnIndex, bool ascending) {
      finExtratoContaBancoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Fin Extrato Conta Banco'),
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
                child: listaFinExtratoContaBanco == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(                        
                      header: const Text('Relação - Fin Extrato Conta Banco'),
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
                            sort<num>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Conta/Caixa'),
                          tooltip: 'Conta/Caixa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.bancoContaCaixa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Mês/Ano'),
                          tooltip: 'Mês/Ano',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.mesAno, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Mês'),
                          tooltip: 'Mês',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.mes, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Ano'),
                          tooltip: 'Ano',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.ano, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data de Movimento'),
                          tooltip: 'Data de Movimento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.dataMovimento, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data do Balancete'),
                          tooltip: 'Data do Balancete',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.dataBalancete, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Histórico'),
                          tooltip: 'Histórico',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.historico, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Documento'),
                          tooltip: 'Documento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.documento, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor'),
                          tooltip: 'Valor',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.valor, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Conciliado'),
                          tooltip: 'Conciliado',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.conciliado, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Observação'),
                          tooltip: 'Observação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.observacao, columnIndex, ascending),
                        ),
                      ],
                      source: finExtratoContaBancoDataSource,
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
            FinExtratoContaBancoPersistePage(finExtratoContaBanco: FinExtratoContaBanco(), title: 'Fin Extrato Conta Banco - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<FinExtratoContaBancoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Fin Extrato Conta Banco - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<FinExtratoContaBancoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<FinExtratoContaBancoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<FinExtratoContaBancoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(
              arquivoPdf: arquivoPdf, title: 'Relatório - Fin Extrato Conta Banco')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<FinExtratoContaBancoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _FinExtratoContaBancoDataSource extends DataTableSource {
  final List<FinExtratoContaBanco>? listaFinExtratoContaBanco;
  final BuildContext context;

  _FinExtratoContaBancoDataSource(this.listaFinExtratoContaBanco, this.context);

  void sort<T>(Comparable<T>? Function(FinExtratoContaBanco finExtratoContaBanco) getField, bool ascending) {
    listaFinExtratoContaBanco!.sort((FinExtratoContaBanco a, FinExtratoContaBanco b) {
      if (!ascending) {
        final FinExtratoContaBanco c = a;
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
    if (index >= listaFinExtratoContaBanco!.length) return null;
    final FinExtratoContaBanco finExtratoContaBanco = listaFinExtratoContaBanco![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${finExtratoContaBanco.id ?? ''}'), onTap: () {
          _detalharFinExtratoContaBanco(finExtratoContaBanco, context);
        }),
        DataCell(Text(finExtratoContaBanco.bancoContaCaixa?.nome ?? ''), onTap: () {
          _detalharFinExtratoContaBanco(finExtratoContaBanco, context);
        }),
        DataCell(Text(MaskedTextController(text: finExtratoContaBanco.mesAno, mask: Constantes.mascaraMES_ANO).text), onTap: () {
          _detalharFinExtratoContaBanco(finExtratoContaBanco, context);
        }),
        DataCell(Text(MaskedTextController(text: finExtratoContaBanco.mes, mask: Constantes.mascaraMES).text), onTap: () {
          _detalharFinExtratoContaBanco(finExtratoContaBanco, context);
        }),
        DataCell(Text(finExtratoContaBanco.ano ?? ''), onTap: () {
          _detalharFinExtratoContaBanco(finExtratoContaBanco, context);
        }),
        DataCell(Text(finExtratoContaBanco.dataMovimento != null ? DateFormat('dd/MM/yyyy').format(finExtratoContaBanco.dataMovimento!) : ''), onTap: () {
          _detalharFinExtratoContaBanco(finExtratoContaBanco, context);
        }),
        DataCell(Text(finExtratoContaBanco.dataBalancete != null ? DateFormat('dd/MM/yyyy').format(finExtratoContaBanco.dataBalancete!) : ''), onTap: () {
          _detalharFinExtratoContaBanco(finExtratoContaBanco, context);
        }),
        DataCell(Text(finExtratoContaBanco.historico ?? ''), onTap: () {
          _detalharFinExtratoContaBanco(finExtratoContaBanco, context);
        }),
        DataCell(Text(finExtratoContaBanco.documento ?? ''), onTap: () {
          _detalharFinExtratoContaBanco(finExtratoContaBanco, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finExtratoContaBanco.valor ?? 0)), onTap: () {
          _detalharFinExtratoContaBanco(finExtratoContaBanco, context);
        }),
        DataCell(Text(finExtratoContaBanco.conciliado ?? ''), onTap: () {
          _detalharFinExtratoContaBanco(finExtratoContaBanco, context);
        }),
        DataCell(Text(finExtratoContaBanco.observacao ?? ''), onTap: () {
          _detalharFinExtratoContaBanco(finExtratoContaBanco, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaFinExtratoContaBanco!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharFinExtratoContaBanco(FinExtratoContaBanco finExtratoContaBanco, BuildContext context) {
   Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => FinExtratoContaBancoPersistePage(
          finExtratoContaBanco: finExtratoContaBanco,
          title: 'Fin Extrato Conta Banco - Editando',
          operacao: 'A')));

  /*Navigator.pushNamed(
    context,
    '/finExtratoContaBancoDetalhe',
    arguments: finExtratoContaBanco,
  );*/
}