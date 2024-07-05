/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [NFSE_CABECALHO] 
                                                                                
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

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/view/shared/page/filtro_page.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:intl/intl.dart';
import 'nfse_cabecalho_page.dart';

class NfseCabecalhoListaPage extends StatefulWidget {
  const NfseCabecalhoListaPage({Key? key}) : super(key: key);

  @override
  NfseCabecalhoListaPageState createState() => NfseCabecalhoListaPageState();
}

class NfseCabecalhoListaPageState extends State<NfseCabecalhoListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;

  final ScrollController _scrollController = ScrollController();

  void limparErro() {
    Provider.of<NfseCabecalhoViewModel>(context).objetoJsonErro = null;
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<NfseCabecalhoViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<NfseCabecalhoViewModel>(context).listaNfseCabecalho == null && Provider.of<NfseCabecalhoViewModel>(context).objetoJsonErro == null) {
      Provider.of<NfseCabecalhoViewModel>(context).consultarLista();
    }     
    var nfseCabecalhoProvider = Provider.of<NfseCabecalhoViewModel>(context);
    var listaNfseCabecalho = nfseCabecalhoProvider.listaNfseCabecalho;
    var colunas = NfseCabecalho.colunas;
    var campos = NfseCabecalho.campos;

    final NfseCabecalhoDataSource nfseCabecalhoDataSource = NfseCabecalhoDataSource(listaNfseCabecalho, context);

    void sort<T>(Comparable<T>? Function(NfseCabecalho nfseCabecalho) getField, int columnIndex, bool ascending) {
      nfseCabecalhoDataSource.sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

      return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro - Nfse Cabecalho'),
          actions: const <Widget>[],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: ViewUtilLib.getBackgroundColorBotaoInserir(),
            child: ViewUtilLib.getIconBotaoInserir(),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                      NfseCabecalhoPage(nfseCabecalho: NfseCabecalho(), title: 'Nfse Cabecalho - Inserindo', operacao: 'I')))
                  .then((_) {
                Provider.of<NfseCabecalhoViewModel>(context).consultarLista();
              });
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          color: ViewUtilLib.getBottomAppBarColor(),
          shape: const CircularNotchedRectangle(),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: ViewUtilLib.getIconBotaoFiltro(),
                onPressed: () async {
                  Filtro? filtro = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => FiltroPage(
                          title: 'Nfse Cabecalho - Filtro',
                          colunas: colunas,
                          filtroPadrao: true,
                        ),
                        fullscreenDialog: true,
                      ));
                  if (!mounted) return;    
                  if (filtro != null) {
                    if (filtro.campo != null) {
                      filtro.campo = campos[int.parse(filtro.campo!)];
                      await Provider.of<NfseCabecalhoViewModel>(context).consultarLista(filtro: filtro);
                    }
                  }
                },
              )
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refrescarTela,
          child: Scrollbar(
            child: listaNfseCabecalho == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                    padding: const EdgeInsets.all(8.0),
                    children: <Widget>[
                      PaginatedDataTable(
                        header: const Text('Relação - Nfse Cabecalho'),
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
									sort<num>((NfseCabecalho nfseCabecalho) => nfseCabecalho.id,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Cliente'),
								tooltip: 'Cliente',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.cliente?.pessoa?.nome,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Ordem de Serviço'),
								tooltip: 'Ordem de Serviço',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.osAbertura?.numero,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Número'),
								tooltip: 'Número',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.numero,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Código Verificação'),
								tooltip: 'Código Verificação',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.codigoVerificacao,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Data/Hora Emissão'),
								tooltip: 'Data/Hora Emissão',
								onSort: (int columnIndex, bool ascending) =>
									sort<DateTime>((NfseCabecalho nfseCabecalho) => nfseCabecalho.dataHoraEmissao,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Mês/Ano Competência'),
								tooltip: 'Mês/Ano Competência',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.competencia,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Número Substituída'),
								tooltip: 'Número Substituída',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.numeroSubstituida,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Natureza Operação'),
								tooltip: 'Natureza Operação',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.naturezaOperacao,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Regime Especial Tributação'),
								tooltip: 'Regime Especial Tributação',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.regimeEspecialTributacao,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Optante Simples Nacional'),
								tooltip: 'Optante Simples Nacional',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.optanteSimplesNacional,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Incentivador Cultural'),
								tooltip: 'Incentivador Cultural',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.incentivadorCultural,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Número RPS'),
								tooltip: 'Número RPS',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.numeroRps,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Série RPS'),
								tooltip: 'Série RPS',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.serieRps,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Tipo RPS'),
								tooltip: 'Tipo RPS',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.tipoRps,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Data de Emissão do RPS'),
								tooltip: 'Data de Emissão do RPS',
								onSort: (int columnIndex, bool ascending) =>
									sort<DateTime>((NfseCabecalho nfseCabecalho) => nfseCabecalho.dataEmissaoRps,
									columnIndex, ascending),
							),
							DataColumn(
								label: const Text('Outras Informações'),
								tooltip: 'Outras Informações',
								onSort: (int columnIndex, bool ascending) =>
									sort<String>((NfseCabecalho nfseCabecalho) => nfseCabecalho.outrasInformacoes,
									columnIndex, ascending),
							),
                        ],
                        source: nfseCabecalhoDataSource,
                      ),
                    ],
                  ),
          ),
        ),
      );
  }

  Future _refrescarTela() async {
    await Provider.of<NfseCabecalhoViewModel>(context).consultarLista();
  }
}

/// codigo referente a fonte de dados
class NfseCabecalhoDataSource extends DataTableSource {
  final List<NfseCabecalho>? listaNfseCabecalho;
  final BuildContext context;

  NfseCabecalhoDataSource(this.listaNfseCabecalho, this.context);

  void sort<T>(Comparable<T>? Function(NfseCabecalho nfseCabecalho) getField, bool ascending) {
    listaNfseCabecalho!.sort((NfseCabecalho a, NfseCabecalho b) {
      if (!ascending) {
        final NfseCabecalho c = a;
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
    if (index >= listaNfseCabecalho!.length) return null;
    final NfseCabecalho nfseCabecalho = listaNfseCabecalho![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
		DataCell(Text('${nfseCabecalho.id ?? ''}'), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.cliente?.pessoa?.nome ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.osAbertura?.numero ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.numero ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.codigoVerificacao ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text('${nfseCabecalho.dataHoraEmissao ?? ''}'), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.competencia ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.numeroSubstituida ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.naturezaOperacao ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.regimeEspecialTributacao ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.optanteSimplesNacional ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.incentivadorCultural ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.numeroRps ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.serieRps ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.tipoRps ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.dataEmissaoRps != null ? DateFormat('dd/MM/yyyy').format(nfseCabecalho.dataEmissaoRps!) : ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
		DataCell(Text(nfseCabecalho.outrasInformacoes ?? ''), onTap: () {
			detalharNfseCabecalho(nfseCabecalho, context);
		}),
      ],
    );
  }

  @override
  int get rowCount => listaNfseCabecalho!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

detalharNfseCabecalho(NfseCabecalho nfseCabecalho, BuildContext context) {
  Navigator.pushNamed(
    context,
    '/nfseCabecalhoDetalhe',
    arguments: nfseCabecalho,
  );
}
