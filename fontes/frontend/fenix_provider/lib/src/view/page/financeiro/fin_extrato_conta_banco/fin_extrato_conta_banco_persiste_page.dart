/*
Title: T2Ti ERP 3.0                                                                
Description: PersistePage relacionada à tabela [FIN_EXTRATO_CONTA_BANCO] 
                                                                                
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
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:fenix/src/infra/constantes.dart';
import 'package:fenix/src/infra/biblioteca.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';
import 'package:fenix/src/view/shared/botoes.dart';
// import 'package:fenix/src/view/shared/widgets_input.dart';

import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/infra/valida_campo_formulario.dart';

class FinExtratoContaBancoPersistePage extends StatefulWidget {
  final FinExtratoContaBanco finExtratoContaBanco;
  final String title;
  final String operacao;

  const FinExtratoContaBancoPersistePage({Key? key, required this.finExtratoContaBanco, required this.title, required this.operacao})
      : super(key: key);

  @override
  FinExtratoContaBancoPersistePageState createState() => FinExtratoContaBancoPersistePageState();
}

class FinExtratoContaBancoPersistePageState extends State<FinExtratoContaBancoPersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;
  late FinExtratoContaBancoViewModel _finExtratoContaBancoProvider;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void initState() {
    super.initState();
    bootstrapGridParameters(
      gutterSize: Constantes.flutterBootstrapGutterSize,
    );

    _shortcutMap = getAtalhosDetalhePage();

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
      case AtalhoTelaType.alterar:
        _salvar();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _finExtratoContaBancoProvider = Provider.of<FinExtratoContaBancoViewModel>(context);
	
    final importaBancoContaCaixaController = TextEditingController();
    importaBancoContaCaixaController.text = widget.finExtratoContaBanco.bancoContaCaixa?.nome ?? '';
    final mesAnoController = MaskedTextController(
      mask: Constantes.mascaraMES_ANO,
      text: widget.finExtratoContaBanco.mesAno ?? '',
    );
    final mesController = MaskedTextController(
      mask: Constantes.mascaraMES,
      text: widget.finExtratoContaBanco.mes ?? '',
    );
    final valorController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finExtratoContaBanco.valor ?? 0);
	
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
                    children: [
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
                                      controller: importaBancoContaCaixaController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe a Conta/Caixa Vinculada',
                                        'Conta/Caixa *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.finExtratoContaBanco.bancoContaCaixa?.nome = text;
                                        _formFoiAlterado = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Conta/Caixa',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Conta/Caixa',
                                                colunas: BancoContaCaixa.colunas,
                                                campos: BancoContaCaixa.campos,
                                                rota: '/banco-conta-caixa/',
                                                campoPesquisaPadrao: 'nome',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['nome'] != null) {
                                          importaBancoContaCaixaController.text = objetoJsonRetorno['nome'];
                                          widget.finExtratoContaBanco.idBancoContaCaixa = objetoJsonRetorno['id'];
                                          widget.finExtratoContaBanco.bancoContaCaixa = BancoContaCaixa.fromJson(objetoJsonRetorno);
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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: mesAnoController,
                                maxLength: Constantes.mascaraMES_ANO.length,
                                decoration: getInputDecoration(
                                  'Informe o Mês/Ano',
                                  'Mês/Ano *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.finExtratoContaBanco.mesAno = text;
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
                                controller: mesController,
                                maxLength: Constantes.mascaraMES.length,
                                decoration: getInputDecoration(
                                  'Informe o Mês',
                                  'Mês *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.finExtratoContaBanco.mes = text;
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
                                maxLength: 4,
                                maxLines: 1,
                                initialValue: widget.finExtratoContaBanco.ano ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Ano',
                                  'Ano *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.finExtratoContaBanco.ano = text;
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
                                  'Informe a Data de Movimento',
                                  'Data de Movimento',
                                  true),
                                isEmpty: widget.finExtratoContaBanco.dataMovimento == null,
                                child: DatePickerItem(
                                  dateTime: widget.finExtratoContaBanco.dataMovimento,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    setState(() {
                                      widget.finExtratoContaBanco.dataMovimento = value;
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
                                  'Informe a Data do Balancete',
                                  'Data do Balancete',
                                  true),
                                isEmpty: widget.finExtratoContaBanco.dataBalancete == null,
                                child: DatePickerItem(
                                  dateTime: widget.finExtratoContaBanco.dataBalancete,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    setState(() {
                                      widget.finExtratoContaBanco.dataBalancete = value;
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
                                  'Informe o Valor',
                                  'Valor *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorioDecimal,
                                onChanged: (text) {
                                  widget.finExtratoContaBanco.valor = valorController.numberValue;
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
                            sizes: 'col-12 col-md-8',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 50,
                                maxLines: 1,
                                initialValue: widget.finExtratoContaBanco.documento ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Documento',
                                  'Documento',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finExtratoContaBanco.documento = text;
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
                                  'Selecione a Opção Desejada',
                                  'Conciliado',
                                  true),
                                isEmpty: widget.finExtratoContaBanco.conciliado == null,
                                child: getDropDownButton(widget.finExtratoContaBanco.conciliado,
                                  (String? newValue) {
                                    setState(() {
                                      widget.finExtratoContaBanco.conciliado = newValue;
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
                            sizes: 'col-12',
                            child: TextFormField(
                              maxLength: 250,
                              maxLines: 3,
                              initialValue: widget.finExtratoContaBanco.historico ?? '',
                              decoration: getInputDecoration(
                                'Informe o Histórico',
                                'Histórico',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.finExtratoContaBanco.historico = text;
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
                              initialValue: widget.finExtratoContaBanco.observacao ?? '',
                              decoration: getInputDecoration(
                                'Observações Gerais',
                                'Observação',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.finExtratoContaBanco.observacao = text;
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
          await _finExtratoContaBancoProvider.alterar(widget.finExtratoContaBanco);
        } else {
          await _finExtratoContaBancoProvider.inserir(widget.finExtratoContaBanco);
        }
        if (!mounted) return;
        Navigator.of(context).pop();
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
      await _finExtratoContaBancoProvider.excluir(widget.finExtratoContaBanco.mesAno);
      if (!mounted) return;
      Navigator.of(context).pop();
      Navigator.of(context).pop();
	    showInSnackBar("Registro excluído com sucesso!", context, corFundo: Colors.green);
    });
  }  
}