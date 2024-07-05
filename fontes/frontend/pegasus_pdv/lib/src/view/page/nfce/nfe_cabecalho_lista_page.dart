/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre ListaPage relacionada à tabela [NFE_CABECALHO] 
                                                                                
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

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:pegasus_pdv/src/database/database_classes.dart';
import 'package:pegasus_pdv/src/database/database.dart';

import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:pegasus_pdv/src/infra/atalhos_desktop_web.dart';
import 'package:pegasus_pdv/src/model/model.dart';

import 'package:pegasus_pdv/src/service/service.dart';
import 'package:pegasus_pdv/src/controller/controller.dart';

import 'package:pegasus_pdv/src/view/shared/caixas_de_dialogo.dart';
import 'package:pegasus_pdv/src/view/shared/page/pdf_page.dart';
import 'package:pegasus_pdv/src/view/shared/view_util_lib.dart';
import 'package:pegasus_pdv/src/view/shared/botoes.dart';

class NfeCabecalhoListaPage extends StatefulWidget {
  const NfeCabecalhoListaPage({Key? key}) : super(key: key);

  @override
  NfeCabecalhoListaPageState createState() => NfeCabecalhoListaPageState();
}

class NfeCabecalhoListaPageState extends State<NfeCabecalhoListaPage> {
  int? _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? sortColumnIndex;
  bool sortAscending = true;
  final ScrollController controllerScroll = ScrollController();

  NfeCabecalhoMontado nfceCabecalhoInicial = NfeCabecalhoMontado();
  List<NfeCabecalho>? _listaNfeCabecalho;

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

    WidgetsBinding.instance.addPostFrameCallback((_) => _refrescarTela());
  }

  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _listaNfeCabecalho = Sessao.db.nfeCabecalhoDao.listaNfeCabecalho;

    final _NfeCabecalhoDataSource nfeCabecalhoDataSource = _NfeCabecalhoDataSource(_listaNfeCabecalho, context, _refrescarTela, _transmitirNota);

    void sort<T>(Comparable<T>? Function(NfeCabecalho nfeCabecalho) getField, int columnIndex, bool ascending) {
      nfeCabecalhoDataSource.sort<T>(getField, ascending);
      setState(() {
        sortColumnIndex = columnIndex;
        sortAscending = ascending;
      });
    }

    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        autofocus: true,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('NFC-e em Contingência'),
            actions: const <Widget>[],
          ),
          bottomNavigationBar: BottomAppBar(
            color: ViewUtilLib.getBottomAppBarColor(),
            //  shape: const CircularNotchedRectangle(),
            child: const Row(
              children: [],
            ),
          ),
          body: RefreshIndicator(
            onRefresh: _refrescarTela,
            child: Scrollbar(
              controller: controllerScroll,
              child: _listaNfeCabecalho == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                    controller: controllerScroll,
                      padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                      children: <Widget>[
                        PaginatedDataTable(
                          rowsPerPage: _rowsPerPage!,
                          onRowsPerPageChanged: (int? value) {
                            setState(() {
                              _rowsPerPage = value;
                            });
                          },
                          sortColumnIndex: sortColumnIndex,
                          sortAscending: sortAscending,
                          columns: <DataColumn>[
                            const DataColumn(
                              numeric: true,
                              label: Text('Cancelar'),
                              tooltip: 'Cancelar',
                            ),
                            DataColumn(
                              label: const Text('Número'),
                              tooltip: 'Número',
                              onSort: (int columnIndex, bool ascending) => sort<String>((NfeCabecalho nfeCabecalho) => nfeCabecalho.numero, columnIndex, ascending),
                            ),
                            DataColumn(
                              label: const Text('Data/Hora Emissão'),
                              tooltip: 'Data/Hora Emissão',
                              onSort: (int columnIndex, bool ascending) => sort<DateTime>((NfeCabecalho nfeCabecalho) => nfeCabecalho.dataHoraEmissao, columnIndex, ascending),
                            ),
                            const DataColumn(
                              numeric: true,
                              label: Text('Prazo Limite'),
                              tooltip: 'Prazo Limite para Transmissão',
                            ),
                            DataColumn(
                              numeric: true,
                              label: const Text('Valor Total NF'),
                              tooltip: 'Valor Total NF',
                              onSort: (int columnIndex, bool ascending) => sort<num>((NfeCabecalho nfeCabecalho) => nfeCabecalho.valorTotal, columnIndex, ascending),
                            ),
                            DataColumn(
                              label: const Text('Número da Venda'),
                              tooltip: 'Número da Venda',
                              onSort: (int columnIndex, bool ascending) => sort<num>((NfeCabecalho nfeCabecalho) => nfeCabecalho.idPdvVendaCabecalho, columnIndex, ascending),
                            ),
                          ],
                          source: nfeCabecalhoDataSource,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Future _refrescarTela() async {
    _listaNfeCabecalho = await Sessao.db.nfeCabecalhoDao.consultarListaFiltro('STATUS_NOTA', '6'); //traz somente as notas em contingencia
    setState(() {});
  }

  Future _transmitirNota(NfeCabecalho nfeCabecalhoContingenciada) async {
    gerarDialogBoxEspera(context);
    try {
      NfceController.instanciarNfceMontado();
      NfceController.nfeCabecalhoMontado!.nfeCabecalho = nfeCabecalhoContingenciada;
      NfceService nfceService = NfceService();
      final retorno = await nfceService.transmitirNfceContingenciada(nfeCabecalhoContingenciada.chaveAcesso!);
      if (!mounted) return;
      if (retorno != null) {
        if (retorno is String) {
          Sessao.fecharDialogBoxEspera(context);
          gerarDialogBoxErro(context, 'Ocorreu um problema na geração da NFC-e: \n$retorno');
        } else if (retorno is Uint8List) {
          _imprimirDanfe(retorno);
        }
      } else {
        Sessao.fecharDialogBoxEspera(context);
      }
    } catch (e) {
      Sessao.fecharDialogBoxEspera(context);
      gerarDialogBoxErro(context, 'Ocorreu um problema ao tentar realizar o procedimento: $e');
    }
  }

  // nesse método precisamos imprimir o danfe e também atualizar a nota inicial que está com status=9
  // seu número precisa ser inutilizado ou ela precisa ser cancelada
  Future _imprimirDanfe(Uint8List danfe) async {
    Sessao.fecharDialogBoxEspera(context);
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PdfPage(arquivoPdf: danfe, title: 'NFC-e'))).then((value) async {
      NfceController.nfeCabecalhoMontado!.nfeCabecalho = NfceController.nfeCabecalhoMontado!.nfeCabecalho!.copyWith(
        statusNota: const Value('4'), // 4=autorizada
        informacoesAddContribuinte: const Value('NOTA ORIGINAL IMPRESSA EM CONTINGENCIA OFFLINE.'),
      );
      await Sessao.db.nfeCabecalhoDao.alterarSemLista(NfceController.nfeCabecalhoMontado!, atualizaFilhos: false);
      await _atualizarNotaInicial();
    });
  }

  Future _atualizarNotaInicial() async {
    gerarDialogBoxEspera(context);
    try {
      // pesquisa pela nota com status igual a 9 - essa nota foi gerada e tentamos emiti-la, mas houve erro e outra foi impressa em contingência
      nfceCabecalhoInicial.nfeCabecalho = await Sessao.db.nfeCabecalhoDao.consultarNotaPorVenda(NfceController.nfeCabecalhoMontado!.nfeCabecalho!.idPdvVendaCabecalho!, status: '9');

      // Caso essa nota tenha sido autorizada, vamos cancelá-la. Do contrário, inutilizaremos seu número (tarefa para o servidor)
      NfceService nfceService = NfceService();
      ObjetoNfe objetoNfe = ObjetoNfe(
        cnpj: Sessao.empresa!.cnpj!,
        justificativa: 'OUTRA NOTA EMITIDA EM CONTINGENCIA OFFLINE. ESTA NOTA ORIGINAL FOI CANCELADA.',
        ano: nfceCabecalhoInicial.nfeCabecalho!.dataHoraEmissao!.year.toString(),
        modelo: nfceCabecalhoInicial.nfeCabecalho!.codigoModelo!,
        serie: nfceCabecalhoInicial.nfeCabecalho!.serie!,
        numeroInicial: nfceCabecalhoInicial.nfeCabecalho!.numero!,
        numeroFinal: nfceCabecalhoInicial.nfeCabecalho!.numero!,
        chaveAcesso: nfceCabecalhoInicial.nfeCabecalho!.chaveAcesso!,
      );
      final retorno = await nfceService.tratarNotaAnteriorContingencia(objetoNfe);

      if (retorno.contains('Inutiliza')) {
        nfceCabecalhoInicial.nfeCabecalho = nfceCabecalhoInicial.nfeCabecalho!.copyWith(
          statusNota: const Value('8'), // 8=inutilizada
          informacoesAddContribuinte: const Value('OUTRA NOTA EMITIDA EM CONTINGENCIA OFFLINE. ESTE NUMERO FOI INUTILIZADO.'),
        );
        await Sessao.db.nfeCabecalhoDao.alterarSemLista(nfceCabecalhoInicial, atualizaFilhos: false);
        await _inserirDadosInutiliza();
      } else {
        nfceCabecalhoInicial.nfeCabecalho = nfceCabecalhoInicial.nfeCabecalho!.copyWith(
          statusNota: const Value('5'), // 5=cancelada
          informacoesAddContribuinte: const Value('OUTRA NOTA EMITIDA EM CONTINGENCIA OFFLINE. ESTA NOTA ORIGINAL FOI CANCELADA.'),
        );
        await Sessao.db.nfeCabecalhoDao.alterarSemLista(nfceCabecalhoInicial, atualizaFilhos: false);
      }
      if (!mounted) return;
      Sessao.fecharDialogBoxEspera(context);
      await _refrescarTela();
    } catch (e) {
      // se acontecer um erro aqui, não vamos fazer nada, a nota continuará com status=9 e seu número deverá ser inutilizado posteriormente
      // gerarDialogBoxErro(context, 'Ocorreu um problema ao tentar realizar o procedimento: ' + e.toString());
    }
  }

  Future _inserirDadosInutiliza() async {
    // insere registro na tabela de inutilização
    NfeNumeroInutilizado inutilizado = NfeNumeroInutilizado(
      id: null,
      serie: nfceCabecalhoInicial.nfeCabecalho!.serie,
      numero: int.tryParse(nfceCabecalhoInicial.nfeCabecalho!.numero!),
      dataInutilizacao: DateTime.now(),
      observacao: 'NOTA EMITIDA EM CONTINGENCIA OFFLINE',
    );
    await Sessao.db.nfeNumeroInutilizadoDao.inserir(inutilizado);
  }

  /////////////////////////////////////////
  /// Utilize o código abaixo para se comunicar diretamente com o ACBrMonitor
  /////////////////////////////////////////
  // nesse método precisamos imprimir o danfe e também atualizar a nota inicial que está com status=9
  // seu número precisa ser inutilizado ou ela precisa ser cancelada
  // Future _imprimirDanfe(String danfeBase64) async {
  //   // Sessao.fecharDialogBoxEspera(context);
  //   var decodeB64 = base64.decode(danfeBase64);
  //   Navigator.of(context)
  //     .push(MaterialPageRoute(
  //       builder: (BuildContext context) => PdfPage(
  //         arquivoPdf: decodeB64, title: 'NFC-e')
  //       )
  //     ).then(
  //       (value) async {
  //         await _inutilizarNumero();
  //       }
  //     );
  // }

  // Future _inutilizarNumero() async {
  //   // pesquisa pela nota com status igual a 9 - essa nota foi gerada e tentamos emiti-la, mas houve erro e outra foi impressa em contingência
  //   nfceCabecalhoInicial.nfeCabecalho =
  //     await Sessao.db.nfeCabecalhoDao.consultarNotaPorVenda(NfceController.nfeCabecalhoMontado!.nfeCabecalho!.idPdvVendaCabecalho!, status: '9');

  //   // vamos inutilizar o número
  //   NfceAcbrService servicoNfce = NfceAcbrService();
  //   try {
  //     NfceController.instanciarNfceMontado();
  //     await servicoNfce.conectar(
  //       context,
  //       formaEmissao: '1',
  //       operacao: 'INUTILIZAR_NUMERO',
  //       chaveAcesso: nfceCabecalhoInicial.nfeCabecalho!.chaveAcesso,
  //       funcaoDeCallBack: _atualizarNotaInicial,
  //     ).then((socket) {
  //       NfceController.enviarComandoInutilizacaoNumero(
  //         socket: socket!,
  //         cnpj: Sessao.empresa!.cnpj!,
  //         justificativa: 'NOTA EMITIDA EM CONTINGENCIA OFFLINE',
  //         ano: nfceCabecalhoInicial.nfeCabecalho!.dataHoraEmissao!.year.toString(),
  //         modelo: nfceCabecalhoInicial.nfeCabecalho!.codigoModelo!,
  //         serie: nfceCabecalhoInicial.nfeCabecalho!.serie!,
  //         numeroInicial: nfceCabecalhoInicial.nfeCabecalho!.numero!,
  //         numeroFinal: nfceCabecalhoInicial.nfeCabecalho!.numero!
  //       );
  //     });
  //   } catch (e) {
  //     // se acontecer um erro aqui, não vamos fazer nada, a nota continuará com status=9 e seu número deverá ser inutilizado posteriormente
  //     // gerarDialogBoxErro(context, 'Ocorreu um problema ao tentar realizar o procedimento: ' + e.toString());
  //   }
  // }

  // Future _atualizarNotaInicial() async {
  //   // atualiza nota
  //   nfceCabecalhoInicial.nfeCabecalho =
  //   nfceCabecalhoInicial.nfeCabecalho!.copyWith(
  //     statusNota: '8',
  //   );
  //   await Sessao.db.nfeCabecalhoDao.alterar(nfceCabecalhoInicial, atualizaFilhos: false).then((value) async => await _refrescarTela());

  //   // insere registro na tabela de inutilização
  //   NfeNumeroInutilizado inutilizado =
  //     NfeNumeroInutilizado(
  //       id: null,
  //       serie: nfceCabecalhoInicial.nfeCabecalho!.serie,
  //       numero: int.tryParse(nfceCabecalhoInicial.nfeCabecalho!.numero!),
  //       dataInutilizacao: DateTime.now(),
  //       observacao: 'NOTA EMITIDA EM CONTINGENCIA OFFLINE',
  //     );
  //   await Sessao.db.nfeNumeroInutilizadoDao.inserir(inutilizado);
  // }

  // Future _transmitirNota(NfeCabecalho nfeCabecalhoContingenciada) async {
  //   NfceAcbrService servicoNfce = NfceAcbrService();
  //   try {
  //     NfceController.instanciarNfceMontado();
  //     NfceController.nfeCabecalhoMontado!.nfeCabecalho = nfeCabecalhoContingenciada;
  //     await servicoNfce.conectar(
  //       context,
  //       formaEmissao: '1',
  //       funcaoDeCallBack: _imprimirDanfe,
  //       operacao: 'TRANSMITIR_CONTINGENCIADA',
  //       chaveAcesso: nfeCabecalhoContingenciada.chaveAcesso,
  //     ).then((socket) async {
  //       socket!.write('NFe.EnviarNFe("C:\\ACBrMonitor\\' + Sessao.empresa!.cnpj! + '\\LOG_NFe\\' + nfeCabecalhoContingenciada.chaveAcesso! + '-nfe.xml", "001", , , , "1", , )\r\n.\r\n');
  //     });
  //   } catch (e) {
  //     gerarDialogBoxErro(context, 'Ocorreu um problema ao tentar realizar o procedimento: ' + e.toString());
  //   }
  // }
}

/// codigo referente a fonte de dados
class _NfeCabecalhoDataSource extends DataTableSource {
  final List<NfeCabecalho>? listaNfeCabecalho;
  final BuildContext context;
  final Function refrescarTela;
  final Function transmitirNota;

  _NfeCabecalhoDataSource(this.listaNfeCabecalho, this.context, this.refrescarTela, this.transmitirNota);

  void sort<T>(Comparable<T>? Function(NfeCabecalho nfeCabecalho) getField, bool ascending) {
    listaNfeCabecalho!.sort((NfeCabecalho a, NfeCabecalho b) {
      if (!ascending) {
        final NfeCabecalho c = a;
        a = b;
        b = c;
      }
      Comparable<T>? aValue = getField(a);
      Comparable<T>? bValue = getField(b);

      aValue ??= '' as Comparable<T>;
      bValue ??= '' as Comparable<T>;

      return Comparable.compare(aValue, bValue);
    });
  }

  final int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= listaNfeCabecalho!.length) return null;
    final nfeCabecalho = listaNfeCabecalho![index];

    final prazoLimite = nfeCabecalho.dataHoraEmissao!.add(const Duration(hours: 24));

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          getBotaoGenericoPdv(
              descricao: 'Transmitir',
              tamanho: const Size.fromWidth(100),
              cor: Colors.green.shade400,
              padding: const EdgeInsets.all(5),
              onPressed: () async {
                await transmitirNota(nfeCabecalho);
              }),
        ),
        DataCell(
          Text(nfeCabecalho.numero ?? ''),
        ),
        DataCell(
          Text(nfeCabecalho.dataHoraEmissao != null ? Biblioteca.formatarDataHora(nfeCabecalho.dataHoraEmissao) : ''),
        ),
        DataCell(
          Text(Biblioteca.formatarDataHora(prazoLimite)),
        ),
        DataCell(
          Text(Constantes.formatoDecimalValor.format(nfeCabecalho.valorTotal ?? 0)),
        ),
        DataCell(
          Text('${nfeCabecalho.idPdvVendaCabecalho ?? ''}'),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaNfeCabecalho!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
