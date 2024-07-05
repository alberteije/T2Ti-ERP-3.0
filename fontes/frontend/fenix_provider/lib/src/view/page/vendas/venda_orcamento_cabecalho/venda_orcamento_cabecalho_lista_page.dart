/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import 'package:fenix/src/infra/sessao.dart';
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
import 'venda_orcamento_cabecalho_page.dart';

class VendaOrcamentoCabecalhoListaPage extends StatefulWidget {
  const VendaOrcamentoCabecalhoListaPage({Key? key}) : super(key: key);

  @override
  VendaOrcamentoCabecalhoListaPageState createState() => VendaOrcamentoCabecalhoListaPageState();
}

class VendaOrcamentoCabecalhoListaPageState extends State<VendaOrcamentoCabecalhoListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = VendaOrcamentoCabecalho.colunas;
  final _campos = VendaOrcamentoCabecalho.campos;

  final ScrollController _scrollController = ScrollController();

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
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<VendaOrcamentoCabecalhoViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
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
    final listaVendaOrcamentoCabecalho = Provider.of<VendaOrcamentoCabecalhoViewModel>(context).listaVendaOrcamentoCabecalho;
    final objetoJsonErro = Provider.of<VendaOrcamentoCabecalhoViewModel>(context).objetoJsonErro;

    if (listaVendaOrcamentoCabecalho == null && objetoJsonErro == null) {
      Provider.of<VendaOrcamentoCabecalhoViewModel>(context, listen: false).consultarLista();
    }

    final _VendaOrcamentoCabecalhoDataSource vendaOrcamentoCabecalhoDataSource = _VendaOrcamentoCabecalhoDataSource(listaVendaOrcamentoCabecalho, context);

    void sort<T>(Comparable<T>? Function(VendaOrcamentoCabecalho vendaOrcamentoCabecalho) getField, int columnIndex, bool ascending) {
      vendaOrcamentoCabecalhoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Venda Orcamento Cabecalho'),
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
                child: listaVendaOrcamentoCabecalho == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: const Text('Relação - Venda Orcamento Cabecalho'),
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
                            sort<num>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Condição Pagamento'),
                          tooltip: 'Condição Pagamento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.vendaCondicoesPagamento?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Vendedor'),
                          tooltip: 'Vendedor',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.vendedor?.colaborador?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Cliente'),
                          tooltip: 'Cliente',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.cliente?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Transportadora'),
                          tooltip: 'Transportadora',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.transportadora?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Código do Orçamento'),
                          tooltip: 'Código do Orçamento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.codigo, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data de Cadastro'),
                          tooltip: 'Data de Cadastro',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.dataCadastro, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data de Entrega'),
                          tooltip: 'Data de Entrega',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.dataEntrega, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data de Validade'),
                          tooltip: 'Data de Validade',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.validade, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Tipo do Frete'),
                          tooltip: 'Tipo do Frete de Pessoa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.tipoFrete, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Subtotal'),
                          tooltip: 'Valor Subtotal',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.valorSubtotal, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Frete'),
                          tooltip: 'Valor Frete',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.valorFrete, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Taxa Comissão'),
                          tooltip: 'Taxa Comissão',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.taxaComissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Comissão'),
                          tooltip: 'Valor Comissão',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.valorComissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Taxa Desconto'),
                          tooltip: 'Taxa Desconto',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.taxaDesconto, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Desconto'),
                          tooltip: 'Valor Desconto',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.valorDesconto, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Total'),
                          tooltip: 'Valor Total',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.valorTotal, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Observação'),
                          tooltip: 'Observação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaOrcamentoCabecalho vendaOrcamentoCabecalho) => vendaOrcamentoCabecalho.observacao, columnIndex, ascending),
                        ),
                      ],
                      source: vendaOrcamentoCabecalhoDataSource,
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
          VendaOrcamentoCabecalhoPage(vendaOrcamentoCabecalho: VendaOrcamentoCabecalho(), title: 'Venda Orcamento Cabecalho - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<VendaOrcamentoCabecalhoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Venda Orcamento Cabecalho - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<VendaOrcamentoCabecalhoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
	    await Provider.of<VendaOrcamentoCabecalhoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
	  } else {
        final arquivoPdf = await Provider.of<VendaOrcamentoCabecalhoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
		    builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Venda Orcamento Cabecalho')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<VendaOrcamentoCabecalhoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _VendaOrcamentoCabecalhoDataSource extends DataTableSource {
  final List<VendaOrcamentoCabecalho>? listaVendaOrcamentoCabecalho;
  final BuildContext context;

  _VendaOrcamentoCabecalhoDataSource(this.listaVendaOrcamentoCabecalho, this.context);

  void sort<T>(Comparable<T>? Function(VendaOrcamentoCabecalho vendaOrcamentoCabecalho) getField, bool ascending) {
    listaVendaOrcamentoCabecalho!.sort((VendaOrcamentoCabecalho a, VendaOrcamentoCabecalho b) {
      if (!ascending) {
        final VendaOrcamentoCabecalho c = a;
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
    if (index >= listaVendaOrcamentoCabecalho!.length) return null;
    final VendaOrcamentoCabecalho vendaOrcamentoCabecalho = listaVendaOrcamentoCabecalho![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${vendaOrcamentoCabecalho.id ?? ''}'), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(vendaOrcamentoCabecalho.vendaCondicoesPagamento?.nome ?? ''), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(vendaOrcamentoCabecalho.vendedor?.colaborador?.pessoa?.nome ?? ''), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(vendaOrcamentoCabecalho.cliente?.pessoa?.nome ?? ''), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(vendaOrcamentoCabecalho.transportadora?.pessoa?.nome ?? ''), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(vendaOrcamentoCabecalho.codigo ?? ''), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(vendaOrcamentoCabecalho.dataCadastro != null ? DateFormat('dd/MM/yyyy').format(vendaOrcamentoCabecalho.dataCadastro!) : ''), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(vendaOrcamentoCabecalho.dataEntrega != null ? DateFormat('dd/MM/yyyy').format(vendaOrcamentoCabecalho.dataEntrega!) : ''), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(vendaOrcamentoCabecalho.validade != null ? DateFormat('dd/MM/yyyy').format(vendaOrcamentoCabecalho.validade!) : ''), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(vendaOrcamentoCabecalho.tipoFrete ?? ''), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaOrcamentoCabecalho.valorSubtotal ?? 0)), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaOrcamentoCabecalho.valorFrete ?? 0)), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(vendaOrcamentoCabecalho.taxaComissao ?? 0)), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaOrcamentoCabecalho.valorComissao ?? 0)), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(vendaOrcamentoCabecalho.taxaDesconto ?? 0)), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaOrcamentoCabecalho.valorDesconto ?? 0)), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaOrcamentoCabecalho.valorTotal ?? 0)), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
        DataCell(Text(vendaOrcamentoCabecalho.observacao ?? ''), onTap: () {
          _detalharVendaOrcamentoCabecalho(vendaOrcamentoCabecalho, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaVendaOrcamentoCabecalho!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharVendaOrcamentoCabecalho(VendaOrcamentoCabecalho vendaOrcamentoCabecalho, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
        VendaOrcamentoCabecalhoPage(vendaOrcamentoCabecalho: vendaOrcamentoCabecalho, title: 'Venda Orcamento Cabecalho - Editando', operacao: 'A')));
}