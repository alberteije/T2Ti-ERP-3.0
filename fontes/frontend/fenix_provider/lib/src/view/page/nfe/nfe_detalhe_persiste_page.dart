/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe PersistePage relacionada à tabela [NFE_DETALHE] 
                                                                                
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
import 'package:fenix/src/service/service.dart';
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
import 'package:extended_masked_text/extended_masked_text.dart';

class NfeDetalhePersistePage extends StatefulWidget {
  final NfeCabecalho? nfeCabecalho;
  final NfeDetalhe? nfeDetalhe;
  final String? title;
  final String? operacao;

  const NfeDetalhePersistePage(
      {Key? key, this.nfeCabecalho, this.nfeDetalhe, this.title, this.operacao})
      : super(key: key);

  @override
  NfeDetalhePersistePageState createState() => NfeDetalhePersistePageState();
}

class NfeDetalhePersistePageState extends State<NfeDetalhePersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;

  final ScrollController _scrollController = ScrollController();

	final importaProdutoController = TextEditingController();
	final quantidadeController = MoneyMaskedTextController(precision: Constantes.decimaisQuantidade);
	final valorUnitarioController = MoneyMaskedTextController(precision: Constantes.decimaisValor);
	final valorSubtotalController = MoneyMaskedTextController(precision: Constantes.decimaisValor);
	final valorDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisValor);
	final valorTotalController = MoneyMaskedTextController(precision: Constantes.decimaisValor);


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
    importaProdutoController.text = widget.nfeDetalhe?.nomeProduto ?? '';
    quantidadeController.updateValue(widget.nfeDetalhe?.quantidadeComercial ?? 0);
    valorUnitarioController.updateValue(widget.nfeDetalhe?.valorUnitarioComercial ?? 0);
    valorSubtotalController.updateValue(widget.nfeDetalhe?.valorSubtotal ?? 0);
    valorDescontoController.updateValue(widget.nfeDetalhe?.valorDesconto ?? 0);
    valorTotalController.updateValue(widget.nfeDetalhe?.valorTotal ?? 0);

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
                              sizes: 'col-12 col-md-8',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
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
                                          widget.nfeDetalhe?.nomeProduto = text;
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
                                            widget.nfeDetalhe!.idProduto = objetoJsonRetorno['id'];
                                            widget.nfeDetalhe?.nomeProduto = objetoJsonRetorno['nome'];
                                            widget.nfeDetalhe?.gtin = objetoJsonRetorno['gtin'] ?? 'SEM GTIN';
                                            widget.nfeDetalhe?.gtinUnidadeTributavel = objetoJsonRetorno['gtin'] ?? 'SEM GTIN';
                                            widget.nfeDetalhe?.ncm = objetoJsonRetorno['codigoNcm'] ?? '00000000';
                                            widget.nfeDetalhe?.unidadeComercial = objetoJsonRetorno["produtoUnidade"]["sigla"];
                                            widget.nfeDetalhe?.unidadeTributavel = objetoJsonRetorno["produtoUnidade"]["sigla"];
                                            widget.nfeDetalhe!.quantidadeComercial = 1;
                                            widget.nfeDetalhe!.quantidadeTributavel = 1;
                                            widget.nfeDetalhe!.valorUnitarioComercial = double.parse(objetoJsonRetorno['valorVenda'].toStringAsFixed(Constantes.decimaisValor));
                                            widget.nfeDetalhe!.valorUnitarioTributavel = widget.nfeDetalhe!.valorUnitarioComercial;
                                            widget.nfeDetalhe!.entraTotal = '1';
                                            widget.nfeDetalhe!.produto = Produto.fromJson(objetoJsonRetorno);

                                            final tributacao = await TributConfiguraOfGtService().consultarTributacao(widget.nfeDetalhe!.produto!.tributGrupoTributario!.id!, widget.nfeCabecalho!.tributOperacaoFiscal!.id!);
                                            if (tributacao != null) {
                                              for (var icms in tributacao.listaTributIcmsUf!) {
                                                if (icms.ufDestino == widget.nfeCabecalho!.nfeDestinatario!.uf) {
                                                  widget.nfeDetalhe!.cfop = icms.cfop;  
                                                  
                                                  // icms
                                                  widget.nfeDetalhe!.nfeDetalheImpostoIcms!.csosn = icms.csosn;
                                                  widget.nfeDetalhe!.nfeDetalheImpostoIcms!.cstIcms = icms.cst;
                                                  widget.nfeDetalhe!.nfeDetalheImpostoIcms!.origemMercadoria = tributacao.tributGrupoTributario!.origemMercadoria!.substring(0, 1);
                                                  widget.nfeDetalhe!.nfeDetalheImpostoIcms!.modalidadeBcIcms = icms.modalidadeBc!.substring(0, 1);
                                                  widget.nfeDetalhe!.nfeDetalheImpostoIcms!.aliquotaIcms = icms.aliquota;

                                                  // pis
                                                  widget.nfeDetalhe!.nfeDetalheImpostoPis!.cstPis = tributacao.tributPis!.cstPis;
                                                  widget.nfeDetalhe!.nfeDetalheImpostoPis!.aliquotaPisPercentual = tributacao.tributPis!.aliquotaPorcento;

                                                  // cofins
                                                  widget.nfeDetalhe!.nfeDetalheImpostoCofins!.cstCofins = tributacao.tributCofins!.cstCofins;
                                                  widget.nfeDetalhe!.nfeDetalheImpostoCofins!.aliquotaCofinsPercentual = tributacao.tributCofins!.aliquotaPorcento;                
                                                }
                                              }
                                            } 

                                            _atualizarTotais(tributacao == null);
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
                              sizes: 'col-12 col-md-4',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.end,
                                  controller: quantidadeController,
                                  decoration: getInputDecoration(
                                    'Informe a Quantidade',
                                    'Quantidade',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.nfeDetalhe?.quantidadeComercial = quantidadeController.numberValue;
                                    widget.nfeDetalhe?.quantidadeTributavel = quantidadeController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
                                    _formFoiAlterado = true;
                                    _atualizarTotais(false);
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
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  controller: valorUnitarioController,
                                  decoration: getInputDecoration(
                                    'Informe o Valor Unitário',
                                    'Valor Unitário',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.nfeDetalhe?.valorUnitarioComercial = valorUnitarioController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
                                    _formFoiAlterado = true;
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
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  controller: valorSubtotalController,
                                  decoration: getInputDecoration(
                                    'Informe o Valor Subtotal',
                                    'Valor Subtotal',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.nfeDetalhe?.valorSubtotal = valorSubtotalController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
                                    _formFoiAlterado = true;
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
                                  readOnly: false,
                                  textAlign: TextAlign.end,
                                  controller: valorDescontoController,
                                  decoration: getInputDecoration(
                                    'Informe o Valor do Desconto',
                                    'Valor Desconto',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.nfeDetalhe?.valorDesconto = valorDescontoController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
                                    _formFoiAlterado = true;
                                    _atualizarTotais(false);
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
                                  readOnly: true,
                                  textAlign: TextAlign.end,
                                  controller: valorTotalController,
                                  decoration: getInputDecoration(
                                    'Informe o Valor Total',
                                    'Valor Total',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.nfeDetalhe?.valorTotal = valorTotalController.numberValue;
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

  _atualizarTotais(bool problemasNaTributacao) {
    if (problemasNaTributacao) {
      showInSnackBar('ATENÇÃO - A tributação para este item não está configurada!', context);
    }
    setState(() {
      double subTotal = Biblioteca.multiplicarMonetario(widget.nfeDetalhe!.quantidadeComercial, widget.nfeDetalhe!.valorUnitarioComercial);
      double desconto = Biblioteca.multiplicarMonetario(widget.nfeDetalhe!.quantidadeComercial, widget.nfeDetalhe!.valorDesconto);
      widget.nfeDetalhe!.valorSubtotal = subTotal;
      widget.nfeDetalhe!.valorDesconto = desconto;
      widget.nfeDetalhe!.valorTotal = subTotal - desconto;
    });
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
      widget.nfeCabecalho!.listaNfeDetalhe!.remove(widget.nfeDetalhe);
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