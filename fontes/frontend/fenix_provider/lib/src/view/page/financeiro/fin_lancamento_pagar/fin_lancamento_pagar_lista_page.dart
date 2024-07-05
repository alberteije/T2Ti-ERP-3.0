/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [FIN_LANCAMENTO_PAGAR] 
                                                                                
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
import 'package:extended_masked_text/extended_masked_text.dart';
import 'fin_lancamento_pagar_page.dart';

class FinLancamentoPagarListaPage extends StatefulWidget {
  const FinLancamentoPagarListaPage({Key? key}) : super(key: key);

  @override
  FinLancamentoPagarListaPageState createState() => FinLancamentoPagarListaPageState();
}

class FinLancamentoPagarListaPageState extends State<FinLancamentoPagarListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = FinLancamentoPagar.colunas;
  final _campos = FinLancamentoPagar.campos;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<FinLancamentoPagarViewModel>(context, listen: false).objetoJsonErro)
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
    if (Provider.of<FinLancamentoPagarViewModel>(context).listaFinLancamentoPagar == null && Provider.of<FinLancamentoPagarViewModel>(context).objetoJsonErro == null) {
      Provider.of<FinLancamentoPagarViewModel>(context, listen: false).consultarLista();
    }     
    var listaFinLancamentoPagar = Provider.of<FinLancamentoPagarViewModel>(context).listaFinLancamentoPagar;

    final _FinLancamentoPagarDataSource finLancamentoPagarDataSource = _FinLancamentoPagarDataSource(listaFinLancamentoPagar, context);

    void sort<T>(Comparable<T>? Function(FinLancamentoPagar finLancamentoPagar) getField, int columnIndex, bool ascending) {
      finLancamentoPagarDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Fin Lancamento Pagar'),
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
                child: listaFinLancamentoPagar == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: const Text('Relação - Fin Lancamento Pagar'),
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
                            sort<num>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Documento Origem'),
                          tooltip: 'Documento Origem',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.finDocumentoOrigem?.sigla, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Natureza Financeira'),
                          tooltip: 'Natureza Financeira',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.finDocumentoOrigem?.sigla, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Fornecedor'),
                          tooltip: 'Fornecedor',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.fornecedor?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Conta/Caixa'),
                          tooltip: 'Conta/Caixa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.bancoContaCaixa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Quantidade de Parcelas'),
                          tooltip: 'Quantidade de Parcelas',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.quantidadeParcela, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor a Pagar'),
                          tooltip: 'Valor a Pagar',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.valorAPagar, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data de Lançamento'),
                          tooltip: 'Data de Lançamento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.dataLancamento, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Número do Documento'),
                          tooltip: 'Número do Documento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.numeroDocumento, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Imagem Documento'),
                          tooltip: 'Imagem Documento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.imagemDocumento, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data do Primeiro Vencimento'),
                          tooltip: 'Data do Primeiro Vencimento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.primeiroVencimento, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Intervalo Entre Parcelas'),
                          tooltip: 'Intervalo Entre Parcelas',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.intervaloEntreParcelas, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Dia Fixo'),
                          tooltip: 'Dia Fixo',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinLancamentoPagar finLancamentoPagar) => finLancamentoPagar.diaFixo, columnIndex, ascending),
                        ),
                      ],
                      source: finLancamentoPagarDataSource,
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
          FinLancamentoPagarPage(finLancamentoPagar: FinLancamentoPagar(), title: 'Fin Lancamento Pagar - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<FinLancamentoPagarViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Fin Lancamento Pagar - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<FinLancamentoPagarViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
        context, Constantes.perguntaGerarRelatorio, () async {
        Navigator.of(context).pop();

        if (kIsWeb) {
          await Provider.of<FinLancamentoPagarViewModel>(context).visualizarPdfWeb(filtro: _filtro);
        } else {
          final arquivoPdf = await Provider.of<FinLancamentoPagarViewModel>(context).visualizarPdf(filtro: _filtro);
          if (!mounted) return;
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (BuildContext context) => PdfPage(
                      arquivoPdf: arquivoPdf, title: 'Relatório - Fin Lancamento Pagar')));
        }
      });
  }

  Future _refrescarTela() async {
    await Provider.of<FinLancamentoPagarViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _FinLancamentoPagarDataSource extends DataTableSource {
  final List<FinLancamentoPagar>? listaFinLancamentoPagar;
  final BuildContext context;

  _FinLancamentoPagarDataSource(this.listaFinLancamentoPagar, this.context);

  void sort<T>(Comparable<T>? Function(FinLancamentoPagar finLancamentoPagar) getField, bool ascending) {
    listaFinLancamentoPagar!.sort((FinLancamentoPagar a, FinLancamentoPagar b) {
      if (!ascending) {
        final FinLancamentoPagar c = a;
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
    if (index >= listaFinLancamentoPagar!.length) return null;
    final FinLancamentoPagar finLancamentoPagar = listaFinLancamentoPagar![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${finLancamentoPagar.id ?? ''}'), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
        DataCell(Text(finLancamentoPagar.finDocumentoOrigem?.sigla ?? ''), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
        DataCell(Text(finLancamentoPagar.finDocumentoOrigem?.sigla ?? ''), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
        DataCell(Text(finLancamentoPagar.fornecedor?.pessoa?.nome ?? ''), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
        DataCell(Text(finLancamentoPagar.bancoContaCaixa?.nome ?? ''), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
        DataCell(Text('${finLancamentoPagar.quantidadeParcela ?? ''}'), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finLancamentoPagar.valorAPagar ?? 0)), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
        DataCell(Text(finLancamentoPagar.dataLancamento != null ? DateFormat('dd/MM/yyyy').format(finLancamentoPagar.dataLancamento!) : ''), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
        DataCell(Text(finLancamentoPagar.numeroDocumento ?? ''), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
        DataCell(Text(finLancamentoPagar.imagemDocumento ?? ''), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
        DataCell(Text(finLancamentoPagar.primeiroVencimento != null ? DateFormat('dd/MM/yyyy').format(finLancamentoPagar.primeiroVencimento!) : ''), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
        DataCell(Text('${finLancamentoPagar.intervaloEntreParcelas ?? ''}'), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
        DataCell(Text(MaskedTextController(text: finLancamentoPagar.diaFixo, mask: Constantes.mascaraDIA).text), onTap: () {
          _detalharFinLancamentoPagar(finLancamentoPagar, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaFinLancamentoPagar!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharFinLancamentoPagar(FinLancamentoPagar finLancamentoPagar, BuildContext context) {
  Navigator.of(context)
    .push(MaterialPageRoute(
        builder: (BuildContext context) =>
        FinLancamentoPagarPage(finLancamentoPagar: finLancamentoPagar, title: 'Fin Lancamento Pagar - Editando', operacao: 'A')));
	
  /*Navigator.pushNamed(
    context,
    '/finLancamentoPagarDetalhe',
    arguments: finLancamentoPagar,
  );*/
}