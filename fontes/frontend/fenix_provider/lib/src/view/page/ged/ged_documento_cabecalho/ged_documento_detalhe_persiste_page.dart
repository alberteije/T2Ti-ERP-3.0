/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe PersistePage relacionada à tabela [GED_DOCUMENTO_DETALHE] 
                                                                                
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

class GedDocumentoDetalhePersistePage extends StatefulWidget {
  final GedDocumentoCabecalho? gedDocumentoCabecalho;
  final GedDocumentoDetalhe? gedDocumentoDetalhe;
  final String title;
  final String operacao;

  const GedDocumentoDetalhePersistePage(
      {Key? key, this.gedDocumentoCabecalho, this.gedDocumentoDetalhe, required this.title, required this.operacao})
      : super(key: key);

  @override
  GedDocumentoDetalhePersistePageState createState() => GedDocumentoDetalhePersistePageState();
}

class GedDocumentoDetalhePersistePageState extends State<GedDocumentoDetalhePersistePage> {
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
	final importaGedTipoDocumentoController = TextEditingController();
	importaGedTipoDocumentoController.text = widget.gedDocumentoDetalhe?.gedTipoDocumento?.nome ?? '';

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
                              sizes: 'col-12 col-md-6',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      child: TextFormField(
                                        controller: importaGedTipoDocumentoController,
                                        readOnly: true,
                                        decoration: getInputDecoration(
                                          'Importe o Tipo de Documento Vinculado',
                                          'Tipo Documento *',
                                          false),
                                        onSaved: (String? value) {
                                        },
                                        validator: ValidaCampoFormulario.validarObrigatorio,
                                        onChanged: (text) {
                                          widget.gedDocumentoDetalhe?.gedTipoDocumento?.nome = text;
                                    paginaMestreDetalheFoiAlterada = true;
                                          _formFoiAlterado = true;
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child: IconButton(
                                      tooltip: 'Importar Tipo Documento',
                                      icon: ViewUtilLib.getIconBotaoLookup(),
                                      onPressed: () async {
                                        ///chamando o lookup
                                        Map<String, dynamic>? objetoJsonRetorno =
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                LookupPage(
                                                  title: 'Importar Tipo Documento',
                                                  colunas: GedTipoDocumento.colunas,
                                                  campos: GedTipoDocumento.campos,
                                                  rota: '/ged-tipo-documento/',
                                                  campoPesquisaPadrao: 'nome',
                                                  valorPesquisaPadrao: '%',
                                                ),
                                                fullscreenDialog: true,
                                              ));
                                        if (objetoJsonRetorno != null) {
                                          if (objetoJsonRetorno['nome'] != null) {
                                            importaGedTipoDocumentoController.text = objetoJsonRetorno['nome'];
                                            widget.gedDocumentoDetalhe!.idGedTipoDocumento = objetoJsonRetorno['id'];
                                            widget.gedDocumentoDetalhe!.gedTipoDocumento = GedTipoDocumento.fromJson(objetoJsonRetorno);
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
                                  maxLength: 100,
                                  maxLines: 1,
                                  initialValue: widget.gedDocumentoDetalhe?.nome ?? '',
                                  decoration: getInputDecoration(
                                    'Informe o Nome',
                                    'Nome',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  validator: ValidaCampoFormulario.validarAlfanumerico,
                                  onChanged: (text) {
                                    widget.gedDocumentoDetalhe!.nome = text;
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
                                child: InputDecorator(
                                  decoration: getInputDecoration(
                                    'Selecione a Opção Desejada',
                                    'Pode Excluir',
                                    true),
                                  isEmpty: widget.gedDocumentoDetalhe!.podeExcluir == null,
                                  child: getDropDownButton(widget.gedDocumentoDetalhe!.podeExcluir,
                                    (String? newValue) {
                                      paginaMestreDetalheFoiAlterada = true;
                                      setState(() {
                                        widget.gedDocumentoDetalhe!.podeExcluir = newValue;
                                      });
                                  }, <String>[
                                    'Sim',
                                    'Não',
                                ])),
                              ),
                            ),
                            BootstrapCol(
                              sizes: 'col-12 col-md-4',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                                child: InputDecorator(
                                  decoration: getInputDecoration(
                                    'Selecione a Opção Desejada',
                                    'Pode Alterar',
                                    true),
                                  isEmpty: widget.gedDocumentoDetalhe!.podeAlterar == null,
                                  child: getDropDownButton(widget.gedDocumentoDetalhe!.podeAlterar,
                                    (String? newValue) {
                                      paginaMestreDetalheFoiAlterada = true;
                                      setState(() {
                                        widget.gedDocumentoDetalhe!.podeAlterar = newValue;
                                      });
                                  }, <String>[
                                    'Sim',
                                    'Não',
                                ])),
                              ),
                            ),
                            BootstrapCol(
                              sizes: 'col-12 col-md-4',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                                child: InputDecorator(
                                  decoration: getInputDecoration(
                                    'Selecione a Opção Desejada',
                                    'Assinatura Digital',
                                    true),
                                  isEmpty: widget.gedDocumentoDetalhe!.assinado == null,
                                  child: getDropDownButton(widget.gedDocumentoDetalhe!.assinado,
                                    (String? newValue) {
                                      paginaMestreDetalheFoiAlterada = true;
                                      setState(() {
                                        widget.gedDocumentoDetalhe!.assinado = newValue;
                                      });
                                  }, <String>[
                                    'Sim',
                                    'Não',
                                ])),
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
                                child: InputDecorator(
                                  decoration: getInputDecoration(
                                    'Informe a Data Final da Vigência',
                                    'Data Fim Vigência',
                                    true),
                                  isEmpty: widget.gedDocumentoDetalhe!.dataFimVigencia == null,
                                  child: DatePickerItem(
                                    dateTime: widget.gedDocumentoDetalhe!.dataFimVigencia,
                                    firstDate: DateTime.parse('1900-01-01'),
                                    lastDate: DateTime.now(),
                                    onChanged: (DateTime? value) {
                                      paginaMestreDetalheFoiAlterada = true;
                                      setState(() {
                                        widget.gedDocumentoDetalhe!.dataFimVigencia = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            BootstrapCol(
                              sizes: 'col-12 col-md-4',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                                child: InputDecorator(
                                  decoration: getInputDecoration(
                                    'Informe a Data de Exclusão do Documento',
                                    'Data Exclusão',
                                    true),
                                  isEmpty: widget.gedDocumentoDetalhe!.dataExclusao == null,
                                  child: DatePickerItem(
                                    dateTime: widget.gedDocumentoDetalhe!.dataExclusao,
                                    firstDate: DateTime.parse('1900-01-01'),
                                    lastDate: DateTime.now(),
                                    onChanged: (DateTime? value) {
                                      paginaMestreDetalheFoiAlterada = true;
                                      setState(() {
                                        widget.gedDocumentoDetalhe!.dataExclusao = value;
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
                              sizes: 'col-12',
                              child: TextFormField(
                                maxLength: 250,
                                maxLines: 3,
                                initialValue: widget.gedDocumentoDetalhe?.palavrasChave ?? '',
                                decoration: getInputDecoration(
                                  'Informe as Palavras Chave do Documento',
                                  'Palavras Chave',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.gedDocumentoDetalhe!.palavrasChave = text;
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
                              child: TextFormField(
                                maxLength: 1000,
                                maxLines: 3,
                                initialValue: widget.gedDocumentoDetalhe?.descricao ?? '',
                                decoration: getInputDecoration(
                                  'Informe a Descrição do Documento',
                                  'Descrição',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.gedDocumentoDetalhe!.descricao = text;
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
      widget.gedDocumentoCabecalho!.listaGedDocumentoDetalhe!.remove(widget.gedDocumentoDetalhe);
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