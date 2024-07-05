/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe PersistePage relacionada à tabela [ESTOQUE_FORMACAO_DETALHE] 
                                                                                
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

import 'package:fenix/src/model/model.dart';

import 'package:fenix/src/view/shared/widgets_abas.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';
import 'package:fenix/src/view/shared/botoes.dart';

import 'package:fenix/src/view/shared/page/lookup_page.dart';
// import 'package:extended_masked_text/extended_masked_text.dart';

class EstoqueFormacaoDetalhePersistePage extends StatefulWidget {
  final EstoqueReajusteCabecalho? estoqueReajusteCabecalho;
  final EstoqueReajusteDetalhe? estoqueReajusteDetalhe;
  final String? title;
  final String? operacao;

  const EstoqueFormacaoDetalhePersistePage(
      {Key? key, this.estoqueReajusteCabecalho, this.estoqueReajusteDetalhe, this.title, this.operacao})
      : super(key: key);

  @override
  EstoqueFormacaoDetalhePersistePageState createState() => EstoqueFormacaoDetalhePersistePageState();
}

class EstoqueFormacaoDetalhePersistePageState extends State<EstoqueFormacaoDetalhePersistePage> {
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
	final importaProdutoController = TextEditingController();
	importaProdutoController.text = widget.estoqueReajusteDetalhe?.produto?.nome ?? '';
	// final valorOriginalController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.estoqueReajusteDetalhe?.valorOriginal ?? 0);
	// final valorReajusteController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.estoqueReajusteDetalhe?.valorReajuste ?? 0);

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
                              sizes: 'col-12',
                              child: Row(
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
                                        validator: ValidaCampoFormulario.validarObrigatorio,
                                        onChanged: (text) {
                                          widget.estoqueReajusteDetalhe?.produto?.nome = text;
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
                                      icon: ViewUtilLib.getIconBotaoLookup(),
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
                                                  valorPesquisaPadrao: '%',
                                                ),
                                                fullscreenDialog: true,
                                              ));
                                        if (objetoJsonRetorno != null) {
                                          if (objetoJsonRetorno['nome'] != null) {
                                            importaProdutoController.text = objetoJsonRetorno['nome'];
                                            widget.estoqueReajusteDetalhe?.idProduto = objetoJsonRetorno['id'];
                                            widget.estoqueReajusteDetalhe?.produto = Produto.fromJson(objetoJsonRetorno);
                                            widget.estoqueReajusteDetalhe?.valorOriginal = double.parse(objetoJsonRetorno['valorCompra'].toString());
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // const Divider(color: Colors.white,),
                        // BootstrapRow(
                        //   height: 60,
                        //   children: <BootstrapCol>[
                        //     BootstrapCol(
                        //       sizes: 'col-12 col-md-6',
                        //       child: Padding(
                        //         padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                        //         child: TextFormField(
                        //           keyboardType: TextInputType.number,
                        //           readOnly: true,
                        //           textAlign: TextAlign.end,
                        //           controller: valorOriginalController,
                        //           decoration: getInputDecoration(
                        //             'Valor Original',
                        //             'Valor Original',
                        //             false),
                        //           onSaved: (String? value) {
                        //           },
                        //           onChanged: (text) {
                        //             widget.estoqueReajusteDetalhe?.valorOriginal = valorOriginalController.numberValue;
                        //             paginaMestreDetalheFoiAlterada = true;
                        //             _formFoiAlterado = true;
                        //           },
                        //         ),
                        //       ),
                        //     ),
                        //     BootstrapCol(
                        //       sizes: 'col-12 col-md-6',
                        //       child: Padding(
                        //         padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                        //         child: TextFormField(
                        //           keyboardType: TextInputType.number,
                        //           readOnly: true,
                        //           textAlign: TextAlign.end,
                        //           controller: valorReajusteController,
                        //           decoration: getInputDecoration(
                        //             'Valor Reajustado',
                        //             'Valor Reajustado',
                        //             false),
                        //           onSaved: (String? value) {
                        //           },
                        //           onChanged: (text) {
                        //             widget.estoqueReajusteDetalhe?.valorReajuste = valorReajusteController.numberValue;
                        //             paginaMestreDetalheFoiAlterada = true;
                        //             _formFoiAlterado = true;
                        //           },
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        const Divider(color: Colors.white,),
                        BootstrapRow(
                          height: 60,
                          children: <BootstrapCol>[
                            BootstrapCol(
                              sizes: 'col-12',
                              child: 
                                Text('* indica que o campo é obrigatório',
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
      widget.estoqueReajusteCabecalho!.listaEstoqueReajusteDetalhe!.remove(widget.estoqueReajusteDetalhe);
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