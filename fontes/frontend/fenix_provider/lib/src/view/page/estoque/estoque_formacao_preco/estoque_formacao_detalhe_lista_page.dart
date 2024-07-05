/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [ESTOQUE_FORMACAO_DETALHE] 
                                                                                
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
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/infra/infra.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:fenix/src/model/model.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'estoque_formacao_detalhe_persiste_page.dart';

class EstoqueFormacaoDetalheListaPage extends StatefulWidget {
  final EstoqueReajusteCabecalho? estoqueReajusteCabecalho;
  final FocusNode? foco;
  final Function? salvarEstoqueReajusteCabecalhoCallBack;

  const EstoqueFormacaoDetalheListaPage({Key? key, this.estoqueReajusteCabecalho, this.foco, this.salvarEstoqueReajusteCabecalhoCallBack}) : super(key: key);

  @override
  EstoqueFormacaoDetalheListaPageState createState() => EstoqueFormacaoDetalheListaPageState();
}

class EstoqueFormacaoDetalheListaPageState extends State<EstoqueFormacaoDetalheListaPage> {
  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ScrollController _scrollController = ScrollController();

  double totalEncargos = 0;
  double totalMarkup = 0;
  
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
        widget.salvarEstoqueReajusteCabecalhoCallBack!();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final encargosController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: totalEncargos);
    final markupController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: totalMarkup);

    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        child: Scaffold(
        appBar: AppBar(
            leading: const SizedBox(),
            actions: <Widget>[
              IconButton(
                tooltip: 'Realizar Cálculos',
                icon: const Icon(Icons.calculate, color: Colors.white),
                onPressed: () {
                  /*
                  C = Valor Compra
                  E = % de encargos sobre vendas
                  M = % markup  sobre o custo
                  P = preço de venda

                  P = C(1 + M) ÷  (1-E)
                  */                 
                  for (var detalhe in widget.estoqueReajusteCabecalho!.listaEstoqueReajusteDetalhe!) {
                    detalhe.valorReajuste = detalhe.valorOriginal! * (1 + (markupController.numberValue/100)) / (1 - (encargosController.numberValue/100));
                  }
                  setState(() {                  
                  });
                },
              ),      
              const SizedBox( width: 10,),      

            ], 
          ),            
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
          body: Scaffold(
            drawerDragStartBehavior: DragStartBehavior.down,
            key: _scaffoldKey,
            body: SafeArea(
              top: false,
              bottom: false,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Scrollbar(
                  controller: _scrollController,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    dragStartBehavior: DragStartBehavior.down,
                    padding: ViewUtilLib.paddingAbaPersistePage,
                    child: BootstrapContainer(
                      fluid: true,
                      decoration: const BoxDecoration(color: Colors.white),
                      padding: Biblioteca.isTelaPequena(context) == true ? ViewUtilLib.paddingBootstrapContainerTelaPequena : ViewUtilLib.paddingBootstrapContainerTelaGrande,
                      children: <Widget>[			  			  
                        const Divider(color: Colors.white,),
                        
                        BootstrapRow(
                          height: 60,
                          children: <BootstrapCol>[  
                          
                            BootstrapCol(
                              sizes: 'col-12 col-md-6',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.end,
                                  controller: encargosController,
                                  decoration: getInputDecoration(
                                    'Informe a Taxa de Encargos',
                                    'Encargos *',
                                    true, paddingVertical: 18),
                                  onSaved: (String? value) {
                                  },
                                  validator: ValidaCampoFormulario.validarObrigatorioDecimal,
                                  onChanged: (text) {
                                    totalEncargos = encargosController.numberValue;
                                  },
                                ),
                              ),
                            ),     
                            BootstrapCol(
                              sizes: 'col-12 col-md-6',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.end,
                                  controller: markupController,
                                  decoration: getInputDecoration(
                                    'Informe a Taxa de Markup',
                                    'Markup *',
                                    true, paddingVertical: 18),
                                  onSaved: (String? value) {
                                  },
                                  validator: ValidaCampoFormulario.validarObrigatorioDecimal,
                                  onChanged: (text) {
                                    totalMarkup = markupController.numberValue;
                                  },
                                ),
                              ),
                            ),                                               
                          ],
                        ),
                      
                        
                        const Divider(color: Colors.white,),

                        Card(
                          color: Colors.white,
                          elevation: 2.0,
                          child: DataTable(columns: _getColumns(), rows: _getRows()),
                        ),                      
                      ],
                    ),
                  ),
                ),			  
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _inserir() {
    var estoqueReajusteDetalhe = EstoqueReajusteDetalhe();
    widget.estoqueReajusteCabecalho!.listaEstoqueReajusteDetalhe!.add(estoqueReajusteDetalhe);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          EstoqueFormacaoDetalhePersistePage(
            estoqueReajusteCabecalho: widget.estoqueReajusteCabecalho,
            estoqueReajusteDetalhe: estoqueReajusteDetalhe,
            title: 'Estoque Reajuste Detalhe - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (estoqueReajusteDetalhe.idProduto == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.estoqueReajusteCabecalho!.listaEstoqueReajusteDetalhe!.remove(estoqueReajusteDetalhe);
          }
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('Produto')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Original')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Reajustado')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.estoqueReajusteCabecalho!.listaEstoqueReajusteDetalhe == null) {
      widget.estoqueReajusteCabecalho!.listaEstoqueReajusteDetalhe = [];
    }
    List<DataRow> lista = [];
    for (var estoqueReajusteDetalhe in widget.estoqueReajusteCabecalho!.listaEstoqueReajusteDetalhe!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ estoqueReajusteDetalhe.id ?? ''}'), onTap: () {
          _detalharEstoqueReajusteDetalhe(widget.estoqueReajusteCabecalho, estoqueReajusteDetalhe, context);
        }),
        DataCell(Text(estoqueReajusteDetalhe.produto?.nome?.toString() ?? ''), onTap: () {
          _detalharEstoqueReajusteDetalhe(widget.estoqueReajusteCabecalho, estoqueReajusteDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(estoqueReajusteDetalhe.valorOriginal ?? 0)), onTap: () {
          _detalharEstoqueReajusteDetalhe(widget.estoqueReajusteCabecalho, estoqueReajusteDetalhe, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(estoqueReajusteDetalhe.valorReajuste ?? 0)), onTap: () {
          _detalharEstoqueReajusteDetalhe(widget.estoqueReajusteCabecalho, estoqueReajusteDetalhe, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharEstoqueReajusteDetalhe(EstoqueReajusteCabecalho? estoqueReajusteCabecalho, EstoqueReajusteDetalhe estoqueReajusteDetalhe, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => EstoqueFormacaoDetalhePersistePage(
              estoqueReajusteCabecalho: estoqueReajusteCabecalho,
              estoqueReajusteDetalhe: estoqueReajusteDetalhe,
			  title: "Estoque Reajuste Detalhe - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}