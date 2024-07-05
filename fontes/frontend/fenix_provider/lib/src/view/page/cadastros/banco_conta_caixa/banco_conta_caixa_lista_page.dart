/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [BANCO_CONTA_CAIXA] 
                                                                                
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

import 'banco_conta_caixa_persiste_page.dart';

class BancoContaCaixaListaPage extends StatefulWidget {
  const BancoContaCaixaListaPage({Key? key}) : super(key: key);

  @override
  BancoContaCaixaListaPageState createState() => BancoContaCaixaListaPageState();
}

class BancoContaCaixaListaPageState extends State<BancoContaCaixaListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = BancoContaCaixa.colunas;
  final _campos = BancoContaCaixa.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<BancoContaCaixaViewModel>(context, listen: false).objetoJsonErro)
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
    final listaBancoContaCaixa = Provider.of<BancoContaCaixaViewModel>(context).listaBancoContaCaixa;
    final objetoJsonErro = Provider.of<BancoContaCaixaViewModel>(context).objetoJsonErro;

    if (listaBancoContaCaixa == null && objetoJsonErro == null) {
      Provider.of<BancoContaCaixaViewModel>(context, listen: false).consultarLista();
    }
  
    final _BancoContaCaixaDataSource bancoContaCaixaDataSource = _BancoContaCaixaDataSource(listaBancoContaCaixa, context);

    void sort<T>(Comparable<T>? Function(BancoContaCaixa bancoContaCaixa) getField, int columnIndex, bool ascending) {
      bancoContaCaixaDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Banco Conta Caixa'),
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
                child: listaBancoContaCaixa == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(                        
                      header: const Text('Relação - Banco Conta Caixa'),
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
                            sort<num>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Agência'),
                          tooltip: 'Agência',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.bancoAgencia?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Número'),
                          tooltip: 'Número',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.numero, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Dígito'),
                          tooltip: 'Dígito',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.digito, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Nome'),
                          tooltip: 'Nome',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Tipo'),
                          tooltip: 'Tipo',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.tipo, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Descrição'),
                          tooltip: 'Descrição',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((BancoContaCaixa bancoContaCaixa) => bancoContaCaixa.descricao, columnIndex, ascending),
                        ),
                      ],
                      source: bancoContaCaixaDataSource,
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
          BancoContaCaixaPersistePage(bancoContaCaixa: BancoContaCaixa(), title: 'Banco Conta Caixa - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<BancoContaCaixaViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Banco Conta Caixa - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<BancoContaCaixaViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<BancoContaCaixaViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<BancoContaCaixaViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Banco Conta Caixa')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<BancoContaCaixaViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _BancoContaCaixaDataSource extends DataTableSource {
  final List<BancoContaCaixa>? listaBancoContaCaixa;
  final BuildContext context;

  _BancoContaCaixaDataSource(this.listaBancoContaCaixa, this.context);

  void sort<T>(Comparable<T>? Function(BancoContaCaixa bancoContaCaixa) getField, bool ascending) {
    listaBancoContaCaixa!.sort((BancoContaCaixa a, BancoContaCaixa b) {
      if (!ascending) {
        final BancoContaCaixa c = a;
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
    if (index >= listaBancoContaCaixa!.length) return null;
    final BancoContaCaixa bancoContaCaixa = listaBancoContaCaixa![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${bancoContaCaixa.id ?? ''}'), onTap: () {
          _detalharBancoContaCaixa(bancoContaCaixa, context);
        }),
        DataCell(Text(bancoContaCaixa.bancoAgencia?.nome ?? ''), onTap: () {
          _detalharBancoContaCaixa(bancoContaCaixa, context);
        }),
        DataCell(Text(bancoContaCaixa.numero ?? ''), onTap: () {
          _detalharBancoContaCaixa(bancoContaCaixa, context);
        }),
        DataCell(Text(bancoContaCaixa.digito ?? ''), onTap: () {
          _detalharBancoContaCaixa(bancoContaCaixa, context);
        }),
        DataCell(Text(bancoContaCaixa.nome ?? ''), onTap: () {
          _detalharBancoContaCaixa(bancoContaCaixa, context);
        }),
        DataCell(Text(bancoContaCaixa.tipo ?? ''), onTap: () {
          _detalharBancoContaCaixa(bancoContaCaixa, context);
        }),
        DataCell(Text(bancoContaCaixa.descricao ?? ''), onTap: () {
          _detalharBancoContaCaixa(bancoContaCaixa, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaBancoContaCaixa!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharBancoContaCaixa(BancoContaCaixa bancoContaCaixa, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => 
        BancoContaCaixaPersistePage(bancoContaCaixa: bancoContaCaixa, title: 'Banco Conta Caixa - Editando', operacao: 'A')));
}