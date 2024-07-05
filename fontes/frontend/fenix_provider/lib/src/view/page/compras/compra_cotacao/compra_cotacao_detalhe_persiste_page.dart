/*
Title: T2Ti ERP Fenix                                                                
Description: AbaDetalhe PersistePage relacionada à tabela [COMPRA_COTACAO_DETALHE] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
import 'package:fenix/src/infra/valida_campo_formulario.dart';

class CompraCotacaoDetalhePersistePage extends StatefulWidget {
  final CompraFornecedorCotacao? compraFornecedorCotacao;
  final CompraCotacaoDetalhe? compraCotacaoDetalhe;
  final String title;
  final String operacao;

  const CompraCotacaoDetalhePersistePage(
      {Key? key, this.compraFornecedorCotacao, this.compraCotacaoDetalhe, required this.title, required this.operacao})
      : super(key: key);

  @override
  CompraCotacaoDetalhePersistePageState createState() =>
      CompraCotacaoDetalhePersistePageState();
}

class CompraCotacaoDetalhePersistePageState extends State<CompraCotacaoDetalhePersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;

  @override
  Widget build(BuildContext context) {
	var importaProdutoController = TextEditingController();
	importaProdutoController.text = widget.compraCotacaoDetalhe?.produto?.nome ?? '';
	var quantidadeController = MoneyMaskedTextController(precision: Constantes.decimaisQuantidade, initialValue: widget.compraCotacaoDetalhe?.quantidade ?? 0);
	var valorUnitarioController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.compraCotacaoDetalhe?.valorUnitario ?? 0);
	var valorSubtotalController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.compraCotacaoDetalhe?.valorSubtotal ?? 0);
	var taxaDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.compraCotacaoDetalhe?.taxaDesconto ?? 0);
	var valorDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.compraCotacaoDetalhe?.valorDesconto ?? 0);
	var valorTotalController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.compraCotacaoDetalhe?.valorTotal ?? 0);
	
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
				  					controller: importaProdutoController,
				  					readOnly: true,
				  					decoration: getInputDecoration(
				  						'Importe o Produto Vinculado',
				  						'Produto *',
				  						false),
				  					onSaved: (String? value) {
				  					},
				  					validator: ValidaCampoFormulario.validarObrigatorioAlfanumerico,
				  					onChanged: (text) {
				  						widget.compraCotacaoDetalhe?.produto?.nome = text;
				  						paginaMestreDetalheFoiAlterada = true;
				  						_formFoiAlterado = true;
				  					},
				  				),
				  			),
				  		),
				  		Expanded(
				  			flex: 0,
				  			child: IconButton(
				  				tooltip: 'Importar Produto',
				  				icon: const Icon(Icons.search),
				  				onPressed: () async {
				  					///chamando o lookup
				  					Map<String, dynamic>? objetoJsonRetorno =
				  						await Navigator.push(
				  							context,
				  							MaterialPageRoute(
				  								builder: (BuildContext context) =>
				  									LookupPage(
				  										title: 'Importar Produto',
				  										colunas: Produto.colunas,
				  										campos: Produto.campos,
				  										rota: '/produto/',
				  										campoPesquisaPadrao: 'nome',
				  									),
				  									fullscreenDialog: true,
				  								));
				  				if (objetoJsonRetorno != null) {
				  					if (objetoJsonRetorno['nome'] != null) {
				  						importaProdutoController.text = objetoJsonRetorno['nome'];
				  						widget.compraCotacaoDetalhe!.idProduto = objetoJsonRetorno['id'];
				  						widget.compraCotacaoDetalhe!.produto = Produto.fromJson(objetoJsonRetorno);
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
				  	controller: quantidadeController,
				  	decoration: getInputDecoration(
				  		'Informe a Quantidade',
				  		'Quantidade',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.compraCotacaoDetalhe!.quantidade = quantidadeController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorUnitarioController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor Unitário',
				  		'Valor Unitário',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.compraCotacaoDetalhe!.valorUnitario = valorUnitarioController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorSubtotalController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor Subtotal',
				  		'Valor Subtotal',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.compraCotacaoDetalhe!.valorSubtotal = valorSubtotalController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
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
				  		widget.compraCotacaoDetalhe!.taxaDesconto = taxaDescontoController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorDescontoController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor do Desconto',
				  		'Valor Desconto',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.compraCotacaoDetalhe!.valorDesconto = valorDescontoController.numberValue;
				  		paginaMestreDetalheFoiAlterada = true;
				  		_formFoiAlterado = true;
				  	},
				  	),
				  const SizedBox(height: 24.0),
				  TextFormField(
				  	keyboardType: TextInputType.number,
				  	controller: valorTotalController,
				  	decoration: getInputDecoration(
				  		'Informe o Valor Total',
				  		'Valor Total',
				  		false),
				  	onSaved: (String? value) {
				  	},
				  	onChanged: (text) {
				  		widget.compraCotacaoDetalhe!.valorTotal = valorTotalController.numberValue;
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
