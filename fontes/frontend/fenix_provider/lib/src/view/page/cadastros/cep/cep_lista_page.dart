/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [CEP] 
                                                                                
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

import 'package:extended_masked_text/extended_masked_text.dart';
import 'cep_persiste_page.dart';

class CepListaPage extends StatefulWidget {
  const CepListaPage({Key? key}) : super(key: key);

  @override
  CepListaPageState createState() => CepListaPageState();
}

class CepListaPageState extends State<CepListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = Cep.colunas;
  final _campos = Cep.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<CepViewModel>(context, listen: false).objetoJsonErro)
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
    final listaCep = Provider.of<CepViewModel>(context).listaCep;
    final objetoJsonErro = Provider.of<CepViewModel>(context).objetoJsonErro;

    if (listaCep == null && objetoJsonErro == null) {
      Provider.of<CepViewModel>(context, listen: false).consultarLista();
    }
  
    final _CepDataSource cepDataSource = _CepDataSource(listaCep, context);

    void sort<T>(Comparable<T>? Function(Cep cep) getField, int columnIndex, bool ascending) {
      cepDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Cep'),
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
                child: listaCep == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(                        
                      header: const Text('Relação - Cep'),
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
                            sort<num>((Cep cep) => cep.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Número CEP'),
                          tooltip: 'CEP',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Cep cep) => cep.numero, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Logradouro'),
                          tooltip: 'Logradouro',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Cep cep) => cep.logradouro, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Complemento'),
                          tooltip: 'Complemento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Cep cep) => cep.complemento, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Bairro'),
                          tooltip: 'Bairro',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Cep cep) => cep.bairro, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Município'),
                          tooltip: 'Município',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Cep cep) => cep.municipio, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('UF'),
                          tooltip: 'UF',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((Cep cep) => cep.uf, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Município IBGE'),
                          tooltip: 'Código IBGE do Município',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((Cep cep) => cep.codigoIbgeMunicipio, columnIndex, ascending),
                        ),
                      ],
                      source: cepDataSource,
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
          CepPersistePage(cep: Cep(), title: 'Cep - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<CepViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Cep - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<CepViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<CepViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<CepViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Cep')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<CepViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _CepDataSource extends DataTableSource {
  final List<Cep>? listaCep;
  final BuildContext context;

  _CepDataSource(this.listaCep, this.context);

  void sort<T>(Comparable<T>? Function(Cep cep) getField, bool ascending) {
    listaCep!.sort((Cep a, Cep b) {
      if (!ascending) {
        final Cep c = a;
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
    if (index >= listaCep!.length) return null;
    final Cep cep = listaCep![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${cep.id ?? ''}'), onTap: () {
          _detalharCep(cep, context);
        }),
        DataCell(Text(MaskedTextController(text: cep.numero, mask: Constantes.mascaraCEP).text), onTap: () {
          _detalharCep(cep, context);
        }),
        DataCell(Text(cep.logradouro ?? ''), onTap: () {
          _detalharCep(cep, context);
        }),
        DataCell(Text(cep.complemento ?? ''), onTap: () {
          _detalharCep(cep, context);
        }),
        DataCell(Text(cep.bairro ?? ''), onTap: () {
          _detalharCep(cep, context);
        }),
        DataCell(Text(cep.municipio ?? ''), onTap: () {
          _detalharCep(cep, context);
        }),
        DataCell(Text(cep.uf ?? ''), onTap: () {
          _detalharCep(cep, context);
        }),
        DataCell(Text('${cep.codigoIbgeMunicipio ?? ''}'), onTap: () {
          _detalharCep(cep, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaCep!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharCep(Cep cep, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => 
        CepPersistePage(cep: cep, title: 'Cep - Editando', operacao: 'A')));
}