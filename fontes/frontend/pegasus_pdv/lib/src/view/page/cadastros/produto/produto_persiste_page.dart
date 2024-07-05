/*
Title: T2Ti ERP 3.0                                                                
Description: PersistePage relacionada à tabela [PRODUTO] 
                                                                                
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
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:pegasus_pdv/src/controller/controller.dart';

import 'package:pegasus_pdv/src/database/database_classes.dart';
import 'package:pegasus_pdv/src/database/database.dart';

import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:pegasus_pdv/src/infra/atalhos_desktop_web.dart';

import 'package:pegasus_pdv/src/view/shared/view_util_lib.dart';
import 'package:pegasus_pdv/src/view/shared/widgets_abas.dart';
import 'package:pegasus_pdv/src/view/shared/widgets_input.dart';

import 'package:pegasus_pdv/src/view/shared/page/lookup_local_page.dart';
import 'package:pegasus_pdv/src/view/shared/caixas_de_dialogo.dart';

class ProdutoPersistePage extends StatefulWidget {
  final ProdutoMontado? produtoMontado;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarProdutoCallBack;
  final Function? atualizarProdutoCallBack;

  const ProdutoPersistePage({Key? key, this.formKey, this.scaffoldKey, this.produtoMontado, this.foco, this.salvarProdutoCallBack, this.atualizarProdutoCallBack}) : super(key: key);

  @override
  ProdutoPersistePageState createState() => ProdutoPersistePageState();
}

class ProdutoPersistePageState extends State<ProdutoPersistePage> {
  Map<LogicalKeySet, Intent>? _shortcutMap;
  Map<Type, Action<Intent>>? _actionMap;
  final _foco = FocusNode();
  final ScrollController controllerScroll = ScrollController();

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

    WidgetsBinding.instance.addPostFrameCallback((_) => _carregarImagens());
  }

  Future _carregarImagens() async {
    ProdutoController.listaProdutoImagem = await Sessao.db.produtoImagemDao.consultarListaFiltro('ID_PRODUTO', widget.produtoMontado!.produto!.id.toString());
    setState(() {});
  }

  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      // case AtalhoTelaType.excluir:
      //   _excluir();
      //   break;
      case AtalhoTelaType.salvar:
        widget.salvarProdutoCallBack!();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final importaProdutoUnidadeController = TextEditingController();
    importaProdutoUnidadeController.text = widget.produtoMontado?.produtoUnidade?.sigla ?? '';
    final importaTributGrupoTributarioController = TextEditingController();
    importaTributGrupoTributarioController.text = widget.produtoMontado?.tributGrupoTributario?.descricao ?? '';
    final importaProdutoTipoController = TextEditingController();
    importaProdutoTipoController.text = widget.produtoMontado?.produtoTipo?.descricao ?? '';
    final importaProdutoSubgrupoController = TextEditingController();
    importaProdutoSubgrupoController.text = widget.produtoMontado?.produtoSubgrupo?.nome ?? '';

    final valorCompraController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.produtoMontado!.produto?.valorCompra ?? 0);
    final valorVendaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.produtoMontado!.produto?.valorVenda ?? 0);
    final valorCustoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.produtoMontado!.produto?.valorCusto ?? 0);
    final quantidadeEstoqueController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.produtoMontado!.produto?.quantidadeEstoque ?? 0);
    final estoqueMinimoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.produtoMontado!.produto?.estoqueMinimo ?? 0);
    final estoqueMaximoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.produtoMontado!.produto?.estoqueMaximo ?? 0);

    final ncmController = MaskedTextController(
      mask: '0000.00.00',
      text: widget.produtoMontado!.produto!.codigoNcm ?? '',
    );
    final cestController = MaskedTextController(
      mask: '00.000.00',
      text: widget.produtoMontado!.produto!.codigoCest ?? '',
    );

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
                            sizes: 'col-12',
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    focusNode: _foco,
                                    validator: ValidaCampoFormulario.validarObrigatorio,
                                    controller: importaProdutoUnidadeController,
                                    readOnly: true,
                                    decoration: getInputDecoration('Conteúdo para o campo Unidade', 'Unidade *', false),
                                    onSaved: (String? value) {},
                                    onChanged: (text) {
                                      paginaMestreDetalheFoiAlterada = true;
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Unidade',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) => LookupLocalPage(
                                              title: 'Importar Unidade',
                                              colunas: ProdutoUnidadeDao.colunas,
                                              campos: ProdutoUnidadeDao.campos,
                                              campoPesquisaPadrao: 'sigla',
                                              valorPesquisaPadrao: '%',
                                              metodoConsultaCallBack: _filtrarUnidadeLookup,
                                              permiteCadastro: true,
                                              metodoCadastroCallBack: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  '/produtoUnidadeLista',
                                                );
                                              },
                                            ),
                                            fullscreenDialog: true,
                                          ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['sigla'] != null) {
                                          importaProdutoUnidadeController.text = objetoJsonRetorno['sigla'];
                                          widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(idProdutoUnidade: Value(objetoJsonRetorno['id']));
                                          widget.produtoMontado!.produtoUnidade = widget.produtoMontado!.produtoUnidade!.copyWith(
                                            sigla: Value(objetoJsonRetorno['sigla']),
                                          );
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
                      const Divider(
                        color: Colors.white,
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12',
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    focusNode: _foco,
                                    validator: ValidaCampoFormulario.validarObrigatorio,
                                    controller: importaProdutoTipoController,
                                    readOnly: true,
                                    decoration: getInputDecoration('Conteúdo para o campo Tipo', 'Tipo *', false),
                                    onSaved: (String? value) {},
                                    onChanged: (text) {
                                      paginaMestreDetalheFoiAlterada = true;
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Tipo',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) => LookupLocalPage(
                                              title: 'Importar Tipo',
                                              colunas: ProdutoTipoDao.colunas,
                                              campos: ProdutoTipoDao.campos,
                                              campoPesquisaPadrao: 'descricao',
                                              valorPesquisaPadrao: '%',
                                              metodoConsultaCallBack: _filtrarTipoLookup,
                                              permiteCadastro: true,
                                              metodoCadastroCallBack: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  '/produtoTipoLista',
                                                );
                                              },
                                            ),
                                            fullscreenDialog: true,
                                          ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['descricao'] != null) {
                                          importaProdutoTipoController.text = objetoJsonRetorno['descricao'];
                                          widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(idProdutoTipo: Value(objetoJsonRetorno['id']));
                                          widget.produtoMontado!.produtoTipo = widget.produtoMontado!.produtoTipo!.copyWith(
                                            descricao: Value(objetoJsonRetorno['descricao']),
                                          );
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
                      const Divider(
                        color: Colors.white,
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12',
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    focusNode: _foco,
                                    validator: ValidaCampoFormulario.validarObrigatorio,
                                    controller: importaProdutoSubgrupoController,
                                    readOnly: true,
                                    decoration: getInputDecoration('Conteúdo para o campo Subgrupo', 'Subgrupo *', false),
                                    onSaved: (String? value) {},
                                    onChanged: (text) {
                                      paginaMestreDetalheFoiAlterada = true;
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Subgrupo',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) => LookupLocalPage(
                                              title: 'Importar Subgrupo',
                                              colunas: ProdutoSubgrupoDao.colunas,
                                              campos: ProdutoSubgrupoDao.campos,
                                              campoPesquisaPadrao: 'nome',
                                              valorPesquisaPadrao: '%',
                                              metodoConsultaCallBack: _filtrarSubgrupoLookup,
                                              permiteCadastro: true,
                                              metodoCadastroCallBack: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  '/produtoSubgrupoLista',
                                                );
                                              },
                                            ),
                                            fullscreenDialog: true,
                                          ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['nome'] != null) {
                                          importaProdutoSubgrupoController.text = objetoJsonRetorno['nome'];
                                          widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(idProdutoSubgrupo: Value(objetoJsonRetorno['id']));
                                          widget.produtoMontado!.produtoSubgrupo = widget.produtoMontado!.produtoSubgrupo!.copyWith(
                                            nome: Value(objetoJsonRetorno['nome']),
                                          );
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
                      Visibility(
                        visible: Sessao.configuracaoPdv!.modulo != 'G',
                        child: const Divider(
                          color: Colors.white,
                        ),
                      ),
                      Visibility(
                        visible: Sessao.configuracaoPdv!.modulo != 'G',
                        child: BootstrapRow(
                          height: 60,
                          children: <BootstrapCol>[
                            BootstrapCol(
                              sizes: 'col-12',
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      focusNode: _foco,
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      controller: importaTributGrupoTributarioController,
                                      readOnly: true,
                                      decoration: getInputDecoration('Conteúdo para o campo Grupo Tributário', 'Grupo Tributário *', false),
                                      onSaved: (String? value) {},
                                      onChanged: (text) {
                                        paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child: IconButton(
                                      tooltip: 'Importar Grupo Tributário',
                                      icon: ViewUtilLib.getIconBotaoLookup(),
                                      onPressed: () async {
                                        ///chamando o lookup
                                        Map<String, dynamic>? objetoJsonRetorno = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) => LookupLocalPage(
                                                title: 'Importar Grupo Tributário',
                                                colunas: TributGrupoTributarioDao.colunas,
                                                campos: TributGrupoTributarioDao.campos,
                                                campoPesquisaPadrao: 'descricao',
                                                valorPesquisaPadrao: '%',
                                                metodoConsultaCallBack: _filtrarGrupoTributarioLookup,
                                                // permiteCadastro: true,
                                                // metodoCadastroCallBack: () { Navigator.pushNamed(context, '/produtoUnidadeLista',); },
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                        if (objetoJsonRetorno != null) {
                                          if (objetoJsonRetorno['descricao'] != null) {
                                            importaTributGrupoTributarioController.text = objetoJsonRetorno['descricao'];
                                            widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(idTributGrupoTributario: Value(objetoJsonRetorno['id']));
                                            widget.produtoMontado!.tributGrupoTributario = widget.produtoMontado!.tributGrupoTributario!.copyWith(
                                              descricao: Value(objetoJsonRetorno['descricao']),
                                            );
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
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                maxLength: 14,
                                maxLines: 1,
                                initialValue: widget.produtoMontado!.produto?.gtin ?? '',
                                decoration: getInputDecoration('Conteúdo para o campo Gtin', 'Gtin', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(gtin: Value(text));
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
                                maxLength: 50,
                                maxLines: 1,
                                initialValue: widget.produtoMontado!.produto?.codigoInterno ?? '',
                                decoration: getInputDecoration('Conteúdo para o campo Codigo Interno', 'Codigo Interno', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(codigoInterno: Value(text));
                                  paginaMestreDetalheFoiAlterada = true;
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
                              validator: ValidaCampoFormulario.validarObrigatorio,
                              maxLength: 100,
                              maxLines: 1,
                              initialValue: widget.produtoMontado!.produto?.nome ?? '',
                              decoration: getInputDecoration('Conteúdo para o campo Nome', 'Nome', false),
                              onSaved: (String? value) {},
                              onChanged: (text) {
                                widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(nome: Value(text));
                                paginaMestreDetalheFoiAlterada = true;
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
                            sizes: 'col-12',
                            child: TextFormField(
                              maxLength: 250,
                              maxLines: 3,
                              initialValue: widget.produtoMontado!.produto?.descricao ?? '',
                              decoration: getInputDecoration('Conteúdo para o campo Descricao', 'Descricao', false),
                              onSaved: (String? value) {},
                              onChanged: (text) {
                                widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(descricao: Value(text));
                                paginaMestreDetalheFoiAlterada = true;
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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                controller: ncmController,
                                decoration: getInputDecoration('Conteúdo para o campo NCM', 'Código NCM', true, paddingVertical: 18),
                                onSaved: (String? value) {
                                  if (value!.isNotEmpty) {
                                    bool achou = false;
                                    for (var i = 0; i < Sessao.tabelaNcm.length; i++) {
                                      if (Sessao.tabelaNcm[i][0] == value) {
                                        achou = true;
                                      }
                                    }
                                    if (!achou) {
                                      showInSnackBar('Código NCM parece inválido.', context, corFundo: Colors.red);
                                    }
                                  }
                                },
                                onChanged: (text) {
                                  widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(codigoNcm: Value(text));
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                // validator: ValidaCampoFormulario.validarObrigatorio,
                                controller: cestController,
                                decoration: getInputDecoration('Conteúdo para o campo CEST', 'Código CEST', true, paddingVertical: 18),
                                onSaved: (String? value) {
                                  if (value!.isNotEmpty) {
                                    bool achou = false;
                                    for (var i = 0; i < Sessao.tabelaCest.length; i++) {
                                      if (Sessao.tabelaCest[i][0] == value) {
                                        achou = true;
                                      }
                                    }
                                    if (!achou) {
                                      showInSnackBar('Código CEST parece inválido.', context, corFundo: Colors.red);
                                    }
                                  }
                                },
                                onChanged: (text) {
                                  widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(codigoCest: Value(text));
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
                                decoration: getInputDecoration('Indicador de Produção Própria ou de Terceiros', 'Produção [P]rópria ou [T]erceiros', true),
                                isEmpty: widget.produtoMontado!.produto!.ippt == null,
                                child: getDropDownButton(
                                  widget.produtoMontado!.produto!.ippt,
                                  (String? newValue) {
                                    setState(() {
                                      widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(ippt: Value(newValue));
                                      widget.atualizarProdutoCallBack!();
                                    });
                                  },
                                  <String>[
                                    'P',
                                    'T',
                                  ],
                                  validator: ValidaCampoFormulario.validarObrigatorio,
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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                enableInteractiveSelection: !Biblioteca.isDesktop(),
                                textAlign: TextAlign.end,
                                controller: valorCompraController,
                                decoration: getInputDecoration('Conteúdo para o campo Valor Compra', 'Valor Compra', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(valorCompra: Value(valorCompraController.numberValue));
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                enableInteractiveSelection: !Biblioteca.isDesktop(),
                                validator: ValidaCampoFormulario.validarObrigatorioDouble,
                                textAlign: TextAlign.end,
                                controller: valorVendaController,
                                decoration: getInputDecoration('Conteúdo para o campo Valor Venda', 'Valor Venda', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(valorVenda: Value(valorVendaController.numberValue));
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                enableInteractiveSelection: !Biblioteca.isDesktop(),
                                // validator: ValidaCampoFormulario.validarObrigatorioDouble,
                                textAlign: TextAlign.end,
                                controller: valorCustoController,
                                decoration: getInputDecoration('Conteúdo para o campo Valor Custo', 'Valor Custo', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(valorCusto: Value(valorCustoController.numberValue));
                                  paginaMestreDetalheFoiAlterada = true;
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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                enableInteractiveSelection: !Biblioteca.isDesktop(),
                                textAlign: TextAlign.end,
                                controller: quantidadeEstoqueController,
                                decoration: getInputDecoration('Conteúdo para o campo Quantidade Estoque', 'Quantidade Estoque', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(quantidadeEstoque: Value(quantidadeEstoqueController.numberValue));
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                enableInteractiveSelection: !Biblioteca.isDesktop(),
                                textAlign: TextAlign.end,
                                controller: estoqueMinimoController,
                                decoration: getInputDecoration('Conteúdo para o campo Estoque Minimo', 'Estoque Minimo', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(estoqueMinimo: Value(estoqueMinimoController.numberValue));
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                enableInteractiveSelection: !Biblioteca.isDesktop(),
                                textAlign: TextAlign.end,
                                controller: estoqueMaximoController,
                                decoration: getInputDecoration('Conteúdo para o campo Estoque Maximo', 'Estoque Maximo', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.produtoMontado!.produto = widget.produtoMontado!.produto!.copyWith(estoqueMaximo: Value(estoqueMaximoController.numberValue));
                                  paginaMestreDetalheFoiAlterada = true;
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
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12',
                            child: const Padding(
                              padding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 0),
                              child: Text(
                                "Imagens selecionadas para o produto",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 2,
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12',
                            child: CarregaImagem(
                              widgetFilho: Card(
                                color: Colors.blueGrey[900],
                                margin: const EdgeInsets.all(16),
                                elevation: 4,
                                child: CustomScrollView(
                                  shrinkWrap: true,
                                  slivers: <Widget>[
                                    gridComImagens(),
                                  ],
                                ),
                              ),
                              exibirImagemCallBack: _exibirImagem,
                            ),
                          ),
                        ],
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12',
                            child: const Padding(
                              padding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                              child: Text(
                                "Pressione a caixa acima para importar as imagens",
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
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

  void _filtrarUnidadeLookup(String campo, String valor) async {
    final listaFiltrada = await Sessao.db.produtoUnidadeDao.consultarListaFiltro(campo, valor);
    Sessao.retornoJsonLookup = jsonEncode(listaFiltrada);
  }

  void _filtrarTipoLookup(String campo, String valor) async {
    final listaFiltrada = await Sessao.db.produtoTipoDao.consultarListaFiltro(campo, valor);
    Sessao.retornoJsonLookup = jsonEncode(listaFiltrada);
  }

  void _filtrarGrupoTributarioLookup(String campo, String valor) async {
    final listaFiltrada = await Sessao.db.tributGrupoTributarioDao.consultarListaFiltro(campo, valor);
    Sessao.retornoJsonLookup = jsonEncode(listaFiltrada);
  }

  void _filtrarSubgrupoLookup(String campo, String valor) async {
    final listaFiltrada = await Sessao.db.produtoSubgrupoDao.consultarListaFiltro(campo, valor);
    Sessao.retornoJsonLookup = jsonEncode(listaFiltrada);
  }

  Future _exibirImagem(Uint8List data) async {
    setState(() {
      ProdutoController.listaProdutoImagem.add(ProdutoImagem(id: null, imagem: data));
    });
    Navigator.of(context).pop();
  }

  /// ==================================================================================================================
  /// o código abaixo monta a grid com as imagens do produto
  /// ==================================================================================================================
  Widget gridComImagens() {
    return SliverPadding(
        padding: const EdgeInsets.all(5.0),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: definirQuantidadeDeCartoesPorLinha(context),
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            return imagemStack(index);
          }, childCount: ProdutoController.listaProdutoImagem.length),
        ));
  }

  int definirQuantidadeDeCartoesPorLinha(BuildContext context) {
    double larguraDaTela = MediaQuery.of(context).size.width;
    int larguraDoCartao = 150;
    int quantidadePorLinha = larguraDaTela ~/ larguraDoCartao;
    return quantidadePorLinha;
  }

  Widget imagemStack(int index) {
    return InkWell(
      canRequestFocus: false,
      hoverColor: Colors.grey,
      onTap: () {},
      splashColor: Colors.black,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            imagemImage(ProdutoController.listaProdutoImagem[index]),
            imagemColor(ProdutoController.listaProdutoImagem[index]),
          ],
        ),
      ),
    );
  }

  //stack 1/3 - primeira porção da pilha - a imagem - fica na parte de baixo do Stack
  Widget imagemImage(ProdutoImagem produtoImagem) {
    return Image.memory(produtoImagem.imagem!);
  }

  //stack 2/3 - segunda porção da pilha - a cor com a opacidade
  Widget imagemColor(ProdutoImagem produtoImagem) => Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.green.withOpacity(0.2),
            blurRadius: 50.0, // efeito de fumaça
          ),
        ]),
      );
}
