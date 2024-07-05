/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [INVENTARIO_CONTAGEM_DET] 
                                                                                
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

import 'package:extended_masked_text/extended_masked_text.dart';

//import 'inventario_contagem_det_detalhe_page.dart';
import 'inventario_contagem_det_persiste_page.dart';

class InventarioContagemDetListaPage extends StatefulWidget {
  final InventarioContagemCab? inventarioContagemCab;
  final FocusNode? foco;
  final Function? salvarInventarioContagemCabCallBack;

  const InventarioContagemDetListaPage({Key? key, this.inventarioContagemCab, this.foco, this.salvarInventarioContagemCabCallBack}) : super(key: key);

  @override
  InventarioContagemDetListaPageState createState() => InventarioContagemDetListaPageState();
}

class InventarioContagemDetListaPageState extends State<InventarioContagemDetListaPage> {
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
        widget.salvarInventarioContagemCabCallBack!();
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
    var inventarioContagemDet = InventarioContagemDet();
    widget.inventarioContagemCab!.listaInventarioContagemDet!.add(inventarioContagemDet);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          InventarioContagemDetPersistePage(
            inventarioContagemCab: widget.inventarioContagemCab,
            inventarioContagemDet: inventarioContagemDet,
            title: 'Inventario Contagem Det - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (inventarioContagemDet.contagem01 == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.inventarioContagemCab!.listaInventarioContagemDet!.remove(inventarioContagemDet);
          }
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('Produto')));
    lista.add(const DataColumn(numeric: true, label: Text('Contagem 01')));
    lista.add(const DataColumn(numeric: true, label: Text('Contagem 02')));
    lista.add(const DataColumn(numeric: true, label: Text('Contagem 03')));
    lista.add(const DataColumn(label: Text('Fechado na Contagem')));
    lista.add(const DataColumn(numeric: true, label: Text('Quantidade Sistema')));
    lista.add(const DataColumn(numeric: true, label: Text('Acuracidade')));
    lista.add(const DataColumn(numeric: true, label: Text('Divergência')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.inventarioContagemCab!.listaInventarioContagemDet == null) {
      widget.inventarioContagemCab!.listaInventarioContagemDet = [];
    }
    List<DataRow> lista = [];
    for (var inventarioContagemDet in widget.inventarioContagemCab!.listaInventarioContagemDet!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ inventarioContagemDet.id ?? ''}'), onTap: () {
          _detalharInventarioContagemDet(widget.inventarioContagemCab, inventarioContagemDet, context);
        }),
        DataCell(Text(inventarioContagemDet.produto?.nome?.toString() ?? ''), onTap: () {
          _detalharInventarioContagemDet(widget.inventarioContagemCab, inventarioContagemDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(inventarioContagemDet.contagem01 ?? 0)), onTap: () {
          _detalharInventarioContagemDet(widget.inventarioContagemCab, inventarioContagemDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(inventarioContagemDet.contagem02 ?? 0)), onTap: () {
          _detalharInventarioContagemDet(widget.inventarioContagemCab, inventarioContagemDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(inventarioContagemDet.contagem03 ?? 0)), onTap: () {
          _detalharInventarioContagemDet(widget.inventarioContagemCab, inventarioContagemDet, context);
        }),
        DataCell(Text(MaskedTextController(text: inventarioContagemDet.fechadoContagem, mask: Constantes.mascaraDIA).text), onTap: () {
          _detalharInventarioContagemDet(widget.inventarioContagemCab, inventarioContagemDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalQuantidade.format(inventarioContagemDet.quantidadeSistema ?? 0)), onTap: () {
          _detalharInventarioContagemDet(widget.inventarioContagemCab, inventarioContagemDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalQuantidade.format(inventarioContagemDet.acuracidade ?? 0)), onTap: () {
          _detalharInventarioContagemDet(widget.inventarioContagemCab, inventarioContagemDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalQuantidade.format(inventarioContagemDet.divergencia ?? 0)), onTap: () {
          _detalharInventarioContagemDet(widget.inventarioContagemCab, inventarioContagemDet, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharInventarioContagemDet(InventarioContagemCab? inventarioContagemCab, InventarioContagemDet inventarioContagemDet, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => InventarioContagemDetPersistePage(
              inventarioContagemCab: inventarioContagemCab,
              inventarioContagemDet: inventarioContagemDet,
			  title: "Inventario Contagem Det - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}