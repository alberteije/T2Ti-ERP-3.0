/*
Title: T2Ti ERP 3.0                                                                
Description: PersistePage relacionada à tabela [CLIENTE] 
                                                                                
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

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:pegasus_pdv/src/database/database.dart';

import 'package:pegasus_pdv/src/infra/infra.dart';

import 'package:pegasus_pdv/src/view/shared/dropdown_lista.dart';
import 'package:pegasus_pdv/src/view/shared/view_util_lib.dart';
import 'package:pegasus_pdv/src/view/shared/caixas_de_dialogo.dart';
import 'package:pegasus_pdv/src/infra/atalhos_desktop_web.dart';
import 'package:pegasus_pdv/src/view/shared/botoes.dart';
import 'package:pegasus_pdv/src/view/shared/widgets_input.dart';

class ClientePersistePage extends StatefulWidget {
  final Cliente? cliente;
  final String? title;
  final String? operacao;

  const ClientePersistePage({Key? key, this.cliente, this.title, this.operacao}) : super(key: key);

  @override
  ClientePersistePageState createState() => ClientePersistePageState();
}

class ClientePersistePageState extends State<ClientePersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;

  // final _cnpjController = MaskedTextController(mask: Constantes.mascaraCNPJ);

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap;
  Map<Type, Action<Intent>>? _actionMap;
  final _foco = FocusNode();

  Cliente? cliente;

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
    cliente = widget.cliente;
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
    final telefoneController = MaskedTextController(
      mask: Constantes.mascaraTELEFONE,
      text: cliente?.telefone ?? '',
    );
    final celularController = MaskedTextController(
      mask: Constantes.mascaraTELEFONE,
      text: cliente?.celular ?? '',
    );
    final cepController = MaskedTextController(
      mask: Constantes.mascaraCEP,
      text: cliente?.cep ?? '',
    );
    final cpfController = MaskedTextController(
      mask: Constantes.mascaraCPF,
      text: cliente?.cpfCnpj ?? '',
    );
    final cnpjController = MaskedTextController(
      mask: Constantes.mascaraCNPJ,
      text: cliente?.cpfCnpj ?? '',
    );
    final quantidadeFidelidadeController = MaskedTextController(
      mask: Constantes.mascaraQUANTIDADE_INTEIRO,
      text: cliente?.fidelidadeQuantidade?.toString() ?? '0',
    );
    final valorFidelidadeController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: cliente?.fidelidadeValor ?? 0);

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
                controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration('Conteúdo para o campo Tipo Pessoa', 'Tipo Pessoa', true),
                                isEmpty: cliente!.tipoPessoa == null,
                                child: getDropDownButton(
                                  cliente!.tipoPessoa,
                                  (String? newValue) {
                                    setState(() {
                                      cliente = cliente!.copyWith(tipoPessoa: Value(newValue));
                                    });
                                  },
                                  <String>[
                                    'Física',
                                    'Jurídica',
                                  ],
                                  validator: ValidaCampoFormulario.validarObrigatorio,
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-8',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                focusNode: _foco,
                                validator: ValidaCampoFormulario.validarObrigatorioAlfanumerico,
                                maxLength: 150,
                                maxLines: 1,
                                initialValue: cliente?.nome ?? '',
                                decoration: getInputDecoration('Conteúdo para o campo Nome', 'Nome', true, paddingVertical: 18),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  cliente = cliente!.copyWith(nome: Value(text));
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: cliente?.tipoPessoa == 'Jurídica',
                        child: const Divider(
                          color: Colors.white,
                        ),
                      ),
                      Visibility(
                        visible: cliente?.tipoPessoa == 'Jurídica',
                        child: BootstrapRow(
                          height: 60,
                          children: <BootstrapCol>[
                            BootstrapCol(
                              sizes: 'col-12',
                              child: TextFormField(
                                maxLength: 150,
                                maxLines: 1,
                                initialValue: cliente?.fantasia ?? '',
                                decoration: getInputDecoration('Conteúdo para o campo Fantasia', 'Fantasia', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  cliente = cliente!.copyWith(fantasia: Value(text));
                                  _formFoiAlterado = true;
                                },
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
                                validator: ValidaCampoFormulario.validarEmail,
                                maxLength: 250,
                                maxLines: 3,
                                initialValue: cliente?.email ?? '',
                                decoration: getInputDecoration('Conteúdo para o campo Email', 'Email', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  cliente = cliente!.copyWith(email: Value(text));
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 250,
                                maxLines: 3,
                                initialValue: cliente?.url ?? '',
                                decoration: getInputDecoration('Conteúdo para o campo Url', 'Url', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  cliente = cliente!.copyWith(url: Value(text));
                                  _formFoiAlterado = true;
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
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: cliente?.tipoPessoa == 'Física' ? 14 : 18,
                                keyboardType: TextInputType.number,
                                controller: cliente?.tipoPessoa == 'Física' ? cpfController : cnpjController,
                                decoration: getInputDecoration('Conteúdo para o campo Cpf Cnpj', 'Cpf / Cnpj', true, paddingVertical: 15),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  cliente = cliente!.copyWith(cpfCnpj: Value(Biblioteca.removerMascara(text)));
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration('Conteúdo para o campo Data Cadastro', 'Data Cadastro', true),
                                isEmpty: cliente!.dataCadastro == null,
                                child: DatePickerItem(
                                  mascara: 'dd/MM/yyyy',
                                  dateTime: cliente!.dataCadastro,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    setState(() {
                                      cliente = cliente!.copyWith(dataCadastro: Value(value));
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: cliente?.tipoPessoa == 'Física',
                        child: const Divider(
                          color: Colors.white,
                        ),
                      ),
                      Visibility(
                        visible: cliente?.tipoPessoa == 'Física',
                        child: BootstrapRow(
                          height: 60,
                          children: <BootstrapCol>[
                            BootstrapCol(
                              sizes: 'col-12 col-md-6',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                                child: InputDecorator(
                                    decoration: getInputDecoration('Conteúdo para o campo Sexo', 'Sexo', true),
                                    isEmpty: cliente!.sexo == null,
                                    child: getDropDownButton(cliente!.sexo, (String? newValue) {
                                      setState(() {
                                        cliente = cliente!.copyWith(sexo: Value(newValue));
                                      });
                                    }, <String>[
                                      'M',
                                      'F',
                                    ])),
                              ),
                            ),
                            BootstrapCol(
                              sizes: 'col-12 col-md-6',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                                child: TextFormField(
                                  maxLength: 20,
                                  maxLines: 1,
                                  initialValue: cliente?.rg ?? '',
                                  decoration: getInputDecoration('Conteúdo para o campo Rg', 'Rg', true, paddingVertical: 18),
                                  onSaved: (String? value) {},
                                  onChanged: (text) {
                                    cliente = cliente!.copyWith(rg: Value(text));
                                    _formFoiAlterado = true;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: cliente?.tipoPessoa == 'Física',
                        child: const Divider(
                          color: Colors.white,
                        ),
                      ),
                      Visibility(
                        visible: cliente?.tipoPessoa == 'Física',
                        child: BootstrapRow(
                          height: 60,
                          children: <BootstrapCol>[
                            BootstrapCol(
                              sizes: 'col-12 col-md-6',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                                child: TextFormField(
                                  maxLength: 20,
                                  maxLines: 1,
                                  initialValue: cliente?.orgaoRg ?? '',
                                  decoration: getInputDecoration('Conteúdo para o campo Orgao Rg', 'Orgao Rg', true, paddingVertical: 15),
                                  onSaved: (String? value) {},
                                  onChanged: (text) {
                                    cliente = cliente!.copyWith(orgaoRg: Value(text));
                                    _formFoiAlterado = true;
                                  },
                                ),
                              ),
                            ),
                            BootstrapCol(
                              sizes: 'col-12 col-md-6',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                                child: InputDecorator(
                                  decoration: getInputDecoration('Conteúdo para o campo Data Emissao Rg', 'Data Emissao Rg', true),
                                  isEmpty: cliente!.dataEmissaoRg == null,
                                  child: DatePickerItem(
                                    mascara: 'dd/MM/yyyy',
                                    dateTime: cliente!.dataEmissaoRg,
                                    firstDate: DateTime.parse('1900-01-01'),
                                    lastDate: DateTime.now(),
                                    onChanged: (DateTime? value) {
                                      setState(() {
                                        cliente = cliente!.copyWith(dataEmissaoRg: Value(value));
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: cliente?.tipoPessoa == 'Jurídica',
                        child: const Divider(
                          color: Colors.white,
                        ),
                      ),
                      Visibility(
                        visible: cliente?.tipoPessoa == 'Jurídica',
                        child: BootstrapRow(
                          height: 60,
                          children: <BootstrapCol>[
                            BootstrapCol(
                              sizes: 'col-12 col-md-6',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                                child: TextFormField(
                                  maxLength: 30,
                                  maxLines: 1,
                                  initialValue: cliente?.inscricaoEstadual ?? '',
                                  decoration: getInputDecoration('Conteúdo para o campo Inscricao Estadual', 'Inscricao Estadual', false),
                                  onSaved: (String? value) {},
                                  onChanged: (text) {
                                    cliente = cliente!.copyWith(inscricaoEstadual: Value(text));
                                    _formFoiAlterado = true;
                                  },
                                ),
                              ),
                            ),
                            BootstrapCol(
                              sizes: 'col-12 col-md-6',
                              child: Padding(
                                padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                                child: TextFormField(
                                  maxLength: 30,
                                  maxLines: 1,
                                  initialValue: cliente?.inscricaoMunicipal ?? '',
                                  decoration: getInputDecoration('Conteúdo para o campo Inscricao Municipal', 'Inscricao Municipal', false),
                                  onSaved: (String? value) {},
                                  onChanged: (text) {
                                    cliente = cliente!.copyWith(inscricaoMunicipal: Value(text));
                                    _formFoiAlterado = true;
                                  },
                                ),
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
                            sizes: 'col-12',
                            child: TextFormField(
                              maxLength: 250,
                              maxLines: 3,
                              initialValue: cliente?.logradouro ?? '',
                              decoration: getInputDecoration('Conteúdo para o campo Logradouro', 'Logradouro', false),
                              onSaved: (String? value) {},
                              onChanged: (text) {
                                cliente = cliente!.copyWith(logradouro: Value(text));
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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                  decoration: getInputDecoration('Conteúdo para o campo Uf', 'Uf', true),
                                  isEmpty: cliente?.uf == null,
                                  child: getDropDownButton(cliente!.uf, (String? newValue) {
                                    setState(() {
                                      cliente = cliente!.copyWith(uf: Value(newValue));
                                    });
                                  }, DropdownLista.listaUF)),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 9,
                                keyboardType: TextInputType.number,
                                controller: cepController,
                                decoration: getInputDecoration('Conteúdo para o campo Cep', 'Cep', true, paddingVertical: 18),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  cliente = cliente!.copyWith(cep: Value(Biblioteca.removerMascara(text)));
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
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: cliente?.numero ?? '',
                                decoration: getInputDecoration('Conteúdo para o campo Numero', 'Numero', true, paddingVertical: 18),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  cliente = cliente!.copyWith(numero: Value(text));
                                  _formFoiAlterado = true;
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
                              maxLength: 100,
                              maxLines: 1,
                              initialValue: cliente?.complemento ?? '',
                              decoration: getInputDecoration('Conteúdo para o campo Complemento', 'Complemento', false),
                              onSaved: (String? value) {},
                              onChanged: (text) {
                                cliente = cliente!.copyWith(complemento: Value(text));
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
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 100,
                                maxLines: 1,
                                initialValue: cliente?.bairro ?? '',
                                decoration: getInputDecoration('Conteúdo para o campo Bairro', 'Bairro', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  cliente = cliente!.copyWith(bairro: Value(text));
                                  _formFoiAlterado = true;
                                },
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
                                initialValue: cliente?.cidade ?? '',
                                decoration: getInputDecoration('Conteúdo para o campo Cidade', 'Cidade', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  cliente = cliente!.copyWith(cidade: Value(text));
                                  _formFoiAlterado = true;
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
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 14,
                                keyboardType: TextInputType.number,
                                controller: telefoneController,
                                decoration: getInputDecoration('Conteúdo para o campo Telefone', 'Telefone', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  cliente = cliente!.copyWith(telefone: Value(Biblioteca.removerMascara(text)));
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 14,
                                keyboardType: TextInputType.number,
                                controller: celularController,
                                decoration: getInputDecoration('Conteúdo para o campo Celular', 'Celular', false),
                                onSaved: (String? value) {},
                                onChanged: (text) {
                                  cliente = cliente!.copyWith(celular: Value(Biblioteca.removerMascara(text)));
                                  _formFoiAlterado = true;
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
                              maxLength: 50,
                              maxLines: 1,
                              initialValue: cliente?.contato ?? '',
                              decoration: getInputDecoration('Conteúdo para o campo Contato', 'Contato', false),
                              onSaved: (String? value) {},
                              onChanged: (text) {
                                cliente = cliente!.copyWith(contato: Value(text));
                                _formFoiAlterado = true;
                              },
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 0),
                        child: Text(
                          "Dados para o programa de fidelidade",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                      const Divider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 2,
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
                              child: InputDecorator(
                                  decoration: getInputDecoration('Conteúdo para o campo Tipo Fidelidade', 'Tipo Fidelidade', true),
                                  isEmpty: cliente!.fidelidadeAviso == null,
                                  child: getDropDownButton(cliente!.fidelidadeAviso, (String? newValue) {
                                    setState(() {
                                      cliente = cliente!.copyWith(fidelidadeAviso: Value(newValue));
                                      _formFoiAlterado = true;
                                    });
                                  }, <String>[
                                    'Quantidade',
                                    'Valor',
                                  ])),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.end,
                              controller: quantidadeFidelidadeController,
                              decoration: getInputDecoration('Quantidade de Vezes para Ativar a Fidelidade', 'Quantidade', true, paddingVertical: 18),
                              onSaved: (String? value) {},
                              onChanged: (text) {
                                cliente = cliente!.copyWith(fidelidadeQuantidade: Value(int.tryParse(quantidadeFidelidadeController.text)));
                                _formFoiAlterado = true;
                              },
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.end,
                              controller: valorFidelidadeController,
                              decoration: getInputDecoration('Valor Atingido para Ativar a Fidelidade', 'Valor', true, paddingVertical: 18),
                              onSaved: (String? value) {},
                              onChanged: (text) {
                                cliente = cliente!.copyWith(fidelidadeValor: Value(valorFidelidadeController.numberValue));
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

  Future<void> _salvar() async {
    final FormState form = _formKey.currentState!;
    if (!form.validate()) {
      _autoValidate = AutovalidateMode.always;
      showInSnackBar(Constantes.mensagemCorrijaErrosFormSalvar, context);
    } else {
      gerarDialogBoxConfirmacao(context, Constantes.perguntaSalvarAlteracoes, () async {
        form.save();
        if (widget.operacao == 'A') {
          Sessao.db.clienteDao.alterar(cliente!);
        } else {
          Sessao.db.clienteDao.inserir(cliente!);
        }
        Navigator.of(context).pop();
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
      await Sessao.db.clienteDao.excluir(widget.cliente!);
      if (!mounted) return;
      Navigator.of(context).pop();
    });
  }
}
