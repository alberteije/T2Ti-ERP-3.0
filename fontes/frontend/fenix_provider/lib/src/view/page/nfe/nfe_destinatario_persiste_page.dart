/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage OneToOne relacionada à tabela [NFE_DESTINATARIO] 
                                                                                
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

import 'package:fenix/src/infra/biblioteca.dart';

import 'package:fenix/src/model/model.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:fenix/src/view/shared/widgets_abas.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:fenix/src/infra/valida_campo_formulario.dart';

class NfeDestinatarioPersistePage extends StatefulWidget {
  final NfeCabecalho? nfeCabecalho;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarNfeCabecalhoCallBack;

  const NfeDestinatarioPersistePage(
      {Key? key,
      this.formKey,
      this.scaffoldKey,
      this.nfeCabecalho,
      this.foco,
      this.salvarNfeCabecalhoCallBack})
      : super(key: key);

  @override
  NfeDestinatarioPersistePageState createState() => NfeDestinatarioPersistePageState();
}

class NfeDestinatarioPersistePageState extends State<NfeDestinatarioPersistePage> {
  Map<LogicalKeySet, Intent>? _shortcutMap;
  Map<Type, Action<Intent>>? _actionMap;

  final ScrollController _scrollController = ScrollController();
  final importaClienteController = TextEditingController();
  final cepController = TextEditingController();
  final logradouroController = TextEditingController();
  final numeroController = TextEditingController();
  final complementoController = TextEditingController();
  final bairroController = TextEditingController();
  final nomeMunicipioController = TextEditingController();
  final ufController = TextEditingController();
  final inscricaoEstadualController = TextEditingController();
  final emailController = TextEditingController();
  final cpfController = TextEditingController();
  final cnpjController = TextEditingController();

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
    if (widget.nfeCabecalho!.nfeDestinatario == null) {
      widget.nfeCabecalho!.nfeDestinatario = NfeDestinatario();
    }
    importaClienteController.text = widget.nfeCabecalho!.nfeDestinatario!.nome ?? '';
    cepController.text = widget.nfeCabecalho!.nfeDestinatario!.cep ?? '';
    logradouroController.text = widget.nfeCabecalho!.nfeDestinatario!.logradouro ?? '';
    numeroController.text = widget.nfeCabecalho!.nfeDestinatario!.numero ?? '';
    complementoController.text = widget.nfeCabecalho!.nfeDestinatario!.complemento ?? '';
    bairroController.text = widget.nfeCabecalho!.nfeDestinatario!.bairro ?? '';
    nomeMunicipioController.text = widget.nfeCabecalho!.nfeDestinatario!.nomeMunicipio ?? '';
    ufController.text = widget.nfeCabecalho!.nfeDestinatario!.uf ?? '';
    inscricaoEstadualController.text = widget.nfeCabecalho!.nfeDestinatario!.inscricaoEstadual ?? '';
    emailController.text = widget.nfeCabecalho!.nfeDestinatario!.email ?? '';
    cpfController.text = widget.nfeCabecalho!.nfeDestinatario!.cpf ?? '';
    cnpjController.text = widget.nfeCabecalho!.nfeDestinatario!.cnpj ?? '';

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
                        children: primeiraLinha(), 
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
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
                                        readOnly: true,
                                        controller: cepController,
                                        decoration:
                                            getInputDecoration(
                                                'Importe o CEP Vinculado',
                                                'CEP',
                                                false),
                                      ),
                                    ),
                                  ),
                                ],
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
                                readOnly: true,
                                maxLength: 60,
                                maxLines: 1,
                                controller: logradouroController,
                                decoration: getInputDecoration(
                                    'Informe o Logradouro',
                                    'Logradouro',
                                    false),
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
                                readOnly: true,
                                maxLength: 60,
                                maxLines: 1,
                                controller: numeroController,
                                decoration: getInputDecoration(
                                    'Informe o Número', 'Número', false),
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
                                readOnly: true,
                                maxLength: 60,
                                maxLines: 1,
                                controller: complementoController,
                                decoration: getInputDecoration(
                                    'Informe o Complemento',
                                    'Complemento',
                                    false),
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
                                controller: bairroController,
                                decoration: getInputDecoration(
                                    'Informe o Bairro', 'Bairro', false),
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
                                controller: nomeMunicipioController,
                                decoration: getInputDecoration(
                                    'Informe o Município', 'Município', false),
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
                                readOnly: true,
                                maxLength: 60,
                                maxLines: 1,
                                controller: ufController,
                                decoration: getInputDecoration(
                                    'Informe a UF', 'UF', false),
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
                                maxLength: 14,
                                maxLines: 1,
                                controller: inscricaoEstadualController,
                                decoration: getInputDecoration(
                                    'Informe o Inscrição Estadual',
                                    'Inscrição Estadual',
                                    false),
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
                                controller: emailController,
                                decoration: getInputDecoration(
                                    'Informe o EMail', 'EMail', false),
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

  List<BootstrapCol> primeiraLinha() {
    List<BootstrapCol> retorno = [];
    retorno.add(
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
                  controller: importaClienteController,
                  readOnly: true,
                  decoration: getInputDecoration(
                    'Importe o Cliente',
                    'Cliente *',
                    false),
                  onSaved: (String? value) {
                  },
                  validator: ValidaCampoFormulario.validarObrigatorio,
                  onChanged: (text) {
                  },
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: IconButton(
                tooltip: 'Importar Cliente',
                icon: ViewUtilLib.getIconBotaoLookup(),
                onPressed: () async {
                  ///chamando o lookup
                  Map<String, dynamic>? objetoJsonRetorno =
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                          LookupPage(
                            title: 'Importar Cliente',
                            colunas: ViewPessoaCliente.colunas,
                            campos: ViewPessoaCliente.campos,
                            rota: '/view-pessoa-cliente/',
                            campoPesquisaPadrao: 'nome',
                            valorPesquisaPadrao: '%',
                          ),
                          fullscreenDialog: true,
                        ));
                  if (objetoJsonRetorno != null) {
                    if (objetoJsonRetorno['nome'] != null) {
                      paginaMestreDetalheFoiAlterada = true;

                      importaClienteController.text = objetoJsonRetorno['nome'];
                      widget.nfeCabecalho?.idCliente = objetoJsonRetorno['id'];
                      widget.nfeCabecalho?.cliente = Cliente.fromJson(objetoJsonRetorno);

                      widget.nfeCabecalho?.nfeDestinatario!.nome = objetoJsonRetorno['nome'];
                      widget.nfeCabecalho!.nfeDestinatario!.cpf = objetoJsonRetorno['cpfCnpj'].length == 11 ? objetoJsonRetorno['cpfCnpj'] : '';    
                      widget.nfeCabecalho!.nfeDestinatario!.cnpj = objetoJsonRetorno['cpfCnpj'].length == 14 ? objetoJsonRetorno['cpfCnpj'] : '';
                      widget.nfeCabecalho?.nfeDestinatario!.cep = objetoJsonRetorno['cep'];     
                      widget.nfeCabecalho!.nfeDestinatario!.logradouro = objetoJsonRetorno['logradouro'];   
                      widget.nfeCabecalho!.nfeDestinatario!.numero = objetoJsonRetorno['numero'];
                      widget.nfeCabecalho!.nfeDestinatario!.complemento = objetoJsonRetorno['complemento'];    
                      widget.nfeCabecalho!.nfeDestinatario!.bairro = objetoJsonRetorno['bairro'];   
                      widget.nfeCabecalho!.nfeDestinatario!.nomeMunicipio = objetoJsonRetorno['cidade']; 
                      widget.nfeCabecalho!.nfeDestinatario!.uf = objetoJsonRetorno['uf'];  
                      widget.nfeCabecalho!.nfeDestinatario!.inscricaoEstadual = objetoJsonRetorno['rgIe']; 
                      widget.nfeCabecalho!.nfeDestinatario!.email = objetoJsonRetorno['email'];   
                      widget.nfeCabecalho!.nfeDestinatario!.codigoMunicipio = objetoJsonRetorno['municipioIbge'];
                      widget.nfeCabecalho!.nfeDestinatario!.codigoPais = 1058;
                      widget.nfeCabecalho!.nfeDestinatario!.nomePais = 'Brazil';

                      setState(() {});               
                    }
                  }
                },
              ),
            ),
          ],
        ),
        ),
      ),      
    );

    if (widget.nfeCabecalho?.nfeDestinatario!.cpf?.length == 11) {
       retorno.add(
        BootstrapCol(
          sizes: 'col-12 col-md-4',
          child: Padding(
            padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
            child: TextFormField(
              readOnly: true,
              keyboardType: TextInputType.number,
              focusNode: widget.foco,
              autofocus: true,
              controller: cpfController,
              decoration: getInputDecoration('Informe o CPF', 'CPF', false),
              onSaved: (String? value) {},
              // validator: ValidaCampoFormulario.validarCPF,
              onChanged: (text) {
                widget.nfeCabecalho!.nfeDestinatario!.cpf = text;
                paginaMestreDetalheFoiAlterada = true;
              },
            ),
          ),
        ),        
       );
    } else {
      retorno.add(
        BootstrapCol(
          sizes: 'col-12 col-md-4',
          child: Padding(
            padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
            child: TextFormField(
              readOnly: true,
              keyboardType: TextInputType.number,
              controller: cnpjController,
              decoration: getInputDecoration('Informe o CNPJ', 'CNPJ', false),
            ),
          ),
        ),
      );
    }
    
    return retorno;                    
  }
}
