/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage relacionada à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

import 'package:fenix/src/model/model.dart';

import 'package:fenix/src/view/shared/widgets_abas.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';

import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

class VendaOrcamentoCabecalhoPersistePage extends StatefulWidget {
  final VendaOrcamentoCabecalho? vendaOrcamentoCabecalho;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarVendaOrcamentoCabecalhoCallBack;
  final Function? atualizarVendaOrcamentoCabecalhoCallBack;

  const VendaOrcamentoCabecalhoPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.vendaOrcamentoCabecalho, this.foco, this.salvarVendaOrcamentoCabecalhoCallBack, this.atualizarVendaOrcamentoCabecalhoCallBack})
      : super(key: key);

  @override
  VendaOrcamentoCabecalhoPersistePageState createState() => VendaOrcamentoCabecalhoPersistePageState();
}

class VendaOrcamentoCabecalhoPersistePageState extends State<VendaOrcamentoCabecalhoPersistePage> {
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
        widget.salvarVendaOrcamentoCabecalhoCallBack!();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final importaVendaCondicoesPagamentoController = TextEditingController();
    importaVendaCondicoesPagamentoController.text = widget.vendaOrcamentoCabecalho?.vendaCondicoesPagamento?.nome ?? '';
    final importaVendedorController = TextEditingController();
    importaVendedorController.text = widget.vendaOrcamentoCabecalho?.vendedor?.colaborador?.pessoa?.nome ?? '';
    final importaClienteController = TextEditingController();
    importaClienteController.text = widget.vendaOrcamentoCabecalho?.cliente?.pessoa?.nome ?? '';
    final importaTransportadoraController = TextEditingController();
    importaTransportadoraController.text = widget.vendaOrcamentoCabecalho?.transportadora?.pessoa?.nome ?? '';
    final valorSubtotalController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaOrcamentoCabecalho?.valorSubtotal ?? 0);
    final valorFreteController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaOrcamentoCabecalho?.valorFrete ?? 0);
    final taxaDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.vendaOrcamentoCabecalho?.taxaDesconto ?? 0);
    final valorDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaOrcamentoCabecalho?.valorDesconto ?? 0);
    final valorTotalController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaOrcamentoCabecalho?.valorTotal ?? 0);

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
                                      controller: importaVendaCondicoesPagamentoController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe a Condição de Pagamento Vinculada',
                                        'Condição  Pagamento *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.vendaOrcamentoCabecalho?.vendaCondicoesPagamento?.nome = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Condição  Pagamento',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Condição  Pagamento',
                                                colunas: VendaCondicoesPagamento.colunas,
                                                campos: VendaCondicoesPagamento.campos,
                                                rota: '/venda-condicoes-pagamento/',
                                                campoPesquisaPadrao: 'nome',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['nome'] != null) {
                                          importaVendaCondicoesPagamentoController.text = objetoJsonRetorno['nome'];
                                          widget.vendaOrcamentoCabecalho?.idVendaCondicoesPagamento = objetoJsonRetorno['id'];
                                          widget.vendaOrcamentoCabecalho?.vendaCondicoesPagamento = VendaCondicoesPagamento.fromJson(objetoJsonRetorno);
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
                                      controller: importaVendedorController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe o Vendedor Vinculado',
                                        'Vendedor *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.vendaOrcamentoCabecalho?.vendedor?.colaborador?.pessoa?.nome = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Vendedor',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Vendedor',
                                                colunas: ViewPessoaVendedor.colunas,
                                                campos: ViewPessoaVendedor.campos,
                                                rota: '/view-pessoa-vendedor/',
                                                campoPesquisaPadrao: 'nome',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['nome'] != null) {
                                          importaVendedorController.text = objetoJsonRetorno['nome'];
                                          widget.vendaOrcamentoCabecalho?.idVendedor = objetoJsonRetorno['id'];  

                                          var vendedor = Vendedor();
                                          vendedor.colaborador = Colaborador();
                                          vendedor.colaborador!.pessoa = ViewPessoaColaborador();
                                          vendedor.id = objetoJsonRetorno['id'];
                                          vendedor.colaborador!.pessoa!.nome = objetoJsonRetorno['nome'];
                                          widget.vendaOrcamentoCabecalho?.vendedor = vendedor;
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
                                      controller: importaClienteController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe o Cliente Vinculado',
                                        'Cliente *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.vendaOrcamentoCabecalho?.cliente?.pessoa?.nome = text;
                                        paginaMestreDetalheFoiAlterada = true;
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
                                          importaClienteController.text = objetoJsonRetorno['nome'];
                                          widget.vendaOrcamentoCabecalho?.idCliente = objetoJsonRetorno['id'];

                                          var cliente = Cliente();
                                          cliente.pessoa = ViewPessoaCliente();
                                          cliente.id = objetoJsonRetorno['id'];
                                          cliente.pessoa!.nome = objetoJsonRetorno['nome'];
                                          widget.vendaOrcamentoCabecalho?.cliente = cliente;                                           
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
                                      controller: importaTransportadoraController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe a Transportadora Vinculada',
                                        'Transportadora *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.vendaOrcamentoCabecalho?.transportadora?.pessoa?.nome = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Transportadora',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Transportadora',
                                                colunas: ViewPessoaTransportadora.colunas,
                                                campos: ViewPessoaTransportadora.campos,
                                                rota: '/view-pessoa-transportadora/',
                                                campoPesquisaPadrao: 'nome',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['nome'] != null) {
                                          importaTransportadoraController.text = objetoJsonRetorno['nome'];
                                          widget.vendaOrcamentoCabecalho?.idTransportadora = objetoJsonRetorno['id'];

                                          var transportadora = Transportadora();
                                          transportadora.pessoa = ViewPessoaTransportadora();
                                          transportadora.id = objetoJsonRetorno['id'];
                                          transportadora.pessoa!.nome = objetoJsonRetorno['nome'];
                                          widget.vendaOrcamentoCabecalho?.transportadora = transportadora;
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
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 20,
                                maxLines: 1,
                                initialValue: widget.vendaOrcamentoCabecalho?.codigo ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Código do Orçamento',
                                  'Código do Orçamento',
                                  true, paddingVertical: 15),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaOrcamentoCabecalho?.codigo = text;
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
                                  'Informe a Data de Cadastro',
                                  'Data de Cadastro',
                                  true),
                                isEmpty: widget.vendaOrcamentoCabecalho?.dataCadastro == null,
                                child: DatePickerItem(
                                  mascara: 'EEE, d / MMM / yyyy',
                                  dateTime: widget.vendaOrcamentoCabecalho?.dataCadastro,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.vendaOrcamentoCabecalho?.dataCadastro = value;
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
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a Data de Entrega',
                                  'Data de Entrega',
                                  true),
                                isEmpty: widget.vendaOrcamentoCabecalho?.dataEntrega == null,
                                child: DatePickerItem(
                                  mascara: 'EEE, d / MMM / yyyy',
                                  dateTime: widget.vendaOrcamentoCabecalho?.dataEntrega,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.parse('2050-01-01'),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.vendaOrcamentoCabecalho?.dataEntrega = value;
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
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a Data de Validade',
                                  'Data de Validade',
                                  true),
                                isEmpty: widget.vendaOrcamentoCabecalho?.validade == null,
                                child: DatePickerItem(
                                  mascara: 'EEE, d / MMM / yyyy',
                                  dateTime: widget.vendaOrcamentoCabecalho?.validade,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.parse('2050-01-01'),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.vendaOrcamentoCabecalho?.validade = value;
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: valorSubtotalController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Subtotal',
                                  'Valor Subtotal',
                                  true, paddingVertical: 18),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaOrcamentoCabecalho?.valorSubtotal = valorSubtotalController.numberValue;
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
                                  'Informe o Tipo do Frete',
                                  'Tipo do Frete',
                                  true),
                                isEmpty: widget.vendaOrcamentoCabecalho?.tipoFrete == null,
                                child: getDropDownButton(widget.vendaOrcamentoCabecalho?.tipoFrete,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.vendaOrcamentoCabecalho?.tipoFrete = newValue;
                                    });
                                }, <String>[
                                  'CIF',
                                  'FOB',
                              ])),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: valorFreteController,
                                decoration: getInputDecoration(
                                  'Informe o Valor do Frete',
                                  'Valor Frete',
                                  true, paddingVertical: 18),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaOrcamentoCabecalho?.valorFrete = valorFreteController.numberValue;
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: taxaDescontoController,
                                decoration: getInputDecoration(
                                  'Informe a Taxa de Desconto',
                                  'Taxa Desconto',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaOrcamentoCabecalho?.taxaDesconto = taxaDescontoController.numberValue;
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
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: valorDescontoController,
                                decoration: getInputDecoration(
                                  'Informe o Valor do Desconto',
                                  'Valor Desconto',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaOrcamentoCabecalho?.valorDesconto = valorDescontoController.numberValue;
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
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: valorTotalController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Total',
                                  'Valor Total',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaOrcamentoCabecalho?.valorTotal = valorTotalController.numberValue;
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
                              initialValue: widget.vendaOrcamentoCabecalho?.observacao ?? '',
                              decoration: getInputDecoration(
                                'Observações Gerais',
                                'Observação',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.vendaOrcamentoCabecalho?.observacao = text;
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