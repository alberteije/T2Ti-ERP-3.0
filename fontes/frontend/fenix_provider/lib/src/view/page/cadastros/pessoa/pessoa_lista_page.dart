/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [PESSOA] 
                                                                                
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

import 'pessoa_page.dart';

class PessoaListaPage extends StatefulWidget {
  const PessoaListaPage({Key? key}) : super(key: key);

  @override
  PessoaListaPageState createState() => PessoaListaPageState();
}

class PessoaListaPageState extends State<PessoaListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = Pessoa.colunas;
  final _campos = Pessoa.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<PessoaViewModel>(context, listen: false).objetoJsonErro)
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
    final listaPessoa = Provider.of<PessoaViewModel>(context).listaPessoa;
    final objetoJsonErro = Provider.of<PessoaViewModel>(context).objetoJsonErro;

    if (listaPessoa == null && objetoJsonErro == null) {
      Provider.of<PessoaViewModel>(context, listen: false).consultarLista();
    }

    final _PessoaDataSource pessoaDataSource = _PessoaDataSource(listaPessoa, context);

    void sort<T>(Comparable<T>? Function(Pessoa pessoa) getField, int columnIndex, bool ascending) {
      pessoaDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Pessoa'),
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
                child: listaPessoa == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                  controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: const Text('Relação - Pessoa'),
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
                            sort<num>((Pessoa pessoa) => pessoa.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Nome'),
                          tooltip: 'Nome',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Pessoa pessoa) => pessoa.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Tipo Pessoa'),
                          tooltip: 'Tipo Pessoa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Pessoa pessoa) => pessoa.tipo, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Site'),
                          tooltip: 'Site',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Pessoa pessoa) => pessoa.site, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('EMail'),
                          tooltip: 'EMail',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Pessoa pessoa) => pessoa.email, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('É Cliente'),
                          tooltip: 'É Cliente',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Pessoa pessoa) => pessoa.ehCliente, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('É Fornecedor'),
                          tooltip: 'É Fornecedor',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Pessoa pessoa) => pessoa.ehFornecedor, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('É Transportadora'),
                          tooltip: 'É Transportadora',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Pessoa pessoa) => pessoa.ehTransportadora, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('É Colaborador'),
                          tooltip: 'É Colaborador',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Pessoa pessoa) => pessoa.ehColaborador, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('É Contador'),
                          tooltip: 'É Contador',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Pessoa pessoa) => pessoa.ehContador, columnIndex, ascending),
                        ),
                      ],
                      source: pessoaDataSource,
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
          PessoaPage(pessoa: Pessoa(), title: 'Pessoa - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<PessoaViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Pessoa - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<PessoaViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
	    await Provider.of<PessoaViewModel>(context).visualizarPdfWeb(filtro: _filtro);
	  } else {
        final arquivoPdf = await Provider.of<PessoaViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
		    builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Pessoa')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<PessoaViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _PessoaDataSource extends DataTableSource {
  final List<Pessoa>? listaPessoa;
  final BuildContext context;

  _PessoaDataSource(this.listaPessoa, this.context);

  void sort<T>(Comparable<T>? Function(Pessoa pessoa) getField, bool ascending) {
    listaPessoa!.sort((Pessoa a, Pessoa b) {
      if (!ascending) {
        final Pessoa c = a;
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
    if (index >= listaPessoa!.length) return null;
    final Pessoa pessoa = listaPessoa![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${pessoa.id ?? ''}'), onTap: () {
          _detalharPessoa(pessoa, context);
        }),
        DataCell(Text(pessoa.nome ?? ''), onTap: () {
          _detalharPessoa(pessoa, context);
        }),
        DataCell(Text(pessoa.tipo ?? ''), onTap: () {
          _detalharPessoa(pessoa, context);
        }),
        DataCell(Text(pessoa.site ?? ''), onTap: () {
          _detalharPessoa(pessoa, context);
        }),
        DataCell(Text(pessoa.email ?? ''), onTap: () {
          _detalharPessoa(pessoa, context);
        }),
        DataCell(Text(pessoa.ehCliente ?? ''), onTap: () {
          _detalharPessoa(pessoa, context);
        }),
        DataCell(Text(pessoa.ehFornecedor ?? ''), onTap: () {
          _detalharPessoa(pessoa, context);
        }),
        DataCell(Text(pessoa.ehTransportadora ?? ''), onTap: () {
          _detalharPessoa(pessoa, context);
        }),
        DataCell(Text(pessoa.ehColaborador ?? ''), onTap: () {
          _detalharPessoa(pessoa, context);
        }),
        DataCell(Text(pessoa.ehContador ?? ''), onTap: () {
          _detalharPessoa(pessoa, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaPessoa!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharPessoa(Pessoa pessoa, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
        PessoaPage(pessoa: pessoa, title: 'Pessoa - Editando', operacao: 'A')));
}