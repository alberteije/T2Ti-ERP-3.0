/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [FIN_CONFIGURACAO_BOLETO] 
                                                                                
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

import 'fin_configuracao_boleto_persiste_page.dart';

class FinConfiguracaoBoletoListaPage extends StatefulWidget {
  const FinConfiguracaoBoletoListaPage({Key? key}) : super(key: key);

  @override
  FinConfiguracaoBoletoListaPageState createState() => FinConfiguracaoBoletoListaPageState();
}

class FinConfiguracaoBoletoListaPageState extends State<FinConfiguracaoBoletoListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = FinConfiguracaoBoleto.colunas;
  final _campos = FinConfiguracaoBoleto.campos;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<FinConfiguracaoBoletoViewModel>(context, listen: false).objetoJsonErro)
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
    if (Provider.of<FinConfiguracaoBoletoViewModel>(context).listaFinConfiguracaoBoleto == null && Provider.of<FinConfiguracaoBoletoViewModel>(context).objetoJsonErro == null) {
      Provider.of<FinConfiguracaoBoletoViewModel>(context, listen: false).consultarLista();
    }
    var listaFinConfiguracaoBoleto = Provider.of<FinConfiguracaoBoletoViewModel>(context).listaFinConfiguracaoBoleto;

    final _FinConfiguracaoBoletoDataSource finConfiguracaoBoletoDataSource = _FinConfiguracaoBoletoDataSource(listaFinConfiguracaoBoleto, context);

    void sort<T>(Comparable<T>? Function(FinConfiguracaoBoleto finConfiguracaoBoleto) getField, int columnIndex, bool ascending) {
      finConfiguracaoBoletoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Fin Configuracao Boleto'),
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
                child: listaFinConfiguracaoBoleto == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(                        
                      header: const Text('Relação - Fin Configuracao Boleto'),
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
                            sort<num>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Conta/Caixa'),
                          tooltip: 'Conta/Caixa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.bancoContaCaixa?.nome, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Instrução 01'),
                          tooltip: 'Instrução 01',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.instrucao01, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Instrução 02'),
                          tooltip: 'Instrução 02',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.instrucao02, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Caminho Arquivo Remessa'),
                          tooltip: 'Caminho Arquivo Remessa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.caminhoArquivoRemessa, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Caminho Arquivo Retorno'),
                          tooltip: 'Caminho Arquivo Retorno',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.caminhoArquivoRetorno, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Caminho Arquivo Logotipo'),
                          tooltip: 'Caminho Arquivo Logotipo',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.caminhoArquivoLogotipo, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Caminho Arquivo PDF'),
                          tooltip: 'Caminho Arquivo PDF',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.caminhoArquivoPdf, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Mensagem'),
                          tooltip: 'Mensagem',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.mensagem, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Local Pagamento'),
                          tooltip: 'Local Pagamento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.localPagamento, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Layout Remessa'),
                          tooltip: 'Layout Remessa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.layoutRemessa, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Aceite'),
                          tooltip: 'Aceite',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.aceite, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Espécie'),
                          tooltip: 'Espécie',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.especie, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Carteira'),
                          tooltip: 'Carteira',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.carteira, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Código Convênio'),
                          tooltip: 'Código Convênio',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.codigoConvenio, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Código Cedente'),
                          tooltip: 'Código Cedente',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.codigoCedente, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Taxa Multa'),
                          tooltip: 'Taxa Multa',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.taxaMulta, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Taxa Juros'),
                          tooltip: 'Taxa Juros',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.taxaJuro, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Dias Protesto'),
                          tooltip: 'Dias Protesto',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.diasProtesto, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Nosso Número Anterior'),
                          tooltip: 'Nosso Número Anterior',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinConfiguracaoBoleto finConfiguracaoBoleto) => finConfiguracaoBoleto.nossoNumeroAnterior, columnIndex, ascending),
                        ),
                      ],
                      source: finConfiguracaoBoletoDataSource,
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
            FinConfiguracaoBoletoPersistePage(finConfiguracaoBoleto: FinConfiguracaoBoleto(), title: 'Fin Configuracao Boleto - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<FinConfiguracaoBoletoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Fin Configuracao Boleto - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<FinConfiguracaoBoletoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<FinConfiguracaoBoletoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<FinConfiguracaoBoletoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(
              arquivoPdf: arquivoPdf, title: 'Relatório - Fin Configuracao Boleto')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<FinConfiguracaoBoletoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _FinConfiguracaoBoletoDataSource extends DataTableSource {
  final List<FinConfiguracaoBoleto>? listaFinConfiguracaoBoleto;
  final BuildContext context;

  _FinConfiguracaoBoletoDataSource(this.listaFinConfiguracaoBoleto, this.context);

  void sort<T>(Comparable<T>? Function(FinConfiguracaoBoleto finConfiguracaoBoleto) getField, bool ascending) {
    listaFinConfiguracaoBoleto!.sort((FinConfiguracaoBoleto a, FinConfiguracaoBoleto b) {
      if (!ascending) {
        final FinConfiguracaoBoleto c = a;
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
    if (index >= listaFinConfiguracaoBoleto!.length) return null;
    final FinConfiguracaoBoleto finConfiguracaoBoleto = listaFinConfiguracaoBoleto![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${finConfiguracaoBoleto.id ?? ''}'), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.bancoContaCaixa?.nome ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.instrucao01 ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.instrucao02 ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.caminhoArquivoRemessa ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.caminhoArquivoRetorno ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.caminhoArquivoLogotipo ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.caminhoArquivoPdf ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.mensagem ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.localPagamento ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.layoutRemessa ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.aceite ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.especie ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.carteira ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.codigoConvenio ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.codigoCedente ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(finConfiguracaoBoleto.taxaMulta ?? 0)), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(finConfiguracaoBoleto.taxaJuro ?? 0)), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text('${finConfiguracaoBoleto.diasProtesto ?? ''}'), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
        DataCell(Text(finConfiguracaoBoleto.nossoNumeroAnterior ?? ''), onTap: () {
          _detalharFinConfiguracaoBoleto(finConfiguracaoBoleto, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaFinConfiguracaoBoleto!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharFinConfiguracaoBoleto(FinConfiguracaoBoleto finConfiguracaoBoleto, BuildContext context) {
   Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => FinConfiguracaoBoletoPersistePage(
          finConfiguracaoBoleto: finConfiguracaoBoleto,
          title: 'Fin Configuracao Boleto - Editando',
          operacao: 'A')));

  /*Navigator.pushNamed(
    context,
    '/finConfiguracaoBoletoDetalhe',
    arguments: finConfiguracaoBoleto,
  );*/
}