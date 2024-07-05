/*
Title: T2Ti ERP 3.0                                                                
Description: PersistePage relacionada à tabela [FIN_PARCELA_PAGAR] 
                                                                                
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
import 'package:fenix/src/infra/biblioteca.dart';
import 'package:fenix/src/view/page/financeiro/fin_cheque_emitido/fin_cheque_emitido_persiste_page.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';

import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/infra/constantes.dart';
import 'package:fenix/src/infra/valida_campo_formulario.dart';

class FinParcelaPagarPersistePage extends StatefulWidget {
  final FinParcelaPagar? finParcelaPagar;
  final String title;
  final String operacao;

  const FinParcelaPagarPersistePage({Key? key, this.finParcelaPagar, required this.title, required this.operacao})
      : super(key: key);

  @override
  FinParcelaPagarPersistePageState createState() => FinParcelaPagarPersistePageState();
}

class FinParcelaPagarPersistePageState extends State<FinParcelaPagarPersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;

  @override
  Widget build(BuildContext context) {
    var finParcelaPagarProvider = Provider.of<FinParcelaPagarViewModel>(context);

    // chama o método para atualizar o valor total
    atualizarTotais();

    var importaFinStatusParcelaController = TextEditingController();
    importaFinStatusParcelaController.text = widget.finParcelaPagar?.finStatusParcela?.descricao ?? '';
    var importaFinTipoPagamentoController = TextEditingController();
    importaFinTipoPagamentoController.text = widget.finParcelaPagar?.finTipoPagamento?.descricao ?? '';
    var importaFinChequeEmitidoController = TextEditingController();
    importaFinChequeEmitidoController.text = widget.finParcelaPagar?.finChequeEmitido?.cheque?.numero?.toString() ?? '';
    var valorController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaPagar?.valor ?? 0);
    var taxaJuroController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finParcelaPagar?.taxaJuro ?? 0);
    var taxaMultaController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finParcelaPagar?.taxaMulta ?? 0);
    var taxaDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finParcelaPagar?.taxaDesconto ?? 0);
    var valorJuroController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaPagar?.valorJuro ?? 0);
    var valorMultaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaPagar?.valorMulta ?? 0);
    var valorDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaPagar?.valorDesconto ?? 0);
    var valorPagoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaPagar?.valorPago ?? 0);

    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: ViewUtilLib.getIconBotaoSalvar(),
            onPressed: () async {
              final FormState form = _formKey.currentState!;
              if (!form.validate()) {
                _autoValidate = AutovalidateMode.always;
                showInSnackBar(
                    'Por favor, corrija os erros apresentados antes de continuar.',
                    context);
              } else {
                form.save();
                if (widget.operacao == 'A') {
                  await finParcelaPagarProvider.alterar(widget.finParcelaPagar!);
                } else {
                  await finParcelaPagarProvider.inserir(widget.finParcelaPagar!);
                }
                if (!mounted) return;
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate,
          onWillPop: _avisarUsuarioFormAlterado,
          child: Scrollbar(
            child: SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
				  const SizedBox(height: 24.0),
				  Row(
				  	children: <Widget>[
				  		Expanded(
				  			flex: 1,
				  			child: SizedBox(
				  				child: TextFormField(
				  					controller: importaFinStatusParcelaController,
				  					readOnly: true,
				  					decoration: getInputDecoration(
				  						'Importe o Status da Parcela Vinculado',
				  						'Status Parcela',
				  						false),
				  					onSaved: (String? value) {
				  					},
				  					onChanged: (text) {
				  						widget.finParcelaPagar?.finStatusParcela?.descricao = text;
				  						_formFoiAlterado = true;
				  					},
				  				),
				  			),
				  		),
				  		Expanded(
				  			flex: 0,
				  			child: IconButton(
				  				tooltip: 'Importar Status Parcela',
				  				icon: const Icon(Icons.search),
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
				  						widget.finParcelaPagar!.idFinStatusParcela = objetoJsonRetorno['id'];
				  						widget.finParcelaPagar!.finStatusParcela = FinStatusParcela.fromJson(objetoJsonRetorno);
				  					}
				  				}
				  			},
				  		),
				  		),
				  	],
				  ),
				  const SizedBox(height: 24.0),
				  Row(
				  	children: <Widget>[
				  		Expanded(
				  			flex: 1,
				  			child: SizedBox(
				  				child: TextFormField(
				  					controller: importaFinTipoPagamentoController,
				  					readOnly: true,
				  					decoration: getInputDecoration(
				  						'Importe o Tipo Pagamento Vinculado',
				  						'Tipo Pagamento *',
				  						false),
				  					onSaved: (String? value) {
				  					},
				  					validator: ValidaCampoFormulario.validarObrigatorioAlfanumerico,
				  					onChanged: (text) {
				  						widget.finParcelaPagar?.finTipoPagamento?.descricao = text;
				  						_formFoiAlterado = true;
				  					},
				  				),
				  			),
				  		),
				  		Expanded(
				  			flex: 0,
				  			child: IconButton(
				  				tooltip: 'Importar Tipo Pagamento',
				  				icon: const Icon(Icons.search),
				  				onPressed: () async {
				  					///chamando o lookup
				  					Map<String, dynamic>? objetoJsonRetorno =
				  						await Navigator.push(
				  							context,
				  							MaterialPageRoute(
				  								builder: (BuildContext context) =>
				  									LookupPage(
				  										title: 'Importar Tipo Pagamento',
				  										colunas: FinTipoPagamento.colunas,
				  										campos: FinTipoPagamento.campos,
				  										rota: '/fin-tipo-pagamento/',
				  										campoPesquisaPadrao: 'descricao',
                              valorPesquisaPadrao: '%',
				  									),
				  									fullscreenDialog: true,
				  								));
				  				if (objetoJsonRetorno != null) {
				  					if (objetoJsonRetorno['descricao'] != null) {
				  						importaFinTipoPagamentoController.text = objetoJsonRetorno['descricao'];
				  						widget.finParcelaPagar!.idFinTipoPagamento = objetoJsonRetorno['id'];
				  						widget.finParcelaPagar!.finTipoPagamento = FinTipoPagamento.fromJson(objetoJsonRetorno);
				  					}
				  				}
				  			},
				  		),
				  		),
				  	],
				  ),
				  const SizedBox(height: 24.0),
				  Row(
				  	children: <Widget>[
				  		Expanded(
				  			flex: 1,
				  			child: SizedBox(
				  				child: TextFormField(
				  					controller: importaFinChequeEmitidoController,
				  					readOnly: true,
				  					decoration: getInputDecoration(
				  						'Importe o Cheque Vinculado',
				  						'Cheque',
				  						false),
				  					onSaved: (String? value) {
				  					},
				  					onChanged: (text) {
				  						widget.finParcelaPagar?.finChequeEmitido?.cheque?.numero = int.tryParse(text);
				  						_formFoiAlterado = true;
				  					},
				  				),
				  			),
				  		),
				  		Expanded(
				  			flex: 0,
				  			child: IconButton(
				  				tooltip: 'Importar Cheque',
				  				icon: const Icon(Icons.search),
				  				onPressed: () async {
				  					///chamando o lookup
				  					FinChequeEmitido? objetoJsonRetorno =
				  						await Navigator.push(
				  							context,
				  							MaterialPageRoute(
				  								builder: (BuildContext context) =>
				  									FinChequeEmitidoPersistePage(
				  										title: 'Importar Cheque',
                              finChequeEmitido: FinChequeEmitido(),
                              operacao: 'I'
				  									),
				  									fullscreenDialog: true,
				  								));
				  				if (objetoJsonRetorno != null) {
				  					if (objetoJsonRetorno.idCheque != null) {
                      importaFinChequeEmitidoController.text = objetoJsonRetorno.cheque!.numero.toString();
                      widget.finParcelaPagar!.finChequeEmitido = objetoJsonRetorno;
				  					}
				  				}
				  			},
				  		),
				  		),
				  	],
				  ),
				  const SizedBox(height: 24.0),
				  TextFormField(
            readOnly: true,
				  	keyboardType: TextInputType.number,
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
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  InputDecorator(
				  	decoration: getInputDecoration(
				  		'Informe a Data de Emissão',
				  		'Data de Emissão',
				  		true),
				  	isEmpty: widget.finParcelaPagar!.dataEmissao == null,
				  	child: DatePickerItem(
              readOnly: true,
				  		dateTime: widget.finParcelaPagar!.dataEmissao,
				  		firstDate: DateTime.parse('1900-01-01'),
				  		lastDate: DateTime.now(),
				  		onChanged: (DateTime? value) {
				  			setState(() {
				  				widget.finParcelaPagar!.dataEmissao = value;
				  			});
				  		},
				  	),
				  ),
				  const SizedBox(height: 24.0),
				  InputDecorator(
				  	decoration: getInputDecoration(
				  		'Informe a Data de Vencimento',
				  		'Data de Vencimento',
				  		true),
				  	isEmpty: widget.finParcelaPagar!.dataVencimento == null,
				  	child: DatePickerItem(
              readOnly: true,
				  		dateTime: widget.finParcelaPagar!.dataVencimento,
				  		firstDate: DateTime.parse('1900-01-01'),
				  		lastDate: DateTime.now(),
				  		onChanged: (DateTime? value) {
				  			setState(() {
				  				widget.finParcelaPagar!.dataVencimento = value;
				  			});
				  		},
				  	),
				  ),
				  const SizedBox(height: 24.0),
				  InputDecorator(
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
				  			setState(() {
				  				widget.finParcelaPagar!.dataPagamento = value;
				  			});
				  		},
				  	),
				  ),
				  const SizedBox(height: 24.0),
				  TextFormField(
            readOnly: true,
				  	keyboardType: TextInputType.number,
				  	controller: valorController,
				  	decoration: getInputDecoration(
				  		'Valor da parcela',
				  		'Valor',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.finParcelaPagar!.valor = valorController.numberValue;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: taxaJuroController,
				  	decoration: getInputDecoration(
				  		'Informe a Taxa de Juros',
				  		'Taxa Juros',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.finParcelaPagar!.taxaJuro = taxaJuroController.numberValue;
              atualizarTotais();
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
            readOnly: true,
				  	keyboardType: TextInputType.number,
				  	controller: valorJuroController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor dos Juros',
				  		'Valor Juros',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.finParcelaPagar!.valorJuro = valorJuroController.numberValue;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: taxaMultaController,
				  	decoration: getInputDecoration(
				  		'Informe a Taxa de Multa',
				  		'Taxa Multa',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.finParcelaPagar!.taxaMulta = taxaMultaController.numberValue;
              atualizarTotais();
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
            readOnly: true,
				  	keyboardType: TextInputType.number,
				  	controller: valorMultaController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor da Multa',
				  		'Valor Multa',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.finParcelaPagar!.valorMulta = valorMultaController.numberValue;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: taxaDescontoController,
				  	decoration: getInputDecoration(
				  		'Informe a Taxa de Desconto',
				  		'Taxa Desconto',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.finParcelaPagar!.taxaDesconto = taxaDescontoController.numberValue;
              atualizarTotais();
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
            readOnly: true,
				  	keyboardType: TextInputType.number,
				  	controller: valorDescontoController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do Desconto',
				  		'Valor Desconto',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.finParcelaPagar!.valorDesconto = valorDescontoController.numberValue;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
            readOnly: true,
				  	keyboardType: TextInputType.number,
				  	controller: valorPagoController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor Pago',
				  		'Valor Pago',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.finParcelaPagar!.valorPago = valorPagoController.numberValue;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
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
				  		_formFoiAlterado = true;
				  	},
				  	),
                  const SizedBox(height: 24.0),
                  Text(
                    '* indica que o campo é obrigatório',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  atualizarTotais() {
    setState(() {
      widget.finParcelaPagar!.valorJuro = Biblioteca.calcularJuros(widget.finParcelaPagar!.valor, widget.finParcelaPagar!.taxaJuro, widget.finParcelaPagar!.dataVencimento);
      widget.finParcelaPagar!.valorMulta = Biblioteca.calcularMulta(widget.finParcelaPagar!.valor, widget.finParcelaPagar!.taxaMulta);
      widget.finParcelaPagar!.valorDesconto = Biblioteca.calcularDesconto(widget.finParcelaPagar!.valor, widget.finParcelaPagar!.taxaDesconto);
      widget.finParcelaPagar!.valorPago = widget.finParcelaPagar!.valor! + widget.finParcelaPagar!.valorJuro! + widget.finParcelaPagar!.valorMulta! - widget.finParcelaPagar!.valorDesconto!;
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