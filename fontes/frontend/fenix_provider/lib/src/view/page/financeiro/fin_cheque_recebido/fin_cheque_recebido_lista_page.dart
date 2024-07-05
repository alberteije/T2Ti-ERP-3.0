/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [FIN_CHEQUE_RECEBIDO] 
                                                                                
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
import 'fin_cheque_recebido_persiste_page.dart';

class FinChequeRecebidoListaPage extends StatefulWidget {
  const FinChequeRecebidoListaPage({Key? key}) : super(key: key);

  @override
  FinChequeRecebidoListaPageState createState() => FinChequeRecebidoListaPageState();
}

class FinChequeRecebidoListaPageState extends State<FinChequeRecebidoListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = FinChequeRecebido.colunas;
  final _campos = FinChequeRecebido.campos;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<FinChequeRecebidoViewModel>(context, listen: false).objetoJsonErro)
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
    if (Provider.of<FinChequeRecebidoViewModel>(context).listaFinChequeRecebido == null && Provider.of<FinChequeRecebidoViewModel>(context).objetoJsonErro == null) {
      Provider.of<FinChequeRecebidoViewModel>(context, listen: false).consultarLista();
    }
    var listaFinChequeRecebido = Provider.of<FinChequeRecebidoViewModel>(context).listaFinChequeRecebido;

    final _FinChequeRecebidoDataSource finChequeRecebidoDataSource = _FinChequeRecebidoDataSource(listaFinChequeRecebido, context);

    void sort<T>(Comparable<T>? Function(FinChequeRecebido finChequeRecebido) getField, int columnIndex, bool ascending) {
      finChequeRecebidoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Fin Cheque Recebido'),
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
                child: listaFinChequeRecebido == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(                        
                      header: const Text('Relação - Fin Cheque Recebido'),
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
                            sort<num>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Pessoa'),
                          tooltip: 'Pessoa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.pessoa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('CPF'),
                          tooltip: 'CPF',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.cpf, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('CNPJ'),
                          tooltip: 'CNPJ',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.cnpj, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Nome'),
                          tooltip: 'Nome',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Código Banco'),
                          tooltip: 'Código Banco',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.codigoBanco, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Código Agência'),
                          tooltip: 'Código Agência',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.codigoAgencia, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Conta'),
                          tooltip: 'Conta',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.conta, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Número do Cheque'),
                          tooltip: 'Número do Cheque',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.numero, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data de Emissão'),
                          tooltip: 'Data de Emissão',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.dataEmissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Cheque Bom Para'),
                          tooltip: 'Cheque Bom Para',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.bomPara, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data de Compensação'),
                          tooltip: 'Data de Compensação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.dataCompensacao, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor'),
                          tooltip: 'Valor',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.valor, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data da Custódia'),
                          tooltip: 'Data da Custódia',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.custodiaData, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Tarifa Custódia'),
                          tooltip: 'Tarifa Custódia',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.custodiaTarifa, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Custódia Comissão'),
                          tooltip: 'Custódia Comissão',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.custodiaComissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data de Desconto'),
                          tooltip: 'Data de Desconto',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.descontoData, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Tarifa Desconto'),
                          tooltip: 'Tarifa Desconto',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.descontoTarifa, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Desconto Comissão'),
                          tooltip: 'Desconto Comissão',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.descontoComissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Recebido'),
                          tooltip: 'Valor Recebido',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinChequeRecebido finChequeRecebido) => finChequeRecebido.valorRecebido, columnIndex, ascending),
                        ),
                      ],
                      source: finChequeRecebidoDataSource,
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
            FinChequeRecebidoPersistePage(finChequeRecebido: FinChequeRecebido(), title: 'Fin Cheque Recebido - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<FinChequeRecebidoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Fin Cheque Recebido - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<FinChequeRecebidoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<FinChequeRecebidoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<FinChequeRecebidoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(
              arquivoPdf: arquivoPdf, title: 'Relatório - Fin Cheque Recebido')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<FinChequeRecebidoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _FinChequeRecebidoDataSource extends DataTableSource {
  final List<FinChequeRecebido>? listaFinChequeRecebido;
  final BuildContext context;

  _FinChequeRecebidoDataSource(this.listaFinChequeRecebido, this.context);

  void sort<T>(Comparable<T>? Function(FinChequeRecebido finChequeRecebido) getField, bool ascending) {
    listaFinChequeRecebido!.sort((FinChequeRecebido a, FinChequeRecebido b) {
      if (!ascending) {
        final FinChequeRecebido c = a;
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
    if (index >= listaFinChequeRecebido!.length) return null;
    final FinChequeRecebido finChequeRecebido = listaFinChequeRecebido![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${finChequeRecebido.id ?? ''}'), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(finChequeRecebido.pessoa?.nome ?? ''), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(MaskedTextController(text: finChequeRecebido.cpf, mask: Constantes.mascaraCPF).text), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(MaskedTextController(text: finChequeRecebido.cnpj, mask: Constantes.mascaraCNPJ).text), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(finChequeRecebido.nome ?? ''), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(finChequeRecebido.codigoBanco ?? ''), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(finChequeRecebido.codigoAgencia ?? ''), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(finChequeRecebido.conta ?? ''), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text('${finChequeRecebido.numero ?? ''}'), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(finChequeRecebido.dataEmissao != null ? DateFormat('dd/MM/yyyy').format(finChequeRecebido.dataEmissao!) : ''), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(finChequeRecebido.bomPara != null ? DateFormat('dd/MM/yyyy').format(finChequeRecebido.bomPara!) : ''), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(finChequeRecebido.dataCompensacao != null ? DateFormat('dd/MM/yyyy').format(finChequeRecebido.dataCompensacao!) : ''), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finChequeRecebido.valor ?? 0)), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(finChequeRecebido.custodiaData != null ? DateFormat('dd/MM/yyyy').format(finChequeRecebido.custodiaData!) : ''), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finChequeRecebido.custodiaTarifa ?? 0)), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finChequeRecebido.custodiaComissao ?? 0)), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(finChequeRecebido.descontoData != null ? DateFormat('dd/MM/yyyy').format(finChequeRecebido.descontoData!) : ''), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finChequeRecebido.descontoTarifa ?? 0)), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finChequeRecebido.descontoComissao ?? 0)), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finChequeRecebido.valorRecebido ?? 0)), onTap: () {
          _detalharFinChequeRecebido(finChequeRecebido, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaFinChequeRecebido!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharFinChequeRecebido(FinChequeRecebido finChequeRecebido, BuildContext context) {
   Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => FinChequeRecebidoPersistePage(
          finChequeRecebido: finChequeRecebido,
          title: 'Fin Cheque Recebido - Editando',
          operacao: 'A')));

  /*Navigator.pushNamed(
    context,
    '/finChequeRecebidoDetalhe',
    arguments: finChequeRecebido,
  );*/
}