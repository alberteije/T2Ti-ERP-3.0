/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage OneToOne relacionada à tabela [PESSOA_JURIDICA] 
                                                                                
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
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

import 'package:extended_masked_text/extended_masked_text.dart';

class PessoaJuridicaPersistePage extends StatefulWidget {
  final Pessoa? pessoa;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarPessoaCallBack;

  const PessoaJuridicaPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.pessoa, this.foco, this.salvarPessoaCallBack})
      : super(key: key);

  @override
  PessoaJuridicaPersistePageState createState() => PessoaJuridicaPersistePageState();
}

class PessoaJuridicaPersistePageState extends State<PessoaJuridicaPersistePage> {
  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;
  final _foco = FocusNode();

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
  }

  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      case AtalhoTelaType.salvar:
        widget.salvarPessoaCallBack!();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    var _cnpjController = MaskedTextController(
      mask: Constantes.mascaraCNPJ,
      text: widget.pessoa?.pessoaJuridica?.cnpj ?? '',
    );
	
    if (widget.pessoa!.pessoaJuridica == null) {
      widget.pessoa!.pessoaJuridica = PessoaJuridica();
    }

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
              controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  dragStartBehavior: DragStartBehavior.down,
                  padding: ViewUtilLib.paddingAbaPersistePage,
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
					        sizes: 'col-12 col-md-4',
					        child: Padding(
					          padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
					          child: TextFormField(
					            keyboardType: TextInputType.number,
					            focusNode: widget.foco,
					            autofocus: true,
					            controller: _cnpjController,
					            decoration: getInputDecoration(
					              '',
					              'CNPJ *',
					              false),
					            onSaved: (String? value) {
					            },
					            validator: ValidaCampoFormulario.validarObrigatorio,
					            onChanged: (text) {
					              widget.pessoa!.pessoaJuridica?.cnpj = text;
					              paginaMestreDetalheFoiAlterada = true;
					            },
					          ),
					        ),
					      ),
					      BootstrapCol(
					        sizes: 'col-12 col-md-8',
					        child: Padding(
					          padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
					          child: TextFormField(
					            maxLength: 100,
					            maxLines: 1,
					            initialValue: widget.pessoa?.pessoaJuridica?.nomeFantasia ?? '',
					            decoration: getInputDecoration(
					              '',
					              'Nome de Fantasia',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.pessoa!.pessoaJuridica?.nomeFantasia = text;
					              paginaMestreDetalheFoiAlterada = true;
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
					        sizes: 'col-12 col-md-6',
					        child: Padding(
					          padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
					          child: TextFormField(
					            maxLength: 45,
					            maxLines: 1,
					            initialValue: widget.pessoa?.pessoaJuridica?.inscricaoEstadual ?? '',
					            decoration: getInputDecoration(
					              '',
					              'Inscrição Estadual',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.pessoa!.pessoaJuridica?.inscricaoEstadual = text;
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
					            maxLength: 45,
					            maxLines: 1,
					            initialValue: widget.pessoa?.pessoaJuridica?.inscricaoMunicipal ?? '',
					            decoration: getInputDecoration(
					              '',
					              'Inscrição Municipal',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.pessoa!.pessoaJuridica?.inscricaoMunicipal = text;
					              paginaMestreDetalheFoiAlterada = true;
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
					              '',
					              'Data Constituição',
					              true),
					            isEmpty: widget.pessoa!.pessoaJuridica?.dataConstituicao == null,
					            child: DatePickerItem(
					              dateTime: widget.pessoa!.pessoaJuridica?.dataConstituicao,
					              firstDate: DateTime.parse('1900-01-01'),
					              lastDate: DateTime.now(),
					              onChanged: (DateTime? value) {
					                paginaMestreDetalheFoiAlterada = true;
					                setState(() {
					                  widget.pessoa!.pessoaJuridica?.dataConstituicao = value;
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
					              '',
					              'Tipo Regime',
					              true),
					            isEmpty: widget.pessoa?.pessoaJuridica?.tipoRegime == null || widget.pessoa?.pessoaJuridica == null,
					            child: getDropDownButton(widget.pessoa!.pessoaJuridica?.tipoRegime, (String? newValue) {
					              paginaMestreDetalheFoiAlterada = true;
					              setState(() {
					                widget.pessoa!.pessoaJuridica?.tipoRegime = newValue;
					                });
					            }, <String>[
					              '1-Lucro REAL',
					              '2-Lucro presumido',
					              '3-Simples nacional',
					          ])),
					        ),
					      ),
					      BootstrapCol(
					        sizes: 'col-12 col-md-4',
					        child: Padding(
					          padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
					          child: InputDecorator(
					            decoration: getInputDecoration(
					              '',
					              'CRT',
					              true),
					            isEmpty: widget.pessoa?.pessoaJuridica?.crt == null || widget.pessoa?.pessoaJuridica == null,
					            child: getDropDownButton(widget.pessoa!.pessoaJuridica?.crt, (String? newValue) {
					              paginaMestreDetalheFoiAlterada = true;
					              setState(() {
					                widget.pessoa!.pessoaJuridica?.crt = newValue;
					                });
					            }, <String>[
					              '1-Simples Nacional',
					              '2-Simples Nacional - excesso de sublimite da receita bruta',
					              '3-Regime Normal',
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
}