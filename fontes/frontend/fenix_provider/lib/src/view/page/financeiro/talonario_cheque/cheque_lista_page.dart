/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [CHEQUE] 
                                                                                
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

import 'cheque_persiste_page.dart';

class ChequeListaPage extends StatefulWidget {
  final TalonarioCheque? talonarioCheque;
  final FocusNode? foco;
  final Function? salvarTalonarioChequeCallBack;

  const ChequeListaPage({Key? key, this.talonarioCheque, this.foco, this.salvarTalonarioChequeCallBack}) : super(key: key);

  @override
  ChequeListaPageState createState() => ChequeListaPageState();
}

class ChequeListaPageState extends State<ChequeListaPage> {
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
        widget.salvarTalonarioChequeCallBack!();
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
    var cheque = Cheque();
    widget.talonarioCheque!.listaCheque!.add(cheque);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          ChequePersistePage(
            talonarioCheque: widget.talonarioCheque,
            cheque: cheque,
            title: 'Cheque - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (cheque.numero == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.talonarioCheque!.listaCheque!.remove(cheque);
          }
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(numeric: true, label: Text('Número')));
    lista.add(const DataColumn(label: Text('Status')));
    lista.add(const DataColumn(label: Text('Data do Status')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.talonarioCheque!.listaCheque == null) {
      widget.talonarioCheque!.listaCheque = [];
    }
    List<DataRow> lista = [];
    for (var cheque in widget.talonarioCheque!.listaCheque!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ cheque.id ?? ''}'), onTap: () {
          _detalharCheque(widget.talonarioCheque, cheque, context);
        }),
        DataCell(Text('${cheque.numero ?? ''}'), onTap: () {
          _detalharCheque(widget.talonarioCheque, cheque, context);
        }),
        DataCell(Text(cheque.statusCheque ?? ''), onTap: () {
          _detalharCheque(widget.talonarioCheque, cheque, context);
        }),
        DataCell(Text(cheque.dataStatus != null ? DateFormat('dd/MM/yyyy').format(cheque.dataStatus!) : ''), onTap: () {
          _detalharCheque(widget.talonarioCheque, cheque, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharCheque(
      TalonarioCheque? talonarioCheque, Cheque cheque, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => ChequePersistePage(
              talonarioCheque: talonarioCheque,
              cheque: cheque,
			  title: "Cheque - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}