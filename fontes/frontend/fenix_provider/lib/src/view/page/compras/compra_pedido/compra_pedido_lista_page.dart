/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [COMPRA_PEDIDO] 
                                                                                
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
import 'compra_pedido_page.dart';

class CompraPedidoListaPage extends StatefulWidget {
  const CompraPedidoListaPage({Key? key}) : super(key: key);

  @override
  CompraPedidoListaPageState createState() => CompraPedidoListaPageState();
}

class CompraPedidoListaPageState extends State<CompraPedidoListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = CompraPedido.colunas;
  final _campos = CompraPedido.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<CompraPedidoViewModel>(context, listen: false).objetoJsonErro)
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
    final listaCompraPedido = Provider.of<CompraPedidoViewModel>(context).listaCompraPedido;
    final objetoJsonErro = Provider.of<CompraPedidoViewModel>(context).objetoJsonErro;

    if (listaCompraPedido == null && objetoJsonErro == null) {
      Provider.of<CompraPedidoViewModel>(context, listen: false).consultarLista();
    }

    final _CompraPedidoDataSource compraPedidoDataSource = _CompraPedidoDataSource(listaCompraPedido, context);

    void sort<T>(Comparable<T>? Function(CompraPedido compraPedido) getField, int columnIndex, bool ascending) {
      compraPedidoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Compra Pedido'),
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
                child: listaCompraPedido == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: const Text('Relação - Compra Pedido'),
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
                            sort<num>((CompraPedido compraPedido) => compraPedido.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Tipo Pedido'),
                          tooltip: 'Tipo Pedido',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CompraPedido compraPedido) => compraPedido.compraTipoPedido?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Fornecedor'),
                          tooltip: 'Fornecedor',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CompraPedido compraPedido) => compraPedido.fornecedor?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Colaborador'),
                          tooltip: 'Colaborador',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CompraPedido compraPedido) => compraPedido.colaborador?.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data do Pedido'),
                          tooltip: 'Data do Pedido',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((CompraPedido compraPedido) => compraPedido.dataPedido, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data Prevista para Entrega'),
                          tooltip: 'Data Prevista para Entrega',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((CompraPedido compraPedido) => compraPedido.dataPrevistaEntrega, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data Previsão Pagamento'),
                          tooltip: 'Data Previsão Pagamento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((CompraPedido compraPedido) => compraPedido.dataPrevisaoPagamento, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Local de Entrega'),
                          tooltip: 'Local de Entrega',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CompraPedido compraPedido) => compraPedido.localEntrega, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Local de Cobrança'),
                          tooltip: 'Local de Cobrança',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CompraPedido compraPedido) => compraPedido.localCobranca, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Nome do Contato'),
                          tooltip: 'Nome do Contato',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CompraPedido compraPedido) => compraPedido.contato, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Subtotal'),
                          tooltip: 'Valor Subtotal',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.valorSubtotal, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Taxa Desconto'),
                          tooltip: 'Taxa Desconto',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.taxaDesconto, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Desconto'),
                          tooltip: 'Valor Desconto',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.valorDesconto, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Total'),
                          tooltip: 'Valor Total',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.valorTotal, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Tipo do Frete'),
                          tooltip: 'Tipo do Frete de Pessoa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CompraPedido compraPedido) => compraPedido.tipoFrete, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Forma de Pagamento'),
                          tooltip: 'Forma de Pagamento de Pessoa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CompraPedido compraPedido) => compraPedido.formaPagamento, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Base Cálculo ICMS'),
                          tooltip: 'Base Cálculo ICMS',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.baseCalculoIcms, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor do ICMS'),
                          tooltip: 'Valor do ICMS',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.valorIcms, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Base Cálculo ICMS ST'),
                          tooltip: 'Base Cálculo ICMS ST',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.baseCalculoIcmsSt, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor do ICMS ST'),
                          tooltip: 'Valor do ICMS ST',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.valorIcmsSt, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Total Produtos'),
                          tooltip: 'Valor Total Produtos',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.valorTotalProdutos, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Frete'),
                          tooltip: 'Valor Frete',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.valorFrete, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Seguro'),
                          tooltip: 'Valor Seguro',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.valorSeguro, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Outras Despesas'),
                          tooltip: 'Valor Outras Despesas',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.valorOutrasDespesas, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor do IPI'),
                          tooltip: 'Valor do IPI',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.valorIpi, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Total NF'),
                          tooltip: 'Valor Total NF',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.valorTotalNf, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Quantidade de Parcelas'),
                          tooltip: 'Quantidade de Parcelas',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.quantidadeParcelas, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Dia Primeiro Vencimento'),
                          tooltip: 'Dia Primeiro Vencimento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CompraPedido compraPedido) => compraPedido.diaPrimeiroVencimento, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Intervalo entre Parcelas'),
                          tooltip: 'Intervalo entre Parcelas',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CompraPedido compraPedido) => compraPedido.intervaloEntreParcelas, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Dia Fixo da Parcela'),
                          tooltip: 'Dia Fixo da Parcela',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CompraPedido compraPedido) => compraPedido.diaFixoParcela, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Código da Cotação'),
                          tooltip: 'Código da Cotação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CompraPedido compraPedido) => compraPedido.codigoCotacao, columnIndex, ascending),
                        ),
                      ],
                      source: compraPedidoDataSource,
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
          CompraPedidoPage(compraPedido: CompraPedido(), title: 'Compra Pedido - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<CompraPedidoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Compra Pedido - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<CompraPedidoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
	    await Provider.of<CompraPedidoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
	  } else {
        final arquivoPdf = await Provider.of<CompraPedidoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
		    builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Compra Pedido')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<CompraPedidoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _CompraPedidoDataSource extends DataTableSource {
  final List<CompraPedido>? listaCompraPedido;
  final BuildContext context;

  _CompraPedidoDataSource(this.listaCompraPedido, this.context);

  void sort<T>(Comparable<T>? Function(CompraPedido compraPedido) getField, bool ascending) {
    listaCompraPedido!.sort((CompraPedido a, CompraPedido b) {
      if (!ascending) {
        final CompraPedido c = a;
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
    if (index >= listaCompraPedido!.length) return null;
    final CompraPedido compraPedido = listaCompraPedido![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${compraPedido.id ?? ''}'), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(compraPedido.compraTipoPedido?.nome ?? ''), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(compraPedido.fornecedor?.pessoa?.nome ?? ''), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(compraPedido.colaborador?.pessoa?.nome ?? ''), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(compraPedido.dataPedido != null ? DateFormat('dd/MM/yyyy').format(compraPedido.dataPedido!) : ''), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(compraPedido.dataPrevistaEntrega != null ? DateFormat('dd/MM/yyyy').format(compraPedido.dataPrevistaEntrega!) : ''), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(compraPedido.dataPrevisaoPagamento != null ? DateFormat('dd/MM/yyyy').format(compraPedido.dataPrevisaoPagamento!) : ''), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(compraPedido.localEntrega ?? ''), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(compraPedido.localCobranca ?? ''), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(compraPedido.contato ?? ''), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.valorSubtotal ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(compraPedido.taxaDesconto ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.valorDesconto ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.valorTotal ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(compraPedido.tipoFrete ?? ''), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(compraPedido.formaPagamento ?? ''), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.baseCalculoIcms ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.valorIcms ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.baseCalculoIcmsSt ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.valorIcmsSt ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.valorTotalProdutos ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.valorFrete ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.valorSeguro ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.valorOutrasDespesas ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.valorIpi ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedido.valorTotalNf ?? 0)), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text('${compraPedido.quantidadeParcelas ?? ''}'), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(MaskedTextController(text: compraPedido.diaPrimeiroVencimento, mask: Constantes.mascaraDIA).text), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text('${compraPedido.intervaloEntreParcelas ?? ''}'), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(MaskedTextController(text: compraPedido.diaFixoParcela, mask: Constantes.mascaraDIA).text), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
        DataCell(Text(compraPedido.codigoCotacao ?? ''), onTap: () {
          _detalharCompraPedido(compraPedido, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaCompraPedido!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharCompraPedido(CompraPedido compraPedido, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
        CompraPedidoPage(compraPedido: compraPedido, title: 'Compra Pedido - Editando', operacao: 'A')));
}