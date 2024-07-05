/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage OneToOne relacionada à tabela [CTE_REMETENTE] 
                                                                                
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

import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/view/shared/dropdown_lista.dart';

class CteRemetentePersistePage extends StatefulWidget {
  final CteCabecalho? cteCabecalho;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarCteCabecalhoCallBack;

  const CteRemetentePersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.cteCabecalho, this.foco, this.salvarCteCabecalhoCallBack})
      : super(key: key);

  @override
  CteRemetentePersistePageState createState() => CteRemetentePersistePageState();
}

class CteRemetentePersistePageState extends State<CteRemetentePersistePage> {
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
        widget.salvarCteCabecalhoCallBack!();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var cnpjController = MaskedTextController(
      mask: Constantes.mascaraCNPJ,
      text: widget.cteCabecalho?.cteRemetente?.cnpj ?? '',
    );
    var cpfController = MaskedTextController(
      mask: Constantes.mascaraCPF,
      text: widget.cteCabecalho?.cteRemetente?.cpf ?? '',
    );
    var importaCepController = TextEditingController();
    importaCepController.text = widget.cteCabecalho?.cteRemetente?.cep ?? '';
    var telefoneController = MaskedTextController(
      mask: Constantes.mascaraTELEFONE,
      text: widget.cteCabecalho?.cteRemetente?.telefone ?? '',
    );
	
    if (widget.cteCabecalho!.cteRemetente == null) {
      widget.cteCabecalho!.cteRemetente = CteRemetente();
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
					            controller: cnpjController,
					            decoration: getInputDecoration(
					              'Informe o CNPJ',
					              'CNPJ',
					              false),
					            onSaved: (String? value) {
					            },
					            validator: ValidaCampoFormulario.validarCNPJ,
					            onChanged: (text) {
					              widget.cteCabecalho!.cteRemetente?.cnpj = text;
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
					            keyboardType: TextInputType.number,
					            controller: cpfController,
					            decoration: getInputDecoration(
					              'Informe o CPF',
					              'CPF',
					              false),
					            onSaved: (String? value) {
					            },
					            validator: ValidaCampoFormulario.validarCPF,
					            onChanged: (text) {
					              widget.cteCabecalho!.cteRemetente?.cpf = text;
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
					            maxLength: 20,
					            maxLines: 1,
					            initialValue: widget.cteCabecalho?.cteRemetente?.ie ?? '',
					            decoration: getInputDecoration(
					              'Informe a Inscrição Estadual',
					              'Inscrição Estadual',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.cteCabecalho!.cteRemetente?.ie = text;
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
					            maxLength: 60,
					            maxLines: 1,
					            initialValue: widget.cteCabecalho?.cteRemetente?.nome ?? '',
					            decoration: getInputDecoration(
					              'Informe o Nome/Razão Social',
					              'Nome/Razão Social',
					              false),
					            onSaved: (String? value) {
					            },
					            validator: ValidaCampoFormulario.validarAlfanumerico,
					            onChanged: (text) {
					              widget.cteCabecalho!.cteRemetente?.nome = text;
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
					            maxLength: 60,
					            maxLines: 1,
					            initialValue: widget.cteCabecalho?.cteRemetente?.fantasia ?? '',
					            decoration: getInputDecoration(
					              'Informe o Fantasia',
					              'Fantasia',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.cteCabecalho!.cteRemetente?.fantasia = text;
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
					        sizes: 'col-12 col-md-9',
					        child: Padding(
					          padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
					          child: TextFormField(
					            maxLength: 250,
					            maxLines: 1,
					            initialValue: widget.cteCabecalho?.cteRemetente?.logradouro ?? '',
					            decoration: getInputDecoration(
					              'Informe o Logradouro',
					              'Logradouro',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.cteCabecalho!.cteRemetente?.logradouro = text;
					              paginaMestreDetalheFoiAlterada = true;
					            },
					          ),
					        ),
					      ),
					      BootstrapCol(
					        sizes: 'col-12 col-md-3',
					        child: Padding(
					          padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
					          child: TextFormField(
					            maxLength: 60,
					            maxLines: 1,
					            initialValue: widget.cteCabecalho?.cteRemetente?.numero ?? '',
					            decoration: getInputDecoration(
					              'Informe o Número',
					              'Número',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.cteCabecalho!.cteRemetente?.numero = text;
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
					            maxLength: 60,
					            maxLines: 1,
					            initialValue: widget.cteCabecalho?.cteRemetente?.complemento ?? '',
					            decoration: getInputDecoration(
					              'Informe o Complemento',
					              'Complemento',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.cteCabecalho!.cteRemetente?.complemento = text;
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
					            maxLength: 60,
					            maxLines: 1,
					            initialValue: widget.cteCabecalho?.cteRemetente?.bairro ?? '',
					            decoration: getInputDecoration(
					              'Informe o Bairro',
					              'Bairro',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.cteCabecalho!.cteRemetente?.bairro = text;
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
					            maxLength: 60,
					            maxLines: 1,
					            initialValue: widget.cteCabecalho?.cteRemetente?.nomeMunicipio ?? '',
					            decoration: getInputDecoration(
					              'Informe o Município',
					              'Município',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.cteCabecalho!.cteRemetente?.nomeMunicipio = text;
					              paginaMestreDetalheFoiAlterada = true;
					            },
					          ),
					        ),
					      ),
					      BootstrapCol(
					        sizes: 'col-12 col-md-3',
					        child: Padding(
					          padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
					          child: InputDecorator(
					            decoration: getInputDecoration(
					              'Informe a UF',
					              'UF',
					              true),
					            isEmpty: widget.cteCabecalho?.cteRemetente?.uf == null || widget.cteCabecalho?.cteRemetente == null,
					            child: getDropDownButton(widget.cteCabecalho!.cteRemetente?.uf, (String? newValue) {
					              paginaMestreDetalheFoiAlterada = true;
					              setState(() {
					                widget.cteCabecalho!.cteRemetente?.uf = newValue;
					                });
					            }, DropdownLista.listaUF)),
					        ),
					      ),
					      BootstrapCol(
					        sizes: 'col-12 col-md-3',
					        child: Padding(
					          padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
					        child: Row(
					          children: <Widget>[
					            Expanded(
					              flex: 1,
					              child: SizedBox(
					                child: TextFormField(
					                  controller: importaCepController,
					                  readOnly: true,
					                  decoration: getInputDecoration(
					                    'Informe o CEP',
					                    'CEP *',
					                    false),
					                  onSaved: (String? value) {
					                  },
					                  //validator: ValidaCampoFormulario.validarObrigatorio,
					                  onChanged: (text) {
					                    widget.cteCabecalho?.cteRemetente?.cep = text;
					                    paginaMestreDetalheFoiAlterada = true;
					                  },
					                ),
					              ),
					            ),
					            Expanded(
					              flex: 0,
					              child: IconButton(
					                tooltip: 'Importar CEP',
					                icon: ViewUtilLib.getIconBotaoLookup(),
					                onPressed: () async {
					                  ///chamando o lookup
					                  Map<String, dynamic>? objetoJsonRetorno =
					                    await Navigator.push(
					                      context,
					                      MaterialPageRoute(
					                        builder: (BuildContext context) =>
					                          LookupPage(
					                            title: 'Importar CEP',
					                            colunas: Cep.colunas,
					                            campos: Cep.campos,
					                            rota: '/cep/',
					                            campoPesquisaPadrao: 'numero',
					                            valorPesquisaPadrao: '',
					                          ),
					                          fullscreenDialog: true,
					                        ));
					                  if (objetoJsonRetorno != null) {
					                    if (objetoJsonRetorno['numero'] != null) {
					                      importaCepController.text = objetoJsonRetorno['numero'];
					                      widget.cteCabecalho!.cteRemetente?.cep = objetoJsonRetorno['numero'];
					                    }
					                  }
					                },
					              ),
					            ),
					          ],
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
					            maxLength: 60,
					            maxLines: 1,
					            initialValue: widget.cteCabecalho?.cteRemetente?.email ?? '',
					            decoration: getInputDecoration(
					              'Informe o EMail',
					              'EMail',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.cteCabecalho!.cteRemetente?.email = text;
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
					            keyboardType: TextInputType.number,
					            controller: telefoneController,
					            decoration: getInputDecoration(
					              'Informe o Telefone',
					              'Telefone',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.cteCabecalho!.cteRemetente?.telefone = text;
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