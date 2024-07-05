/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage relacionada à tabela [VENDA_CABECALHO] 
                                                                                
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

class VendaCabecalhoPersistePage extends StatefulWidget {
  final VendaCabecalho? vendaCabecalho;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarVendaCabecalhoCallBack;
  final Function? atualizarVendaCabecalhoCallBack;

  const VendaCabecalhoPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.vendaCabecalho, this.foco, this.salvarVendaCabecalhoCallBack, this.atualizarVendaCabecalhoCallBack})
      : super(key: key);

  @override
  VendaCabecalhoPersistePageState createState() => VendaCabecalhoPersistePageState();
}

class VendaCabecalhoPersistePageState extends State<VendaCabecalhoPersistePage> {
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
        widget.salvarVendaCabecalhoCallBack!();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final importaVendaOrcamentoCabecalhoController = TextEditingController();
    importaVendaOrcamentoCabecalhoController.text = widget.vendaCabecalho?.vendaOrcamentoCabecalho?.codigo ?? '';
    final importaVendaCondicoesPagamentoController = TextEditingController();
    importaVendaCondicoesPagamentoController.text = widget.vendaCabecalho?.vendaCondicoesPagamento?.nome ?? '';
    final importaNotaFiscalTipoController = TextEditingController();
    importaNotaFiscalTipoController.text = widget.vendaCabecalho?.notaFiscalTipo?.nome ?? '';
    final importaClienteController = TextEditingController();
    importaClienteController.text = widget.vendaCabecalho?.cliente?.pessoa?.nome ?? '';
    final importaTransportadoraController = TextEditingController();
    importaTransportadoraController.text = widget.vendaCabecalho?.transportadora?.pessoa?.nome ?? '';
    final importaVendedorController = TextEditingController();
    importaVendedorController.text = widget.vendaCabecalho?.vendedor?.colaborador?.pessoa?.nome ?? '';
    final horaSaidaController = MaskedTextController(
      mask: Constantes.mascaraHORA,
      text: widget.vendaCabecalho?.horaSaida ?? '',
    );
    final valorSubtotalController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaCabecalho?.valorSubtotal ?? 0);
    final valorComissaoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaCabecalho?.valorComissao ?? 0);
    final taxaDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.vendaCabecalho?.taxaDesconto ?? 0);
    final valorDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaCabecalho?.valorDesconto ?? 0);
    final valorFreteController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaCabecalho?.valorFrete ?? 0);
    final valorSeguroController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaCabecalho?.valorSeguro ?? 0);
    final valorTotalController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.vendaCabecalho?.valorTotal ?? 0);
    final importaDiaParcelaController = TextEditingController();
    importaDiaParcelaController.text = widget.vendaCabecalho?.diaFixoParcela ?? '';

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
                                      controller: importaVendaOrcamentoCabecalhoController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe o Orçamento Vinculado',
                                        'Orçamento',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      onChanged: (text) {
                                        widget.vendaCabecalho?.vendaOrcamentoCabecalho?.codigo = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Orçamento',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Orçamento',
                                                colunas: VendaOrcamentoCabecalho.colunas,
                                                campos: VendaOrcamentoCabecalho.campos,
                                                rota: '/venda-orcamento-cabecalho/',
                                                campoPesquisaPadrao: 'codigo',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['codigo'] != null) {
                                          importaVendaOrcamentoCabecalhoController.text = objetoJsonRetorno['codigo'];
                                          widget.vendaCabecalho?.idVendaOrcamentoCabecalho = objetoJsonRetorno['id'];
                                          widget.vendaCabecalho?.vendaOrcamentoCabecalho = VendaOrcamentoCabecalho.fromJson(objetoJsonRetorno);
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
                                        widget.vendaCabecalho?.vendaCondicoesPagamento?.nome = text;
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
                                          widget.vendaCabecalho?.idVendaCondicoesPagamento = objetoJsonRetorno['id'];
                                          widget.vendaCabecalho?.vendaCondicoesPagamento = VendaCondicoesPagamento.fromJson(objetoJsonRetorno);
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
                                      controller: importaNotaFiscalTipoController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe o Tipo da Nota Fiscal Vinculada',
                                        'Tipo Nota Fiscal',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      onChanged: (text) {
                                        widget.vendaCabecalho?.notaFiscalTipo?.nome = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Tipo Nota Fiscal',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Tipo Nota Fiscal',
                                                colunas: NotaFiscalTipo.colunas,
                                                campos: NotaFiscalTipo.campos,
                                                rota: '/nota-fiscal-tipo/',
                                                campoPesquisaPadrao: 'nome',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['nome'] != null) {
                                          importaNotaFiscalTipoController.text = objetoJsonRetorno['nome'];
                                          widget.vendaCabecalho?.idNotaFiscalTipo = objetoJsonRetorno['id'];
                                          widget.vendaCabecalho?.notaFiscalTipo = NotaFiscalTipo.fromJson(objetoJsonRetorno);
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
                                        widget.vendaCabecalho?.cliente?.pessoa?.nome = text;
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
                                          widget.vendaCabecalho?.idCliente = objetoJsonRetorno['id'];

                                          var cliente = Cliente();
                                          cliente.pessoa = ViewPessoaCliente();
                                          cliente.id = objetoJsonRetorno['id'];
                                          cliente.pessoa!.nome = objetoJsonRetorno['nome'];
                                          widget.vendaCabecalho?.cliente = cliente;
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
                                        widget.vendaCabecalho?.transportadora?.pessoa?.nome = text;
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
                                          widget.vendaCabecalho?.idTransportadora = objetoJsonRetorno['id'];

                                          var transportadora = Transportadora();
                                          transportadora.pessoa = ViewPessoaTransportadora();
                                          transportadora.id = objetoJsonRetorno['id'];
                                          transportadora.pessoa!.nome = objetoJsonRetorno['nome'];                                          
                                          widget.vendaCabecalho?.transportadora = transportadora;
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
                                        widget.vendaCabecalho?.vendedor?.colaborador?.pessoa?.nome = text;
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
                                          widget.vendaCabecalho?.idVendedor = objetoJsonRetorno['id'];

                                          var vendedor = Vendedor();
                                          vendedor.colaborador = Colaborador();
                                          vendedor.colaborador!.pessoa = ViewPessoaColaborador();
                                          vendedor.id = objetoJsonRetorno['id'];
                                          vendedor.colaborador!.pessoa!.nome = objetoJsonRetorno['nome'];                                         
                                          widget.vendaCabecalho?.vendedor = vendedor;
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
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a Data da Venda',
                                  'Data da Venda',
                                  true),
                                isEmpty: widget.vendaCabecalho?.dataVenda == null,
                                child: DatePickerItem(
                                  mascara: 'EEE, d / MMM / yyyy',
                                  dateTime: widget.vendaCabecalho?.dataVenda,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.parse('2050-01-01'),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.vendaCabecalho?.dataVenda = value;
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
                                  'Informe a Data da Saída',
                                  'Data da Saída',
                                  true),
                                isEmpty: widget.vendaCabecalho?.dataSaida == null,
                                child: DatePickerItem(
                                  mascara: 'EEE, d / MMM / yyyy',
                                  dateTime: widget.vendaCabecalho?.dataSaida,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.parse('2050-01-01'),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.vendaCabecalho?.dataSaida = value;
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
                                controller: horaSaidaController,
                                maxLength: Constantes.mascaraHORA.length,
                                decoration: getInputDecoration(
                                  'Informe a Hora da Saída',
                                  'Hora da Saída',
                                  true, paddingVertical: 15),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCabecalho?.horaSaida = text;
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
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                maxLines: 1,
                                initialValue: widget.vendaCabecalho?.numeroFatura?.toString() ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Número da Fatura',
                                  'Número da Fatura',
                                  true, paddingVertical: 15),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCabecalho?.numeroFatura = int.tryParse(text);
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
                                maxLength: 100,
                                maxLines: 1,
                                initialValue: widget.vendaCabecalho?.localEntrega ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Local de Entrega',
                                  'Local de Entrega',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCabecalho?.localEntrega = text;
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
                                maxLength: 100,
                                maxLines: 1,
                                initialValue: widget.vendaCabecalho?.localCobranca ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Local de Cobrança',
                                  'Local de Cobrança',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCabecalho?.localCobranca = text;
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
                            sizes: 'col-12 col-md-3',
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
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCabecalho?.valorSubtotal = valorSubtotalController.numberValue;
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
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: valorComissaoController,
                                decoration: getInputDecoration(
                                  'Informe o Valor da Comissão',
                                  'Valor Comissão',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCabecalho?.valorComissao = valorComissaoController.numberValue;
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
                                  widget.vendaCabecalho?.taxaDesconto = taxaDescontoController.numberValue;
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
                                  widget.vendaCabecalho?.valorDesconto = valorDescontoController.numberValue;
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
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'Tipo do Frete',
                                  true),
                                isEmpty: widget.vendaCabecalho?.tipoFrete == null,
                                child: getDropDownButton(widget.vendaCabecalho?.tipoFrete,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.vendaCabecalho?.tipoFrete = newValue;
                                    });
                                }, <String>[
                                  'CIF',
                                  'FOB',
                              ])),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
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
                                  widget.vendaCabecalho?.valorFrete = valorFreteController.numberValue;
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
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                controller: valorSeguroController,
                                decoration: getInputDecoration(
                                  'Informe o Valor do Seguro',
                                  'Valor Seguro',
                                  true, paddingVertical: 18),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCabecalho?.valorSeguro = valorSeguroController.numberValue;
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
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: valorTotalController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Total',
                                  'Valor Total',
                                  true, paddingVertical: 18),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.vendaCabecalho?.valorTotal = valorTotalController.numberValue;
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
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe o Forma de Pagamento',
                                  'Forma de Pagamento',
                                  true),
                                isEmpty: widget.vendaCabecalho?.formaPagamento == null,
                                child: getDropDownButton(widget.vendaCabecalho?.formaPagamento,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.vendaCabecalho?.formaPagamento = newValue;
                                    });
                                }, <String>[
                                  'Pagamento a Vista',
                                  'Pagamento a Prazo',
                                  'Outros',
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
                                  'Situação',
                                  true),
                                isEmpty: widget.vendaCabecalho?.situacao == null,
                                child: getDropDownButton(widget.vendaCabecalho?.situacao,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.vendaCabecalho?.situacao = newValue;
                                    });
                                }, <String>[
                                  'Digitação',
                                  'Produção',
                                  'Expedição',
                                  'Faturado',
                                  'Entregue',
                                  'Devolução',
                              ])),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: TextFormField(
                              controller: importaDiaParcelaController,
                              readOnly: true,
                              decoration: getInputDecoration(
                                'Informe o Dia Fixo da Parcela',
                                'Dia Fixo da Parcela',
                                true, paddingVertical: 18),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.vendaCabecalho?.diaFixoParcela = text;
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
                            child: TextFormField(
                              maxLength: 1000,
                              maxLines: 3,
                              initialValue: widget.vendaCabecalho?.observacao ?? '',
                              decoration: getInputDecoration(
                                'Observações Gerais',
                                'Observação',
                                false),
                              onSaved: (String? value) {
                              },
                              onChanged: (text) {
                                widget.vendaCabecalho?.observacao = text;
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