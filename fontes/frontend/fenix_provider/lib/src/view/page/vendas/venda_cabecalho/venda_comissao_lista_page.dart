/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [VENDA_COMISSAO] 
                                                                                
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

import 'package:intl/intl.dart';

//import 'venda_comissao_detalhe_page.dart';
import 'venda_comissao_persiste_page.dart';

class VendaComissaoListaPage extends StatefulWidget {
  final VendaCabecalho? vendaCabecalho;
  final FocusNode? foco;
  final Function? salvarVendaCabecalhoCallBack;

  const VendaComissaoListaPage({Key? key, this.vendaCabecalho, this.foco, this.salvarVendaCabecalhoCallBack}) : super(key: key);

  @override
  VendaComissaoListaPageState createState() => VendaComissaoListaPageState();
}

class VendaComissaoListaPageState extends State<VendaComissaoListaPage> {
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
        widget.salvarVendaCabecalhoCallBack!();
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
    var vendaComissao = VendaComissao();
    widget.vendaCabecalho!.listaVendaComissao!.add(vendaComissao);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          VendaComissaoPersistePage(
            vendaCabecalho: widget.vendaCabecalho,
            vendaComissao: vendaComissao,
            title: 'Venda Comissao - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (vendaComissao.dataLancamento == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.vendaCabecalho!.listaVendaComissao!.remove(vendaComissao);
          }
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('Vendedor')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Venda')));
    lista.add(const DataColumn(label: Text('Tipo Contábil')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Comissão')));
    lista.add(const DataColumn(label: Text('Situação')));
    lista.add(const DataColumn(label: Text('Data de Lançamento')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.vendaCabecalho!.listaVendaComissao == null) {
      widget.vendaCabecalho!.listaVendaComissao = [];
    }
    List<DataRow> lista = [];
    for (var vendaComissao in widget.vendaCabecalho!.listaVendaComissao!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ vendaComissao.id ?? ''}'), onTap: () {
          _detalharVendaComissao(widget.vendaCabecalho, vendaComissao, context);
        }),
        DataCell(Text(vendaComissao.vendedor?.colaborador?.pessoa?.nome ?? ''), onTap: () {
          _detalharVendaComissao(widget.vendaCabecalho, vendaComissao, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaComissao.valorVenda ?? 0)), onTap: () {
          _detalharVendaComissao(widget.vendaCabecalho, vendaComissao, context);
        }),
        DataCell(Text(vendaComissao.tipoContabil ?? ''), onTap: () {
          _detalharVendaComissao(widget.vendaCabecalho, vendaComissao, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(vendaComissao.valorComissao ?? 0)), onTap: () {
          _detalharVendaComissao(widget.vendaCabecalho, vendaComissao, context);
        }),
        DataCell(Text(vendaComissao.situacao ?? ''), onTap: () {
          _detalharVendaComissao(widget.vendaCabecalho, vendaComissao, context);
        }),
        DataCell(Text(vendaComissao.dataLancamento != null ? DateFormat('dd/MM/yyyy').format(vendaComissao.dataLancamento!) : ''), onTap: () {
          _detalharVendaComissao(widget.vendaCabecalho, vendaComissao, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharVendaComissao(VendaCabecalho? vendaCabecalho, VendaComissao vendaComissao, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => VendaComissaoPersistePage(
              vendaCabecalho: vendaCabecalho,
              vendaComissao: vendaComissao,
			  title: "Venda Comissao - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}