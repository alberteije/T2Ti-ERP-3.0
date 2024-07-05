/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage OneToOne relacionada à tabela [NFE_EMITENTE] 
                                                                                
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

import 'package:fenix/src/infra/constantes.dart';
import 'package:fenix/src/infra/biblioteca.dart';

import 'package:fenix/src/model/model.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:fenix/src/view/shared/widgets_abas.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/view/shared/dropdown_lista.dart';

class EstoqueNfeEmitentePersistePage extends StatefulWidget {
  final NfeCabecalho? nfeCabecalho;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarNfeCabecalhoCallBack;

  const EstoqueNfeEmitentePersistePage(
      {Key? key,
      this.formKey,
      this.scaffoldKey,
      this.nfeCabecalho,
      this.foco,
      this.salvarNfeCabecalhoCallBack})
      : super(key: key);

  @override
  EstoqueNfeEmitentePersistePageState createState() => EstoqueNfeEmitentePersistePageState();
}

class EstoqueNfeEmitentePersistePageState extends State<EstoqueNfeEmitentePersistePage> {
  Map<LogicalKeySet, Intent>? _shortcutMap;
  Map<Type, Action<Intent>>? _actionMap;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
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
        widget.salvarNfeCabecalhoCallBack!();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var cpfController = MaskedTextController(
      mask: Constantes.mascaraCPF,
      text: widget.nfeCabecalho?.nfeEmitente?.cpf ?? '',
    );
    var cnpjController = MaskedTextController(
      mask: Constantes.mascaraCNPJ,
      text: widget.nfeCabecalho?.nfeEmitente?.cnpj ?? '',
    );
    var importaCepController = TextEditingController();
    importaCepController.text =
        widget.nfeCabecalho?.nfeEmitente?.cep ?? '';
    var telefoneController = MaskedTextController(
      mask: Constantes.mascaraTELEFONE,
      text: widget.nfeCabecalho?.nfeEmitente?.telefone ?? '',
    );

    if (widget.nfeCabecalho!.nfeEmitente == null) {
      widget.nfeCabecalho!.nfeEmitente = NfeEmitente();
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
                      const Divider(
                        color: Colors.white,
                      ),
                      BootstrapRow(height: 60, children: <BootstrapCol>[
                        BootstrapCol(
                          sizes: 'col-12 col-md-3',
                          child: Padding(
                            padding:
                                Biblioteca.distanciaEntreColunasQuebraLinha(
                                    context)!,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              focusNode: widget.foco,
                              autofocus: true,
                              controller: cpfController,
                              decoration: getInputDecoration(
                                  'Informe o CPF', 'CPF', false),
                              onSaved: (String? value) {},
                              // validator: ValidaCampoFormulario.validarCPF,
                              onChanged: (text) {
                                widget.nfeCabecalho!.nfeEmitente?.cpf = text;
                                paginaMestreDetalheFoiAlterada = true;
                              },
                            ),
                          ),
                        ),
                        BootstrapCol(
                          sizes: 'col-12 col-md-3',
                          child: Padding(
                            padding:
                                Biblioteca.distanciaEntreColunasQuebraLinha(
                                    context)!,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: cnpjController,
                              decoration: getInputDecoration(
                                  'Informe o CNPJ', 'CNPJ', false),
                              onSaved: (String? value) {},
                              // validator: ValidaCampoFormulario.validarCNPJ,
                              onChanged: (text) {
                                widget.nfeCabecalho!.nfeEmitente?.cnpj =
                                    text;
                                paginaMestreDetalheFoiAlterada = true;
                              },
                            ),
                          ),
                        ),
                        BootstrapCol(
                          sizes: 'col-12 col-md-6',
                          child: Padding(
                            padding:
                                Biblioteca.distanciaEntreColunasQuebraLinha(
                                    context)!,
                            child: TextFormField(
                              maxLength: 60,
                              maxLines: 1,
                              initialValue:
                                  widget.nfeCabecalho?.nfeEmitente?.nome ??
                                      '',
                              decoration: getInputDecoration(
                                  'Informe o Nome', 'Nome', false),
                              onSaved: (String? value) {},
                              // validator: ValidaCampoFormulario.validarObrigatorio,
                              onChanged: (text) {
                                widget.nfeCabecalho!.nfeEmitente?.nome =
                                    text;
                                paginaMestreDetalheFoiAlterada = true;
                              },
                            ),
                          ),
                        ),
                      ]),
                      const Divider(
                        color: Colors.white,
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding:
                                  Biblioteca.distanciaEntreColunasQuebraLinha(
                                      context)!,
                              child: TextFormField(
                                        controller: importaCepController,
                                        // readOnly: true,
                                        decoration:
                                            getInputDecoration(
                                                'Importe o CEP Vinculado',
                                                'CEP',
                                                false),
                                        onSaved: (String? value) {},
                                        // validator: ValidaCampoFormulario.validarObrigatorio,
                                        onChanged: (text) {
                                          widget.nfeCabecalho?.nfeEmitente
                                              ?.cep = text;
                                          paginaMestreDetalheFoiAlterada = true;
                                        },
                                      ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding:
                                  Biblioteca.distanciaEntreColunasQuebraLinha(
                                      context)!,
                              child: TextFormField(
                                maxLength: 60,
                                maxLines: 1,
                                initialValue: widget.nfeCabecalho
                                        ?.nfeEmitente?.logradouro ??
                                    '',
                                decoration: getInputDecoration(
                                    'Informe o Logradouro',
                                    'Logradouro',
                                    false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.nfeCabecalho!.nfeEmitente
                                      ?.logradouro = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding:
                                  Biblioteca.distanciaEntreColunasQuebraLinha(
                                      context)!,
                              child: TextFormField(
                                maxLength: 60,
                                maxLines: 1,
                                initialValue: widget.nfeCabecalho
                                        ?.nfeEmitente?.numero ??
                                    '',
                                decoration: getInputDecoration(
                                    'Informe o Número', 'Número', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.nfeCabecalho!.nfeEmitente?.numero =
                                      text;
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
                              padding:
                                  Biblioteca.distanciaEntreColunasQuebraLinha(
                                      context)!,
                              child: TextFormField(
                                maxLength: 60,
                                maxLines: 1,
                                initialValue: widget.nfeCabecalho
                                        ?.nfeEmitente?.complemento ??
                                    '',
                                decoration: getInputDecoration(
                                    'Informe o Complemento',
                                    'Complemento',
                                    false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.nfeCabecalho!.nfeEmitente
                                      ?.complemento = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding:
                                  Biblioteca.distanciaEntreColunasQuebraLinha(
                                      context)!,
                              child: TextFormField(
                                maxLength: 60,
                                maxLines: 1,
                                initialValue: widget.nfeCabecalho
                                        ?.nfeEmitente?.bairro ??
                                    '',
                                decoration: getInputDecoration(
                                    'Informe o Bairro', 'Bairro', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.nfeCabecalho!.nfeEmitente?.bairro =
                                      text;
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding:
                                  Biblioteca.distanciaEntreColunasQuebraLinha(
                                      context)!,
                              child: TextFormField(
                                readOnly: true,
                                maxLength: 60,
                                maxLines: 1,
                                initialValue: widget.nfeCabecalho
                                        ?.nfeEmitente?.nomeMunicipio ??
                                    '',
                                decoration: getInputDecoration(
                                    'Informe o Município', 'Município', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.nfeCabecalho!.nfeEmitente
                                      ?.nomeMunicipio = text;
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
                            sizes: 'col-12 col-md-2',
                            child: Padding(
                              padding:
                                  Biblioteca.distanciaEntreColunasQuebraLinha(
                                      context)!,
                              child: InputDecorator(
                                  decoration: getInputDecoration(
                                      'Informe a UF', 'UF', true),
                                  isEmpty: widget.nfeCabecalho?.nfeEmitente
                                              ?.uf ==
                                          null ||
                                      widget.nfeCabecalho?.nfeEmitente ==
                                          null,
                                  child: getDropDownButton(
                                      widget.nfeCabecalho!.nfeEmitente?.uf,
                                      (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.nfeCabecalho!.nfeEmitente?.uf =
                                          newValue;
                                    });
                                  }, DropdownLista.listaUF)),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding:
                                  Biblioteca.distanciaEntreColunasQuebraLinha(
                                      context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: telefoneController,
                                decoration: getInputDecoration(
                                    'Informe o Telefone', 'Telefone', true, paddingVertical: 18),
                                onSaved: (String? value) {},
                                //validator: ValidaCampoFormulario.validarTelefone,
                                onChanged: (text) {
                                  widget.nfeCabecalho!.nfeEmitente
                                      ?.telefone = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding:
                                  Biblioteca.distanciaEntreColunasQuebraLinha(
                                      context)!,
                              child: TextFormField(
                                maxLength: 14,
                                maxLines: 1,
                                initialValue: widget.nfeCabecalho
                                        ?.nfeEmitente?.inscricaoEstadual ??
                                    '',
                                decoration: getInputDecoration(
                                    'Informe o Inscrição Estadual',
                                    'Inscrição Estadual',
                                    true, paddingVertical: 18),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.nfeCabecalho!.nfeEmitente
                                      ?.inscricaoEstadual = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding:
                                  Biblioteca.distanciaEntreColunasQuebraLinha(
                                      context)!,
                              child: TextFormField(
                                maxLength: 60,
                                maxLines: 1,
                                initialValue: widget
                                        .nfeCabecalho?.nfeEmitente?.email ??
                                    '',
                                decoration: getInputDecoration(
                                    'Informe o EMail', 'EMail', true, paddingVertical: 18),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  widget.nfeCabecalho!.nfeEmitente?.email =
                                      text;
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
