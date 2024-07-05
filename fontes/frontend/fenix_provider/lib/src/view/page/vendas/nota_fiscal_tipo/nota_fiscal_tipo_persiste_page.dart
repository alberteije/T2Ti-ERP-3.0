/*
Title: T2Ti ERP 3.0                                                                
Description: PersistePage relacionada à tabela [NOTA_FISCAL_TIPO] 
                                                                                
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
import 'package:provider/provider.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:fenix/src/infra/infra.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/view/shared/botoes.dart';

import 'package:fenix/src/view/shared/page/lookup_page.dart';

class NotaFiscalTipoPersistePage extends StatefulWidget {
  final NotaFiscalTipo? notaFiscalTipo;
  final String? title;
  final String? operacao;

  const NotaFiscalTipoPersistePage({Key? key, this.notaFiscalTipo, this.title, this.operacao})
      : super(key: key);

  @override
  NotaFiscalTipoPersistePageState createState() => NotaFiscalTipoPersistePageState();
}

class NotaFiscalTipoPersistePageState extends State<NotaFiscalTipoPersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;
  late NotaFiscalTipoViewModel _notaFiscalTipoProvider;
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
    _notaFiscalTipoProvider = Provider.of<NotaFiscalTipoViewModel>(context);
	
    final importaNotaFiscalModeloController = TextEditingController();
    importaNotaFiscalModeloController.text = widget.notaFiscalTipo?.notaFiscalModelo?.descricao ?? '';
	
    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        autofocus: true,
        child: Scaffold(drawerDragStartBehavior: DragStartBehavior.down,
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(widget.title!), 
            actions: widget.operacao == "I"
              ? getBotoesAppBarPersistePage(context: context, salvar: _salvar,)
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
                                      controller: importaNotaFiscalModeloController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe o Modelo da Nota Fiscal Vinculado',
                                        'Modelo NF *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.notaFiscalTipo?.notaFiscalModelo?.descricao = text;
                                        _formFoiAlterado = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Modelo NF',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Modelo NF',
                                                colunas: NotaFiscalModelo.colunas,
                                                campos: NotaFiscalModelo.campos,
                                                rota: '/nota-fiscal-modelo/',
                                                campoPesquisaPadrao: 'descricao',
                                                valorPesquisaPadrao: '',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['descricao'] != null) {
                                          importaNotaFiscalModeloController.text = objetoJsonRetorno['descricao'];
                                          widget.notaFiscalTipo?.idNotaFiscalModelo = objetoJsonRetorno['id'];
                                          widget.notaFiscalTipo?.notaFiscalModelo = NotaFiscalModelo.fromJson(objetoJsonRetorno);
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
                              child: TextFormField(
                                maxLength: 50,
                                maxLines: 1,
                                initialValue: widget.notaFiscalTipo?.nome ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Nome do Tipo NF',
                                  'Nome *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.notaFiscalTipo?.nome = text;
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
                                maxLength: 3,
                                maxLines: 1,
                                initialValue: widget.notaFiscalTipo?.serie ?? '',
                                decoration: getInputDecoration(
                                  'Informe a Série do Tipo da NF',
                                  'Série',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.notaFiscalTipo?.serie = text;
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
                                maxLength: 3,
                                maxLines: 1,
                                initialValue: widget.notaFiscalTipo?.serieScan ?? '',
                                decoration: getInputDecoration(
                                  'Informe a Série SCAN do Tipo da NF',
                                  'Série SCAN',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.notaFiscalTipo?.serieScan = text;
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
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: widget.notaFiscalTipo?.ultimoNumero?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Último Número',
                                  'Último Número',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.notaFiscalTipo?.ultimoNumero = int.tryParse(text);
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
                              initialValue: widget.notaFiscalTipo?.descricao ?? '',
                              decoration: getInputDecoration(
                                'Informe a Descrição do Tipo NF',
                                'Descrição',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.notaFiscalTipo?.descricao = text;
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
      gerarDialogBoxConfirmacao(context, Constantes.perguntaSalvarAlteracoes, () async {
        form.save();
        if (widget.operacao == 'A') {
          await _notaFiscalTipoProvider.alterar(widget.notaFiscalTipo!);
        } else {
          await _notaFiscalTipoProvider.inserir(widget.notaFiscalTipo!);
        }
        if (!mounted) return;
        Navigator.of(context).pop();
        showInSnackBar("Registro atualizado com sucesso!", context, corFundo: Colors.green);
      });
    }
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
  
  void _excluir() {
    gerarDialogBoxExclusao(context, () async {
      await _notaFiscalTipoProvider.excluir(widget.notaFiscalTipo!.id!);
  	  if (!mounted) return;
      Navigator.of(context).pop();
      showInSnackBar("Registro excluído com sucesso!", context, corFundo: Colors.green);
    });
  }  
}