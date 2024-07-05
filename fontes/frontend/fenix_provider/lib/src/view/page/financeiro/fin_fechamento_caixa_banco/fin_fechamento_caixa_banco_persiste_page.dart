/*
Title: T2Ti ERP 3.0                                                                
Description: PersistePage relacionada à tabela [FIN_FECHAMENTO_CAIXA_BANCO] 
                                                                                
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

import 'package:fenix/src/infra/constantes.dart';
import 'package:fenix/src/infra/biblioteca.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';
import 'package:fenix/src/view/shared/botoes.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';

import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/infra/valida_campo_formulario.dart';

class FinFechamentoCaixaBancoPersistePage extends StatefulWidget {
  final FinFechamentoCaixaBanco finFechamentoCaixaBanco;
  final String title;
  final String operacao;

  const FinFechamentoCaixaBancoPersistePage({Key? key, required this.finFechamentoCaixaBanco, required this.title, required this.operacao})
      : super(key: key);

  @override
  FinFechamentoCaixaBancoPersistePageState createState() => FinFechamentoCaixaBancoPersistePageState();
}

class FinFechamentoCaixaBancoPersistePageState extends State<FinFechamentoCaixaBancoPersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;
  late FinFechamentoCaixaBancoViewModel _finFechamentoCaixaBancoProvider;

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
    _finFechamentoCaixaBancoProvider = Provider.of<FinFechamentoCaixaBancoViewModel>(context);
	
    final importaBancoContaCaixaController = TextEditingController();
    importaBancoContaCaixaController.text = widget.finFechamentoCaixaBanco.bancoContaCaixa?.nome ?? '';
    final mesAnoController = MaskedTextController(
      mask: Constantes.mascaraMES_ANO,
      text: widget.finFechamentoCaixaBanco.mesAno ?? '',
    );
    final mesController = MaskedTextController(
      mask: Constantes.mascaraMES,
      text: widget.finFechamentoCaixaBanco.mes ?? '',
    );
    final anoController = MaskedTextController(
      mask: Constantes.mascaraANO,
      text: widget.finFechamentoCaixaBanco.ano ?? '',
    );
    final saldoAnteriorController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finFechamentoCaixaBanco.saldoAnterior ?? 0);
    final recebimentosController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finFechamentoCaixaBanco.recebimentos ?? 0);
    final pagamentosController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finFechamentoCaixaBanco.pagamentos ?? 0);
    final saldoContaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finFechamentoCaixaBanco.saldoConta ?? 0);
    final chequeNaoCompensadoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finFechamentoCaixaBanco.chequeNaoCompensado ?? 0);
    final saldoDisponivelController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finFechamentoCaixaBanco.saldoDisponivel ?? 0);
	
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
                                        widget.finFechamentoCaixaBanco.bancoContaCaixa?.nome = text;
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
                                          widget.finFechamentoCaixaBanco.idBancoContaCaixa = objetoJsonRetorno['id'];
                                          widget.finFechamentoCaixaBanco.bancoContaCaixa = BancoContaCaixa.fromJson(objetoJsonRetorno);
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
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a Data do Fechamento',
                                  'Data do Fechamento *',
                                  true),
                                isEmpty: widget.finFechamentoCaixaBanco.dataFechamento == null,
                                child: DatePickerItem(
                                  dateTime: widget.finFechamentoCaixaBanco.dataFechamento,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    setState(() {
                                      widget.finFechamentoCaixaBanco.dataFechamento = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
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
                                  widget.finFechamentoCaixaBanco.mesAno = text;
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
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
                                  widget.finFechamentoCaixaBanco.mes = text;
                                  _formFoiAlterado = true;
                                },
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: anoController,
                                maxLength: Constantes.mascaraANO.length,
                                decoration: getInputDecoration(
                                  'Informe o Ano',
                                  'Ano *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.finFechamentoCaixaBanco.ano = text;
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
                                controller: saldoAnteriorController,
                                decoration: getInputDecoration(
                                  'Informe o Valor do Saldo Anterior',
                                  'Valor Saldo Anterior',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finFechamentoCaixaBanco.saldoAnterior = saldoAnteriorController.numberValue;
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
                                controller: recebimentosController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Total de Recebimentos',
                                  'Total Recebimentos',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finFechamentoCaixaBanco.recebimentos = recebimentosController.numberValue;
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
                                controller: pagamentosController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Total de Pagamentos',
                                  'Total Pagamentos',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finFechamentoCaixaBanco.pagamentos = pagamentosController.numberValue;
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
                                controller: saldoContaController,
                                decoration: getInputDecoration(
                                  'Informe o Valor do Saldo em Conta',
                                  'Saldo em Conta',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finFechamentoCaixaBanco.saldoConta = saldoContaController.numberValue;
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
                                controller: chequeNaoCompensadoController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Total de Cheques Não Compensados',
                                  'Cheques Não Compensados',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finFechamentoCaixaBanco.chequeNaoCompensado = chequeNaoCompensadoController.numberValue;
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
                                controller: saldoDisponivelController,
                                decoration: getInputDecoration(
                                  'Informe o Valo do Saldo Disponível',
                                  'Saldo Disponível',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finFechamentoCaixaBanco.saldoDisponivel = saldoDisponivelController.numberValue;
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
          await _finFechamentoCaixaBancoProvider.alterar(widget.finFechamentoCaixaBanco);
        } else {
          await _finFechamentoCaixaBancoProvider.inserir(widget.finFechamentoCaixaBanco);
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
      await _finFechamentoCaixaBancoProvider.excluir(widget.finFechamentoCaixaBanco.id!);
      if (!mounted) return;
      Navigator.of(context).pop();
      Navigator.of(context).pop();
  	  showInSnackBar("Registro excluído com sucesso!", context, corFundo: Colors.green);
    });
  }  
}