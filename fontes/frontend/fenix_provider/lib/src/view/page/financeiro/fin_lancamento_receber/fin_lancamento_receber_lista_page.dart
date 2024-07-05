/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [FIN_LANCAMENTO_RECEBER] 
                                                                                
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
import 'package:fenix/src/view/shared/botoes.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/page/filtro_page.dart';
import 'package:fenix/src/view/shared/page/pdf_page.dart';

import 'package:intl/intl.dart';
import 'fin_lancamento_receber_page.dart';

class FinLancamentoReceberListaPage extends StatefulWidget {
  const FinLancamentoReceberListaPage({Key? key}) : super(key: key);

  @override
  FinLancamentoReceberListaPageState createState() => FinLancamentoReceberListaPageState();
}

class FinLancamentoReceberListaPageState extends State<FinLancamentoReceberListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = FinLancamentoReceber.colunas;
  final _campos = FinLancamentoReceber.campos;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<FinLancamentoReceberViewModel>(context, listen: false).objetoJsonErro)
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
    if (Provider.of<FinLancamentoReceberViewModel>(context).listaFinLancamentoReceber == null && Provider.of<FinLancamentoReceberViewModel>(context).objetoJsonErro == null) {
      Provider.of<FinLancamentoReceberViewModel>(context, listen: false).consultarLista();
    }     
    var listaFinLancamentoReceber = Provider.of<FinLancamentoReceberViewModel>(context).listaFinLancamentoReceber;

    final _FinLancamentoReceberDataSource finLancamentoReceberDataSource = _FinLancamentoReceberDataSource(listaFinLancamentoReceber, context);

    void sort<T>(Comparable<T>? Function(FinLancamentoReceber finLancamentoReceber) getField, int columnIndex, bool ascending) {
      finLancamentoReceberDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Fin Lancamento Receber'),
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
                child: listaFinLancamentoReceber == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: const Text('Relação - Fin Lancamento Receber'),
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
                            sort<num>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Documento Origem'),
                          tooltip: 'Documento Origem',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.finDocumentoOrigem?.sigla, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Natureza Financeira'),
                          tooltip: 'Natureza Financeira',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.finDocumentoOrigem?.sigla, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Cliente'),
                          tooltip: 'Cliente',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.cliente?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Conta/Caixa'),
                          tooltip: 'Conta/Caixa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.bancoContaCaixa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Quantidade de Parcelas'),
                          tooltip: 'Quantidade de Parcelas',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.quantidadeParcela, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor a Receber'),
                          tooltip: 'Valor a Receber',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.valorAReceber, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data de Lançamento'),
                          tooltip: 'Data de Lançamento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.dataLancamento, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Número do Documento'),
                          tooltip: 'Número do Documento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.numeroDocumento, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data do Primeiro Vencimento'),
                          tooltip: 'Data do Primeiro Vencimento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.primeiroVencimento, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Taxa de Comissão'),
                          tooltip: 'Taxa de Comissão',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.taxaComissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Comissão'),
                          tooltip: 'Valor Comissão',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.valorComissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Intervalo Entre Parcelas'),
                          tooltip: 'Intervalo Entre Parcelas',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.intervaloEntreParcelas, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Dia Fixo da Parcela'),
                          tooltip: 'Dia Fixo da Parcela',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoReceber finLancamentoReceber) => finLancamentoReceber.diaFixo, columnIndex, ascending),
                        ),
                      ],
                      source: finLancamentoReceberDataSource,
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
          FinLancamentoReceberPage(finLancamentoReceber: FinLancamentoReceber(), title: 'Fin Lancamento Receber - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<FinLancamentoReceberViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Fin Lancamento Receber - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<FinLancamentoReceberViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
        context, Constantes.perguntaGerarRelatorio, () async {
        Navigator.of(context).pop();

        if (kIsWeb) {
          await Provider.of<FinLancamentoReceberViewModel>(context).visualizarPdfWeb(filtro: _filtro);
        } else {
          final arquivoPdf = await Provider.of<FinLancamentoReceberViewModel>(context).visualizarPdf(filtro: _filtro);
          if (!mounted) return;
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (BuildContext context) => PdfPage(
                      arquivoPdf: arquivoPdf, title: 'Relatório - Fin Lancamento Receber')));
        }
      });
  }

  Future _refrescarTela() async {
    await Provider.of<FinLancamentoReceberViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _FinLancamentoReceberDataSource extends DataTableSource {
  final List<FinLancamentoReceber>? listaFinLancamentoReceber;
  final BuildContext context;

  _FinLancamentoReceberDataSource(this.listaFinLancamentoReceber, this.context);

  void sort<T>(Comparable<T>? Function(FinLancamentoReceber finLancamentoReceber) getField, bool ascending) {
    listaFinLancamentoReceber!.sort((FinLancamentoReceber a, FinLancamentoReceber b) {
      if (!ascending) {
        final FinLancamentoReceber c = a;
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
    if (index >= listaFinLancamentoReceber!.length) return null;
    final FinLancamentoReceber finLancamentoReceber = listaFinLancamentoReceber![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${finLancamentoReceber.id ?? ''}'), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text(finLancamentoReceber.finDocumentoOrigem?.sigla ?? ''), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text(finLancamentoReceber.finDocumentoOrigem?.sigla ?? ''), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text(finLancamentoReceber.cliente?.pessoa?.nome ?? ''), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text(finLancamentoReceber.bancoContaCaixa?.nome ?? ''), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text('${finLancamentoReceber.quantidadeParcela ?? ''}'), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finLancamentoReceber.valorAReceber ?? 0)), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text(finLancamentoReceber.dataLancamento != null ? DateFormat('dd/MM/yyyy').format(finLancamentoReceber.dataLancamento!) : ''), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text(finLancamentoReceber.numeroDocumento ?? ''), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text(finLancamentoReceber.primeiroVencimento != null ? DateFormat('dd/MM/yyyy').format(finLancamentoReceber.primeiroVencimento!) : ''), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(finLancamentoReceber.taxaComissao ?? 0)), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finLancamentoReceber.valorComissao ?? 0)), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text('${finLancamentoReceber.intervaloEntreParcelas ?? ''}'), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
        DataCell(Text(finLancamentoReceber.diaFixo ?? ''), onTap: () {
          _detalharFinLancamentoReceber(finLancamentoReceber, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaFinLancamentoReceber!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharFinLancamentoReceber(FinLancamentoReceber finLancamentoReceber, BuildContext context) {
  Navigator.of(context)
    .push(MaterialPageRoute(
        builder: (BuildContext context) =>
        FinLancamentoReceberPage(finLancamentoReceber: finLancamentoReceber, title: 'Fin Lancamento Receber - Editando', operacao: 'A')));
	
  /*Navigator.pushNamed(
    context,
    '/finLancamentoReceberDetalhe',
    arguments: finLancamentoReceber,
  );*/
}