/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage relacionada à tabela [FIN_LANCAMENTO_PAGAR] 
                                                                                
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
import 'package:fenix/src/infra/constantes.dart';
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
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/infra/valida_campo_formulario.dart';

class FinLancamentoPagarPersistePage extends StatefulWidget {
  final FinLancamentoPagar? finLancamentoPagar;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarFinLancamentoPagarCallBack;
  final Function? atualizarFinLancamentoPagarCallBack;

  const FinLancamentoPagarPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.finLancamentoPagar, this.foco, this.salvarFinLancamentoPagarCallBack, this.atualizarFinLancamentoPagarCallBack})
      : super(key: key);

  @override
  FinLancamentoPagarPersistePageState createState() => FinLancamentoPagarPersistePageState();
}

class FinLancamentoPagarPersistePageState extends State<FinLancamentoPagarPersistePage> {
  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

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
        widget.salvarFinLancamentoPagarCallBack!();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final importaFinDocumentoOrigemController = TextEditingController();
    importaFinDocumentoOrigemController.text = widget.finLancamentoPagar?.finDocumentoOrigem?.sigla ?? '';
    final importaFinNaturezaFinanceiraController = TextEditingController();
    importaFinNaturezaFinanceiraController.text = widget.finLancamentoPagar?.finNaturezaFinanceira?.descricao ?? '';
    final importaFornecedorController = TextEditingController();
    importaFornecedorController.text = widget.finLancamentoPagar?.fornecedor?.pessoa?.nome ?? '';
    final importaBancoContaCaixaController = TextEditingController();
    importaBancoContaCaixaController.text = widget.finLancamentoPagar?.bancoContaCaixa?.nome ?? '';
    final valorAPagarController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.finLancamentoPagar?.valorAPagar ?? 0);
    final diaFixoController = MaskedTextController(
      mask: Constantes.mascaraDIA,
      text: widget.finLancamentoPagar?.diaFixo ?? '',
    );

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
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    child: TextFormField(
                                      controller: importaFinDocumentoOrigemController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe o Documento de Origem Vinculado',
                                        'Documento Origem *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.finLancamentoPagar?.finDocumentoOrigem?.sigla = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Documento Origem',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Documento Origem',
                                                colunas: FinDocumentoOrigem.colunas,
                                                campos: FinDocumentoOrigem.campos,
                                                rota: '/fin-documento-origem/',
                                                campoPesquisaPadrao: 'sigla',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['sigla'] != null) {
                                          importaFinDocumentoOrigemController.text = objetoJsonRetorno['sigla'];
                                          widget.finLancamentoPagar!.idFinDocumentoOrigem = objetoJsonRetorno['id'];
                                          widget.finLancamentoPagar!.finDocumentoOrigem = FinDocumentoOrigem.fromJson(objetoJsonRetorno);
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
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    child: TextFormField(
                                      controller: importaFinNaturezaFinanceiraController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe a Natureza Financeira Vinculada',
                                        'Natureza Financeira *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.finLancamentoPagar?.finNaturezaFinanceira?.descricao = text;
                                        paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Natureza Financeira',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Natureza Financeira',
                                                colunas: FinNaturezaFinanceira.colunas,
                                                campos: FinNaturezaFinanceira.campos,
                                                rota: '/fin-natureza-financeira/',
                                                campoPesquisaPadrao: 'descricao',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['descricao'] != null) {
                                          importaFinNaturezaFinanceiraController.text = objetoJsonRetorno['descricao'];
                                          widget.finLancamentoPagar!.idFinNaturezaFinanceira = objetoJsonRetorno['id'];
                                          widget.finLancamentoPagar!.finNaturezaFinanceira = FinNaturezaFinanceira.fromJson(objetoJsonRetorno);
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
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    child: TextFormField(
                                      controller: importaFornecedorController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe o Fornecedor Vinculado',
                                        'Fornecedor *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      //validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.finLancamentoPagar?.fornecedor?.pessoa?.nome = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Fornecedor',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Fornecedor',
                                                colunas: Fornecedor.colunas,
                                                campos: Fornecedor.campos,
                                                rota: '/fornecedor/',
                                                campoPesquisaPadrao: 'pessoa?.nome',
                                                valorPesquisaPadrao: '',
                                              ),
                                              fullscreenDialog: true,
                                            )
                                        );
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['pessoa?.nome'] != null) {
                                          importaFornecedorController.text = objetoJsonRetorno['pessoa?.nome'];
                                          widget.finLancamentoPagar!.idFornecedor = objetoJsonRetorno['id'];
                                          widget.finLancamentoPagar!.fornecedor = Fornecedor.fromJson(objetoJsonRetorno);
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
                                        widget.finLancamentoPagar?.bancoContaCaixa?.nome = text;
                                  paginaMestreDetalheFoiAlterada = true;
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
                                          widget.finLancamentoPagar!.idBancoContaCaixa = objetoJsonRetorno['id'];
                                          widget.finLancamentoPagar!.bancoContaCaixa = BancoContaCaixa.fromJson(objetoJsonRetorno);
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
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: widget.finLancamentoPagar?.quantidadeParcela?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Informe a Quantidade de Parcelas',
                                  'Quantidade de Parcelas *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.finLancamentoPagar!.quantidadeParcela = int.tryParse(text);
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
                                textAlign: TextAlign.end,
                                controller: valorAPagarController,
                                decoration: getInputDecoration(
                                  'Informe o Valor a Pagar',
                                  'Valor a Pagar *',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarObrigatorioDecimal,
                                onChanged: (text) {
                                  widget.finLancamentoPagar!.valorAPagar = valorAPagarController.numberValue;
                                  paginaMestreDetalheFoiAlterada = true;
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
                                  'Informe a Data de Lançamento',
                                  'Data de Lançamento *',
                                  true),
                                isEmpty: widget.finLancamentoPagar!.dataLancamento == null,
                                child: DatePickerItem(
                                  dateTime: widget.finLancamentoPagar!.dataLancamento,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.finLancamentoPagar!.dataLancamento = value;
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
                              maxLength: 50,
                              maxLines: 1,
                              initialValue: widget.finLancamentoPagar?.numeroDocumento ?? '',
                              decoration: getInputDecoration(
                                'Informe o Número do Documento',
                                'Número do Documento',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.finLancamentoPagar!.numeroDocumento = text;
                                paginaMestreDetalheFoiAlterada = true;
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
                                  'Informe a Data do Primeiro Vencimento',
                                  'Data do Primeiro Vencimento',
                                  true),
                                isEmpty: widget.finLancamentoPagar!.primeiroVencimento == null,
                                child: DatePickerItem(
                                  dateTime: widget.finLancamentoPagar!.primeiroVencimento,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.parse('2100-01-01'),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.finLancamentoPagar!.primeiroVencimento = value;
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
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: widget.finLancamentoPagar?.intervaloEntreParcelas?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Intervalo Entre Parcelas (Dias)',
                                  'Intervalo Entre Parcelas',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.finLancamentoPagar!.intervaloEntreParcelas = int.tryParse(text);
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
                                controller: diaFixoController,
                                maxLength: Constantes.mascaraDIA.length,
                                decoration: getInputDecoration(
                                  'Informe o Dia Fixo para o Pagamento',
                                  'Dia Fixo',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarDIA,
                                onChanged: (text) {
                                  widget.finLancamentoPagar!.diaFixo = text;
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
                            child: TextFormField(
                              maxLength: 1000,
                              maxLines: 3,
                              initialValue: widget.finLancamentoPagar?.imagemDocumento ?? '',
                              decoration: getInputDecoration(
                                'Imagem Documento',
                                'Imagem Documento',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.finLancamentoPagar!.imagemDocumento = text;
                                paginaMestreDetalheFoiAlterada = true;
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
}