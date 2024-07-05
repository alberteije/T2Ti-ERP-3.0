/*
Title: T2Ti ERP 3.0                                                                
Description: PersistePage relacionada à tabela [PRODUTO_SUBGRUPO] 
                                                                                
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
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:pegasus_pdv/src/database/database_classes.dart';
import 'package:pegasus_pdv/src/database/database.dart';

import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:pegasus_pdv/src/infra/atalhos_desktop_web.dart';
import 'package:pegasus_pdv/src/view/shared/page/lookup_local_page.dart';

import 'package:pegasus_pdv/src/view/shared/view_util_lib.dart';
import 'package:pegasus_pdv/src/view/shared/caixas_de_dialogo.dart';
import 'package:pegasus_pdv/src/view/shared/botoes.dart';
import 'package:pegasus_pdv/src/view/shared/widgets_input.dart';

class ProdutoSubgrupoPersistePage extends StatefulWidget {
  final ProdutoSubgrupoMontado? produtoSubgrupoMontado;
  final String? title;
  final String? operacao;

  const ProdutoSubgrupoPersistePage({Key? key, this.produtoSubgrupoMontado, this.title, this.operacao}) : super(key: key);

  @override
  ProdutoSubgrupoPersistePageState createState() => ProdutoSubgrupoPersistePageState();
}

class ProdutoSubgrupoPersistePageState extends State<ProdutoSubgrupoPersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;

  Map<LogicalKeySet, Intent>? _shortcutMap;
  Map<Type, Action<Intent>>? _actionMap;
  final _foco = FocusNode();
  final ScrollController controllerScroll = ScrollController();

  ProdutoSubgrupo? produtoSubgrupo;

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
    produtoSubgrupo = widget.produtoSubgrupoMontado!.produtoSubgrupo;
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
    final importaProdutoGrupoController = TextEditingController();
    importaProdutoGrupoController.text = widget.produtoSubgrupoMontado?.produtoGrupo?.nome ?? '';

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
                    padding: Biblioteca.isTelaPequena(context) == true ? ViewUtilLib.paddingBootstrapContainerTelaPequena : ViewUtilLib.paddingBootstrapContainerTelaGrande,
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
                                    controller: importaProdutoGrupoController,
                                    readOnly: true,
                                    decoration: getInputDecoration('Conteúdo para o campo Grupo', 'Grupo *', false),
                                    onSaved: (String? value) {},
                                    onChanged: (text) {},
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Grupo',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) => LookupLocalPage(
                                              title: 'Importar Grupo',
                                              colunas: ProdutoGrupoDao.colunas,
                                              campos: ProdutoGrupoDao.campos,
                                              campoPesquisaPadrao: 'nome',
                                              valorPesquisaPadrao: '%',
                                              metodoConsultaCallBack: _filtrarGrupoLookup,
                                              permiteCadastro: true,
                                              metodoCadastroCallBack: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  '/produtoGrupoLista',
                                                );
                                              },
                                            ),
                                            fullscreenDialog: true,
                                          ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['nome'] != null) {
                                          importaProdutoGrupoController.text = objetoJsonRetorno['nome'];
                                          widget.produtoSubgrupoMontado!.produtoGrupo = widget.produtoSubgrupoMontado!.produtoGrupo!.copyWith(
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
                      const Divider(
                        color: Colors.white,
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12',
                            child: TextFormField(
                              maxLength: 100,
                              maxLines: 1,
                              initialValue: produtoSubgrupo?.nome ?? '',
                              decoration: getInputDecoration('Informe o Nome', 'Nome', false),
                              onSaved: (String? value) {},
                              validator: ValidaCampoFormulario.validarAlfanumerico,
                              onChanged: (text) {
                                produtoSubgrupo = produtoSubgrupo!.copyWith(nome: Value(text));
                                _formFoiAlterado = true;
                              },
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12',
                            child: TextFormField(
                              maxLength: 250,
                              maxLines: 3,
                              initialValue: produtoSubgrupo?.descricao ?? '',
                              decoration: getInputDecoration('Informe a Descrição', 'Descrição', false),
                              onSaved: (String? value) {},
                              onChanged: (text) {
                                produtoSubgrupo = produtoSubgrupo!.copyWith(descricao: Value(text));
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

  void _filtrarGrupoLookup(String campo, String valor) async {
    final listaFiltrada = await Sessao.db.produtoGrupoDao.consultarListaFiltro(campo, valor);
    Sessao.retornoJsonLookup = jsonEncode(listaFiltrada);
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
          await Sessao.db.produtoSubgrupoDao.alterar(produtoSubgrupo!);
        } else {
          await Sessao.db.produtoSubgrupoDao.inserir(produtoSubgrupo!);
        }
        if (!mounted) return;
        Navigator.of(context).pop();
        showInSnackBar("Registro salvo com sucesso!", context, corFundo: Colors.green);
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
      await Sessao.db.produtoSubgrupoDao.excluir(produtoSubgrupo!);
      if (!mounted) return;
      Navigator.of(context).pop();
      showInSnackBar("Registro excluído com sucesso!", context, corFundo: Colors.green);
    });
  }
}
