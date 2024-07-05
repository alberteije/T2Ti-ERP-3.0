// ignore_for_file: unnecessary_new

/*
Title: T2Ti ERP 3.0                                                                
Description: PersistePage relacionada à tabela [FIN_CONFIGURACAO_BOLETO] 
                                                                                
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

class FinConfiguracaoBoletoPersistePage extends StatefulWidget {
  final FinConfiguracaoBoleto finConfiguracaoBoleto;
  final String title;
  final String operacao;

  const FinConfiguracaoBoletoPersistePage({Key? key, required this.finConfiguracaoBoleto, required this.title, required this.operacao})
      : super(key: key);

  @override
  FinConfiguracaoBoletoPersistePageState createState() => FinConfiguracaoBoletoPersistePageState();
}

class FinConfiguracaoBoletoPersistePageState extends State<FinConfiguracaoBoletoPersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;
  late FinConfiguracaoBoletoViewModel _finConfiguracaoBoletoProvider;

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
    _finConfiguracaoBoletoProvider = Provider.of<FinConfiguracaoBoletoViewModel>(context);
	
    final importaBancoContaCaixaController = TextEditingController();
    importaBancoContaCaixaController.text = widget.finConfiguracaoBoleto.bancoContaCaixa?.nome ?? '';
    final taxaMultaController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finConfiguracaoBoleto.taxaMulta ?? 0);
    final taxaJuroController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.finConfiguracaoBoleto.taxaJuro ?? 0);
	
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
                                        widget.finConfiguracaoBoleto.bancoContaCaixa?.nome = text;
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
                                          widget.finConfiguracaoBoleto.idBancoContaCaixa = objetoJsonRetorno['id'];
                                          widget.finConfiguracaoBoleto.bancoContaCaixa = new BancoContaCaixa.fromJson(objetoJsonRetorno);
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
                                maxLength: 3,
                                maxLines: 1,
                                initialValue: widget.finConfiguracaoBoleto.carteira ?? '',
                                decoration: getInputDecoration(
                                  'Informe a Carteira do Boleto',
                                  'Carteira',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finConfiguracaoBoleto.carteira = text;
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
                                initialValue: widget.finConfiguracaoBoleto.codigoConvenio ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Código de Convênio do Boleto',
                                  'Código Convênio',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finConfiguracaoBoleto.codigoConvenio = text;
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
                                initialValue: widget.finConfiguracaoBoleto.codigoCedente ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Código de Cedente do Boleto',
                                  'Código Cedente',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finConfiguracaoBoleto.codigoCedente = text;
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
                                controller: taxaMultaController,
                                decoration: getInputDecoration(
                                  'Informe a Taxa de Multa',
                                  'Taxa Multa',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finConfiguracaoBoleto.taxaMulta = taxaMultaController.numberValue;
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
                                controller: taxaJuroController,
                                decoration: getInputDecoration(
                                  'Informe a Taxa de Juros',
                                  'Taxa Juros',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finConfiguracaoBoleto.taxaJuro = taxaJuroController.numberValue;
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
                                initialValue: widget.finConfiguracaoBoleto.diasProtesto?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Informe a Quantidade de Dias para Protesto',
                                  'Dias Protesto',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finConfiguracaoBoleto.diasProtesto = int.tryParse(text);
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
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 50,
                                maxLines: 1,
                                initialValue: widget.finConfiguracaoBoleto.nossoNumeroAnterior ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Nosso Número Anterior',
                                  'Nosso Número Anterior',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finConfiguracaoBoleto.nossoNumeroAnterior = text;
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
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 100,
                                maxLines: 1,
                                initialValue: widget.finConfiguracaoBoleto.instrucao01 ?? '',
                                decoration: getInputDecoration(
                                  'Informe a Instrução 01 do Boleto',
                                  'Instrução 01',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finConfiguracaoBoleto.instrucao01 = text;
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
                                initialValue: widget.finConfiguracaoBoleto.instrucao02 ?? '',
                                decoration: getInputDecoration(
                                  'Informe a Instrução 02 do Boleto',
                                  'Instrução 02',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finConfiguracaoBoleto.instrucao02 = text;
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
                              maxLength: 250,
                              maxLines: 3,
                              initialValue: widget.finConfiguracaoBoleto.caminhoArquivoRemessa ?? '',
                              decoration: getInputDecoration(
                                'Informe o Caminho Arquivo Remessa',
                                'Caminho Arquivo Remessa',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.finConfiguracaoBoleto.caminhoArquivoRemessa = text;
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
                              maxLength: 250,
                              maxLines: 3,
                              initialValue: widget.finConfiguracaoBoleto.caminhoArquivoRetorno ?? '',
                              decoration: getInputDecoration(
                                'Informe o Caminho Arquivo Retorno',
                                'Caminho Arquivo Retorno',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.finConfiguracaoBoleto.caminhoArquivoRetorno = text;
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
                              maxLength: 250,
                              maxLines: 3,
                              initialValue: widget.finConfiguracaoBoleto.caminhoArquivoLogotipo ?? '',
                              decoration: getInputDecoration(
                                'Informe o Caminho Arquivo Logotipo',
                                'Caminho Arquivo Logotipo',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.finConfiguracaoBoleto.caminhoArquivoLogotipo = text;
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
                              maxLength: 250,
                              maxLines: 3,
                              initialValue: widget.finConfiguracaoBoleto.caminhoArquivoPdf ?? '',
                              decoration: getInputDecoration(
                                'Informe o Caminho Arquivo PDF',
                                'Caminho Arquivo PDF',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.finConfiguracaoBoleto.caminhoArquivoPdf = text;
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
                              maxLength: 250,
                              maxLines: 3,
                              initialValue: widget.finConfiguracaoBoleto.mensagem ?? '',
                              decoration: getInputDecoration(
                                'Informe a Mensagem do Boleto',
                                'Mensagem',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.finConfiguracaoBoleto.mensagem = text;
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
                              maxLength: 100,
                              maxLines: 1,
                              initialValue: widget.finConfiguracaoBoleto.localPagamento ?? '',
                              decoration: getInputDecoration(
                                'Informe o Local de Pagamento do Boleto',
                                'Local Pagamento',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.finConfiguracaoBoleto.localPagamento = text;
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
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe o Layout de Remessa do Boleto',
                                  'Layout Remessa',
                                  true),
                                isEmpty: widget.finConfiguracaoBoleto.layoutRemessa == null,
                                child: getDropDownButton(widget.finConfiguracaoBoleto.layoutRemessa,
                                  (String? newValue) {
                                    setState(() {
                                      widget.finConfiguracaoBoleto.layoutRemessa = newValue;
                                    });
                                }, <String>[
                                  'CNAB 240',
                                  'CNAB 400',
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
                                  'Aceite',
                                  true),
                                isEmpty: widget.finConfiguracaoBoleto.aceite == null,
                                child: getDropDownButton(widget.finConfiguracaoBoleto.aceite,
                                  (String? newValue) {
                                    setState(() {
                                      widget.finConfiguracaoBoleto.aceite = newValue;
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
                                  'Selecione a Espécie do Boleto',
                                  'Espécie',
                                  true),
                                isEmpty: widget.finConfiguracaoBoleto.especie == null,
                                child: getDropDownButton(widget.finConfiguracaoBoleto.especie,
                                  (String? newValue) {
                                    setState(() {
                                      widget.finConfiguracaoBoleto.especie = newValue;
                                    });
                                }, <String>[
                                  'DM-Duplicata Mercantil',
                                  'DS-Duplicata de Serviços',
                                  'RC-Recibo',
                                  'NP-Nota Promissória',
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

  Future<void> _salvar() async {
    final FormState form = _formKey.currentState!;
    if (!form.validate()) {
      _autoValidate = AutovalidateMode.always;
      showInSnackBar(Constantes.mensagemCorrijaErrosFormSalvar, context);
    } else {
      gerarDialogBoxConfirmacao(context, Constantes.perguntaSalvarAlteracoes, () async {
        form.save();
        if (widget.operacao == 'A') {
          await _finConfiguracaoBoletoProvider.alterar(widget.finConfiguracaoBoleto);
        } else {
          await _finConfiguracaoBoletoProvider.inserir(widget.finConfiguracaoBoleto);
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
      await _finConfiguracaoBoletoProvider.excluir(widget.finConfiguracaoBoleto.id!);
      if (!mounted) return;
      Navigator.of(context).pop();
      Navigator.of(context).pop();
	    showInSnackBar("Registro excluído com sucesso!", context, corFundo: Colors.green);
    });
  }  
}