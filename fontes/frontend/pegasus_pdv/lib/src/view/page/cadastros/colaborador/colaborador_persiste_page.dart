/*
Title: T2Ti ERP 3.0                                                                
Description: PersistePage relacionada à tabela [COLABORADOR] 
                                                                                
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
import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:pegasus_pdv/src/database/database.dart';

import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:pegasus_pdv/src/infra/atalhos_desktop_web.dart';

import 'package:pegasus_pdv/src/view/shared/view_util_lib.dart';
import 'package:pegasus_pdv/src/view/shared/caixas_de_dialogo.dart';
import 'package:pegasus_pdv/src/view/shared/botoes.dart';
import 'package:pegasus_pdv/src/view/shared/widgets_input.dart';

class ColaboradorPersistePage extends StatefulWidget {
  final Colaborador? colaborador;
  final String? title;
  final String? operacao;

  const ColaboradorPersistePage({Key? key, this.colaborador, this.title, this.operacao}) : super(key: key);

  @override
  ColaboradorPersistePageState createState() => ColaboradorPersistePageState();
}

class ColaboradorPersistePageState extends State<ColaboradorPersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;

  Map<LogicalKeySet, Intent>? _shortcutMap;
  Map<Type, Action<Intent>>? _actionMap;
  final _foco = FocusNode();
  final ScrollController controllerScroll = ScrollController();

  Colaborador? colaborador;

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
    colaborador = widget.colaborador;
    _foco.requestFocus();
  }

  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      case AtalhoTelaType.excluir:
        _excluir();
        break;
      case AtalhoTelaType.salvar:
        _salvar();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final telefoneController = MaskedTextController(
      mask: Constantes.mascaraTELEFONE,
      text: colaborador?.telefone ?? '',
    );
    final celularController = MaskedTextController(
      mask: Constantes.mascaraTELEFONE,
      text: colaborador?.celular ?? '',
    );
    final cpfController = MaskedTextController(
      mask: Constantes.mascaraCPF,
      text: colaborador?.cpf ?? '',
    );
    final comissaoVistaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: colaborador?.comissaoVista ?? 0);
    final comissaoPrazoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: colaborador?.comissaoPrazo ?? 0);

    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        autofocus: true,
        child: Scaffold(
          drawerDragStartBehavior: DragStartBehavior.down,
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(widget.title!),
            actions: widget.operacao == 'I'
                ? getBotoesAppBarPersistePage(
                    context: context,
                    salvar: _salvar,
                  )
                : getBotoesAppBarPersistePageComExclusao(context: context, salvar: _salvar, excluir: _excluir),
          ),
          body: SafeArea(
            top: false,
            bottom: false,
            child: Form(
              key: _formKey,
              autovalidateMode: _autoValidate,
              canPop: _avisarUsuarioFormAlterado(),
              child: Scrollbar(
                controller: controllerScroll,
                child: SingleChildScrollView(
                  controller: controllerScroll,
                  dragStartBehavior: DragStartBehavior.down,
                  child: BootstrapContainer(
                    fluid: true,
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: Biblioteca.isTelaPequena(context) == true ? ViewUtilLib.paddingBootstrapContainerTelaPequena : ViewUtilLib.paddingBootstrapContainerTelaGrande, // children: [
                    children: <Widget>[
                      const Divider(
                        color: Colors.white,
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                focusNode: _foco,
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                maxLength: 150,
                                maxLines: 1,
                                initialValue: colaborador?.nome ?? '',
                                decoration: getInputDecoration('Conteúdo para o campo Nome', 'Nome', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  colaborador = colaborador!.copyWith(nome: Value(text));
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 14,
                                keyboardType: TextInputType.number,
                                controller: cpfController,
                                decoration: getInputDecoration('Conteúdo para o campo Cpf', 'Cpf', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  colaborador = colaborador!.copyWith(cpf: Value(Biblioteca.removerMascara(text)));
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 14,
                                keyboardType: TextInputType.number,
                                controller: telefoneController,
                                decoration: getInputDecoration('Conteúdo para o campo Telefone', 'Telefone', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  colaborador = colaborador!.copyWith(telefone: Value(Biblioteca.removerMascara(text)));
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 14,
                                keyboardType: TextInputType.number,
                                controller: celularController,
                                decoration: getInputDecoration('Conteúdo para o campo Celular', 'Celular', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  colaborador = colaborador!.copyWith(celular: Value(Biblioteca.removerMascara(text)));
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12',
                            child: TextFormField(
                              validator: ValidaCampoFormulario.validarEmail,
                              maxLength: 250,
                              maxLines: 3,
                              initialValue: colaborador?.email ?? '',
                              decoration: getInputDecoration('Conteúdo para o campo Email', 'Email', false),
                              onSaved: (String? value) {},
                              onChanged: (text) {
                                colaborador = colaborador!.copyWith(email: Value(text));
                                _formFoiAlterado = true;
                              },
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                enableInteractiveSelection: !Biblioteca.isDesktop(),
                                textAlign: TextAlign.end,
                                controller: comissaoVistaController,
                                decoration: getInputDecoration('Conteúdo para o campo Comissao Vista', 'Comissao Vista', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  colaborador = colaborador!.copyWith(comissaoVista: Value(comissaoVistaController.numberValue));
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                enableInteractiveSelection: !Biblioteca.isDesktop(),
                                textAlign: TextAlign.end,
                                controller: comissaoPrazoController,
                                decoration: getInputDecoration('Conteúdo para o campo Comissao Prazo', 'Comissao Prazo', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  colaborador = colaborador!.copyWith(comissaoPrazo: Value(comissaoPrazoController.numberValue));
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration('Tipo de veículo do entregador', 'Entregador Veículo', true),
                                isEmpty: colaborador!.entregadorVeiculo == null,
                                child: getDropDownButton(
                                  colaborador!.entregadorVeiculo,
                                  (String? newValue) {
                                    setState(() {
                                      colaborador = colaborador!.copyWith(entregadorVeiculo: Value(newValue));
                                    });
                                  },
                                  <String>[
                                    'Moto',
                                    'Carro',
                                    'Biclicleta',
                                    'Aplicativo',
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12',
                            child: Text(
                              '* indica que o campo é obrigatório',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
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

  Future<void> _salvar() async {
    final FormState form = _formKey.currentState!;
    if (!form.validate()) {
      _autoValidate = AutovalidateMode.always;
      showInSnackBar(Constantes.mensagemCorrijaErrosFormSalvar, context);
    } else {
      gerarDialogBoxConfirmacao(context, Constantes.perguntaSalvarAlteracoes, () async {
        form.save();
        if (widget.operacao == 'A') {
          Sessao.db.colaboradorDao.alterar(colaborador!);
        } else {
          Sessao.db.colaboradorDao.inserir(colaborador!);
        }
        Navigator.of(context).pop();
      });
    }
  }

  bool _avisarUsuarioFormAlterado() {
    final FormState? form = _formKey.currentState;
    if (form == null || !_formFoiAlterado) {
      return true;
    } else {
      (gerarDialogBoxFormAlterado(context));
      return false;
    }
  }

  void _excluir() {
    gerarDialogBoxExclusao(context, () async {
      await Sessao.db.colaboradorDao.excluir(widget.colaborador!);
      if (!mounted) return;
      Navigator.of(context).pop();
    });
  }
}
