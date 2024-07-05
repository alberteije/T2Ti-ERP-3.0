/*
Title: T2Ti ERP Fenix                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [COMPRA_COTACAO_DETALHE] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/infra/constantes.dart';
// import 'compra_cotacao_detalhe_detalhe_page.dart';
import 'compra_cotacao_detalhe_persiste_page.dart';

class CompraCotacaoDetalheListaPage extends StatefulWidget {
  final CompraFornecedorCotacao? compraFornecedorCotacao;

  const CompraCotacaoDetalheListaPage({Key? key, this.compraFornecedorCotacao}) : super(key: key);

  @override
  CompraCotacaoDetalheListaPageState createState() => CompraCotacaoDetalheListaPageState();
}

class CompraCotacaoDetalheListaPageState extends State<CompraCotacaoDetalheListaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: ViewUtilLib.getBackgroundColorBotaoInserir(),
          child: ViewUtilLib.getIconBotaoInserir(),
          onPressed: () {
            var compraCotacaoDetalhe = CompraCotacaoDetalhe();
            widget.compraFornecedorCotacao!.listaCompraCotacaoDetalhe!.add(compraCotacaoDetalhe);
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        CompraCotacaoDetalhePersistePage(
                            compraFornecedorCotacao: widget.compraFornecedorCotacao,
                            compraCotacaoDetalhe: compraCotacaoDetalhe,
                            title: 'Compra Cotacao Detalhe - Inserindo',
                            operacao: 'I')))
                .then((_) {
              setState(() {
                if (compraCotacaoDetalhe.quantidade == null || compraCotacaoDetalhe.quantidade.toString() == "") { // se esse atributo estiver vazio, o objeto será removido
                  widget.compraFornecedorCotacao!.listaCompraCotacaoDetalhe!.remove(compraCotacaoDetalhe);
                }
                getRows();
              });
            });
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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

  List<DataColumn> getColumns() {
    List<DataColumn> lista = [];
	lista.add(const DataColumn(numeric: true, label: Text('Id')));
	lista.add(const DataColumn(label: Text('Produto')));
	lista.add(const DataColumn(numeric: true, label: Text('Quantidade')));
	lista.add(const DataColumn(numeric: true, label: Text('Valor Unitário')));
	lista.add(const DataColumn(numeric: true, label: Text('Valor Subtotal')));
	lista.add(const DataColumn(numeric: true, label: Text('Taxa Desconto')));
	lista.add(const DataColumn(numeric: true, label: Text('Valor Desconto')));
	lista.add(const DataColumn(numeric: true, label: Text('Valor Total')));
    return lista;
  }

  List<DataRow> getRows() {
    if (widget.compraFornecedorCotacao!.listaCompraCotacaoDetalhe == null) {
      widget.compraFornecedorCotacao!.listaCompraCotacaoDetalhe = [];
    }
    List<DataRow> lista = [];
    for (var compraCotacaoDetalhe in widget.compraFornecedorCotacao!.listaCompraCotacaoDetalhe!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ compraCotacaoDetalhe.id ?? ''}'), onTap: () {
          detalharCompraCotacaoDetalhe(widget.compraFornecedorCotacao, compraCotacaoDetalhe, context);
        }),
		DataCell(Text(compraCotacaoDetalhe.produto?.nome ?? ''), onTap: () {
			detalharCompraCotacaoDetalhe(widget.compraFornecedorCotacao, compraCotacaoDetalhe, context);
		}),
		DataCell(Text(compraCotacaoDetalhe.quantidade != null ? Constantes.formatoDecimalQuantidade.format(compraCotacaoDetalhe.quantidade) : 0.toStringAsFixed(Constantes.decimaisQuantidade)), onTap: () {
			detalharCompraCotacaoDetalhe(widget.compraFornecedorCotacao, compraCotacaoDetalhe, context);
		}),
		DataCell(Text(compraCotacaoDetalhe.valorUnitario != null ? Constantes.formatoDecimalValor.format(compraCotacaoDetalhe.valorUnitario) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
			detalharCompraCotacaoDetalhe(widget.compraFornecedorCotacao, compraCotacaoDetalhe, context);
		}),
		DataCell(Text(compraCotacaoDetalhe.valorSubtotal != null ? Constantes.formatoDecimalValor.format(compraCotacaoDetalhe.valorSubtotal) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
			detalharCompraCotacaoDetalhe(widget.compraFornecedorCotacao, compraCotacaoDetalhe, context);
		}),
		DataCell(Text(compraCotacaoDetalhe.taxaDesconto != null ? Constantes.formatoDecimalTaxa.format(compraCotacaoDetalhe.taxaDesconto) : 0.toStringAsFixed(Constantes.decimaisTaxa)), onTap: () {
			detalharCompraCotacaoDetalhe(widget.compraFornecedorCotacao, compraCotacaoDetalhe, context);
		}),
		DataCell(Text(compraCotacaoDetalhe.valorDesconto != null ? Constantes.formatoDecimalValor.format(compraCotacaoDetalhe.valorDesconto) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
			detalharCompraCotacaoDetalhe(widget.compraFornecedorCotacao, compraCotacaoDetalhe, context);
		}),
		DataCell(Text(compraCotacaoDetalhe.valorTotal != null ? Constantes.formatoDecimalValor.format(compraCotacaoDetalhe.valorTotal) : 0.toStringAsFixed(Constantes.decimaisValor)), onTap: () {
			detalharCompraCotacaoDetalhe(widget.compraFornecedorCotacao, compraCotacaoDetalhe, context);
		}),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  detalharCompraCotacaoDetalhe(
      CompraFornecedorCotacao? compraFornecedorCotacao, CompraCotacaoDetalhe compraCotacaoDetalhe, BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(
    //         builder: (BuildContext context) => CompraCotacaoDetalheDetalhePage(
    //               compraFornecedorCotacao: compraFornecedorCotacao,
    //               compraCotacaoDetalhe: compraCotacaoDetalhe,
    //             ))).then((_) {
		// 		  setState(() {
		// 			getRows();
		// 		  });
		// 		});
  }
}