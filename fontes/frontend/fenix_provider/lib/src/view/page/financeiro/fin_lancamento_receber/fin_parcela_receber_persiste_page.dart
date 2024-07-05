/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe PersistePage relacionada à tabela [FIN_PARCELA_RECEBER] 
                                                                                
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

import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/infra/valida_campo_formulario.dart';

class FinParcelaReceberPersistePage extends StatefulWidget {
  final FinLancamentoReceber? finLancamentoReceber;
  final FinParcelaReceber? finParcelaReceber;
  final String title;
  final String operacao;

  const FinParcelaReceberPersistePage(
      {Key? key, this.finLancamentoReceber, this.finParcelaReceber, required this.title, required this.operacao})
      : super(key: key);

  @override
  FinParcelaReceberPersistePageState createState() => FinParcelaReceberPersistePageState();
}

class FinParcelaReceberPersistePageState extends State<FinParcelaReceberPersistePage> {
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
	final importaFinStatusParcelaController = TextEditingController();
	importaFinStatusParcelaController.text = widget.finParcelaReceber?.finStatusParcela?.descricao ?? '';
	final importaFinTipoRecebimentoController = TextEditingController();
	importaFinTipoRecebimentoController.text = widget.finParcelaReceber?.finTipoRecebimento?.descricao ?? '';
	final importaFinChequeRecebidoController = TextEditingController();
	importaFinChequeRecebidoController.text = widget.finParcelaReceber?.finChequeRecebido?.numero as String? ?? '';
	final valorController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaReceber?.valor ?? 0);
	final taxaJuroController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finParcelaReceber?.taxaJuro ?? 0);
	final taxaMultaController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finParcelaReceber?.taxaMulta ?? 0);
	final taxaDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finParcelaReceber?.taxaDesconto ?? 0);
	final valorJuroController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaReceber?.valorJuro ?? 0);
	final valorMultaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaReceber?.valorMulta ?? 0);
	final valorDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaReceber?.valorDesconto ?? 0);
	final valorRecebidoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaReceber?.valorRecebido ?? 0);

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
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    child: TextFormField(
                                      controller: importaFinStatusParcelaController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe o Status Parcela Vinculado',
                                        'Status Parcela *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.finParcelaReceber?.finStatusParcela?.descricao = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                        _formFoiAlterado = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Status Parcela',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Status Parcela',
                                                colunas: FinStatusParcela.colunas,
                                                campos: FinStatusParcela.campos,
                                                rota: '/fin-status-parcela/',
                                                campoPesquisaPadrao: 'descricao',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['descricao'] != null) {
                                          importaFinStatusParcelaController.text = objetoJsonRetorno['descricao'];
                                          widget.finParcelaReceber!.idFinStatusParcela = objetoJsonRetorno['id'];
                                          widget.finParcelaReceber!.finStatusParcela = FinStatusParcela.fromJson(objetoJsonRetorno);
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    child: TextFormField(
                                      controller: importaFinTipoRecebimentoController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe o Tipo de Recebimento Vinculado',
                                        'Tipo Recebimento *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.finParcelaReceber?.finTipoRecebimento?.descricao = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                        _formFoiAlterado = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Tipo Recebimento',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Tipo Recebimento',
                                                colunas: FinTipoRecebimento.colunas,
                                                campos: FinTipoRecebimento.campos,
                                                rota: '/fin-tipo-recebimento/',
                                                campoPesquisaPadrao: 'descricao',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['descricao'] != null) {
                                          importaFinTipoRecebimentoController.text = objetoJsonRetorno['descricao'];
                                          widget.finParcelaReceber!.idFinTipoRecebimento = objetoJsonRetorno['id'];
                                          widget.finParcelaReceber!.finTipoRecebimento = FinTipoRecebimento.fromJson(objetoJsonRetorno);
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            ),
                          ),
                        ]
                      ),
                      const Divider(color: Colors.white,),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    child: TextFormField(
                                      controller: importaFinChequeRecebidoController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe o Cheque Vinculado',
                                        'Cheque',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      onChanged: (text) {
                                        widget.finParcelaReceber?.finChequeRecebido?.numero = int.tryParse(text);
                                  paginaMestreDetalheFoiAlterada = true;
                                        _formFoiAlterado = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Cheque',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Cheque',
                                                colunas: FinChequeRecebido.colunas,
                                                campos: FinChequeRecebido.campos,
                                                rota: '/fin-cheque-recebido/',
                                                campoPesquisaPadrao: 'numero',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['numero'] != null) {
                                          importaFinChequeRecebidoController.text = objetoJsonRetorno['numero'];
                                          widget.finParcelaReceber!.idFinChequeRecebido = objetoJsonRetorno['id'];
                                          widget.finParcelaReceber!.finChequeRecebido = FinChequeRecebido.fromJson(objetoJsonRetorno);
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
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
                                initialValue: widget.finParcelaReceber?.numeroParcela?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Número da Parcela',
                                  'Número da Parcela',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaReceber!.numeroParcela = int.tryParse(text);
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
                                  widget.finParcelaReceber!.valor = valorController.numberValue;
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
                                isEmpty: widget.finParcelaReceber!.dataEmissao == null,
                                child: DatePickerItem(
                                  dateTime: widget.finParcelaReceber!.dataEmissao,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.finParcelaReceber!.dataEmissao = value;
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
                                isEmpty: widget.finParcelaReceber!.dataVencimento == null,
                                child: DatePickerItem(
                                  dateTime: widget.finParcelaReceber!.dataVencimento,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.finParcelaReceber!.dataVencimento = value;
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
                                  'Informe a Data de Recebimento',
                                  'Data de Recebimento',
                                  true),
                                isEmpty: widget.finParcelaReceber!.dataRecebimento == null,
                                child: DatePickerItem(
                                  dateTime: widget.finParcelaReceber!.dataRecebimento,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.finParcelaReceber!.dataRecebimento = value;
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
                                isEmpty: widget.finParcelaReceber!.descontoAte == null,
                                child: DatePickerItem(
                                  dateTime: widget.finParcelaReceber!.descontoAte,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.finParcelaReceber!.descontoAte = value;
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
                                  widget.finParcelaReceber!.taxaJuro = taxaJuroController.numberValue;
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
                                  widget.finParcelaReceber!.taxaMulta = taxaMultaController.numberValue;
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
                                  widget.finParcelaReceber!.taxaDesconto = taxaDescontoController.numberValue;
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
                                  widget.finParcelaReceber!.valorJuro = valorJuroController.numberValue;
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
                                  widget.finParcelaReceber!.valorMulta = valorMultaController.numberValue;
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
                                  widget.finParcelaReceber!.valorDesconto = valorDescontoController.numberValue;
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
                            sizes: 'col-12 col-md-2',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'Emitiu Boleto',
                                  true),
                                isEmpty: widget.finParcelaReceber!.emitiuBoleto == null,
                                child: getDropDownButton(widget.finParcelaReceber!.emitiuBoleto,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.finParcelaReceber!.emitiuBoleto = newValue;
                                    });
                                }, <String>[
                                  'Sim',
                                  'Não',
                              ])),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 50,
                                maxLines: 1,
                                initialValue: widget.finParcelaReceber?.boletoNossoNumero ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Nosso Número do Boleto',
                                  'Boleto Nosso Número',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaReceber!.boletoNossoNumero = text;
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
                                controller: valorRecebidoController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Recebido',
                                  'Valor Recebido',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finParcelaReceber!.valorRecebido = valorRecebidoController.numberValue;
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
                              initialValue: widget.finParcelaReceber?.historico ?? '',
                              decoration: getInputDecoration(
                                'Informe o Histórico',
                                'Histórico',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.finParcelaReceber!.historico = text;
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
      widget.finLancamentoReceber!.listaFinParcelaReceber!.remove(widget.finParcelaReceber);
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