/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [NFSE_DETALHE] 
                                                                                
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
@version 1.0.05
*******************************************************************************/
// import 'dart:io';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/view/shared/page/pdf_page.dart';
// import 'package:fenix/src/view_model/cadastros/banco_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:path_provider/path_provider.dart';
// opção 01
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
// opção 02
// import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

import 'package:fenix/src/view_model/nfse/nfse_cabecalho_view_model.dart';
import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/infra/constantes.dart';
// import 'nfse_detalhe_detalhe_page.dart';
import 'nfse_detalhe_persiste_page.dart';

class NfseDetalheListaPage extends StatefulWidget {
  final NfseCabecalho? nfseCabecalho;

  const NfseDetalheListaPage({Key? key, this.nfseCabecalho}) : super(key: key);

  @override
  NfseDetalheListaPageState createState() => NfseDetalheListaPageState();
}

class NfseDetalheListaPageState extends State<NfseDetalheListaPage> {
  String _valorServicos = '';
  String _aliquota = '';
  String _valorIss = '';
  String _valorLiquido = '';

  final bool _isLoadingPDF = true;
  // PDFDocument _documentoPDF;

  // String _path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Opções'),
          backgroundColor: ViewUtilLib.getBackgroundColorBarraTelaDetalhe(),
          leading: Container(),
          actions: <Widget>[
            IconButton(
              tooltip: 'Atualizar Totais',
              icon: const Icon(Icons.device_hub, color: Colors.yellow),
              onPressed: () async {
                await atualizarTotais();
              },
            ),
            IconButton(
              tooltip: 'Transmitir Nota',
              icon: const Icon(Icons.cloud_upload, color: Colors.greenAccent),
              onPressed: () async {
                await transmitirNfse();
              },
            ),
            IconButton(
              tooltip: 'Visualizar PDF',
              icon: const Icon(Icons.picture_as_pdf, color: Colors.orangeAccent),
              onPressed: () async {
                await visualizarPdf();
              },
            ),
          ]),
      floatingActionButton: FloatingActionButton(
          backgroundColor: ViewUtilLib.getBackgroundColorBotaoInserir(),
          child: ViewUtilLib.getIconBotaoInserir(),
          onPressed: () {
            var nfseDetalhe = NfseDetalhe();
            widget.nfseCabecalho!.listaNfseDetalhe!.add(nfseDetalhe);
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (BuildContext context) => NfseDetalhePersistePage(
                        nfseCabecalho: widget.nfseCabecalho,
                        nfseDetalhe: nfseDetalhe,
                        title: 'Nfse Detalhe - Inserindo',
                        operacao: 'I')))
                .then((_) {
              setState(() {
                if (nfseDetalhe.discriminacao == null ||
                    nfseDetalhe.discriminacao == "") {
                  // se esse atributo estiver vazio, o objeto será removido
                  widget.nfseCabecalho!.listaNfseDetalhe!.remove(nfseDetalhe);
                }
                getRows();
              });
            });
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
          color: ViewUtilLib.getBottomAppBarColor(),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.monetization_on),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => getTotaisDrawer(),
                  );
                },
              ),
            ],
          )),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Card(
                color: Colors.white,
                elevation: 2.0,
                child: DataTable(columns: getColumns(), rows: getRows()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTotaisDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          getResumoTotais(),
        ],
      ),
    );
  }

  Widget getResumoTotais() {
    return Scrollbar(
      child: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Card(
          color: ViewUtilLib.getBackgroundColorBarraTelaDetalhe(),
          elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 10.0),
              Card(
                color: Colors.blue.shade100,
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 35,
                  child: Text(
                    'Valor Serviços: $_valorServicos',
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
                color: Colors.blue.shade100,
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 35,
                  child: Text(
                    'Alíquota: $_aliquota',
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
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 35,
                  child: Text(
                    'Valor ISS: $_valorIss',
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
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 35,
                  child: Text(
                    'Valor Líquido: $_valorLiquido',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontFamily: Constantes.ralewayFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  List<DataColumn> getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('Lista Serviço')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor dos Serviços')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor das Deduções')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor do PIS')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor do COFINS')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor do INSS')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor do IR')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor do CSLL')));
    lista.add(const DataColumn(label: Text('CNAE')));
    lista.add(const DataColumn(label: Text('Código Tributação Município')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Base Cálculo')));
    lista.add(const DataColumn(numeric: true, label: Text('Alíquota')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor do ISS')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Líquido')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Outras Retenções')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Crédito')));
    lista.add(const DataColumn(label: Text('ISS Retido')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor ISS Retido')));
    lista.add(
        const DataColumn(numeric: true, label: Text('Valor Desconto Condicionado')));
    lista.add(const DataColumn(
        numeric: true, label: Text('Valor Desconto Incondicionado')));
    lista.add(const DataColumn(label: Text('Discriminação')));
    lista.add(const DataColumn(numeric: true, label: Text('Município IBGE')));
    return lista;
  }

  List<DataRow> getRows() {
    if (widget.nfseCabecalho!.listaNfseDetalhe == null) {
      widget.nfseCabecalho!.listaNfseDetalhe = [];
    }
    List<DataRow> lista = [];
    for (var nfseDetalhe in widget.nfseCabecalho!.listaNfseDetalhe!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${nfseDetalhe.id ?? ''}'), onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(Text(nfseDetalhe.nfseListaServico?.descricao ?? ''),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorServicos != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorServicos) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorDeducoes != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorDeducoes) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorPis != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorPis) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorCofins != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorCofins) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorInss != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorInss) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorIr != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorIr) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorCsll != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorCsll) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(Text(nfseDetalhe.codigoCnae ?? ''), onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(Text(nfseDetalhe.codigoTributacaoMunicipio ?? ''),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorBaseCalculo != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorBaseCalculo) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.aliquota != null ? Constantes.formatoDecimalTaxa.format(nfseDetalhe.aliquota) : 0.toStringAsFixed(Constantes.decimaisTaxa)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorIss != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorIss) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorLiquido != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorLiquido) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.outrasRetencoes != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.outrasRetencoes) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorCredito != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorCredito) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(Text(nfseDetalhe.issRetido ?? ''), onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorIssRetido != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorIssRetido) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorDescontoCondicionado != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorDescontoCondicionado) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(
            Text(
                nfseDetalhe.valorDescontoIncondicionado != null ? Constantes.formatoDecimalValor.format(nfseDetalhe.valorDescontoIncondicionado) : 0.toStringAsFixed(Constantes.decimaisValor)),
            onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(Text(nfseDetalhe.discriminacao ?? ''), onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
        DataCell(Text('${nfseDetalhe.municipioPrestacao ?? ''}'), onTap: () {
          detalharNfseDetalhe(widget.nfseCabecalho, nfseDetalhe, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  detalharNfseDetalhe(NfseCabecalho? nfseCabecalho, NfseDetalhe nfseDetalhe,
      BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(
    //         builder: (BuildContext context) => NfseDetalheDetalhePage(
    //               nfseCabecalho: nfseCabecalho,
    //               nfseDetalhe: nfseDetalhe,
    //             )))
    //     .then((_) {
    //   setState(() {
    //     getRows();
    //   });
    // });
  }

  Future atualizarTotais() async {
    gerarDialogBoxConfirmacao(
        context, 'Desejar atualizar os totais da nota?', () async {
      //TODO: verificar se o cálculo está correto
      double valorServicos = 0;
      double aliquota = 0;
      double valorIss = 0;
      double valorLiquido = 0;
      NfseCabecalho? nfse = await Provider.of<NfseCabecalhoViewModel>(context).calcularTotais(widget.nfseCabecalho!);
      try {
        if (nfse != null) {
          for (NfseDetalhe objeto in nfse.listaNfseDetalhe!) {
            valorServicos = valorServicos + objeto.valorServicos!;
            aliquota = aliquota + objeto.aliquota!;
            valorIss = valorIss + objeto.valorIss!;
            valorLiquido = valorLiquido + objeto.valorLiquido!;
          }
        }
      } catch (e) {
        debugPrint(e.toString());
      }

      setState(() {
        _valorServicos = Constantes.formatoDecimalValor.format(valorServicos);
        _aliquota = Constantes.formatoDecimalValor.format(aliquota);
        _valorIss = Constantes.formatoDecimalValor.format(valorIss);
        _valorLiquido = Constantes.formatoDecimalValor.format(valorLiquido);
      });
      if (!mounted) return;
      Navigator.of(context).pop();
    });
  }

  Future transmitirNfse() async {
    gerarDialogBoxConfirmacao(
        context, 'Desejar transmitir a nota fiscal?', () async {
      // TODO: inserir um indicador visual de que o sistema aguarda pelo servidor para emissão da nota

      Navigator.of(context).pop();

      var retorno = await Provider.of<NfseCabecalhoViewModel>(context).transmitirNfse(widget.nfseCabecalho!);

      if (!mounted) return;

      gerarDialogBoxInformacao(context, retorno!, onOkPressed: () {
        Navigator.of(context).pop();
      });
    });
  }

  Widget getPdfDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 8,
            child: _isLoadingPDF
                ? const CircularProgressIndicator()
                : const Text('visualizar pdf')
                // TODO: usar o pacote Reporting
                // PDFViewer(
                //     document: _documentoPDF,
                //   ),
          ),
          // Container(
          //     height: 300.0,
          //     child: _isLoadingPDF
          //       ? CircularProgressIndicator()
          //       : PdfViewer(
          //           filePath: _path,
          //         ),
          //   )
        ],
      ),
    );
  }

  Future visualizarPdf() async {
    gerarDialogBoxConfirmacao(
        context, 'Desejar visualizar o PDF da nota?', () async {
      Navigator.of(context).pop();

      final arquivoPdf = await Provider.of<NfseCabecalhoViewModel>(context).visualizarPdf(widget.nfseCabecalho);
      if (!mounted) return;
      Navigator.of(context)
          .push(MaterialPageRoute(
              builder: (BuildContext context) => PdfPage(
                  arquivoPdf: arquivoPdf, title: 'NFS-e')));
   
    /*
      showModalBottomSheet<Null>(
        context: context,
        builder: (BuildContext context) => getPdfDrawer(),
      );

      setState(() {
        _isLoadingPDF = true;
      });

      final diretorioTemporario = await getTemporaryDirectory();
      final arquivoPDF = await new File('${diretorioTemporario.path}/nfse.pdf').create();
      arquivoPDF.writeAsBytesSync(retorno);

      // usado para a opção 01
      //_path = arquivoPDF.path;

      // usado para a opção 02
      //_documentoPDF = await PDFDocument.fromFile(arquivoPDF);

      setState(() {
        _isLoadingPDF = false;
      });

      */
    });
  }
}
