/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [CTE_CABECALHO] 
                                                                                
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
import 'cte_cabecalho_page.dart';

class CteCabecalhoListaPage extends StatefulWidget {
  const CteCabecalhoListaPage({Key? key}) : super(key: key);

  @override
  CteCabecalhoListaPageState createState() => CteCabecalhoListaPageState();
}

class CteCabecalhoListaPageState extends State<CteCabecalhoListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = CteCabecalho.colunas;
  final _campos = CteCabecalho.campos;

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
      (_) => Sessao.tratarErrosSessao(context, Provider.of<CteCabecalhoViewModel>(context, listen: false).objetoJsonErro)
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
    final listaCteCabecalho = Provider.of<CteCabecalhoViewModel>(context).listaCteCabecalho;
    final objetoJsonErro = Provider.of<CteCabecalhoViewModel>(context).objetoJsonErro;

    if (listaCteCabecalho == null && objetoJsonErro == null) {
      Provider.of<CteCabecalhoViewModel>(context, listen: false).consultarLista();
    }

    final _CteCabecalhoDataSource cteCabecalhoDataSource = _CteCabecalhoDataSource(listaCteCabecalho, context);

    void sort<T>(Comparable<T>? Function(CteCabecalho cteCabecalho) getField, int columnIndex, bool ascending) {
      cteCabecalhoDataSource.sort<T>(getField, ascending);
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
              title: const Text('Cadastro - Cte Cabecalho'),
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
                child: listaCteCabecalho == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: const Text('Relação - Cte Cabecalho'),
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
                            sort<num>((CteCabecalho cteCabecalho) => cteCabecalho.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('CFOP'),
                          tooltip: 'CFOP',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CteCabecalho cteCabecalho) => cteCabecalho.cfop, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Natureza da Operação'),
                          tooltip: 'Natureza da Operação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.naturezaOperacao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Forma Pagamento'),
                          tooltip: 'Forma Pagamento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.formaPagamento, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Série'),
                          tooltip: 'Série',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.serie, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Número'),
                          tooltip: 'Número',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.numero, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data de Emissão'),
                          tooltip: 'Data de Emissão',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((CteCabecalho cteCabecalho) => cteCabecalho.dataHoraEmissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Formato Impressão DACTE'),
                          tooltip: 'Formato Impressão DACTE',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.formatoImpressaoDacte, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Tipo Emissão'),
                          tooltip: 'Tipo Emissão',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.tipoEmissao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Chave de Acesso'),
                          tooltip: 'Chave de Acesso',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.chaveAcesso, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('DV Chave Acesso'),
                          tooltip: 'DV Chave Acesso',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.digitoChaveAcesso, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Tipo CT-e'),
                          tooltip: 'Tipo CT-e',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.tipoCte, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Modal'),
                          tooltip: 'Modal',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.modal, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Município Início Prestação'),
                          tooltip: 'Município Início Prestação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.nomeMunicipioIniPrestacao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('UF Início Prestação'),
                          tooltip: 'UF Início Prestação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.ufIniPrestacao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Município Fim Prestação'),
                          tooltip: 'Município Fim Prestação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.nomeMunicipioFimPrestacao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('UF Fim Prestação'),
                          tooltip: 'UF Fim Prestação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.ufFimPrestacao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Retira'),
                          tooltip: 'Retira',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.retira, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Tomador do Serviço'),
                          tooltip: 'Tomador do Serviço',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.tomador, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Observação'),
                          tooltip: 'Observação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.observacoesGerais, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Total Serviços'),
                          tooltip: 'Valor Total Serviços',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CteCabecalho cteCabecalho) => cteCabecalho.valorTotalServico, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor a Receber'),
                          tooltip: 'Valor a Receber',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CteCabecalho cteCabecalho) => cteCabecalho.valorReceber, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor ICMS'),
                          tooltip: 'Valor ICMS',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CteCabecalho cteCabecalho) => cteCabecalho.valorIcms, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Total Carga'),
                          tooltip: 'Valor Total Carga',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((CteCabecalho cteCabecalho) => cteCabecalho.valorTotalCarga, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Produto Predominante'),
                          tooltip: 'Produto Predominante',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.produtoPredominante, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Outras Características Carga'),
                          tooltip: 'Outras Características Carga',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((CteCabecalho cteCabecalho) => cteCabecalho.cargaOutrasCaracteristicas, columnIndex, ascending),
                        ),
                      ],
                      source: cteCabecalhoDataSource,
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
          CteCabecalhoPage(cteCabecalho: CteCabecalho(), title: 'Cte Cabecalho - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<CteCabecalhoViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Cte Cabecalho - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<CteCabecalhoViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
	    await Provider.of<CteCabecalhoViewModel>(context).visualizarPdfWeb(filtro: _filtro);
	  } else {
        final arquivoPdf = await Provider.of<CteCabecalhoViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
		    builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Cte Cabecalho')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<CteCabecalhoViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _CteCabecalhoDataSource extends DataTableSource {
  final List<CteCabecalho>? listaCteCabecalho;
  final BuildContext context;

  _CteCabecalhoDataSource(this.listaCteCabecalho, this.context);

  void sort<T>(Comparable<T>? Function(CteCabecalho cteCabecalho) getField, bool ascending) {
    listaCteCabecalho!.sort((CteCabecalho a, CteCabecalho b) {
      if (!ascending) {
        final CteCabecalho c = a;
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
    if (index >= listaCteCabecalho!.length) return null;
    final CteCabecalho cteCabecalho = listaCteCabecalho![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${cteCabecalho.id ?? ''}'), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text('${cteCabecalho.cfop ?? ''}'), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.naturezaOperacao ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.formaPagamento ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.serie ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.numero ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(MaskedTextController(text: cteCabecalho.dataHoraEmissao?.toString(), mask: Constantes.mascaraDATA_HORA).text), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.formatoImpressaoDacte ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.tipoEmissao ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.chaveAcesso ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.digitoChaveAcesso ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.tipoCte ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.modal ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.nomeMunicipioIniPrestacao ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.ufIniPrestacao ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.nomeMunicipioFimPrestacao ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.ufFimPrestacao ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.retira ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.tomador ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.observacoesGerais ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(cteCabecalho.valorTotalServico ?? 0)), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(cteCabecalho.valorReceber ?? 0)), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(cteCabecalho.valorIcms ?? 0)), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(cteCabecalho.valorTotalCarga ?? 0)), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.produtoPredominante ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
        DataCell(Text(cteCabecalho.cargaOutrasCaracteristicas ?? ''), onTap: () {
          _detalharCteCabecalho(cteCabecalho, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaCteCabecalho!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharCteCabecalho(CteCabecalho cteCabecalho, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
        CteCabecalhoPage(cteCabecalho: cteCabecalho, title: 'Cte Cabecalho - Editando', operacao: 'A')));
}