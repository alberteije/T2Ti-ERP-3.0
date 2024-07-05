/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [FIN_PARCELA_RECEBER] 
                                                                                
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

//import 'fin_parcela_receber_detalhe_page.dart';
import 'fin_parcela_receber_persiste_page.dart';

class FinParcelaReceberListaPage extends StatefulWidget {
  final FinLancamentoReceber? finLancamentoReceber;
  final FocusNode? foco;
  final Function? salvarFinLancamentoReceberCallBack;

  const FinParcelaReceberListaPage({Key? key, this.finLancamentoReceber, this.foco, this.salvarFinLancamentoReceberCallBack}) : super(key: key);

  @override
  FinParcelaReceberListaPageState createState() => FinParcelaReceberListaPageState();
}

class FinParcelaReceberListaPageState extends State<FinParcelaReceberListaPage> {
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
        widget.salvarFinLancamentoReceberCallBack!();
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
    var finParcelaReceber = FinParcelaReceber();
    widget.finLancamentoReceber!.listaFinParcelaReceber!.add(finParcelaReceber);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          FinParcelaReceberPersistePage(
            finLancamentoReceber: widget.finLancamentoReceber,
            finParcelaReceber: finParcelaReceber,
            title: 'Fin Parcela Receber - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          /*if (_finParcelaReceber.nome == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.finLancamentoReceber.listaFinParcelaReceber.remove(_finParcelaReceber);
          }*/
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('Status Parcela')));
    lista.add(const DataColumn(label: Text('Tipo Recebimento')));
    lista.add(const DataColumn(numeric: true, label: Text('Cheque')));
    lista.add(const DataColumn(numeric: true, label: Text('Número da Parcela')));
    lista.add(const DataColumn(label: Text('Data de Emissão')));
    lista.add(const DataColumn(label: Text('Data de Vencimento')));
    lista.add(const DataColumn(label: Text('Data de Recebimento')));
    lista.add(const DataColumn(label: Text('Desconto Até')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor')));
    lista.add(const DataColumn(numeric: true, label: Text('Taxa Juros')));
    lista.add(const DataColumn(numeric: true, label: Text('Taxa Multa')));
    lista.add(const DataColumn(numeric: true, label: Text('Taxa Desconto')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Juros')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Multa')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Desconto')));
    lista.add(const DataColumn(label: Text('Emitiu Boleto')));
    lista.add(const DataColumn(label: Text('Boleto Nosso Número')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Recebido')));
    lista.add(const DataColumn(label: Text('Histórico')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.finLancamentoReceber!.listaFinParcelaReceber == null) {
      widget.finLancamentoReceber!.listaFinParcelaReceber = [];
    }
    List<DataRow> lista = [];
    for (var finParcelaReceber in widget.finLancamentoReceber!.listaFinParcelaReceber!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ finParcelaReceber.id ?? ''}'), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(finParcelaReceber.finStatusParcela?.descricao ?? ''), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(finParcelaReceber.finTipoRecebimento?.descricao ?? ''), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text('${finParcelaReceber.finChequeRecebido?.numero ?? ''}'), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text('${finParcelaReceber.numeroParcela ?? ''}'), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(finParcelaReceber.dataEmissao != null ? DateFormat('dd/MM/yyyy').format(finParcelaReceber.dataEmissao!) : ''), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(finParcelaReceber.dataVencimento != null ? DateFormat('dd/MM/yyyy').format(finParcelaReceber.dataVencimento!) : ''), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(finParcelaReceber.dataRecebimento != null ? DateFormat('dd/MM/yyyy').format(finParcelaReceber.dataRecebimento!) : ''), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(finParcelaReceber.descontoAte != null ? DateFormat('dd/MM/yyyy').format(finParcelaReceber.descontoAte!) : ''), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finParcelaReceber.valor ?? 0)), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(finParcelaReceber.taxaJuro ?? 0)), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(finParcelaReceber.taxaMulta ?? 0)), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(finParcelaReceber.taxaDesconto ?? 0)), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finParcelaReceber.valorJuro ?? 0)), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finParcelaReceber.valorMulta ?? 0)), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finParcelaReceber.valorDesconto ?? 0)), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(finParcelaReceber.emitiuBoleto ?? ''), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(finParcelaReceber.boletoNossoNumero ?? ''), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(finParcelaReceber.valorRecebido ?? 0)), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
        DataCell(Text(finParcelaReceber.historico ?? ''), onTap: () {
          _detalharFinParcelaReceber(widget.finLancamentoReceber, finParcelaReceber, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharFinParcelaReceber(
      FinLancamentoReceber? finLancamentoReceber, FinParcelaReceber finParcelaReceber, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => FinParcelaReceberPersistePage(
              finLancamentoReceber: finLancamentoReceber,
              finParcelaReceber: finParcelaReceber,
			  title: "Fin Parcela Receber - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}