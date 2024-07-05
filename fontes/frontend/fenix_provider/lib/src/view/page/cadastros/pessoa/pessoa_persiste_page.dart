/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage relacionada à tabela [PESSOA] 
                                                                                
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

class PessoaPersistePage extends StatefulWidget {
  final Pessoa? pessoa;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarPessoaCallBack;
  final Function? atualizarPessoaCallBack;

  const PessoaPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.pessoa, this.foco, this.salvarPessoaCallBack, this.atualizarPessoaCallBack})
      : super(key: key);

  @override
  PessoaPersistePageState createState() => PessoaPersistePageState();
}

class PessoaPersistePageState extends State<PessoaPersistePage> {
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
        widget.salvarPessoaCallBack!();
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
                            sizes: 'col-12 col-md-8',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 150,
                                maxLines: 1,
                                initialValue: widget.pessoa?.nome ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Nome da pessoa',
                                  'Nome *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.pessoa!.nome = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'Tipo Pessoa',
                                  true),
                                isEmpty: widget.pessoa!.tipo == null,
                                child: getDropDownButton(widget.pessoa!.tipo,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.pessoa!.tipo = newValue;
                                    });
                                }, <String>[
                                  'Física',
                                  'Jurídica',
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
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 250,
                                maxLines: 3,
                                initialValue: widget.pessoa?.site ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Site',
                                  'Site',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.pessoa!.site = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 250,
                                maxLines: 3,
                                initialValue: widget.pessoa?.email ?? '',
                                decoration: getInputDecoration(
                                  'Informe o EMail',
                                  'EMail',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.pessoa!.email = text;
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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'É Cliente',
                                  true),
                                isEmpty: widget.pessoa!.ehCliente == null,
                                child: getDropDownButton(widget.pessoa!.ehCliente,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.pessoa!.ehCliente = newValue;
                                    });
                                }, <String>[
                                  'Sim',
                                  'Não',
                              ])),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'É Fornecedor',
                                  true),
                                isEmpty: widget.pessoa!.ehFornecedor == null,
                                child: getDropDownButton(widget.pessoa!.ehFornecedor,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.pessoa!.ehFornecedor = newValue;
                                    });
                                }, <String>[
                                  'Sim',
                                  'Não',
                              ])),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'É Transportadora',
                                  true),
                                isEmpty: widget.pessoa!.ehTransportadora == null,
                                child: getDropDownButton(widget.pessoa!.ehTransportadora,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.pessoa!.ehTransportadora = newValue;
                                    });
                                }, <String>[
                                  'Sim',
                                  'Não',
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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'É Colaborador',
                                  true),
                                isEmpty: widget.pessoa!.ehColaborador == null,
                                child: getDropDownButton(widget.pessoa!.ehColaborador,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.pessoa!.ehColaborador = newValue;
                                    });
                                }, <String>[
                                  'Sim',
                                  'Não',
                              ])),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'É Contador',
                                  true),
                                isEmpty: widget.pessoa!.ehContador == null,
                                child: getDropDownButton(widget.pessoa!.ehContador,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.pessoa!.ehContador = newValue;
                                    });
                                }, <String>[
                                  'Sim',
                                  'Não',
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