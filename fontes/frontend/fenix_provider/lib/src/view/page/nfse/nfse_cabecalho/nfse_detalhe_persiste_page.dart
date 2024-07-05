/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe PersistePage relacionada à tabela [NFSE_DETALHE] 
                                                                                
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
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/view/shared/widgets_abas.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';

import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/infra/constantes.dart';

class NfseDetalhePersistePage extends StatefulWidget {
  final NfseCabecalho? nfseCabecalho;
  final NfseDetalhe? nfseDetalhe;
  final String title;
  final String operacao;

  const NfseDetalhePersistePage(
      {Key? key, this.nfseCabecalho, this.nfseDetalhe, required this.title, required this.operacao})
      : super(key: key);

  @override
  NfseDetalhePersistePageState createState() =>
      NfseDetalhePersistePageState();
}

class NfseDetalhePersistePageState extends State<NfseDetalhePersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;

  @override
  Widget build(BuildContext context) {
	var importaNfseListaServicoController = TextEditingController();
	importaNfseListaServicoController.text = widget.nfseDetalhe?.nfseListaServico?.descricao ?? '';
	var valorServicosController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorServicos ?? 0);
	var valorDeducoesController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorDeducoes ?? 0);
	var valorPisController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorPis ?? 0);
	var valorCofinsController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorCofins ?? 0);
	var valorInssController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorInss ?? 0);
	var valorIrController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorIr ?? 0);
	var valorCsllController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorCsll ?? 0);
	var importaCnaeController = TextEditingController();
	importaCnaeController.text = widget.nfseDetalhe?.codigoCnae ?? '';
	var valorBaseCalculoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorBaseCalculo ?? 0);
	var aliquotaController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.nfseDetalhe?.aliquota ?? 0);
	var valorIssController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorIss ?? 0);
	var valorLiquidoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorLiquido ?? 0);
	var outrasRetencoesController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.outrasRetencoes ?? 0);
	var valorCreditoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorCredito ?? 0);
	var valorIssRetidoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorIssRetido ?? 0);
	var valorDescontoCondicionadoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorDescontoCondicionado ?? 0);
	var valorDescontoIncondicionadoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfseDetalhe?.valorDescontoIncondicionado ?? 0);
	var importaMunicipioController = TextEditingController();
	importaMunicipioController.text = widget.nfseDetalhe?.municipioPrestacao as String? ?? '';
	
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
				  					controller: importaNfseListaServicoController,
				  					readOnly: true,
				  					decoration: getInputDecoration(
				  						'Importe a Lista Serviço Vinculada',
				  						'Lista Serviço *',
				  						false),
				  					onSaved: (String? value) {
				  					},
				  					onChanged: (text) {
				  						widget.nfseDetalhe?.nfseListaServico?.descricao = text;
				  						paginaMestreDetalheFoiAlterada = true;
				  						_formFoiAlterado = true;
				  					},
				  				),
				  			),
				  		),
				  		Expanded(
				  			flex: 0,
				  			child: IconButton(
				  				tooltip: 'Importar Lista Serviço',
				  				icon: const Icon(Icons.search),
				  				onPressed: () async {
				  					///chamando o lookup
				  					Map<String, dynamic>? objetoJsonRetorno =
				  						await Navigator.push(
				  							context,
				  							MaterialPageRoute(
				  								builder: (BuildContext context) =>
				  									LookupPage(
				  										title: 'Importar Lista Serviço',
				  										colunas: NfseListaServico.colunas,
				  										campos: NfseListaServico.campos,
				  										rota: '/nfse-lista-servico/',
				  										campoPesquisaPadrao: 'descricao',
				  										valorPesquisaPadrao: '%',
				  									),
				  									fullscreenDialog: true,
				  								));
				  				if (objetoJsonRetorno != null) {
				  					if (objetoJsonRetorno['descricao'] != null) {
				  						importaNfseListaServicoController.text = objetoJsonRetorno['descricao'];
				  						widget.nfseDetalhe!.idNfseListaServico = objetoJsonRetorno['id'];
				  						widget.nfseDetalhe!.nfseListaServico = NfseListaServico.fromJson(objetoJsonRetorno);
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
				  					controller: importaCnaeController,
				  					readOnly: true,
				  					decoration: getInputDecoration(
				  						'Informe o CNAE',
				  						'CNAE *',
				  						false),
				  					onSaved: (String? value) {
				  					},
				  					onChanged: (text) {
				  						widget.nfseDetalhe?.codigoCnae = text;
				  						paginaMestreDetalheFoiAlterada = true;
				  						_formFoiAlterado = true;
				  					},
				  				),
				  			),
				  		),
				  		Expanded(
				  			flex: 0,
				  			child: IconButton(
				  				tooltip: 'Importar CNAE',
				  				icon: const Icon(Icons.search),
				  				onPressed: () async {
				  					///chamando o lookup
				  					Map<String, dynamic>? objetoJsonRetorno =
				  						await Navigator.push(
				  							context,
				  							MaterialPageRoute(
				  								builder: (BuildContext context) =>
				  									LookupPage(
				  										title: 'Importar CNAE',
				  										colunas: Cnae.colunas,
				  										campos: Cnae.campos,
				  										rota: '/cnae/',
				  										campoPesquisaPadrao: 'codigo',
				  										valorPesquisaPadrao: '%',
				  									),
				  									fullscreenDialog: true,
				  								));
				  				if (objetoJsonRetorno != null) {
				  					if (objetoJsonRetorno['codigo'] != null) {
				  						importaCnaeController.text = objetoJsonRetorno['codigo'];
				  						widget.nfseDetalhe!.codigoCnae = objetoJsonRetorno['codigo'];
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
				  					controller: importaMunicipioController,
				  					readOnly: true,
				  					decoration: getInputDecoration(
				  						'Importe o Município IBGE Vinculado',
				  						'Município IBGE *',
				  						false),
				  					onSaved: (String? value) {
				  					},
				  					onChanged: (text) {
				  						widget.nfseDetalhe?.municipioPrestacao = int.tryParse(text);
				  						paginaMestreDetalheFoiAlterada = true;
				  						_formFoiAlterado = true;
				  					},
				  				),
				  			),
				  		),
				  		Expanded(
				  			flex: 0,
				  			child: IconButton(
				  				tooltip: 'Importar Município IBGE',
				  				icon: const Icon(Icons.search),
				  				onPressed: () async {
				  					///chamando o lookup
				  					Map<String, dynamic>? objetoJsonRetorno =
				  						await Navigator.push(
				  							context,
				  							MaterialPageRoute(
				  								builder: (BuildContext context) =>
				  									LookupPage(
				  										title: 'Importar Município IBGE',
				  										colunas: Municipio.colunas,
				  										campos: Municipio.campos,
				  										rota: '/municipio/',
				  										campoPesquisaPadrao: 'codigoIbge',
				  										valorPesquisaPadrao: '',
				  									),
				  									fullscreenDialog: true,
				  								));
				  				if (objetoJsonRetorno != null) {
				  					if (objetoJsonRetorno['codigoIbge'] != null) {
				  						importaMunicipioController.text = objetoJsonRetorno['codigoIbge'];
				  						widget.nfseDetalhe!.municipioPrestacao = objetoJsonRetorno['codigoIbge'];
				  					}
				  				}
				  			},
				  		),
				  		),
				  	],
				  ),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorServicosController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor',
				  		'Valor dos Serviços',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorServicos = valorServicosController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorDeducoesController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor',
				  		'Valor das Deduções',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorDeducoes = valorDeducoesController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorPisController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do PIS',
				  		'Valor do PIS',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorPis = valorPisController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorCofinsController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do COFINS',
				  		'Valor do COFINS',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorCofins = valorCofinsController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorInssController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do INSS',
				  		'Valor do INSS',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorInss = valorInssController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorIrController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do IR',
				  		'Valor do IR',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorIr = valorIrController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorCsllController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do CSLL',
				  		'Valor do CSLL',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorCsll = valorCsllController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	maxLength: 20,
				  	maxLines: 1,
				  	initialValue: widget.nfseDetalhe?.codigoTributacaoMunicipio ?? '',
				  	decoration: getInputDecoration(
				  		'Informe o Código Tributação Município',
				  		'Código Tributação Município',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.codigoTributacaoMunicipio = text;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorBaseCalculoController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor Base Cálculo',
				  		'Valor Base Cálculo',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorBaseCalculo = valorBaseCalculoController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: aliquotaController,
				  	decoration: getInputDecoration(
				  		'Informe o Alíquota',
				  		'Alíquota',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.aliquota = aliquotaController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorIssController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do ISS',
				  		'Valor do ISS',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorIss = valorIssController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorLiquidoController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor Líquido',
				  		'Valor Líquido',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorLiquido = valorLiquidoController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: outrasRetencoesController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do Outras Retenções',
				  		'Valor Outras Retenções',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.outrasRetencoes = outrasRetencoesController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorCreditoController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do Crédito',
				  		'Valor Crédito',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorCredito = valorCreditoController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  InputDecorator(
				  	decoration: getInputDecoration(
				  		'Selecione a Opção Desejada',
				  		'ISS Retido',
				  		true),
				  	isEmpty: widget.nfseDetalhe!.issRetido == null,
				  	child: getDropDownButton(widget.nfseDetalhe!.issRetido,
				  		(String? newValue) {
				  		paginaMestreDetalheFoiAlterada = true;
				  	setState(() {
				  		widget.nfseDetalhe!.issRetido = newValue;
				  	});
				  	}, <String>[
				  		'Sim',
				  		'Não',
				  ])),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorIssRetidoController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do ISS Retido',
				  		'Valor ISS Retido',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorIssRetido = valorIssRetidoController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorDescontoCondicionadoController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do Desconto Condicionado',
				  		'Valor Desconto Condicionado',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorDescontoCondicionado = valorDescontoCondicionadoController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorDescontoIncondicionadoController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do Desconto Incondicionado',
				  		'Valor Desconto Incondicionado',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.valorDescontoIncondicionado = valorDescontoIncondicionadoController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	maxLength: 1000,
				  	maxLines: 3,
				  	initialValue: widget.nfseDetalhe?.discriminacao ?? '',
				  	decoration: getInputDecoration(
				  		'Observações Gerais',
				  		'Discriminação',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.nfseDetalhe!.discriminacao = text;
				  		paginaMestreDetalheFoiAlterada = true;
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
