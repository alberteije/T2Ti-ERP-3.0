/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [FIN_PARCELA_PAGAR] 
                                                                                
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

import 'fin_parcela_pagar_persiste_page.dart';

class FinParcelaPagarListaPage extends StatefulWidget {
  final FinLancamentoPagar? finLancamentoPagar;
  final FocusNode? foco;
  final Function? salvarFinLancamentoPagarCallBack;

  const FinParcelaPagarListaPage({Key? key, this.finLancamentoPagar, this.foco, this.salvarFinLancamentoPagarCallBack}) : super(key: key);

  @override
  FinParcelaPagarListaPageState createState() => FinParcelaPagarListaPageState();
}

class FinParcelaPagarListaPageState extends State<FinParcelaPagarListaPage> {
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
        widget.salvarFinLancamentoPagarCallBack!();
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
    var finParcelaPagar = FinParcelaPagar();
    widget.finLancamentoPagar!.listaFinParcelaPagar!.add(finParcelaPagar);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          FinParcelaPagarPersistePage(
            finLancamentoPagar: widget.finLancamentoPagar,
            finParcelaPagar: finParcelaPagar,
            title: 'Fin Parcela Pagar - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          /*if (_finParcelaPagar.nome == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.finLancamentoPagar.listaFinParcelaPagar.remove(_finParcelaPagar);
          }*/
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('Status Parcela')));
    lista.add(const DataColumn(label: Text('Tipo Pagamento')));
    lista.add(const DataColumn(numeric: true, label: Text('Cheque')));
    lista.add(const DataColumn(numeric: true, label: Text('Número da Parcela')));
    lista.add(const DataColumn(label: Text('Data de Emissão')));
    lista.add(const DataColumn(label: Text('Data de Vencimento')));
    lista.add(const DataColumn(label: Text('Data de Pagamento')));
    lista.add(const DataColumn(label: Text('Desconto Até')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor')));
    lista.add(const DataColumn(numeric: true, label: Text('Taxa Juros')));
    lista.add(const DataColumn(numeric: true, label: Text('Taxa Multa')));
    lista.add(const DataColumn(numeric: true, label: Text('Taxa Desconto')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Juros')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Multa')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Desconto')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Pago')));
    lista.add(const DataColumn(label: Text('Histórico')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.finLancamentoPagar!.listaFinParcelaPagar == null) {
      widget.finLancamentoPagar!.listaFinParcelaPagar = [];
    }
    List<DataRow> lista = [];
    for (var finParcelaPagar in widget.finLancamentoPagar!.listaFinParcelaPagar!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ finParcelaPagar.id ?? ''}'), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(finParcelaPagar.finStatusParcela?.descricao ?? ''), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(finParcelaPagar.finTipoPagamento?.descricao ?? ''), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text('${finParcelaPagar.finChequeEmitido?.cheque?.numero ?? ''}'), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text('${finParcelaPagar.numeroParcela ?? ''}'), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(finParcelaPagar.dataEmissao != null ? DateFormat('dd/MM/yyyy').format(finParcelaPagar.dataEmissao!) : ''), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(finParcelaPagar.dataVencimento != null ? DateFormat('dd/MM/yyyy').format(finParcelaPagar.dataVencimento!) : ''), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(finParcelaPagar.dataPagamento != null ? DateFormat('dd/MM/yyyy').format(finParcelaPagar.dataPagamento!) : ''), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(finParcelaPagar.descontoAte != null ? DateFormat('dd/MM/yyyy').format(finParcelaPagar.descontoAte!) : ''), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finParcelaPagar.valor ?? 0)), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(finParcelaPagar.taxaJuro ?? 0)), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(finParcelaPagar.taxaMulta ?? 0)), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(finParcelaPagar.taxaDesconto ?? 0)), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finParcelaPagar.valorJuro ?? 0)), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finParcelaPagar.valorMulta ?? 0)), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finParcelaPagar.valorDesconto ?? 0)), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finParcelaPagar.valorPago ?? 0)), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
        DataCell(Text(finParcelaPagar.historico ?? ''), onTap: () {
          _detalharFinParcelaPagar(widget.finLancamentoPagar, finParcelaPagar, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharFinParcelaPagar(
      FinLancamentoPagar? finLancamentoPagar, FinParcelaPagar finParcelaPagar, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => FinParcelaPagarPersistePage(
              finLancamentoPagar: finLancamentoPagar,
              finParcelaPagar: finParcelaPagar,
			  title: "Fin Parcela Pagar - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}