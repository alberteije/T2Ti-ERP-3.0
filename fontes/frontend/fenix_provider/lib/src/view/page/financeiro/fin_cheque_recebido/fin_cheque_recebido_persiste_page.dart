/*
Title: T2Ti ERP 3.0                                                                
Description: PersistePage relacionada à tabela [FIN_CHEQUE_RECEBIDO] 
                                                                                
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
import 'package:extended_masked_text/extended_masked_text.dart';

class FinChequeRecebidoPersistePage extends StatefulWidget {
  final FinChequeRecebido finChequeRecebido;
  final String title;
  final String operacao;

  const FinChequeRecebidoPersistePage({Key? key, required this.finChequeRecebido, required this.title, required this.operacao})
      : super(key: key);

  @override
  FinChequeRecebidoPersistePageState createState() => FinChequeRecebidoPersistePageState();
}

class FinChequeRecebidoPersistePageState extends State<FinChequeRecebidoPersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;
  late FinChequeRecebidoViewModel _finChequeRecebidoProvider;

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
    _finChequeRecebidoProvider = Provider.of<FinChequeRecebidoViewModel>(context);
	
    final importaPessoaController = TextEditingController();
    importaPessoaController.text = widget.finChequeRecebido.pessoa?.nome ?? '';
    final cpfController = MaskedTextController(
      mask: Constantes.mascaraCPF,
      text: widget.finChequeRecebido.cpf ?? '',
    );
    final cnpjController = MaskedTextController(
      mask: Constantes.mascaraCNPJ,
      text: widget.finChequeRecebido.cnpj ?? '',
    );
    final valorController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finChequeRecebido.valor ?? 0);
    final custodiaTarifaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finChequeRecebido.custodiaTarifa ?? 0);
    final custodiaComissaoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finChequeRecebido.custodiaComissao ?? 0);
    final descontoTarifaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finChequeRecebido.descontoTarifa ?? 0);
    final descontoComissaoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finChequeRecebido.descontoComissao ?? 0);
    final valorRecebidoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finChequeRecebido.valorRecebido ?? 0);
	
    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        autofocus: true,
        child: Scaffold(drawerDragStartBehavior: DragStartBehavior.down,
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(widget.title), 
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
                            sizes: 'col-12',
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    child: TextFormField(
                                      controller: importaPessoaController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe a Pessoa Vinculada',
                                        'Pessoa *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.finChequeRecebido.pessoa?.nome = text;
                                        _formFoiAlterado = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Pessoa',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Pessoa',
                                                colunas: Pessoa.colunas,
                                                campos: Pessoa.campos,
                                                rota: '/pessoa/',
                                                campoPesquisaPadrao: 'nome',
                                                valorPesquisaPadrao: '',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['nome'] != null) {
                                          importaPessoaController.text = objetoJsonRetorno['nome'];
                                          widget.finChequeRecebido.idPessoa = objetoJsonRetorno['id'];
                                          widget.finChequeRecebido.pessoa = Pessoa.fromJson(objetoJsonRetorno);
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
                      const Divider(color: Colors.white,),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: cpfController,
                                maxLength: Constantes.mascaraCPF.length,
                                decoration: getInputDecoration(
                                  'Informe o CPF do Cliente',
                                  'CPF *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.finChequeRecebido.cpf = text;
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
                                keyboardType: TextInputType.number,
                                controller: cnpjController,
                                maxLength: Constantes.mascaraCNPJ.length,
                                decoration: getInputDecoration(
                                  'Informe o CNPJ do Cliente',
                                  'CNPJ *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.finChequeRecebido.cnpj = text;
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
                              maxLength: 100,
                              maxLines: 1,
                              initialValue: widget.finChequeRecebido.nome ?? '',
                              decoration: getInputDecoration(
                                'Informe o nome do Cliente',
                                'Nome *',
                                false),
                              onSaved: (String? value) {
                              },
                              validator: ValidaCampoFormulario.validarObrigatorio,
                              onChanged: (text) {
                                widget.finChequeRecebido.nome = text;
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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: widget.finChequeRecebido.codigoBanco ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Código do Banco',
                                  'Código Banco *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.finChequeRecebido.codigoBanco = text;
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
                                initialValue: widget.finChequeRecebido.codigoAgencia ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Código da Agência',
                                  'Código Agência *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.finChequeRecebido.codigoAgencia = text;
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
                                maxLength: 20,
                                maxLines: 1,
                                initialValue: widget.finChequeRecebido.conta ?? '',
                                decoration: getInputDecoration(
                                  'Informe a Conta',
                                  'Conta *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.finChequeRecebido.conta = text;
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
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: widget.finChequeRecebido.numero?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Número do Cheque',
                                  'Número do Cheque',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finChequeRecebido.numero = int.tryParse(text);
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a Data de Emissão',
                                  'Data de Emissão *',
                                  true),
                                isEmpty: widget.finChequeRecebido.dataEmissao == null,
                                child: DatePickerItem(
                                  dateTime: widget.finChequeRecebido.dataEmissao,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    setState(() {
                                      widget.finChequeRecebido.dataEmissao = value;
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
                                  'Informe a Data do Cheque Bom Para',
                                  'Cheque Bom Para',
                                  true),
                                isEmpty: widget.finChequeRecebido.bomPara == null,
                                child: DatePickerItem(
                                  dateTime: widget.finChequeRecebido.bomPara,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    setState(() {
                                      widget.finChequeRecebido.bomPara = value;
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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a Data de Compensação',
                                  'Data de Compensação',
                                  true),
                                isEmpty: widget.finChequeRecebido.dataCompensacao == null,
                                child: DatePickerItem(
                                  dateTime: widget.finChequeRecebido.dataCompensacao,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    setState(() {
                                      widget.finChequeRecebido.dataCompensacao = value;
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: valorController,
                                decoration: getInputDecoration(
                                  'Informe o Valor do Cheque',
                                  'Valor *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorioDecimal,
                                onChanged: (text) {
                                  widget.finChequeRecebido.valor = valorController.numberValue;
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
                                  'Informe a Data da Custódia',
                                  'Data da Custódia',
                                  true),
                                isEmpty: widget.finChequeRecebido.custodiaData == null,
                                child: DatePickerItem(
                                  dateTime: widget.finChequeRecebido.custodiaData,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    setState(() {
                                      widget.finChequeRecebido.custodiaData = value;
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: custodiaTarifaController,
                                decoration: getInputDecoration(
                                  'Informe o Valor da Tarifa Custódia',
                                  'Tarifa Custódia',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finChequeRecebido.custodiaTarifa = custodiaTarifaController.numberValue;
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
                                textAlign: TextAlign.end,
                                controller: custodiaComissaoController,
                                decoration: getInputDecoration(
                                  'Informe o Valor da  Comissão da Custódia',
                                  'Custódia Comissão',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finChequeRecebido.custodiaComissao = custodiaComissaoController.numberValue;
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
                                  'Informe a Data de Desconto',
                                  'Data de Desconto',
                                  true),
                                isEmpty: widget.finChequeRecebido.descontoData == null,
                                child: DatePickerItem(
                                  dateTime: widget.finChequeRecebido.descontoData,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    setState(() {
                                      widget.finChequeRecebido.descontoData = value;
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: descontoTarifaController,
                                decoration: getInputDecoration(
                                  'Informe o Valor da Tarifa Desconto',
                                  'Tarifa Desconto',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finChequeRecebido.descontoTarifa = descontoTarifaController.numberValue;
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
                                textAlign: TextAlign.end,
                                controller: descontoComissaoController,
                                decoration: getInputDecoration(
                                  'Informe o Valor da  Comissão da Desconto',
                                  'Desconto Comissão',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finChequeRecebido.descontoComissao = descontoComissaoController.numberValue;
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
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: valorRecebidoController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Recebido',
                                  'Valor Recebido',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finChequeRecebido.valorRecebido = valorRecebidoController.numberValue;
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
          await _finChequeRecebidoProvider.alterar(widget.finChequeRecebido);
        } else {
          await _finChequeRecebidoProvider.inserir(widget.finChequeRecebido);
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
      await _finChequeRecebidoProvider.excluir(widget.finChequeRecebido.id!);
      if (!mounted) return;
      Navigator.of(context).pop();
      showInSnackBar("Registro excluído com sucesso!", context, corFundo: Colors.green);
    });
  }  
}