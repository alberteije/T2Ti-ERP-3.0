/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [NFE_DETALHE] 
                                                                                
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
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

class EstoqueNfeDetalheListaPage extends StatefulWidget {
  final NfeCabecalho? nfeCabecalho;
  final FocusNode? foco;
  final Function? salvarNfeCabecalhoCallBack;

  const EstoqueNfeDetalheListaPage({Key? key, this.nfeCabecalho, this.foco, this.salvarNfeCabecalhoCallBack}) : super(key: key);

  @override
  EstoqueNfeDetalheListaPageState createState() => EstoqueNfeDetalheListaPageState();
}

class EstoqueNfeDetalheListaPageState extends State<EstoqueNfeDetalheListaPage> {
  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;
  final ScrollController _scrollController = ScrollController();

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
        widget.salvarNfeCabecalhoCallBack!();
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
          body: Scrollbar(
            controller: _scrollController,            
            child: ListView(
              controller: _scrollController, 
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
    /*var _nfeDetalhe = NfeDetalhe();
    widget.nfeCabecalho.listaNfeDetalhe.add(_nfeDetalhe);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          NfeDetalhePersistePage(
            nfeCabecalho: widget.nfeCabecalho,
            nfeDetalhe: _nfeDetalhe,
            title: 'Nfe Detalhe - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (_nfeDetalhe.nome == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.nfeCabecalho.listaNfeDetalhe.remove(_nfeDetalhe);
          }
          _getRows();
        });
      });*/
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Número do Item')));
    lista.add(const DataColumn(label: Text('Produto')));
    lista.add(const DataColumn(label: Text('Código do Produto')));
    lista.add(const DataColumn(label: Text('GTIN')));
    lista.add(const DataColumn(label: Text('Unidade')));
    lista.add(const DataColumn(numeric: true, label: Text('Quantidade')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Unitário')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Desconto')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Subtotal')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Total')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.nfeCabecalho!.listaNfeDetalhe == null) {
      widget.nfeCabecalho!.listaNfeDetalhe = [];
    }
    List<DataRow> lista = [];
    for (var nfeDetalhe in widget.nfeCabecalho!.listaNfeDetalhe!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${nfeDetalhe.numeroItem ?? ''}'), onTap: () {
          //_detalharNfeDetalhe(widget.nfeCabecalho, nfeDetalhe, context);
        }),
        DataCell(Text(nfeDetalhe.nomeProduto ?? ''), onTap: () {
          //_detalharNfeDetalhe(widget.nfeCabecalho, nfeDetalhe, context);
        }),
        DataCell(Text(nfeDetalhe.codigoProduto ?? ''), onTap: () {
          //_detalharNfeDetalhe(widget.nfeCabecalho, nfeDetalhe, context);
        }),
        DataCell(Text(nfeDetalhe.gtin ?? ''), onTap: () {
          //_detalharNfeDetalhe(widget.nfeCabecalho, nfeDetalhe, context);
        }),
        DataCell(Text(nfeDetalhe.unidadeComercial ?? ''), onTap: () {
          //_detalharNfeDetalhe(widget.nfeCabecalho, nfeDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalQuantidade.format(nfeDetalhe.quantidadeComercial ?? 0)), onTap: () {
          //_detalharNfeDetalhe(widget.nfeCabecalho, nfeDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(nfeDetalhe.valorUnitarioComercial ?? 0)), onTap: () {
          //_detalharNfeDetalhe(widget.nfeCabecalho, nfeDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(nfeDetalhe.valorDesconto ?? 0)), onTap: () {
          //_detalharNfeDetalhe(widget.nfeCabecalho, nfeDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(nfeDetalhe.valorSubtotal ?? 0)), onTap: () {
          //_detalharNfeDetalhe(widget.nfeCabecalho, nfeDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(nfeDetalhe.valorTotal ?? 0)), onTap: () {
          //_detalharNfeDetalhe(widget.nfeCabecalho, nfeDetalhe, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  /*void _detalharNfeDetalhe(
      NfeCabecalho nfeCabecalho, NfeDetalhe nfeDetalhe, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => NfeDetalhePersistePage(
              nfeCabecalho: nfeCabecalho,
              nfeDetalhe: nfeDetalhe,
			  title: "Nfe Detalhe - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }*/
  
}