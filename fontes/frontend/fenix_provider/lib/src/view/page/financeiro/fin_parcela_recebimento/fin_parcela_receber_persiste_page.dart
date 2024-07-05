/*
Title: T2Ti ERP 3.0                                                                
Description: PersistePage relacionada à tabela [FIN_PARCELA_RECEBER] 
                                                                                
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
import 'package:fenix/src/view/page/page.dart';
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

class FinParcelaReceberPersistePage extends StatefulWidget {
  final FinParcelaReceber? finParcelaReceber;
  final String title;
  final String operacao;

  const FinParcelaReceberPersistePage({Key? key, this.finParcelaReceber, required this.title, required this.operacao})
      : super(key: key);

  @override
  FinParcelaReceberPersistePageState createState() => FinParcelaReceberPersistePageState();
}

class FinParcelaReceberPersistePageState extends State<FinParcelaReceberPersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;

  @override
  Widget build(BuildContext context) {
    var finParcelaReceberProvider = Provider.of<FinParcelaReceberViewModel>(context);

    // chama o método para atualizar o valor total
    atualizarTotais();

    var importaFinStatusParcelaController = TextEditingController();
    importaFinStatusParcelaController.text = widget.finParcelaReceber?.finStatusParcela?.descricao ?? '';
    var importaFinTipoRecebimentoController = TextEditingController();
    importaFinTipoRecebimentoController.text = widget.finParcelaReceber?.finTipoRecebimento?.descricao ?? '';
    var importaFinChequeRecebidoController = TextEditingController();
    importaFinChequeRecebidoController.text = widget.finParcelaReceber?.finChequeRecebido?.numero?.toString() ?? '';
    var valorController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaReceber?.valor ?? 0);
    var taxaJuroController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finParcelaReceber?.taxaJuro ?? 0);
    var taxaMultaController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finParcelaReceber?.taxaMulta ?? 0);
    var taxaDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finParcelaReceber?.taxaDesconto ?? 0);
    var valorJuroController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaReceber?.valorJuro ?? 0);
    var valorMultaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaReceber?.valorMulta ?? 0);
    var valorDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaReceber?.valorDesconto ?? 0);
    var valorRecebidoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finParcelaReceber?.valorRecebido ?? 0);

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
                  await finParcelaReceberProvider.alterar(widget.finParcelaReceber!);
                } else {
                  await finParcelaReceberProvider.inserir(widget.finParcelaReceber!);
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
				  						widget.finParcelaReceber?.finStatusParcela?.descricao = text;
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
				  						widget.finParcelaReceber!.idFinStatusParcela = objetoJsonRetorno['id'];
				  						widget.finParcelaReceber!.finStatusParcela = FinStatusParcela.fromJson(objetoJsonRetorno);
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
				  					controller: importaFinTipoRecebimentoController,
				  					readOnly: true,
				  					decoration: getInputDecoration(
				  						'Importe o Tipo Recebimento Vinculado',
				  						'Tipo Recebimento *',
				  						false),
				  					onSaved: (String? value) {
				  					},
				  					validator: ValidaCampoFormulario.validarObrigatorioAlfanumerico,
				  					onChanged: (text) {
				  						widget.finParcelaReceber?.finTipoRecebimento?.descricao = text;
				  						_formFoiAlterado = true;
				  					},
				  				),
				  			),
				  		),
				  		Expanded(
				  			flex: 0,
				  			child: IconButton(
				  				tooltip: 'Importar Tipo Recebimento',
				  				icon: const Icon(Icons.search),
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
				  										rota: '/fin-tipo-pagamento/',
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
				  const SizedBox(height: 24.0),
				  Row(
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
				  					FinChequeRecebido? objetoJsonRetorno =
				  						await Navigator.push(
				  							context,
				  							MaterialPageRoute(
				  								builder: (BuildContext context) =>
				  									FinChequeRecebidoPersistePage( 
				  										title: 'Importar Cheque',
                              finChequeRecebido: FinChequeRecebido(), operacao: '',
				  									),
				  									fullscreenDialog: true,
				  								));
				  				if (objetoJsonRetorno != null) {
				  					if (objetoJsonRetorno.numero != null) {
                      importaFinChequeRecebidoController.text = objetoJsonRetorno.numero.toString();
                      widget.finParcelaReceber!.finChequeRecebido = objetoJsonRetorno;
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
				  	initialValue: widget.finParcelaReceber?.numeroParcela?.toString() ?? '',
				  	decoration: getInputDecoration(
				  		'Informe o Número da Parcela',
				  		'Número da Parcela',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.finParcelaReceber!.numeroParcela = int.tryParse(text);
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  InputDecorator(
				  	decoration: getInputDecoration(
				  		'Informe a Data de Emissão',
				  		'Data de Emissão',
				  		true),
				  	isEmpty: widget.finParcelaReceber!.dataEmissao == null,
				  	child: DatePickerItem(
              readOnly: true,
				  		dateTime: widget.finParcelaReceber!.dataEmissao,
				  		firstDate: DateTime.parse('1900-01-01'),
				  		lastDate: DateTime.now(),
				  		onChanged: (DateTime? value) {
				  			setState(() {
				  				widget.finParcelaReceber!.dataEmissao = value;
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
				  	isEmpty: widget.finParcelaReceber!.dataVencimento == null,
				  	child: DatePickerItem(
              readOnly: true,
				  		dateTime: widget.finParcelaReceber!.dataVencimento,
				  		firstDate: DateTime.parse('1900-01-01'),
				  		lastDate: DateTime.now(),
				  		onChanged: (DateTime? value) {
				  			setState(() {
				  				widget.finParcelaReceber!.dataVencimento = value;
				  			});
				  		},
				  	),
				  ),
				  const SizedBox(height: 24.0),
				  InputDecorator(
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
				  			setState(() {
				  				widget.finParcelaReceber!.dataRecebimento = value;
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
				  		widget.finParcelaReceber!.valor = valorController.numberValue;
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
				  		widget.finParcelaReceber!.taxaJuro = taxaJuroController.numberValue;
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
				  		widget.finParcelaReceber!.valorJuro = valorJuroController.numberValue;
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
				  		widget.finParcelaReceber!.taxaMulta = taxaMultaController.numberValue;
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
				  		widget.finParcelaReceber!.valorMulta = valorMultaController.numberValue;
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
				  		widget.finParcelaReceber!.taxaDesconto = taxaDescontoController.numberValue;
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
				  		widget.finParcelaReceber!.valorDesconto = valorDescontoController.numberValue;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
            readOnly: true,
				  	keyboardType: TextInputType.number,
				  	controller: valorRecebidoController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor Recebido',
				  		'Valor Recebido',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.finParcelaReceber!.valorRecebido = valorRecebidoController.numberValue;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
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
      widget.finParcelaReceber!.valorJuro = Biblioteca.calcularJuros(widget.finParcelaReceber!.valor, widget.finParcelaReceber!.taxaJuro, widget.finParcelaReceber!.dataVencimento);
      widget.finParcelaReceber!.valorMulta = Biblioteca.calcularMulta(widget.finParcelaReceber!.valor, widget.finParcelaReceber!.taxaMulta);
      widget.finParcelaReceber!.valorDesconto = Biblioteca.calcularDesconto(widget.finParcelaReceber!.valor, widget.finParcelaReceber!.taxaDesconto);
      widget.finParcelaReceber!.valorRecebido = widget.finParcelaReceber!.valor! + widget.finParcelaReceber!.valorJuro! + widget.finParcelaReceber!.valorMulta! - widget.finParcelaReceber!.valorDesconto!;
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