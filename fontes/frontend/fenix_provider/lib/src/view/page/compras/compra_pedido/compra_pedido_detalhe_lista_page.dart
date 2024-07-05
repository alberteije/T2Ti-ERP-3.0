/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [COMPRA_PEDIDO_DETALHE] 
                                                                                
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

import 'package:fenix/src/infra/constantes.dart';

import 'package:fenix/src/model/model.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';


//import 'compra_pedido_detalhe_detalhe_page.dart';
import 'compra_pedido_detalhe_persiste_page.dart';

class CompraPedidoDetalheListaPage extends StatefulWidget {
  final CompraPedido? compraPedido;
  final FocusNode? foco;
  final Function? salvarCompraPedidoCallBack;

  const CompraPedidoDetalheListaPage({Key? key, this.compraPedido, this.foco, this.salvarCompraPedidoCallBack}) : super(key: key);

  @override
  CompraPedidoDetalheListaPageState createState() => CompraPedidoDetalheListaPageState();
}

class CompraPedidoDetalheListaPageState extends State<CompraPedidoDetalheListaPage> {
  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void initState() {
    super.initState();
    _shortcutMap = getAtalhosAbaPage();

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
      case AtalhoTelaType.salvar:
        widget.salvarCompraPedidoCallBack!();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            focusNode: widget.foco,
            autofocus: true,
            focusColor: ViewUtilLib.getBotaoFocusColor(),
            tooltip: Constantes.botaoInserirDica,
            backgroundColor: ViewUtilLib.getBackgroundColorBotaoInserir(),
            child: ViewUtilLib.getIconBotaoInserir(),
            onPressed: () {
              _inserir();
            }),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: Scrollbar(
            child: ListView(
              padding: const EdgeInsets.all(2.0),
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: DataTable(columns: _getColumns(), rows: _getRows()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _inserir() {
    var compraPedidoDetalhe = CompraPedidoDetalhe();
    widget.compraPedido!.listaCompraPedidoDetalhe!.add(compraPedidoDetalhe);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          CompraPedidoDetalhePersistePage(
            compraPedido: widget.compraPedido,
            compraPedidoDetalhe: compraPedidoDetalhe,
            title: 'Compra Pedido Detalhe - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (compraPedidoDetalhe.quantidade == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.compraPedido!.listaCompraPedidoDetalhe!.remove(compraPedidoDetalhe);
          }
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('Produto')));
    lista.add(const DataColumn(numeric: true, label: Text('Quantidade')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Unitário')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Subtotal')));
    lista.add(const DataColumn(numeric: true, label: Text('Taxa Desconto')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Desconto')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Total')));
    lista.add(const DataColumn(label: Text('CST')));
    lista.add(const DataColumn(label: Text('CSOSN')));
    lista.add(const DataColumn(numeric: true, label: Text('CFOP')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor do ICMS')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor do IPI')));
    lista.add(const DataColumn(numeric: true, label: Text('Alíquota do ICMS')));
    lista.add(const DataColumn(numeric: true, label: Text('Alíquota do IPI')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.compraPedido!.listaCompraPedidoDetalhe == null) {
      widget.compraPedido!.listaCompraPedidoDetalhe = [];
    }
    List<DataRow> lista = [];
    for (var compraPedidoDetalhe in widget.compraPedido!.listaCompraPedidoDetalhe!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ compraPedidoDetalhe.id ?? ''}'), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(compraPedidoDetalhe.produto?.nome ?? ''), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalQuantidade.format(compraPedidoDetalhe.quantidade ?? 0)), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedidoDetalhe.valorUnitario ?? 0)), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedidoDetalhe.valorSubtotal ?? 0)), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(compraPedidoDetalhe.taxaDesconto ?? 0)), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedidoDetalhe.valorDesconto ?? 0)), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedidoDetalhe.valorTotal ?? 0)), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(compraPedidoDetalhe.cst ?? ''), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(compraPedidoDetalhe.csosn ?? ''), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text('${compraPedidoDetalhe.cfop ?? ''}'), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedidoDetalhe.valorIcms ?? 0)), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(compraPedidoDetalhe.valorIpi ?? 0)), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(compraPedidoDetalhe.aliquotaIcms ?? 0)), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(compraPedidoDetalhe.aliquotaIpi ?? 0)), onTap: () {
          _detalharCompraPedidoDetalhe(widget.compraPedido, compraPedidoDetalhe, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharCompraPedidoDetalhe(CompraPedido? compraPedido, CompraPedidoDetalhe compraPedidoDetalhe, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => CompraPedidoDetalhePersistePage(
              compraPedido: compraPedido,
              compraPedidoDetalhe: compraPedidoDetalhe,
			  title: "Compra Pedido Detalhe - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}