/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [BANCO] 
                                                                                
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

import 'package:fenix/src/infra/infra.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/botoes.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/page/filtro_page.dart';
import 'package:fenix/src/view/shared/page/pdf_page.dart';

import 'banco_persiste_page.dart';

class BancoListaPage extends StatefulWidget {
  const BancoListaPage({Key? key}) : super(key: key);

  @override
  BancoListaPageState createState() => BancoListaPageState();
}

class BancoListaPageState extends State<BancoListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = Banco.colunas;
  final _campos = Banco.campos;
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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<BancoViewModel>(context, listen: false).objetoJsonErro)
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
    final listaBanco = Provider.of<BancoViewModel>(context).listaBanco;
    final objetoJsonErro = Provider.of<BancoViewModel>(context).objetoJsonErro;

    if (listaBanco == null && objetoJsonErro == null) {
      Provider.of<BancoViewModel>(context, listen: false).consultarLista();
    }
  
    final _BancoDataSource bancoDataSource = _BancoDataSource(listaBanco, context);

    void sort<T>(Comparable<T>? Function(Banco banco) getField, int columnIndex, bool ascending) {
      bancoDataSource.sort<T>(getField, ascending);
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
            title: const Text('Cadastro - Banco'),
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
              child: listaBanco == null
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                controller: _scrollController,                
                padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                children: <Widget>[
                  PaginatedDataTable(                        
                    header: const Text('Relação - Banco'),
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
                          sort<num>((Banco banco) => banco.id, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Código'),
                        tooltip: 'Código',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Banco banco) => banco.codigo, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('Nome'),
                        tooltip: 'Nome',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Banco banco) => banco.nome, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: const Text('URL'),
                        tooltip: 'URL',
                        onSort: (int columnIndex, bool ascending) =>
                          sort<String>((Banco banco) => banco.url, columnIndex, ascending),
                      ),
                    ],
                    source: bancoDataSource,
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
          BancoPersistePage(banco: Banco(), title: 'Banco - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<BancoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Banco - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<BancoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<BancoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<BancoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Banco')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<BancoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _BancoDataSource extends DataTableSource {
  final List<Banco>? listaBanco;
  final BuildContext context;

  _BancoDataSource(this.listaBanco, this.context);

  void sort<T>(Comparable<T>? Function(Banco banco) getField, bool ascending) {
    listaBanco!.sort((Banco a, Banco b) {
      if (!ascending) {
        final Banco c = a;
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
    if (index >= listaBanco!.length) return null;
    final Banco banco = listaBanco![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(banco.id?.toString() ?? ''), onTap: () {
          _detalharBanco(banco, context);
        }),
        DataCell(Text(banco.codigo ?? ''), onTap: () {
          _detalharBanco(banco, context);
        }),
        DataCell(Text(banco.nome ?? ''), onTap: () {
          _detalharBanco(banco, context);
        }),
        DataCell(Text(banco.url ?? ''), onTap: () {
          _detalharBanco(banco, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaBanco!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharBanco(Banco banco, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => 
        BancoPersistePage(banco: banco, title: 'Banco - Editando', operacao: 'A')));
}