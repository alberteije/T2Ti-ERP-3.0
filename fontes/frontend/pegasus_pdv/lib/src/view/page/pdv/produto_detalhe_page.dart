/*
Title: T2Ti ERP 3.0                                                                
Description: Caixa - Página de detalhe do produto
                                                                                
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

Based on: Flutter UI Challenges by Many - https://github.com/lohanidamodar/flutter_ui_challenges
*******************************************************************************/
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:pegasus_pdv/src/database/database_classes.dart';

import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:pegasus_pdv/src/infra/atalhos_pdv.dart';

import 'package:pegasus_pdv/src/view/shared/botoes.dart';
import 'package:pegasus_pdv/src/view/shared/view_util_lib.dart';
import 'package:pegasus_pdv/src/view/shared/widgets_input.dart';

class ProdutoDetalhePage extends StatefulWidget {
  final String? title;
  final VendaDetalhe? item;

  const ProdutoDetalhePage({Key? key, this.title, this.item}) : super(key: key);

  @override
  ProdutoDetalhePageState createState() => ProdutoDetalhePageState();
}

class ProdutoDetalhePageState extends State<ProdutoDetalhePage> {
  final _quantidadeController = MoneyMaskedTextController(
      precision: Constantes.decimaisQuantidade, initialValue: 0);
  final _descontoController = MoneyMaskedTextController(
      precision: Constantes.decimaisValor, initialValue: 0);
  final _focusNode = FocusNode();

  Map<LogicalKeySet, Intent>? _shortcutMap;
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void initState() {
    super.initState();

    _shortcutMap = getAtalhosCaixa();
    _actionMap = <Type, Action<Intent>>{
      AtalhoTelaIntent: CallbackAction<AtalhoTelaIntent>(
        onInvoke: _tratarAcoesAtalhos,
      ),
    };
    bootstrapGridParameters(
      gutterSize: Constantes.flutterBootstrapGutterSize,
    );
    _focusNode.requestFocus();
  }

  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      case AtalhoTelaType.escape:
        Navigator.pop(context);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _quantidadeController.updateValue(widget.item!.pdvVendaDetalhe!.quantidade);
    _descontoController
        .updateValue(widget.item!.pdvVendaDetalhe!.taxaDesconto ?? 0);

    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        autofocus: true,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.teal.shade200, Colors.teal.shade600]),
                ),
              ),
              ListView.builder(
                itemCount: 3,
                itemBuilder: _mainListBuilder,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainListBuilder(BuildContext context, int index) {
    if (index == 0) return _cabecalhoTela(context);
    // if (index == 1) return conteudoTela(context);
    if (index == 1) return _rodapeTela(context);
    return const SizedBox();
  }

  Container _cabecalhoTela(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                top: 40.0, left: 20.0, right: 20.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    widget.title!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                    thickness: 2,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(
                              widget.item!.produto!.quantidadeEstoque
                                  .toString(),
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Estoque".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12.0)),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              Constantes.formatoDecimalValor
                                  .format(widget.item!.produto!.valorVenda),
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Preço".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 16.0, right: 16.0, bottom: 0.0),
                    child: Column(
                      children: <Widget>[
                        const Divider(
                          indent: 10,
                          endIndent: 10,
                          thickness: 2,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: TextField(
                                  // enableInteractiveSelection: !Biblioteca.isDesktop(),
                                  focusNode: _focusNode,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.end,
                                  autofocus: true,
                                  controller: _quantidadeController,
                                  decoration: getInputDecoration(
                                      'Informe a quantidade desejada',
                                      'Quantidade',
                                      false),
                                  onChanged: (text) {
                                    _atualizarTotais();
                                  },
                                  onSubmitted: (value) {
                                    _atualizarTotais();
                                    _focusNode.requestFocus();
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: TextField(
                                  // enableInteractiveSelection: !Biblioteca.isDesktop(),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.end,
                                  controller: _descontoController,
                                  decoration: getInputDecoration(
                                      'Informe o percentual desejado',
                                      'Taxa Desconto',
                                      false),
                                  onChanged: (text) {
                                    if (_descontoController.numberValue >=
                                        100) {
                                      _descontoController.updateValue(99.9);
                                    }
                                    _atualizarTotais();
                                  },
                                  onSubmitted: (value) {
                                    _atualizarTotais();
                                    _focusNode.requestFocus();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        BootstrapContainer(
                          fluid: true,
                          decoration: const BoxDecoration(color: Colors.white),
                          padding: Biblioteca.isTelaPequena(context) == true
                              ? ViewUtilLib.paddingBootstrapContainerTelaPequena
                              : ViewUtilLib.paddingBootstrapContainerTelaGrande,
                          children: <Widget>[
                            BootstrapRow(
                              height: 60,
                              children: <BootstrapCol>[
                                BootstrapCol(
                                  sizes: 'col-12 col-md-4',
                                  child: Padding(
                                    padding: Biblioteca
                                        .distanciaEntreColunasQuebraLinha(
                                            context)!,
                                    child: ListTile(
                                      tileColor: Colors.blue.shade100,
                                      title: Text(
                                        Constantes.formatoDecimalValor.format(
                                            widget.item!.pdvVendaDetalhe!
                                                .valorTotalItem),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text("Total Item".toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style:
                                              const TextStyle(fontSize: 12.0)),
                                    ),
                                  ),
                                ),
                                BootstrapCol(
                                  sizes: 'col-12 col-md-4',
                                  child: Padding(
                                    padding: Biblioteca
                                        .distanciaEntreColunasQuebraLinha(
                                            context)!,
                                    child: ListTile(
                                      tileColor: Colors.red.shade100,
                                      title: Text(
                                        Constantes.formatoDecimalValor.format(
                                            widget.item!.pdvVendaDetalhe!
                                                    .valorDesconto ??
                                                0),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                          "Valor Desconto".toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style:
                                              const TextStyle(fontSize: 12.0)),
                                    ),
                                  ),
                                ),
                                BootstrapCol(
                                  sizes: 'col-12 col-md-4',
                                  child: Padding(
                                    padding: Biblioteca
                                        .distanciaEntreColunasQuebraLinha(
                                            context)!,
                                    child: ListTile(
                                      tileColor: Colors.green.shade100,
                                      title: Text(
                                        Constantes.formatoDecimalValor.format(
                                            widget.item!.pdvVendaDetalhe!
                                                .valorTotal),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                          "Valor Final".toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style:
                                              const TextStyle(fontSize: 12.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage(Constantes.produtoIcon),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _rodapeTela(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _getBotoesRodape(context: context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getBotoesRodape({BuildContext? context}) {
    List<Widget> listaBotoes = [];
    listaBotoes.add(SizedBox(
      width: 200,
      child: getBotaoGenericoPdv(
          descricao: Biblioteca.isMobile() ? 'Sair' : 'Sair [ESC]',
          cor: Colors.green,
          onPressed: () {
            Navigator.pop(context!);
          }),
    ));
    return listaBotoes;
  }

  void _atualizarTotais() {
    double valorDesconto = Biblioteca.calcularDesconto(
        widget.item!.pdvVendaDetalhe!.valorTotalItem,
        _descontoController.numberValue);
    double valorTotalItem = _quantidadeController.numberValue *
        widget.item!.pdvVendaDetalhe!.valorUnitario!;
    double valorTotal = _quantidadeController.numberValue *
            widget.item!.pdvVendaDetalhe!.valorUnitario! -
        valorDesconto;

    setState(() {
      widget.item!.pdvVendaDetalhe = widget.item!.pdvVendaDetalhe!.copyWith(
        quantidade: Value(_quantidadeController.numberValue),
        taxaDesconto: Value(_descontoController.numberValue),
        valorDesconto: Value(valorDesconto),
        valorTotalItem: Value(valorTotalItem),
        valorTotal: Value(valorTotal),
      );
      // remove o desconto do cabeçalho da venda
      Sessao.vendaAtual = Sessao.vendaAtual!.copyWith(
        taxaDesconto: const Value(0),
        valorDesconto: const Value(0),
      );
    });
  }
}
