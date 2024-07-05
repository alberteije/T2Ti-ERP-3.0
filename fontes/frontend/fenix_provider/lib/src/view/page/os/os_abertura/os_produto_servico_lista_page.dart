/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [OS_PRODUTO_SERVICO] 
                                                                                
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


//import 'os_produto_servico_detalhe_page.dart';
import 'os_produto_servico_persiste_page.dart';

class OsProdutoServicoListaPage extends StatefulWidget {
  final OsAbertura? osAbertura;
  final FocusNode? foco;
  final Function? salvarOsAberturaCallBack;

  const OsProdutoServicoListaPage({Key? key, this.osAbertura, this.foco, this.salvarOsAberturaCallBack}) : super(key: key);

  @override
  OsProdutoServicoListaPageState createState() => OsProdutoServicoListaPageState();
}

class OsProdutoServicoListaPageState extends State<OsProdutoServicoListaPage> {
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
    var osProdutoServico = OsProdutoServico();
    widget.osAbertura!.listaOsProdutoServico!.add(osProdutoServico);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          OsProdutoServicoPersistePage(
            osAbertura: widget.osAbertura,
            osProdutoServico: osProdutoServico,
            title: 'Os Produto Servico - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (osProdutoServico.quantidade == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.osAbertura!.listaOsProdutoServico!.remove(osProdutoServico);
          }
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('Produto')));
    lista.add(const DataColumn(label: Text('Tipo')));
    lista.add(const DataColumn(label: Text('Complemento')));
    lista.add(const DataColumn(numeric: true, label: Text('Quantidade')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Unitário')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Subtotal')));
    lista.add(const DataColumn(numeric: true, label: Text('Taxa Desconto')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Desconto')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Total')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.osAbertura!.listaOsProdutoServico == null) {
      widget.osAbertura!.listaOsProdutoServico = [];
    }
    List<DataRow> lista = [];
    for (var osProdutoServico in widget.osAbertura!.listaOsProdutoServico!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ osProdutoServico.id ?? ''}'), onTap: () {
          _detalharOsProdutoServico(widget.osAbertura, osProdutoServico, context);
        }),
        DataCell(Text(osProdutoServico.produto?.nome ?? ''), onTap: () {
          _detalharOsProdutoServico(widget.osAbertura, osProdutoServico, context);
        }),
        DataCell(Text(osProdutoServico.tipo ?? ''), onTap: () {
          _detalharOsProdutoServico(widget.osAbertura, osProdutoServico, context);
        }),
        DataCell(Text(osProdutoServico.complemento ?? ''), onTap: () {
          _detalharOsProdutoServico(widget.osAbertura, osProdutoServico, context);
        }),
        DataCell(Text(Constantes.formatoDecimalQuantidade.format(osProdutoServico.quantidade ?? 0)), onTap: () {
          _detalharOsProdutoServico(widget.osAbertura, osProdutoServico, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(osProdutoServico.valorUnitario ?? 0)), onTap: () {
          _detalharOsProdutoServico(widget.osAbertura, osProdutoServico, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(osProdutoServico.valorSubtotal ?? 0)), onTap: () {
          _detalharOsProdutoServico(widget.osAbertura, osProdutoServico, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(osProdutoServico.taxaDesconto ?? 0)), onTap: () {
          _detalharOsProdutoServico(widget.osAbertura, osProdutoServico, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(osProdutoServico.valorDesconto ?? 0)), onTap: () {
          _detalharOsProdutoServico(widget.osAbertura, osProdutoServico, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(osProdutoServico.valorTotal ?? 0)), onTap: () {
          _detalharOsProdutoServico(widget.osAbertura, osProdutoServico, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharOsProdutoServico(OsAbertura? osAbertura, OsProdutoServico osProdutoServico, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => OsProdutoServicoPersistePage(
              osAbertura: osAbertura,
              osProdutoServico: osProdutoServico,
			  title: "Os Produto Servico - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}