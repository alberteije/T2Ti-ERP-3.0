/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [VIEW_FIN_MOVIMENTO_CAIXA_BANCO] 
                                                                                
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
import 'package:backdrop/backdrop.dart';
import 'package:fenix/src/infra/biblioteca.dart';
import 'package:fenix/src/infra/sessao.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/infra/constantes.dart';
import 'package:intl/intl.dart';

class ProcessaFechamentoPage extends StatefulWidget {
  final ViewFinMovimentoCaixaBanco? viewFinMovimentoCaixaBanco;
  final String? mesAno;

  const ProcessaFechamentoPage({Key? key, this.viewFinMovimentoCaixaBanco, this.mesAno}) : super(key: key);

  @override
  ProcessaFechamentoPageState createState() => ProcessaFechamentoPageState();
}

class ProcessaFechamentoPageState  extends State<ProcessaFechamentoPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  FinFechamentoCaixaBanco? _finFechamentoCaixaBanco;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => filtrar());
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<ViewFinMovimentoCaixaBancoViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    String nomeContaCaixa = widget.viewFinMovimentoCaixaBanco!.nomeContaCaixa ?? '';   

    var listaViewFinMovimentoCaixaBanco = Provider.of<ViewFinMovimentoCaixaBancoViewModel>(context).listaViewFinMovimentoCaixaBanco;

    final ProcessaFechamentoDataSource processaFechamentoDataSource = ProcessaFechamentoDataSource(listaViewFinMovimentoCaixaBanco, context);

    void sort<T>(
        Comparable<T>? Function(
            ViewFinMovimentoCaixaBanco viewFinMovimentoCaixaBanco) getField,
        int columnIndex,
        bool ascending) {
      processaFechamentoDataSource.sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

      return BackdropScaffold( 
        appBar: BackdropAppBar(
          title: const Text("Fechamento"),
          actions: <Widget>[
            IconButton(
              tooltip: 'Processa o Fechamento Mensal da Conta/Caixa',
              icon: const Icon(Icons.receipt, color: Colors.yellow),
              onPressed: () {
                processarFechamento();
              },
            ),
          ],
        ),        
        backLayer: getResumoTotais(context),
        frontLayer: Scrollbar(
          child: listaViewFinMovimentoCaixaBanco == null
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(8.0),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: Text("${widget.mesAno!} - $nomeContaCaixa"),
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
                          label: const Text('Operacao'),
                          tooltip: 'Operacao',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<String>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco.operacao,
                                  columnIndex,
                                  ascending),
                        ),
                        DataColumn(
                          label: const Text('Nome Cliente / Fornecedor'),
                          tooltip: 'Nome Cliente / Fornecedor',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<String>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco.nomePessoa,
                                  columnIndex,
                                  ascending),
                        ),
                        DataColumn(
                          label: const Text('Data Lancamento'),
                          tooltip: 'Data Lancamento',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<DateTime>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco
                                          .dataLancamento,
                                  columnIndex,
                                  ascending),
                        ),
                        DataColumn(
                          label: const Text('Data Pago Recebido'),
                          tooltip: 'Data Pago Recebido',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<DateTime>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco
                                          .dataPagoRecebido,
                                  columnIndex,
                                  ascending),
                        ),
                        DataColumn(
                          label: const Text('Historico'),
                          tooltip: 'Historico',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<String>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco.historico,
                                  columnIndex,
                                  ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor'),
                          tooltip: 'Valor',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<num>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco.valor,
                                  columnIndex,
                                  ascending),
                        ),
                        DataColumn(
                          label: const Text('Descricao Documento Origem'),
                          tooltip: 'Descricao Documento Origem',
                          onSort: (int columnIndex, bool ascending) =>
                              sort<String>(
                                  (ViewFinMovimentoCaixaBanco
                                          viewFinMovimentoCaixaBanco) =>
                                      viewFinMovimentoCaixaBanco
                                          .descricaoDocumentoOrigem,
                                  columnIndex,
                                  ascending),
                        ),
                      ],
                      source: processaFechamentoDataSource,
                    ),
                  ],
                ),
              ),
            );         
    
  }

  Future filtrar() async {
    // pega os lançamentos filtrados por mes/ano e por conta/caixa
    String montaWhere = '';
    montaWhere = '$montaWhere?filter=MES_ANO||\$eq||${widget.mesAno!}';
    montaWhere = '$montaWhere&filter=ID_CONTA_CAIXA||\$eq||${widget.viewFinMovimentoCaixaBanco!.idContaCaixa}';
    Sessao.filtroGlobal.condicao = 'where';
    Sessao.filtroGlobal.where = montaWhere;
    await Provider.of<ViewFinMovimentoCaixaBancoViewModel>(context).consultarLista(filtro: Sessao.filtroGlobal);
    await consultaFechamento();
  }

  Future consultaFechamento() async {
    // consulta o fechamento
    Filtro filtro = Filtro();
    String montaWhere = '';
    montaWhere = '$montaWhere?filter=MES_ANO||\$eq||${widget.mesAno!}';
    montaWhere = '$montaWhere&filter=ID_BANCO_CONTA_CAIXA||\$eq||${widget.viewFinMovimentoCaixaBanco!.idContaCaixa}';
    filtro.condicao = 'where';
    filtro.where = montaWhere;
    await Provider.of<FinFechamentoCaixaBancoViewModel>(context).consultarLista(filtro: filtro);
    if (!mounted) return;
    if (Provider.of<FinFechamentoCaixaBancoViewModel>(context).listaFinFechamentoCaixaBanco!.isNotEmpty) {
      _finFechamentoCaixaBanco = Provider.of<FinFechamentoCaixaBancoViewModel>(context).listaFinFechamentoCaixaBanco!.elementAt(0);
    } else {
      _finFechamentoCaixaBanco = FinFechamentoCaixaBanco();
    }
  }

  Widget getResumoTotais(BuildContext context) {
    return Scrollbar(
    child: SingleChildScrollView(
      dragStartBehavior: DragStartBehavior.down,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: Colors.white,
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 10.0),
            Card(
              color: ViewUtilLib.getBackgroundColorCardValor(_finFechamentoCaixaBanco?.saldoAnterior ?? 0),
              elevation: 10,
              child: Container (
                padding: const EdgeInsets.all(8.0),
                height: 35,
                child: Text(
                  'Saldo Anterior: ${Constantes.formatoDecimalValor.format(_finFechamentoCaixaBanco?.saldoAnterior ?? 0)}',
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontFamily: Constantes.ralewayFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              color: ViewUtilLib.getBackgroundColorCardValor(_finFechamentoCaixaBanco?.recebimentos ?? 0),
              elevation: 10,
              child: Container (
                padding: const EdgeInsets.all(8.0),
                height: 35,
                child: Text(
                  'Recebimentos: ${Constantes.formatoDecimalValor.format(_finFechamentoCaixaBanco?.recebimentos ?? 0)}',
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontFamily: Constantes.ralewayFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              color: ViewUtilLib.getBackgroundColorCardValor(_finFechamentoCaixaBanco?.pagamentos ?? 0),
              elevation: 10,
              child: Container (
                padding: const EdgeInsets.all(8.0),
                height: 35,
                child: Text(
                  'Pagamentos: ${Constantes.formatoDecimalValor.format(_finFechamentoCaixaBanco?.pagamentos ?? 0)}',
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontFamily: Constantes.ralewayFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              color: ViewUtilLib.getBackgroundColorCardValor(_finFechamentoCaixaBanco?.saldoConta ?? 0),
              elevation: 10,
              child: Container (
                padding: const EdgeInsets.all(8.0),
                height: 35,
                child: Text(
                  'Saldo Conta: ${Constantes.formatoDecimalValor.format(_finFechamentoCaixaBanco?.saldoConta ?? 0)}',
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontFamily: Constantes.ralewayFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              color: ViewUtilLib.getBackgroundColorCardValor(_finFechamentoCaixaBanco?.chequeNaoCompensado ?? 0),
              elevation: 10,
              child: Container (
                padding: const EdgeInsets.all(8.0),
                height: 35,
                child: Text(
                  'Cheques Não Compensados: ${Constantes.formatoDecimalValor.format(_finFechamentoCaixaBanco?.chequeNaoCompensado ?? 0)}',
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontFamily: Constantes.ralewayFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              color: ViewUtilLib.getBackgroundColorCardValor(_finFechamentoCaixaBanco?.saldoDisponivel ?? 0),
              elevation: 10,
              child: Container (
                padding: const EdgeInsets.all(8.0),
                height: 35,
                child: Text(
                  'Saldo Disponível: ${Constantes.formatoDecimalValor.format(_finFechamentoCaixaBanco?.saldoDisponivel ?? 0)}',
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontFamily: Constantes.ralewayFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
          ],),
        ),
      ),
    );    
  }  

  processarFechamento() {
    gerarDialogBoxConfirmacao(context, 'Deseja processar o fechamento?', () async {
      double? saldoAnterior = 0;
      double pagamentos = 0;
      double recebimentos = 0;
      double chequesNaoCompensados = 0;

      // pega o fechamento anterior
      Filtro filtro = Filtro();
      String montaWhere = '';
      montaWhere = '$montaWhere?filter=MES_ANO||\$eq||${Biblioteca.periodoAnterior(widget.mesAno!)}';   
      montaWhere = '$montaWhere&filter=ID_BANCO_CONTA_CAIXA||\$eq||${widget.viewFinMovimentoCaixaBanco!.idContaCaixa}';
      filtro.condicao = 'where';
      filtro.where = montaWhere;

      FinFechamentoCaixaBanco? fechamentoAnterior;
      await Provider.of<FinFechamentoCaixaBancoViewModel>(context).consultarLista(filtro: filtro);
      if (!mounted) return;
      if (Provider.of<FinFechamentoCaixaBancoViewModel>(context).listaFinFechamentoCaixaBanco!.isNotEmpty) {
        fechamentoAnterior = Provider.of<FinFechamentoCaixaBancoViewModel>(context).listaFinFechamentoCaixaBanco!.elementAt(0);
      }

      // se houver fechamento anterior, pega o saldo anterior
      if (fechamentoAnterior != null) {
        saldoAnterior = fechamentoAnterior.saldoDisponivel;
      }

      // pega os cheques não compensados
      filtro = Filtro();
      filtro.condicao = 'eq';
      filtro.campo = 'ID_CONTA_CAIXA';
      filtro.valor = widget.viewFinMovimentoCaixaBanco!.idContaCaixa.toString();
      await Provider.of<ViewFinChequeNaoCompensadoViewModel>(context).consultarLista(filtro: filtro);
      if (!mounted) return;
      List<ViewFinChequeNaoCompensado> listaCheques = Provider.of<ViewFinChequeNaoCompensadoViewModel>(context).listaViewFinChequeNaoCompensado!;
      try {
        for (ViewFinChequeNaoCompensado objeto in listaCheques) {
          chequesNaoCompensados = chequesNaoCompensados + objeto.valor!;
        }     
      } catch (e) {
        debugPrint(e.toString());
      }     

      // pega pagamentos e recebimentos
      List<ViewFinMovimentoCaixaBanco> listaLancamentos = Provider.of<ViewFinMovimentoCaixaBancoViewModel>(context).listaViewFinMovimentoCaixaBanco!;
      try {
        for (ViewFinMovimentoCaixaBanco objeto in listaLancamentos) {
          if (objeto.operacao == 'Saída') {
            pagamentos = pagamentos + objeto.valor!;
          }
          else if (objeto.operacao == 'Entrada') {
            recebimentos = recebimentos + objeto.valor!;
          }
        }     
      } catch (e) {
        debugPrint(e.toString());
      }

      // insere/atualiza o fechamento
      _finFechamentoCaixaBanco!.bancoContaCaixa = BancoContaCaixa(id: widget.viewFinMovimentoCaixaBanco!.idContaCaixa);
      _finFechamentoCaixaBanco!.idBancoContaCaixa = widget.viewFinMovimentoCaixaBanco!.idContaCaixa;
      _finFechamentoCaixaBanco!.dataFechamento = DateTime.now();
      _finFechamentoCaixaBanco!.mesAno = widget.mesAno;
      _finFechamentoCaixaBanco!.mes = widget.mesAno!.substring(0, 2);
      _finFechamentoCaixaBanco!.ano = widget.mesAno!.substring(3, 7);
      _finFechamentoCaixaBanco!.saldoAnterior = saldoAnterior;
      _finFechamentoCaixaBanco!.recebimentos = recebimentos;
      _finFechamentoCaixaBanco!.pagamentos = pagamentos;
      _finFechamentoCaixaBanco!.saldoConta = saldoAnterior! + recebimentos - pagamentos;
      _finFechamentoCaixaBanco!.chequeNaoCompensado = chequesNaoCompensados;
      _finFechamentoCaixaBanco!.saldoDisponivel = saldoAnterior + recebimentos - pagamentos - chequesNaoCompensados;

      if (_finFechamentoCaixaBanco!.id != null) {
        await Provider.of<FinFechamentoCaixaBancoViewModel>(context).alterar(_finFechamentoCaixaBanco!);
      } else {
        await Provider.of<FinFechamentoCaixaBancoViewModel>(context).inserir(_finFechamentoCaixaBanco!);
      }
      if (!mounted) return;
      Navigator.of(context).pop();
    });
  }

}

/// codigo referente a fonte de dados
class ProcessaFechamentoDataSource extends DataTableSource {
  final List<ViewFinMovimentoCaixaBanco>? listaViewFinMovimentoCaixaBanco;
  final BuildContext context;

  ProcessaFechamentoDataSource(this.listaViewFinMovimentoCaixaBanco, this.context);

  void sort<T>(
      Comparable<T>? Function(
          ViewFinMovimentoCaixaBanco viewFinMovimentoCaixaBanco) getField,
      bool ascending) {
    listaViewFinMovimentoCaixaBanco!
        .sort((ViewFinMovimentoCaixaBanco a, ViewFinMovimentoCaixaBanco b) {
      if (!ascending) {
        final ViewFinMovimentoCaixaBanco c = a;
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
    if (index >= listaViewFinMovimentoCaixaBanco!.length) return null;
    final ViewFinMovimentoCaixaBanco viewFinMovimentoCaixaBanco =
        listaViewFinMovimentoCaixaBanco![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(viewFinMovimentoCaixaBanco.operacao ?? ''),
            onTap: () {
        }),
        DataCell(Text(viewFinMovimentoCaixaBanco.nomePessoa ?? ''),
            onTap: () {
        }),
        DataCell(
            Text(
                viewFinMovimentoCaixaBanco.dataLancamento != null ? DateFormat('dd/MM/yyyy').format(viewFinMovimentoCaixaBanco.dataLancamento!) : ''),
            onTap: () {
        }),
        DataCell(
            Text(
                viewFinMovimentoCaixaBanco.dataPagoRecebido != null ? DateFormat('dd/MM/yyyy').format(viewFinMovimentoCaixaBanco.dataPagoRecebido!) : ''),
            onTap: () {
        }),
        DataCell(Text(viewFinMovimentoCaixaBanco.historico ?? ''),
            onTap: () {
        }),
        DataCell(
            Text(
                viewFinMovimentoCaixaBanco.valor != null ? Constantes.formatoDecimalValor.format(viewFinMovimentoCaixaBanco.valor) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
        }),
        DataCell(
            Text(
                viewFinMovimentoCaixaBanco.descricaoDocumentoOrigem ?? ''),
            onTap: () {
        }),
      ],
    );
  }

  @override
  int get rowCount => listaViewFinMovimentoCaixaBanco!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

}