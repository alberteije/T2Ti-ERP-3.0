/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [FIN_EXTRATO_CONTA_BANCO]
Utilizada para realizar a conciliação bancária 
                                                                                
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
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';

import 'package:backdrop/backdrop.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';
import 'package:fenix/src/infra/constantes.dart';
import 'package:intl/intl.dart';

class ConciliacaoBancariaEspecificoPage extends StatefulWidget {
  final BancoContaCaixa? bancoContaCaixa;
  final String? mesAno;

  const ConciliacaoBancariaEspecificoPage({Key? key, this.bancoContaCaixa, this.mesAno}) : super(key: key);

  @override
  ConciliacaoBancariaEspecificoPageState createState() => ConciliacaoBancariaEspecificoPageState();
}

class ConciliacaoBancariaEspecificoPageState  extends State<ConciliacaoBancariaEspecificoPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  String _creditos = '';
  String _debitos = '';
  String _saldo = '';

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => filtrar());
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<FinExtratoContaBancoViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String nomeContaCaixa = widget.bancoContaCaixa!.nome ?? '';

    var listaFinExtratoContaBanco = Provider.of<FinExtratoContaBancoViewModel>(context).listaFinExtratoContaBanco;

    final ConciliacaoBancariaEspecificoDataSource conciliacaoBancariaEspecificoDataSource = ConciliacaoBancariaEspecificoDataSource(listaFinExtratoContaBanco, context);

    void sort<T>(
        Comparable<T>? Function(FinExtratoContaBanco finExtratoContaBanco) getField,
        int columnIndex,
        bool ascending) {
      conciliacaoBancariaEspecificoDataSource.sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

      return BackdropScaffold( 
        appBar: BackdropAppBar(
          title: Text("Extrato Bancário - ${widget.mesAno!}"),
          actions: <Widget>[
            const BackdropToggleButton(
              icon: AnimatedIcons.list_view,
            ),
            IconButton(
              tooltip: 'Importar Arquivo do Extrato Bancário',
              icon: const Icon(Icons.file_download, color: Colors.white),
              onPressed: () {
                importarExtrato(listaFinExtratoContaBanco);
              },
            ),
            IconButton(
              tooltip: 'Conciliar Lançamentos',
              icon: const Icon(Icons.playlist_add_check, color: Colors.yellow),
              onPressed: () {
                conciliarLancamentos(listaFinExtratoContaBanco);
              },
            ),
            IconButton(
              tooltip: 'Conciliar Cheques',
              icon: const Icon(Icons.playlist_add_check, color: Colors.orange),
              onPressed: () {
                conciliarCheques(listaFinExtratoContaBanco);
              },
            ),
          ],
        ),                    
        backLayer: getResumoTotais(context),
        frontLayer: Scrollbar(
          child: listaFinExtratoContaBanco == null
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(8.0),
                  children: <Widget>[
                    PaginatedDataTable(
                      header: Text(nomeContaCaixa),
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
                          label: const Text('Data de Movimento'),
                          tooltip: 'Data de Movimento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.dataMovimento,
                            columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Data do Balancete'),
                          tooltip: 'Data do Balancete',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<DateTime>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.dataBalancete,
                            columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Histórico'),
                          tooltip: 'Histórico',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.historico,
                            columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Documento'),
                          tooltip: 'Documento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.documento,
                            columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor'),
                          tooltip: 'Valor',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.valor,
                            columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Conciliado'),
                          tooltip: 'Conciliado',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.conciliado,
                            columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Observação'),
                          tooltip: 'Observação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((FinExtratoContaBanco finExtratoContaBanco) => finExtratoContaBanco.observacao,
                            columnIndex, ascending),
                        ),
                      ],
                      source: conciliacaoBancariaEspecificoDataSource,
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
    montaWhere = '$montaWhere&filter=ID_BANCO_CONTA_CAIXA||\$eq||${widget.bancoContaCaixa!.id}';
    Sessao.filtroGlobal.condicao = 'where';
    Sessao.filtroGlobal.where = montaWhere;
    await Provider.of<FinExtratoContaBancoViewModel>(context, listen: false).consultarLista(filtro: Sessao.filtroGlobal);
    await calcularTotais();
  }

  Future calcularTotais() async {
    double creditos = 0;
    double debitos = 0;
    double saldo = 0;
    List<FinExtratoContaBanco> listaLancamentos = Provider.of<FinExtratoContaBancoViewModel>(context, listen: false).listaFinExtratoContaBanco!;
    try {
      for (FinExtratoContaBanco objeto in listaLancamentos) {
        if (objeto.valor! < 0) {
          debitos = debitos + objeto.valor!;
        }
        else {
          creditos = creditos + objeto.valor!;
        }
      }     
      saldo = creditos + debitos;
      _creditos = 'Créditos: ${Constantes.formatoDecimalValor.format(creditos)}';
      _debitos = 'Débitos: ${Constantes.formatoDecimalValor.format(debitos)}';
      _saldo = 'Saldo: ${Constantes.formatoDecimalValor.format(saldo)}';
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  importarExtrato(List<FinExtratoContaBanco>? listaFinExtratoContaBanco) {
    // TODO: inserir um CircularProgressIndicator enquanto executa o procedimento
    gerarDialogBoxConfirmacao(context, 'Deseja importar o arquivo do extrato bancário?', () async {
      /*
      try {
        // limpa a lista
        listaFinExtratoContaBanco!.clear();

        // exlui os registros no banco de dados
        await Provider.of<FinExtratoContaBancoViewModel>(context).excluir(widget.mesAno);

        // carrega os dados do arquivo
        late File file;// = await FilePicker.getFile(type: FileType.any);
        String arquivoOFX = await file.readAsString();
        final arquivoXML = xml.XmlDocument.parse(arquivoOFX);

        Navigator.of(context).pop();

        // captura os lançamentos no arquivo      
        final lancamentos = arquivoXML.findAllElements('STMTTRN');
        for (var lancamento in lancamentos.toList()) {
          var lancamentoExtrato = new FinExtratoContaBanco();
          lancamentoExtrato.bancoContaCaixa = new BancoContaCaixa( id: widget.bancoContaCaixa.id!);
          lancamentoExtrato.idBancoContaCaixa = widget.bancoContaCaixa!.id;
          lancamentoExtrato.mesAno = widget.mesAno;
          lancamentoExtrato.mes = widget.mesAno!.substring(0, 2);
          lancamentoExtrato.ano = widget.mesAno!.substring(3, 7);
          int ano = int.tryParse(lancamento.findElements('DTPOSTED').single.text.substring(0, 4))!;
          int mes = int.tryParse(lancamento.findElements('DTPOSTED').single.text.substring(4, 6))!;
          int dia = int.tryParse(lancamento.findElements('DTPOSTED').single.text.substring(6, 8))!;
          lancamentoExtrato.dataMovimento = new DateTime.utc(ano, mes, dia);
          lancamentoExtrato.dataBalancete = new DateTime.utc(ano, mes, dia);
          lancamentoExtrato.historico = lancamento.findElements('MEMO').single.text;
          lancamentoExtrato.documento = lancamento.findElements('CHECKNUM').single.text;
          lancamentoExtrato.valor = num.tryParse(lancamento.findElements('TRNAMT').single.text) as double?;
          lancamentoExtrato.observacao = 'Número de Referência: ' + lancamento.findElements('REFNUM').single.text;

          // persiste no banco de dados
          await Provider.of<FinExtratoContaBancoViewModel>(context).inserir(lancamentoExtrato);
        }      
        await filtrar();
      } catch (e) {
        debugPrint(e.toString());
      }
      */
    });    
  }

  conciliarLancamentos(List<FinExtratoContaBanco>? listaFinExtratoContaBanco) {
    gerarDialogBoxConfirmacao(context, 'Deseja conciliar os lançamentos do extrato bancário?', () async {
      try {

        Navigator.of(context).pop();

        for (FinExtratoContaBanco objeto in listaFinExtratoContaBanco!) {
          // pega os lançamentos que não contem a palavra cheque
          if (!objeto.historico!.toLowerCase().contains('cheque')) {
            // se o valor for menor que zero, verifica se tem algo nos pagamentos
            if (objeto.valor! < 0) {
              Filtro filtro = Filtro();
              String montaWhere = '';
              montaWhere = '$montaWhere?filter=DATA_PAGAMENTO||\$eq||${DateFormat('yyyy-MM-dd').format(objeto.dataMovimento!)}';
              montaWhere = '$montaWhere&filter=VALOR_PAGO||\$eq||${objeto.valor!.abs()}';
              filtro.condicao = 'where';
              filtro.where = montaWhere;
              await Provider.of<FinParcelaPagarViewModel>(context).consultarLista(filtro: filtro);
              if (!mounted) return;
              if (Provider.of<FinParcelaPagarViewModel>(context).listaFinParcelaPagar!.isNotEmpty) {
                objeto.conciliado = 'Sim';
                await Provider.of<FinExtratoContaBancoViewModel>(context).alterar(objeto);
              } 
            } else {
              Filtro filtro = Filtro();
              String montaWhere = '';
              montaWhere = '$montaWhere?filter=DATA_RECEBIMENTO||\$eq||${DateFormat('yyy-MM-dd').format(objeto.dataMovimento!)}';
              montaWhere = '$montaWhere&filter=VALOR_RECEBIDO||\$eq||${objeto.valor!.abs()}';
              filtro.condicao = 'where';
              filtro.where = montaWhere;
              await Provider.of<FinParcelaReceberViewModel>(context).consultarLista(filtro: filtro);
              if (!mounted) return;
              if (Provider.of<FinParcelaReceberViewModel>(context).listaFinParcelaReceber!.isNotEmpty) {
                objeto.conciliado = 'Sim';
                await Provider.of<FinExtratoContaBancoViewModel>(context).alterar(objeto);
              } 
            }
          }
        }     
        await filtrar();
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }

  conciliarCheques(List<FinExtratoContaBanco>? listaFinExtratoContaBanco) {
    // TODO: Exercício: implemente a conciliação do cheque tomando como base a conciliação dos lançamentos feita acima
    // leve em conta que é preciso alterar o status do cheque (tabela: CHEQUE) após o mesmo ser conciliado
    gerarDialogBoxConfirmacao(context, 'Deseja conciliar os cheques do extrato bancário?', () async {
      try {
        await filtrar();
      } catch (e) {
        debugPrint(e.toString());
      }
    });
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
              color: Colors.blue.shade100,
              elevation: 10,
              child: Container (
                padding: const EdgeInsets.all(8.0),
                height: 35,
                child: Text(
                _creditos,
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
              color: Colors.red.shade100,
              elevation: 10,
              child: Container (
                padding: const EdgeInsets.all(8.0),
                height: 35,
                child: Text(
                _debitos,
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
              color: Colors.green.shade100,
              elevation: 10,
              child: Container (
                padding: const EdgeInsets.all(8.0),
                height: 35,
                child: Text(
                _saldo,
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


}

/// codigo referente a fonte de dados
class ConciliacaoBancariaEspecificoDataSource extends DataTableSource {
  final List<FinExtratoContaBanco>? listaFinExtratoContaBanco;
  final BuildContext context;

  ConciliacaoBancariaEspecificoDataSource(this.listaFinExtratoContaBanco, this.context);

  void sort<T>(
      Comparable<T>? Function(FinExtratoContaBanco finExtratoContaBanco) getField,
      bool ascending) {
    listaFinExtratoContaBanco!
        .sort((FinExtratoContaBanco a, FinExtratoContaBanco b) {
      if (!ascending) {
        final FinExtratoContaBanco c = a;
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
    if (index >= listaFinExtratoContaBanco!.length) return null;
    final FinExtratoContaBanco finExtratoContaBanco =
        listaFinExtratoContaBanco![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(finExtratoContaBanco.dataMovimento != null ? DateFormat('dd/MM/yyyy').format(finExtratoContaBanco.dataMovimento!) : ''), onTap: () {
        }),
        DataCell(Text(finExtratoContaBanco.dataBalancete != null ? DateFormat('dd/MM/yyyy').format(finExtratoContaBanco.dataBalancete!) : ''), onTap: () {
        }),
        DataCell(Text(finExtratoContaBanco.historico ?? ''), onTap: () {
        }),
        DataCell(Text(finExtratoContaBanco.documento ?? ''), onTap: () {
        }),
        DataCell(Text(finExtratoContaBanco.valor != null ? Constantes.formatoDecimalValor.format(finExtratoContaBanco.valor) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
        }),
        DataCell(Text(finExtratoContaBanco.conciliado ?? ''), onTap: () {
        }),
        DataCell(Text(finExtratoContaBanco.observacao ?? ''), onTap: () {
        }),
      ],
    );
  }

  @override
  int get rowCount => listaFinExtratoContaBanco!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

}