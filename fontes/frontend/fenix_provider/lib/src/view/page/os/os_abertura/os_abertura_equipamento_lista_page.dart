/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [OS_ABERTURA_EQUIPAMENTO] 
                                                                                
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


//import 'os_abertura_equipamento_detalhe_page.dart';
import 'os_abertura_equipamento_persiste_page.dart';

class OsAberturaEquipamentoListaPage extends StatefulWidget {
  final OsAbertura? osAbertura;
  final FocusNode? foco;
  final Function? salvarOsAberturaCallBack;

  const OsAberturaEquipamentoListaPage({Key? key, this.osAbertura, this.foco, this.salvarOsAberturaCallBack}) : super(key: key);

  @override
  OsAberturaEquipamentoListaPageState createState() => OsAberturaEquipamentoListaPageState();
}

class OsAberturaEquipamentoListaPageState extends State<OsAberturaEquipamentoListaPage> {
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
        widget.salvarOsAberturaCallBack!();
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
    var osAberturaEquipamento = OsAberturaEquipamento();
    widget.osAbertura!.listaOsAberturaEquipamento!.add(osAberturaEquipamento);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          OsAberturaEquipamentoPersistePage(
            osAbertura: widget.osAbertura,
            osAberturaEquipamento: osAberturaEquipamento,
            title: 'Os Abertura Equipamento - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (osAberturaEquipamento.tipoCobertura == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.osAbertura!.listaOsAberturaEquipamento!.remove(osAberturaEquipamento);
          }
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('Equipamento')));
    lista.add(const DataColumn(label: Text('Número de Série')));
    lista.add(const DataColumn(label: Text('Tipo Cobertura')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.osAbertura!.listaOsAberturaEquipamento == null) {
      widget.osAbertura!.listaOsAberturaEquipamento = [];
    }
    List<DataRow> lista = [];
    for (var osAberturaEquipamento in widget.osAbertura!.listaOsAberturaEquipamento!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ osAberturaEquipamento.id ?? ''}'), onTap: () {
          _detalharOsAberturaEquipamento(widget.osAbertura, osAberturaEquipamento, context);
        }),
        DataCell(Text(osAberturaEquipamento.osEquipamento?.nome ?? ''), onTap: () {
          _detalharOsAberturaEquipamento(widget.osAbertura, osAberturaEquipamento, context);
        }),
        DataCell(Text(osAberturaEquipamento.numeroSerie ?? ''), onTap: () {
          _detalharOsAberturaEquipamento(widget.osAbertura, osAberturaEquipamento, context);
        }),
        DataCell(Text(osAberturaEquipamento.tipoCobertura ?? ''), onTap: () {
          _detalharOsAberturaEquipamento(widget.osAbertura, osAberturaEquipamento, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharOsAberturaEquipamento(OsAbertura? osAbertura, OsAberturaEquipamento osAberturaEquipamento, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => OsAberturaEquipamentoPersistePage(
              osAbertura: osAbertura,
              osAberturaEquipamento: osAberturaEquipamento,
			  title: "Os Abertura Equipamento - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}