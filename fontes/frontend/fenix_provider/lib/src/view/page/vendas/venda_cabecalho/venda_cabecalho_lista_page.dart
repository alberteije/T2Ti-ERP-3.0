/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [VENDA_CABECALHO] 
                                                                                
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
import 'package:extended_masked_text/extended_masked_text.dart';
import 'venda_cabecalho_page.dart';

class VendaCabecalhoListaPage extends StatefulWidget {
  const VendaCabecalhoListaPage({Key? key}) : super(key: key);

  @override
  VendaCabecalhoListaPageState createState() => VendaCabecalhoListaPageState();
}

class VendaCabecalhoListaPageState extends State<VendaCabecalhoListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = VendaCabecalho.colunas;
  final _campos = VendaCabecalho.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<VendaCabecalhoViewModel>(context, listen: false).objetoJsonErro)
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
    final listaVendaCabecalho = Provider.of<VendaCabecalhoViewModel>(context).listaVendaCabecalho;
    final objetoJsonErro = Provider.of<VendaCabecalhoViewModel>(context).objetoJsonErro;

    if (listaVendaCabecalho == null && objetoJsonErro == null) {
      Provider.of<VendaCabecalhoViewModel>(context, listen: false).consultarLista();
    }

    final _VendaCabecalhoDataSource vendaCabecalhoDataSource = _VendaCabecalhoDataSource(listaVendaCabecalho, context);

    void sort<T>(Comparable<T>? Function(VendaCabecalho vendaCabecalho) getField, int columnIndex, bool ascending) {
      vendaCabecalhoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Venda Cabecalho'),
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
                child: listaVendaCabecalho == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: const Text('Relação - Venda Cabecalho'),
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
                            sort<num>((VendaCabecalho vendaCabecalho) => vendaCabecalho.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Orçamento'),
                          tooltip: 'Orçamento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.vendaOrcamentoCabecalho?.codigo, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Condição Pagamento'),
                          tooltip: 'Condição Pagamento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.vendaCondicoesPagamento?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Tipo Nota Fiscal'),
                          tooltip: 'Tipo Nota Fiscal',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.notaFiscalTipo?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Cliente'),
                          tooltip: 'Cliente',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.cliente?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Transportadora'),
                          tooltip: 'Transportadora',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.transportadora?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Vendedor'),
                          tooltip: 'Vendedor',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.vendedor?.colaborador?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data da Venda'),
                          tooltip: 'Data da Venda',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((VendaCabecalho vendaCabecalho) => vendaCabecalho.dataVenda, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data da Saída'),
                          tooltip: 'Data da Saída',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((VendaCabecalho vendaCabecalho) => vendaCabecalho.dataSaida, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Hora da Saída'),
                          tooltip: 'Hora da Saída',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.horaSaida, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Número da Fatura'),
                          tooltip: 'Número da Fatura',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCabecalho vendaCabecalho) => vendaCabecalho.numeroFatura, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Local de Entrega'),
                          tooltip: 'Local de Entrega',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.localEntrega, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Local de Cobrança'),
                          tooltip: 'Local de Cobrança',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.localCobranca, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Subtotal'),
                          tooltip: 'Valor Subtotal',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCabecalho vendaCabecalho) => vendaCabecalho.valorSubtotal, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Taxa Comissão'),
                          tooltip: 'Taxa Comissão',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCabecalho vendaCabecalho) => vendaCabecalho.taxaComissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Comissão'),
                          tooltip: 'Valor Comissão',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCabecalho vendaCabecalho) => vendaCabecalho.valorComissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Taxa Desconto'),
                          tooltip: 'Taxa Desconto',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCabecalho vendaCabecalho) => vendaCabecalho.taxaDesconto, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Desconto'),
                          tooltip: 'Valor Desconto',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCabecalho vendaCabecalho) => vendaCabecalho.valorDesconto, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Total'),
                          tooltip: 'Valor Total',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCabecalho vendaCabecalho) => vendaCabecalho.valorTotal, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Tipo do Frete'),
                          tooltip: 'Tipo do Frete',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.tipoFrete, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Forma de Pagamento'),
                          tooltip: 'Forma de Pagamento de Pessoa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.formaPagamento, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Frete'),
                          tooltip: 'Valor Frete',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCabecalho vendaCabecalho) => vendaCabecalho.valorFrete, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Seguro'),
                          tooltip: 'Valor Seguro',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((VendaCabecalho vendaCabecalho) => vendaCabecalho.valorSeguro, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Observação'),
                          tooltip: 'Observação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.observacao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Situação'),
                          tooltip: 'Situação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.situacao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Dia Fixo da Parcela'),
                          tooltip: 'Dia Fixo da Parcela',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((VendaCabecalho vendaCabecalho) => vendaCabecalho.diaFixoParcela, columnIndex, ascending),
                        ),
                      ],
                      source: vendaCabecalhoDataSource,
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
          VendaCabecalhoPage(vendaCabecalho: VendaCabecalho(), title: 'Venda Cabecalho - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<VendaCabecalhoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Venda Cabecalho - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<VendaCabecalhoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
	    await Provider.of<VendaCabecalhoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
	  } else {
        final arquivoPdf = await Provider.of<VendaCabecalhoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
		    builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Venda Cabecalho')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<VendaCabecalhoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _VendaCabecalhoDataSource extends DataTableSource {
  final List<VendaCabecalho>? listaVendaCabecalho;
  final BuildContext context;

  _VendaCabecalhoDataSource(this.listaVendaCabecalho, this.context);

  void sort<T>(Comparable<T>? Function(VendaCabecalho vendaCabecalho) getField, bool ascending) {
    listaVendaCabecalho!.sort((VendaCabecalho a, VendaCabecalho b) {
      if (!ascending) {
        final VendaCabecalho c = a;
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
    if (index >= listaVendaCabecalho!.length) return null;
    final VendaCabecalho vendaCabecalho = listaVendaCabecalho![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${vendaCabecalho.id ?? ''}'), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.vendaOrcamentoCabecalho?.codigo ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.vendaCondicoesPagamento?.nome ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.notaFiscalTipo?.nome ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.cliente?.pessoa?.nome ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.transportadora?.pessoa?.nome ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.vendedor?.colaborador?.pessoa?.nome ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.dataVenda != null ? DateFormat('dd/MM/yyyy').format(vendaCabecalho.dataVenda!) : ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.dataSaida != null ? DateFormat('dd/MM/yyyy').format(vendaCabecalho.dataSaida!) : ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(MaskedTextController(text: vendaCabecalho.horaSaida, mask: Constantes.mascaraHORA).text), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text('${vendaCabecalho.numeroFatura ?? ''}'), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.localEntrega ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.localCobranca ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaCabecalho.valorSubtotal ?? 0)), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(vendaCabecalho.taxaComissao ?? 0)), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaCabecalho.valorComissao ?? 0)), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(vendaCabecalho.taxaDesconto ?? 0)), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaCabecalho.valorDesconto ?? 0)), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaCabecalho.valorTotal ?? 0)), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.tipoFrete ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.formaPagamento ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaCabecalho.valorFrete ?? 0)), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaCabecalho.valorSeguro ?? 0)), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.observacao ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.situacao ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
        DataCell(Text(vendaCabecalho.diaFixoParcela ?? ''), onTap: () {
          _detalharVendaCabecalho(vendaCabecalho, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaVendaCabecalho!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharVendaCabecalho(VendaCabecalho vendaCabecalho, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
        VendaCabecalhoPage(vendaCabecalho: vendaCabecalho, title: 'Venda Cabecalho - Editando', operacao: 'A')));
}