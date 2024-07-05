/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage relacionada à tabela [VENDA_CONDICOES_PAGAMENTO] 
                                                                                
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
import 'package:flutter/gestures.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:fenix/src/infra/infra.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

import 'package:fenix/src/model/model.dart';

import 'package:fenix/src/view/shared/widgets_abas.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';

import 'package:extended_masked_text/extended_masked_text.dart';

class VendaCondicoesPagamentoPersistePage extends StatefulWidget {
  final VendaCondicoesPagamento? vendaCondicoesPagamento;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarVendaCondicoesPagamentoCallBack;
  final Function? atualizarVendaCondicoesPagamentoCallBack;

  const VendaCondicoesPagamentoPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.vendaCondicoesPagamento, this.foco, this.salvarVendaCondicoesPagamentoCallBack, this.atualizarVendaCondicoesPagamentoCallBack})
      : super(key: key);

  @override
  VendaCondicoesPagamentoPersistePageState createState() => VendaCondicoesPagamentoPersistePageState();
}

class VendaCondicoesPagamentoPersistePageState extends State<VendaCondicoesPagamentoPersistePage> {
  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;
  final _foco = FocusNode();

  @override
  void initState() {
    super.initState();
    bootstrapGridParameters(
      gutterSize: Constantes.flutterBootstrapGutterSize,
    );
	
    _shortcutMap = getAtalhosPersistePage();

    _actionMap = <Type, Action<Intent>>{
      AtalhoTelaIntent: CallbackAction<AtalhoTelaIntent>(
        onInvoke: _tratarAcoesAtalhos,
      ),
    };
    _foco.requestFocus();
  }

  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      case AtalhoTelaType.salvar:
        widget.salvarVendaCondicoesPagamentoCallBack!();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final faturamentoMinimoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaCondicoesPagamento?.faturamentoMinimo ?? 0);
    final faturamentoMaximoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaCondicoesPagamento?.faturamentoMaximo ?? 0);
    final indiceCorrecaoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaCondicoesPagamento?.indiceCorrecao ?? 0);
    final valorToleranciaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaCondicoesPagamento?.valorTolerancia ?? 0);

    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        child: Scaffold(
          drawerDragStartBehavior: DragStartBehavior.down,
          key: widget.scaffoldKey,
          body: SafeArea(
            top: false,
            bottom: false,
            child: Form(
              key: widget.formKey,
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
                            sizes: 'col-12',
                            child: TextFormField(
                              maxLength: 50,
                              maxLines: 1,
                              initialValue: widget.vendaCondicoesPagamento?.nome ?? '',
                              decoration: getInputDecoration(
                                'Informe o Nome da Condição',
                                'Nome *',
                                false),
                              onSaved: (String? value) {
                              },
                              validator: ValidaCampoFormulario.validarObrigatorio,
                              onChanged: (text) {
                                widget.vendaCondicoesPagamento?.nome = text;
                                paginaMestreDetalheFoiAlterada = true;
                              },
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white,),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12',
                            child: TextFormField(
                              maxLength: 1000,
                              maxLines: 3,
                              initialValue: widget.vendaCondicoesPagamento?.descricao ?? '',
                              decoration: getInputDecoration(
                                'Informe a Descrição da Condição',
                                'Descrição',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.vendaCondicoesPagamento?.descricao = text;
                                paginaMestreDetalheFoiAlterada = true;
                              },
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white,),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: faturamentoMinimoController,
                                decoration: getInputDecoration(
                                  'Informe o Faturamento Mínimo',
                                  'Faturamento Mínimo',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCondicoesPagamento?.faturamentoMinimo = faturamentoMinimoController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: faturamentoMaximoController,
                                decoration: getInputDecoration(
                                  'Informe o Faturamento Máximo',
                                  'Faturamento Máximo',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCondicoesPagamento?.faturamentoMaximo = faturamentoMaximoController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: indiceCorrecaoController,
                                decoration: getInputDecoration(
                                  'Informe o Índice de Correção',
                                  'Índice de Correção',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCondicoesPagamento?.indiceCorrecao = indiceCorrecaoController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: widget.vendaCondicoesPagamento?.diasTolerancia?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Número de Dias de Tolerância',
                                  'Dias de Tolerância',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCondicoesPagamento?.diasTolerancia = int.tryParse(text);
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white,),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: valorToleranciaController,
                                decoration: getInputDecoration(
                                  'Informe o Valor da Tolerância',
                                  'Valor Tolerância',
                                  true, paddingVertical: 18),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCondicoesPagamento?.valorTolerancia = valorToleranciaController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: widget.vendaCondicoesPagamento?.prazoMedio?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Prazo Médio',
                                  'Prazo Médio',
                                  true, paddingVertical: 18),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCondicoesPagamento?.prazoMedio = int.tryParse(text);
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'Vista ou Prazo',
                                  true,
                                  ),
                                isEmpty: widget.vendaCondicoesPagamento?.vistaPrazo == null,
                                child: getDropDownButton(widget.vendaCondicoesPagamento?.vistaPrazo,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.vendaCondicoesPagamento?.vistaPrazo = newValue;
                                    });
                                }, <String>[
                                  'Vista',
                                  'Prazo',
                              ])),
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white,),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12',
                            child: 
                              Text(
                                '* indica que o campo é obrigatório',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),								
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white,),
                    ],
                  ),
                ),
              ),			  
            ),
          ),
        ),
      ),
    );
  }
}