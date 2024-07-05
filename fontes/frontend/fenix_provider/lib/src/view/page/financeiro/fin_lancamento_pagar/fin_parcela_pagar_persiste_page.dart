/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe PersistePage relacionada à tabela [FIN_PARCELA_PAGAR] 
                                                                                
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

import 'package:fenix/src/infra/constantes.dart';
import 'package:fenix/src/infra/biblioteca.dart';

import 'package:fenix/src/model/model.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';
import 'package:fenix/src/view/shared/botoes.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:fenix/src/view/shared/widgets_abas.dart';

import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/infra/valida_campo_formulario.dart';

class FinParcelaPagarPersistePage extends StatefulWidget {
  final FinLancamentoPagar? finLancamentoPagar;
  final FinParcelaPagar? finParcelaPagar;
  final String title;
  final String operacao;

  const FinParcelaPagarPersistePage(
      {Key? key, this.finLancamentoPagar, this.finParcelaPagar, required this.title, required this.operacao})
      : super(key: key);

  @override
  FinParcelaPagarPersistePageState createState() => FinParcelaPagarPersistePageState();
}

class FinParcelaPagarPersistePageState extends State<FinParcelaPagarPersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

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
  }

  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      case AtalhoTelaType.salvar:
        _salvar();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
	final valorController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaPagar?.valor ?? 0);
	final taxaJuroController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finParcelaPagar?.taxaJuro ?? 0);
	final taxaMultaController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finParcelaPagar?.taxaMulta ?? 0);
	final taxaDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finParcelaPagar?.taxaDesconto ?? 0);
	final valorJuroController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaPagar?.valorJuro ?? 0);
	final valorMultaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaPagar?.valorMulta ?? 0);
	final valorDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaPagar?.valorDesconto ?? 0);
	final valorPagoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaPagar?.valorPago ?? 0);

    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        autofocus: true,
        child: Scaffold(
          drawerDragStartBehavior: DragStartBehavior.down,
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(widget.title), 
            actions: widget.operacao == "I"
              ? getBotoesAppBarPersistePage(context: context, salvar: _salvar)
              : getBotoesAppBarPersistePageComExclusao(context: context, salvar: _salvar, excluir: _excluir),
            ),
          body: SafeArea(
            top: false,
            bottom: false,
            child: Form(
              key: _formKey,
              autovalidateMode: _autoValidate,
              onWillPop: _avisarUsuarioFormAlterado,
              child: Scrollbar(
              controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  dragStartBehavior: DragStartBehavior.down,
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
                                readOnly: true,
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: widget.finParcelaPagar?.idFinStatusParcela?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Importe o Status Parcela Vinculado',
                                  'Status Parcela *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.finParcelaPagar!.idFinStatusParcela = int.tryParse(text);
                                  paginaMestreDetalheFoiAlterada = true;
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
                                readOnly: true,
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: widget.finParcelaPagar?.idFinTipoPagamento?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Importe o Tipo de Pagamento Vinculado',
                                  'Tipo Pagamento *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.finParcelaPagar!.idFinTipoPagamento = int.tryParse(text);
                                  paginaMestreDetalheFoiAlterada = true;
                                  _formFoiAlterado = true;
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
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: widget.finParcelaPagar?.idFinChequeEmitido?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Importe o Cheque Vinculado',
                                  'Cheque',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaPagar!.idFinChequeEmitido = int.tryParse(text);
                                  paginaMestreDetalheFoiAlterada = true;
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-2',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: widget.finParcelaPagar?.numeroParcela?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Número da Parcela',
                                  'Número da Parcela',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaPagar!.numeroParcela = int.tryParse(text);
                                  paginaMestreDetalheFoiAlterada = true;
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                         BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: valorController,
                                decoration: getInputDecoration(
                                  'Informe o Valor da parcela',
                                  'Valor',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaPagar!.valor = valorController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
                                  _formFoiAlterado = true;
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
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a Data de Emissão',
                                  'Data de Emissão',
                                  true),
                                isEmpty: widget.finParcelaPagar!.dataEmissao == null,
                                child: DatePickerItem(
                                  dateTime: widget.finParcelaPagar!.dataEmissao,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.finParcelaPagar!.dataEmissao = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a Data de Vencimento',
                                  'Data de Vencimento',
                                  true),
                                isEmpty: widget.finParcelaPagar!.dataVencimento == null,
                                child: DatePickerItem(
                                  dateTime: widget.finParcelaPagar!.dataVencimento,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.finParcelaPagar!.dataVencimento = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a Data de Pagamento',
                                  'Data de Pagamento',
                                  true),
                                isEmpty: widget.finParcelaPagar!.dataPagamento == null,
                                child: DatePickerItem(
                                  dateTime: widget.finParcelaPagar!.dataPagamento,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.finParcelaPagar!.dataPagamento = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Conceder Desconto até a Data Informada',
                                  'Desconto Até',
                                  true),
                                isEmpty: widget.finParcelaPagar!.descontoAte == null,
                                child: DatePickerItem(
                                  dateTime: widget.finParcelaPagar!.descontoAte,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.finParcelaPagar!.descontoAte = value;
                                    });
                                  },
                                ),
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: taxaJuroController,
                                decoration: getInputDecoration(
                                  'Informe a Taxa de Juros',
                                  'Taxa Juros',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaPagar!.taxaJuro = taxaJuroController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: taxaMultaController,
                                decoration: getInputDecoration(
                                  'Informe a Taxa de Multa',
                                  'Taxa Multa',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaPagar!.taxaMulta = taxaMultaController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: taxaDescontoController,
                                decoration: getInputDecoration(
                                  'Informe a Taxa de Desconto',
                                  'Taxa Desconto',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaPagar!.taxaDesconto = taxaDescontoController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
                                  _formFoiAlterado = true;
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: valorJuroController,
                                decoration: getInputDecoration(
                                  'Informe o Valor dos Juros',
                                  'Valor Juros',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaPagar!.valorJuro = valorJuroController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: valorMultaController,
                                decoration: getInputDecoration(
                                  'Informe o Valor da Multa',
                                  'Valor Multa',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaPagar!.valorMulta = valorMultaController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: valorDescontoController,
                                decoration: getInputDecoration(
                                  'Informe o Valor do Desconto',
                                  'Valor Desconto',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaPagar!.valorDesconto = valorDescontoController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
                                  _formFoiAlterado = true;
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: valorPagoController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Pago',
                                  'Valor Pago',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaPagar!.valorPago = valorPagoController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
                                  _formFoiAlterado = true;
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
                            sizes: 'col-12',
                            child: TextFormField(
                              maxLength: 1000,
                              maxLines: 3,
                              initialValue: widget.finParcelaPagar?.historico ?? '',
                              decoration: getInputDecoration(
                                'Informe o Histórico',
                                'Histórico',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.finParcelaPagar!.historico = text;
                                paginaMestreDetalheFoiAlterada = true;
                                _formFoiAlterado = true;
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

  Future<void> _salvar() async {
    final FormState form = _formKey.currentState!;
    if (!form.validate()) {
      _autoValidate = AutovalidateMode.always;
      showInSnackBar(Constantes.mensagemCorrijaErrosFormSalvar, context);
    } else {
      form.save();
      Navigator.of(context).pop();
    }
  }
  
  void _excluir() {
    gerarDialogBoxExclusao(context, () {
      widget.finLancamentoPagar!.listaFinParcelaPagar!.remove(widget.finParcelaPagar);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    });
  }
  
  Future<bool> _avisarUsuarioFormAlterado() async {
    final FormState? form = _formKey.currentState;
    if (form == null || !_formFoiAlterado) {
      return true;
    } else {
      await (gerarDialogBoxFormAlterado(context));
      return false;
    }
  }
}