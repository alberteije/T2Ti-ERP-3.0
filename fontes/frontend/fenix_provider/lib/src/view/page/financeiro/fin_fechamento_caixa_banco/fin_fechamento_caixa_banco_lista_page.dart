/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [FIN_FECHAMENTO_CAIXA_BANCO] 
                                                                                
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
import 'fin_fechamento_caixa_banco_persiste_page.dart';

class FinFechamentoCaixaBancoListaPage extends StatefulWidget {
  const FinFechamentoCaixaBancoListaPage({Key? key}) : super(key: key);

  @override
  FinFechamentoCaixaBancoListaPageState createState() => FinFechamentoCaixaBancoListaPageState();
}

class FinFechamentoCaixaBancoListaPageState extends State<FinFechamentoCaixaBancoListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = FinFechamentoCaixaBanco.colunas;
  final _campos = FinFechamentoCaixaBanco.campos;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<FinFechamentoCaixaBancoViewModel>(context, listen: false).objetoJsonErro)
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
    if (Provider.of<FinFechamentoCaixaBancoViewModel>(context).listaFinFechamentoCaixaBanco == null && Provider.of<FinFechamentoCaixaBancoViewModel>(context).objetoJsonErro == null) {
      Provider.of<FinFechamentoCaixaBancoViewModel>(context, listen: false).consultarLista();
    }
    var listaFinFechamentoCaixaBanco = Provider.of<FinFechamentoCaixaBancoViewModel>(context).listaFinFechamentoCaixaBanco;

    final _FinFechamentoCaixaBancoDataSource finFechamentoCaixaBancoDataSource = _FinFechamentoCaixaBancoDataSource(listaFinFechamentoCaixaBanco, context);

    void sort<T>(Comparable<T>? Function(FinFechamentoCaixaBanco finFechamentoCaixaBanco) getField, int columnIndex, bool ascending) {
      finFechamentoCaixaBancoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Fin Fechamento Caixa Banco'),
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
                child: listaFinFechamentoCaixaBanco == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(                        
                      header: const Text('Relação - Fin Fechamento Caixa Banco'),
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
                            sort<num>((FinFechamentoCaixaBanco finFechamentoCaixaBanco) => finFechamentoCaixaBanco.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Conta/Caixa'),
                          tooltip: 'Conta/Caixa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinFechamentoCaixaBanco finFechamentoCaixaBanco) => finFechamentoCaixaBanco.bancoContaCaixa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data do Fechamento'),
                          tooltip: 'Data do Fechamento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinFechamentoCaixaBanco finFechamentoCaixaBanco) => finFechamentoCaixaBanco.dataFechamento, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Mês/Ano'),
                          tooltip: 'Mês/Ano',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinFechamentoCaixaBanco finFechamentoCaixaBanco) => finFechamentoCaixaBanco.mesAno, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Mês'),
                          tooltip: 'Mês',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinFechamentoCaixaBanco finFechamentoCaixaBanco) => finFechamentoCaixaBanco.mes, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Ano'),
                          tooltip: 'Ano',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinFechamentoCaixaBanco finFechamentoCaixaBanco) => finFechamentoCaixaBanco.ano, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Saldo Anterior'),
                          tooltip: 'Valor Saldo Anterior',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinFechamentoCaixaBanco finFechamentoCaixaBanco) => finFechamentoCaixaBanco.saldoAnterior, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Total Recebimentos'),
                          tooltip: 'Total Recebimentos',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinFechamentoCaixaBanco finFechamentoCaixaBanco) => finFechamentoCaixaBanco.recebimentos, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Total Pagamentos'),
                          tooltip: 'Total Pagamentos',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinFechamentoCaixaBanco finFechamentoCaixaBanco) => finFechamentoCaixaBanco.pagamentos, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Saldo em Conta'),
                          tooltip: 'Saldo em Conta',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinFechamentoCaixaBanco finFechamentoCaixaBanco) => finFechamentoCaixaBanco.saldoConta, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Cheques Não Compensados'),
                          tooltip: 'Cheques Não Compensados',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinFechamentoCaixaBanco finFechamentoCaixaBanco) => finFechamentoCaixaBanco.chequeNaoCompensado, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Saldo Disponível'),
                          tooltip: 'Saldo Disponível',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinFechamentoCaixaBanco finFechamentoCaixaBanco) => finFechamentoCaixaBanco.saldoDisponivel, columnIndex, ascending),
                        ),
                      ],
                      source: finFechamentoCaixaBancoDataSource,
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
            FinFechamentoCaixaBancoPersistePage(finFechamentoCaixaBanco: FinFechamentoCaixaBanco(), title: 'Fin Fechamento Caixa Banco - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<FinFechamentoCaixaBancoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Fin Fechamento Caixa Banco - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<FinFechamentoCaixaBancoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<FinFechamentoCaixaBancoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<FinFechamentoCaixaBancoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(
              arquivoPdf: arquivoPdf, title: 'Relatório - Fin Fechamento Caixa Banco')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<FinFechamentoCaixaBancoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _FinFechamentoCaixaBancoDataSource extends DataTableSource {
  final List<FinFechamentoCaixaBanco>? listaFinFechamentoCaixaBanco;
  final BuildContext context;

  _FinFechamentoCaixaBancoDataSource(this.listaFinFechamentoCaixaBanco, this.context);

  void sort<T>(Comparable<T>? Function(FinFechamentoCaixaBanco finFechamentoCaixaBanco) getField, bool ascending) {
    listaFinFechamentoCaixaBanco!.sort((FinFechamentoCaixaBanco a, FinFechamentoCaixaBanco b) {
      if (!ascending) {
        final FinFechamentoCaixaBanco c = a;
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
    if (index >= listaFinFechamentoCaixaBanco!.length) return null;
    final FinFechamentoCaixaBanco finFechamentoCaixaBanco = listaFinFechamentoCaixaBanco![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${finFechamentoCaixaBanco.id ?? ''}'), onTap: () {
          _detalharFinFechamentoCaixaBanco(finFechamentoCaixaBanco, context);
        }),
        DataCell(Text(finFechamentoCaixaBanco.bancoContaCaixa?.nome ?? ''), onTap: () {
          _detalharFinFechamentoCaixaBanco(finFechamentoCaixaBanco, context);
        }),
        DataCell(Text(finFechamentoCaixaBanco.dataFechamento != null ? DateFormat('dd/MM/yyyy').format(finFechamentoCaixaBanco.dataFechamento!) : ''), onTap: () {
          _detalharFinFechamentoCaixaBanco(finFechamentoCaixaBanco, context);
        }),
        DataCell(Text(MaskedTextController(text: finFechamentoCaixaBanco.mesAno, mask: Constantes.mascaraMES_ANO).text), onTap: () {
          _detalharFinFechamentoCaixaBanco(finFechamentoCaixaBanco, context);
        }),
        DataCell(Text(MaskedTextController(text: finFechamentoCaixaBanco.mes, mask: Constantes.mascaraMES).text), onTap: () {
          _detalharFinFechamentoCaixaBanco(finFechamentoCaixaBanco, context);
        }),
        DataCell(Text(MaskedTextController(text: finFechamentoCaixaBanco.ano, mask: Constantes.mascaraANO).text), onTap: () {
          _detalharFinFechamentoCaixaBanco(finFechamentoCaixaBanco, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finFechamentoCaixaBanco.saldoAnterior ?? 0)), onTap: () {
          _detalharFinFechamentoCaixaBanco(finFechamentoCaixaBanco, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finFechamentoCaixaBanco.recebimentos ?? 0)), onTap: () {
          _detalharFinFechamentoCaixaBanco(finFechamentoCaixaBanco, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finFechamentoCaixaBanco.pagamentos ?? 0)), onTap: () {
          _detalharFinFechamentoCaixaBanco(finFechamentoCaixaBanco, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finFechamentoCaixaBanco.saldoConta ?? 0)), onTap: () {
          _detalharFinFechamentoCaixaBanco(finFechamentoCaixaBanco, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finFechamentoCaixaBanco.chequeNaoCompensado ?? 0)), onTap: () {
          _detalharFinFechamentoCaixaBanco(finFechamentoCaixaBanco, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finFechamentoCaixaBanco.saldoDisponivel ?? 0)), onTap: () {
          _detalharFinFechamentoCaixaBanco(finFechamentoCaixaBanco, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaFinFechamentoCaixaBanco!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharFinFechamentoCaixaBanco(FinFechamentoCaixaBanco finFechamentoCaixaBanco, BuildContext context) {
   Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => FinFechamentoCaixaBancoPersistePage(
          finFechamentoCaixaBanco: finFechamentoCaixaBanco,
          title: 'Fin Fechamento Caixa Banco - Editando',
          operacao: 'A')));

  /*Navigator.pushNamed(
    context,
    '/finFechamentoCaixaBancoDetalhe',
    arguments: finFechamentoCaixaBanco,
  );*/
}