/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage relacionada à tabela [NFE_CABECALHO] 
                                                                                
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
import 'dart:io';

import 'package:fenix/src/infra/constantes.dart';
import 'package:fenix/src/infra/valida_campo_formulario.dart';
import 'package:fenix/src/model/nfe/nfe_fatura.dart';
import 'package:fenix/src/model/nfe/nfe_transporte.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:fenix/src/infra/biblioteca.dart';

import 'package:fenix/src/model/model.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:fenix/src/view/shared/widgets_abas.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:xml/xml.dart';

class EstoqueNfeCabecalhoPersistePage extends StatefulWidget {
  final NfeCabecalho nfeCabecalho;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarNfeCabecalhoCallBack;
  final Function? atualizarNfeCabecalhoCallBack;

  const EstoqueNfeCabecalhoPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, required this.nfeCabecalho, this.foco, this.salvarNfeCabecalhoCallBack, this.atualizarNfeCabecalhoCallBack})
      : super(key: key);

  @override
  EstoqueNfeCabecalhoPersistePageState createState() => EstoqueNfeCabecalhoPersistePageState();
}

class EstoqueNfeCabecalhoPersistePageState extends State<EstoqueNfeCabecalhoPersistePage> {
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
        widget.salvarNfeCabecalhoCallBack!();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final codigoModeloController = TextEditingController();
    codigoModeloController.text = widget.nfeCabecalho.codigoModelo ?? '';
    final importaNaturezaOperacaoController = TextEditingController();
    importaNaturezaOperacaoController.text = widget.nfeCabecalho.naturezaOperacao ?? '';
    final chaveAcessoController = TextEditingController();
    chaveAcessoController.text = widget.nfeCabecalho.chaveAcesso ?? '';
    final codigoNumericoController = TextEditingController();
    codigoNumericoController.text = widget.nfeCabecalho.codigoNumerico ?? '';
    final serieController = TextEditingController();
    serieController.text = widget.nfeCabecalho.serie ?? '';
    final numeroController = TextEditingController();
    numeroController.text = widget.nfeCabecalho.numero ?? '';
    final importaFornecedorController = TextEditingController();
    importaFornecedorController.text = widget.nfeCabecalho.fornecedor?.pessoa?.nome ?? '';

    final baseCalculoIcmsController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.baseCalculoIcms ?? 0);
    final valorIcmsController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.valorIcms ?? 0);
    final baseCalculoIcmsStController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.baseCalculoIcmsSt ?? 0);
    final valorIcmsStController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.valorIcmsSt ?? 0);
    final valorCofinsController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.valorCofins ?? 0);
    final valorIpiController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.valorIpi ?? 0);
    final valorFreteController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.valorFrete ?? 0);
    final valorSeguroController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.valorSeguro ?? 0);
    final valorDespesasAcessoriasController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.valorDespesasAcessorias ?? 0);
    final valorPisController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.valorPis ?? 0);
    final valorDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.valorDesconto ?? 0);
    final valorImpostoImportacaoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.valorImpostoImportacao ?? 0);
    final valorTotalProdutosController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.valorTotalProdutos ?? 0);
    final valorTotalController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho.valorTotal ?? 0);

    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        child: Scaffold(
          appBar: AppBar(
            leading: const SizedBox(),
            actions: <Widget>[
              IconButton(
                tooltip: 'Importar XML da Nota Fiscal',
                icon: const Icon(Icons.file_download, color: Colors.white),
                onPressed: () {
                  importarXmlNota();
                },
              ),
            ], 
          ),         
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
                            sizes: 'col-12',
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
                                        validator: ValidaCampoFormulario.validarObrigatorio,
                                        onChanged: (text) {
                                          widget.nfeCabecalho.fornecedor?.pessoa?.nome = text;
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
                                                  colunas: ViewPessoaFornecedor.colunas,
                                                  campos: ViewPessoaFornecedor.campos,
                                                  rota: '/view-pessoa-fornecedor/',
                                                  campoPesquisaPadrao: 'nome',
                                                  valorPesquisaPadrao: '%',
                                                ),
                                                fullscreenDialog: true,
                                              )
                                          );
                                        if (objetoJsonRetorno != null) {
                                          if (objetoJsonRetorno['nome'] != null) {
                                            importaFornecedorController.text = objetoJsonRetorno['nome'];
                                            widget.nfeCabecalho.idFornecedor = objetoJsonRetorno['id'];

                                            var fornecedor = Fornecedor();
                                            fornecedor.pessoa = ViewPessoaFornecedor();
                                            fornecedor.id = objetoJsonRetorno['id'];
                                            fornecedor.pessoa!.nome = objetoJsonRetorno['nome'];
                                            widget.nfeCabecalho.fornecedor = fornecedor;                                           
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
                      ),                      const Divider(color: Colors.white,),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLines: 1,
                                controller: codigoModeloController,
                                // initialValue: widget.nfeCabecalho.codigoModelo ?? '',
                                readOnly: true,
                                decoration: getInputDecoration(
                                  'Informe o Código do Modelo',
                                  'Código Modelo',
                                  false),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                controller: importaNaturezaOperacaoController,
                                maxLength: 60,
                                maxLines: 1,
                                readOnly: true,
                                // validator: ValidaCampoFormulario.validarObrigatorio,
                                //initialValue: widget.nfeCabecalho?.naturezaOperacao ?? '',
                                decoration: getInputDecoration(
                                  'Informe a Natureza da Operação',
                                  'Natureza da Operação',
                                  false),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                readOnly: true,
                                maxLength: 44,
                                maxLines: 1,
                                // initialValue: widget.nfeCabecalho.chaveAcesso ?? '',
                                controller: chaveAcessoController,
                                decoration: getInputDecoration(
                                  'Chave de Acesso - Gerado Automaticamente',
                                  'Chave de Acesso',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.nfeCabecalho.chaveAcesso = text;
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
                                readOnly: true,
                                maxLength: 8,
                                maxLines: 1,
                                controller: codigoNumericoController,
                                // initialValue: widget.nfeCabecalho.codigoNumerico ?? '',
                                decoration: getInputDecoration(
                                  'Código Numérico - Gerado Automaticamente',
                                  'Código Numérico',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.nfeCabecalho.codigoNumerico = text;
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
                                maxLength: 3,
                                maxLines: 1,
                                
                                controller: serieController,
                                // initialValue: widget.nfeCabecalho.serie ?? '',
                                decoration: getInputDecoration(
                                  'Informe a Série',
                                  'Série',
                                  false),
                                onSaved: (String? value) {
                                },
                                // validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.nfeCabecalho.serie = text;
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
                                readOnly: true,
                                maxLength: 9,
                                maxLines: 1,
                                controller: numeroController,
                                // initialValue: widget.nfeCabecalho.numero ?? '',
                                decoration: getInputDecoration(
                                  'Número - Gerado Automaticamente',
                                  'Número',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.nfeCabecalho.numero = text;
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
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a Data/Hora Emissão',
                                  'Data/Hora Emissão *',
                                  true),
                                isEmpty: widget.nfeCabecalho.dataHoraEmissao == null,
                                child: DatePickerItem(
                                  readOnly: true,
                                  mascara: "dd/MM/yyyy H:m",
                                  dateTime: widget.nfeCabecalho.dataHoraEmissao,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.nfeCabecalho.dataHoraEmissao = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a Data/Hora Entrada/Saída',
                                  'Data/Hora Entrada/Saída',
                                  true),
                                isEmpty: widget.nfeCabecalho.dataHoraEntradaSaida == null,
                                child: DatePickerItem(
                                  mascara: "dd/MM/yyyy H:m",
                                  dateTime: widget.nfeCabecalho.dataHoraEntradaSaida,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.nfeCabecalho.dataHoraEntradaSaida = value;
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
                          // BootstrapCol(
                          //   sizes: 'col-12 col-md-3',
                          //   child: Padding(
                          //     padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                          //     child: InputDecorator(
                          //       decoration: getInputDecoration(
                          //         'Selecione a Opção Desejada',
                          //         'Tipo Operação *',
                          //         true),
                          //       isEmpty: widget.nfeCabecalho.tipoOperacao == null,
                          //       child: getDropDownButton(widget.nfeCabecalho.tipoOperacao,
                          //         (String? newValue) {
                          //           paginaMestreDetalheFoiAlterada = true;
                          //           setState(() {
                          //             widget.nfeCabecalho.tipoOperacao = newValue;
                          //           });
                          //       }, <String>[
                          //         '0=Entrada',
                          //         '1=Saída',
                          //     ])),
                          //   ),
                          // ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'Tipo de Emissão *',
                                  true),
                                isEmpty: widget.nfeCabecalho.tipoEmissao == null,
                                child: getDropDownButton(widget.nfeCabecalho.tipoEmissao,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.nfeCabecalho.tipoEmissao = newValue;
                                    });
                                }, <String>[
                                  '1=Emissão normal',
                                  '2=Contingência FS-IA',
                                  '4=Contingência EPEC',
                                  '5=Contingência FS-DA',
                                  '6=Contingência SVC-AN',
                                  '7=Contingência SVC-RS',
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
                                  'Formato de Impressão do DANFE *',
                                  true),
                                isEmpty: widget.nfeCabecalho.formatoImpressaoDanfe == null,
                                child: getDropDownButton(widget.nfeCabecalho.formatoImpressaoDanfe,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.nfeCabecalho.formatoImpressaoDanfe = newValue;
                                    });
                                }, <String>[
                                  '0=Sem geração de DANFE',
                                  '1=DANFE normal, Retrato',
                                  '2=DANFE normal, Paisagem',
                                  '3=DANFE Simplificado',
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
                                  'Finalidade Emissão *',
                                  true),
                                isEmpty: widget.nfeCabecalho.finalidadeEmissao == null,
                                child: getDropDownButton(widget.nfeCabecalho.finalidadeEmissao,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.nfeCabecalho.finalidadeEmissao = newValue;
                                    });
                                }, <String>[
                                  '1=NF-e normal',
                                  '2=NF-e complementar',
                                  '3=NF-e de ajuste',
                                  '4=Devolução de mercadoria',
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
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: baseCalculoIcmsController,
                                decoration: getInputDecoration(
                                  'Informe a Base de Cálculo do ICMS',
                                  'Base Cálculo ICMS',
                                  false),
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
                                controller: valorIcmsController,
                                decoration: getInputDecoration(
                                  'Informe o Valor do ICMS',
                                  'Valor do ICMS',
                                  false),
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
                                controller: baseCalculoIcmsStController,
                                decoration: getInputDecoration(
                                  'Informe a Base de Cálculo do ICMS ST',
                                  'Base Cálculo ICMS ST',
                                  false),
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
                                controller: valorIcmsStController,
                                decoration: getInputDecoration(
                                  'Informe o Valor do ICMS ST',
                                  'Valor do ICMS ST',
                                  false),
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
                                controller: valorCofinsController,
                                decoration: getInputDecoration(
                                  'Informe o Valor COFINS',
                                  'Valor COFINS',
                                  false),
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
                                controller: valorIpiController,
                                decoration: getInputDecoration(
                                  'Informe o Valor IPI',
                                  'Valor IPI',
                                  false),
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
                                controller: valorFreteController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Frete',
                                  'Valor Frete',
                                  false),
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
                                controller: valorSeguroController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Seguro',
                                  'Valor Seguro',
                                  false),
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
                                controller: valorDespesasAcessoriasController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Despesas Acessórias',
                                  'Valor Despesas Acessórias',
                                  false),
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
                                controller: valorPisController,
                                decoration: getInputDecoration(
                                  'Informe o Valor PIS',
                                  'Valor PIS',
                                  false),
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
                                  'Informe o Valor Desconto',
                                  'Valor Desconto',
                                  false),
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
                                controller: valorImpostoImportacaoController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Imposto Importação',
                                  'Valor Imposto Importação',
                                  false),
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
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: valorTotalProdutosController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Total Produtos',
                                  'Valor Total Produtos',
                                  false),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                textAlign: TextAlign.end,
                                controller: valorTotalController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Total NF',
                                  'Valor Total NF',
                                  false),
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


  importarXmlNota() {
    
    gerarDialogBoxConfirmacao(context, 'Deseja importar o arquivo XML da nota?', () async {
      try {
        FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
          type: FileType.custom, 
          allowedExtensions: ['xml'],
          dialogTitle: 'Selecione o arquivo XML da nota fiscal'
        );
        if(filePickerResult != null) {
          File arquivoSelecionado = File(filePickerResult.files.single.path!);
          final xmlDocument = XmlDocument.parse(arquivoSelecionado.readAsStringSync());

          // infNFe
          final infNFe = xmlDocument.findAllElements('infNFe').toList();
          if (infNFe.isNotEmpty) {
            widget.nfeCabecalho.chaveAcesso = infNFe[0].getAttribute('Id')?.substring(3);
          }

          // infAdic
          final infAdic = xmlDocument.findAllElements('infAdic').toList();
          if (infAdic.isNotEmpty) {
            widget.nfeCabecalho.informacoesAddFisco = pegarElementoXML(infNFe[0].findElements('infCpl'), false);
          }

          // ide
          final ide = xmlDocument.findAllElements('ide').toList();
          if (ide.isNotEmpty) {
            widget.nfeCabecalho.ufEmitente = int.parse(pegarElementoXML(ide[0].findElements('cUF'), true));
            widget.nfeCabecalho.codigoNumerico = pegarElementoXML(ide[0].findElements('cNF'), false);
            widget.nfeCabecalho.naturezaOperacao = pegarElementoXML(ide[0].findElements('natOp'), false);
            widget.nfeCabecalho.codigoModelo = pegarElementoXML(ide[0].findElements('mod'), false);
            widget.nfeCabecalho.serie = pegarElementoXML(ide[0].findElements('serie'), false);
            widget.nfeCabecalho.numero = pegarElementoXML(ide[0].findElements('nNF'), false);
            widget.nfeCabecalho.dataHoraEmissao = DateTime.parse(pegarElementoXML(ide[0].findElements('dEmi'), true));
            widget.nfeCabecalho.dataHoraEntradaSaida = DateTime.parse(pegarElementoXML(ide[0].findElements('dSaiEnt'), true));
            widget.nfeCabecalho.tipoOperacao = '0'; // entrada
            widget.nfeCabecalho.codigoMunicipio = int.parse(pegarElementoXML(ide[0].findElements('cMunFG'), true));
            widget.nfeCabecalho.formatoImpressaoDanfe = widget.nfeCabecalho.getFormatoImpressaoDanfe(pegarElementoXML(ide[0].findElements('tpImp'), false));
            widget.nfeCabecalho.tipoEmissao = widget.nfeCabecalho.getTipoEmissao(pegarElementoXML(ide[0].findElements('tpEmis'), false));
            widget.nfeCabecalho.digitoChaveAcesso = pegarElementoXML(ide[0].findElements('cDV'), false);
            widget.nfeCabecalho.ambiente = pegarElementoXML(ide[0].findElements('tpAmb'), false);
            widget.nfeCabecalho.finalidadeEmissao = widget.nfeCabecalho.getFinalidadeEmissao(pegarElementoXML(ide[0].findElements('finNFe'), false));
            widget.nfeCabecalho.processoEmissao = pegarElementoXML(ide[0].findElements('procEmi'), false);
            widget.nfeCabecalho.versaoProcessoEmissao = pegarElementoXML(ide[0].findElements('verProc'), false);            
          }

          // emit
          widget.nfeCabecalho.nfeEmitente ??= NfeEmitente();
          final emit = xmlDocument.findAllElements('emit').toList();
          if (emit.isNotEmpty) {
            widget.nfeCabecalho.nfeEmitente!.cnpj = pegarElementoXML(emit[0].findElements('CNPJ'), false);
            widget.nfeCabecalho.nfeEmitente!.cpf = pegarElementoXML(emit[0].findElements('CPF'), false);
            widget.nfeCabecalho.nfeEmitente!.nome = pegarElementoXML(emit[0].findElements('xNome'), false);
            widget.nfeCabecalho.nfeEmitente!.fantasia = pegarElementoXML(emit[0].findElements('xFant'), false);
            widget.nfeCabecalho.nfeEmitente!.inscricaoEstadual = pegarElementoXML(emit[0].findElements('IE'), false);
            widget.nfeCabecalho.nfeEmitente!.inscricaoMunicipal = pegarElementoXML(emit[0].findElements('IEST'), false);
          }
          final enderEmit = xmlDocument.findAllElements('enderEmit').toList();
          if (enderEmit.isNotEmpty) {          
            widget.nfeCabecalho.nfeEmitente!.logradouro = pegarElementoXML(enderEmit[0].findElements('xLgr'), false);
            widget.nfeCabecalho.nfeEmitente!.numero = pegarElementoXML(enderEmit[0].findElements('nro'), false);
            widget.nfeCabecalho.nfeEmitente!.bairro = pegarElementoXML(enderEmit[0].findElements('xBairro'), false);
            widget.nfeCabecalho.nfeEmitente!.codigoMunicipio = int.parse(pegarElementoXML(enderEmit[0].findElements('cMun'), true));
            widget.nfeCabecalho.nfeEmitente!.nomeMunicipio = pegarElementoXML(enderEmit[0].findElements('xMun'), false);
            widget.nfeCabecalho.nfeEmitente!.uf = pegarElementoXML(enderEmit[0].findElements('UF'), false);
            widget.nfeCabecalho.nfeEmitente!.cep = pegarElementoXML(enderEmit[0].findElements('CEP'), false);
            widget.nfeCabecalho.nfeEmitente!.codigoPais = int.parse(pegarElementoXML(enderEmit[0].findElements('cPais'), true));
            widget.nfeCabecalho.nfeEmitente!.nomePais = pegarElementoXML(enderEmit[0].findElements('xPais'), false);
            widget.nfeCabecalho.nfeEmitente!.telefone = pegarElementoXML(enderEmit[0].findElements('fone'), false);
          }

          // dest
          widget.nfeCabecalho.nfeDestinatario ??= NfeDestinatario();
          final dest = xmlDocument.findAllElements('dest').toList();
          if (dest.isNotEmpty) {
            widget.nfeCabecalho.nfeDestinatario!.cnpj = pegarElementoXML(dest[0].findElements('CNPJ'), false);
            widget.nfeCabecalho.nfeDestinatario!.cpf = pegarElementoXML(dest[0].findElements('CPF'), false);
            widget.nfeCabecalho.nfeDestinatario!.nome = pegarElementoXML(dest[0].findElements('xNome'), false);
            widget.nfeCabecalho.nfeDestinatario!.inscricaoEstadual = pegarElementoXML(dest[0].findElements('IE'), false);
            widget.nfeCabecalho.nfeDestinatario!.inscricaoMunicipal = pegarElementoXML(dest[0].findElements('IEST'), false);
          }
          final enderDest = xmlDocument.findAllElements('enderDest').toList();
          if (enderDest.isNotEmpty) {          
            widget.nfeCabecalho.nfeDestinatario!.logradouro = pegarElementoXML(enderDest[0].findElements('xLgr'), false);
            widget.nfeCabecalho.nfeDestinatario!.numero = pegarElementoXML(enderDest[0].findElements('nro'), false);
            widget.nfeCabecalho.nfeDestinatario!.bairro = pegarElementoXML(enderDest[0].findElements('xBairro'), false);
            widget.nfeCabecalho.nfeDestinatario!.codigoMunicipio = int.parse(pegarElementoXML(enderDest[0].findElements('cMun'), true));
            widget.nfeCabecalho.nfeDestinatario!.nomeMunicipio = pegarElementoXML(enderDest[0].findElements('xMun'), false);
            widget.nfeCabecalho.nfeDestinatario!.uf = pegarElementoXML(enderDest[0].findElements('UF'), false);
            widget.nfeCabecalho.nfeDestinatario!.cep = pegarElementoXML(enderDest[0].findElements('CEP'), false);
            widget.nfeCabecalho.nfeDestinatario!.codigoPais = int.parse(pegarElementoXML(enderDest[0].findElements('cPais'), true));
            widget.nfeCabecalho.nfeDestinatario!.nomePais = pegarElementoXML(enderDest[0].findElements('xPais'), false);
            widget.nfeCabecalho.nfeDestinatario!.telefone = pegarElementoXML(enderDest[0].findElements('fone'), false);
          }          

          // ICMSTot
          final icmsTot = xmlDocument.findAllElements('ICMSTot').toList();
          if (icmsTot.isNotEmpty) {       
            widget.nfeCabecalho.baseCalculoIcms = double.parse(pegarElementoXML(icmsTot[0].findElements('vBC'), true));
            widget.nfeCabecalho.valorIcms = double.parse(pegarElementoXML(icmsTot[0].findElements('vICMS'), true));
            widget.nfeCabecalho.baseCalculoIcmsSt = double.parse(pegarElementoXML(icmsTot[0].findElements('vBCST'), true));
            widget.nfeCabecalho.valorIcmsSt = double.parse(pegarElementoXML(icmsTot[0].findElements('vST'), true));
            widget.nfeCabecalho.valorTotalProdutos = double.parse(pegarElementoXML(icmsTot[0].findElements('vProd'), true));
            widget.nfeCabecalho.valorFrete = double.parse(pegarElementoXML(icmsTot[0].findElements('vFrete'), true));
            widget.nfeCabecalho.valorSeguro = double.parse(pegarElementoXML(icmsTot[0].findElements('vSeg'), true));
            widget.nfeCabecalho.valorDesconto = double.parse(pegarElementoXML(icmsTot[0].findElements('vDesc'), true));
            widget.nfeCabecalho.valorImpostoImportacao = double.parse(pegarElementoXML(icmsTot[0].findElements('vII'), true));
            widget.nfeCabecalho.valorIpi = double.parse(pegarElementoXML(icmsTot[0].findElements('vIPI'), true));
            widget.nfeCabecalho.valorPis = double.parse(pegarElementoXML(icmsTot[0].findElements('vPIS'), true));
            widget.nfeCabecalho.valorCofins = double.parse(pegarElementoXML(icmsTot[0].findElements('vCOFINS'), true));
            widget.nfeCabecalho.valorDespesasAcessorias = double.parse(pegarElementoXML(icmsTot[0].findElements('vOutro'), true));
            widget.nfeCabecalho.valorTotal = double.parse(pegarElementoXML(icmsTot[0].findElements('vNF'), true));
          }

          // transp
          widget.nfeCabecalho.nfeTransporte ??= NfeTransporte();
          final transp = xmlDocument.findAllElements('transp').toList();
          if (transp.isNotEmpty) {
            widget.nfeCabecalho.nfeTransporte!.modalidadeFrete = pegarElementoXML(transp[0].findElements('modFrete'), false);
          }
          final transporta = xmlDocument.findAllElements('transporta').toList();
          if (transporta.isNotEmpty) {
            widget.nfeCabecalho.nfeTransporte!.nome = pegarElementoXML(transporta[0].findElements('xNome'), false);
            widget.nfeCabecalho.nfeTransporte!.endereco = pegarElementoXML(transporta[0].findElements('xEnder'), false);
            widget.nfeCabecalho.nfeTransporte!.nomeMunicipio = pegarElementoXML(transporta[0].findElements('xMun'), false);
            widget.nfeCabecalho.nfeTransporte!.uf = pegarElementoXML(transporta[0].findElements('UF'), false);
          }          
          final veicTransp = xmlDocument.findAllElements('veicTransp').toList();
          if (veicTransp.isNotEmpty) {
            widget.nfeCabecalho.nfeTransporte!.placaVeiculo = pegarElementoXML(veicTransp[0].findElements('placa'), false);
            widget.nfeCabecalho.nfeTransporte!.ufVeiculo = pegarElementoXML(veicTransp[0].findElements('UF'), false);
          }

          // fat
          widget.nfeCabecalho.nfeFatura ??= NfeFatura();
          final fat = xmlDocument.findAllElements('fat').toList();
          if (fat.isNotEmpty) {
            widget.nfeCabecalho.nfeFatura!.numero = pegarElementoXML(fat[0].findElements('nFat'), false);
            widget.nfeCabecalho.nfeFatura!.valorOriginal = double.parse(pegarElementoXML(fat[0].findElements('vOrig'), true));
            widget.nfeCabecalho.nfeFatura!.valorLiquido = double.parse(pegarElementoXML(fat[0].findElements('vLiq'), true));
          }

          // det
        final det = xmlDocument.findAllElements('det').toList();
        for (var detalhe in det) {
          NfeDetalhe nfeDetalhe = NfeDetalhe();

          // prod
          final prod = detalhe.findAllElements('prod').toList();
          if (prod.isNotEmpty) {
            nfeDetalhe.numeroItem = int.parse(detalhe.getAttribute('nItem') ?? '');
            nfeDetalhe.codigoProduto = pegarElementoXML(prod[0].findElements('cProd'), false);
            nfeDetalhe.gtin = pegarElementoXML(prod[0].findElements('cEAN'), false);
            nfeDetalhe.gtinUnidadeTributavel = pegarElementoXML(prod[0].findElements('cEANTrib'), false);
            nfeDetalhe.nomeProduto = pegarElementoXML(prod[0].findElements('xProd'), false);
            nfeDetalhe.ncm = pegarElementoXML(prod[0].findElements('NCM'), false);
            nfeDetalhe.cfop = int.parse(pegarElementoXML(prod[0].findElements('CFOP'), true));
            nfeDetalhe.unidadeComercial = pegarElementoXML(prod[0].findElements('uCom'), false);
            nfeDetalhe.unidadeTributavel = pegarElementoXML(prod[0].findElements('uTrib'), false);
            nfeDetalhe.quantidadeComercial = double.parse(pegarElementoXML(prod[0].findElements('qCom'), true));
            nfeDetalhe.valorUnitarioComercial = double.parse(pegarElementoXML(prod[0].findElements('vUnCom'), true));
            nfeDetalhe.valorBrutoProduto = double.parse(pegarElementoXML(prod[0].findElements('vProd'), true));
            nfeDetalhe.valorTotal = double.parse(pegarElementoXML(prod[0].findElements('vProd'), true));
            nfeDetalhe.valorDesconto = double.parse(pegarElementoXML(prod[0].findElements('vDesc'), true));
            nfeDetalhe.valorOutrasDespesas = double.parse(pegarElementoXML(prod[0].findElements('vOutro'), true));
            nfeDetalhe.valorFrete = double.parse(pegarElementoXML(prod[0].findElements('vFrete'), true));
            nfeDetalhe.valorSeguro = double.parse(pegarElementoXML(prod[0].findElements('vSeg'), true));
            nfeDetalhe.quantidadeTributavel = double.parse(pegarElementoXML(prod[0].findElements('qTrib'), true));
            nfeDetalhe.valorUnitarioTributavel = double.parse(pegarElementoXML(prod[0].findElements('vUnTrib'), true));
            nfeDetalhe.valorTotalTributos = double.parse(pegarElementoXML(prod[0].findElements('vTotTrib'), true));

            // produto
            nfeDetalhe.produto = Produto();
            nfeDetalhe.produto!.nome = nfeDetalhe.nomeProduto;
            nfeDetalhe.produto!.descricao = nfeDetalhe.nomeProduto;
            nfeDetalhe.produto!.gtin = nfeDetalhe.gtin;
            nfeDetalhe.produto!.valorCompra = nfeDetalhe.valorUnitarioComercial;
            nfeDetalhe.produto!.valorVenda = nfeDetalhe.valorUnitarioComercial;
            nfeDetalhe.produto!.codigoNcm = nfeDetalhe.ncm;
            nfeDetalhe.produto!.quantidadeEstoque = nfeDetalhe.quantidadeComercial;
            nfeDetalhe.produto!.dataCadastro = DateTime.now();
            nfeDetalhe.produto!.idProdutoMarca = 1;
            nfeDetalhe.produto!.idProdutoSubgrupo = 1;
            nfeDetalhe.produto!.idProdutoUnidade = 1;
          }

          // imposto
          final imposto = detalhe.findAllElements('imposto').toList();
          if (imposto.isNotEmpty) {   
            // ICMS
            nfeDetalhe.nfeDetalheImpostoIcms = NfeDetalheImpostoIcms();
            for (var tipoIcms in listaTipoIcms) {
              final icms = imposto[0].findAllElements(tipoIcms).toList();
              if (icms.isNotEmpty) {   
                nfeDetalhe.nfeDetalheImpostoIcms!.origemMercadoria = pegarElementoXML(icms[0].findElements('orig'), false);
                nfeDetalhe.nfeDetalheImpostoIcms!.cstIcms = pegarElementoXML(icms[0].findElements('CST'), false);
                nfeDetalhe.nfeDetalheImpostoIcms!.csosn = pegarElementoXML(icms[0].findElements('CSOSN'), false);
                nfeDetalhe.nfeDetalheImpostoIcms!.modalidadeBcIcms = pegarElementoXML(icms[0].findElements('modBC'), false);
                nfeDetalhe.nfeDetalheImpostoIcms!.percentualReducaoBcIcms = double.parse(pegarElementoXML(icms[0].findElements('pRedBC'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorBcIcms = double.parse(pegarElementoXML(icms[0].findElements('vBC'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.aliquotaIcms = double.parse(pegarElementoXML(icms[0].findElements('pICMS'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorIcms = double.parse(pegarElementoXML(icms[0].findElements('vICMS'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.baseCalculoFcp = double.parse(pegarElementoXML(icms[0].findElements('vBCFCP'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.percentualFcp = double.parse(pegarElementoXML(icms[0].findElements('pFCP'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorFcp = double.parse(pegarElementoXML(icms[0].findElements('vFCP'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.modalidadeBcIcmsSt = pegarElementoXML(icms[0].findElements('modBCST'), false);
                nfeDetalhe.nfeDetalheImpostoIcms!.percentualMvaIcmsSt = double.parse(pegarElementoXML(icms[0].findElements('pMVAST'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.percentualReducaoBcIcmsSt = double.parse(pegarElementoXML(icms[0].findElements('pRedBCST'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorBaseCalculoIcmsSt = double.parse(pegarElementoXML(icms[0].findElements('vBCST'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.aliquotaIcmsSt = double.parse(pegarElementoXML(icms[0].findElements('pICMSST'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorIcmsSt = double.parse(pegarElementoXML(icms[0].findElements('vICMSST'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.baseCalculoFcpSt = double.parse(pegarElementoXML(icms[0].findElements('vBCFCPST'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.percentualFcpSt = double.parse(pegarElementoXML(icms[0].findElements('pFCPST'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorFcpSt = double.parse(pegarElementoXML(icms[0].findElements('vFCPST'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.ufSt = pegarElementoXML(icms[0].findElements('UFST'), false);
                nfeDetalhe.nfeDetalheImpostoIcms!.percentualBcOperacaoPropria = double.parse(pegarElementoXML(icms[0].findElements('pBCOp'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorBcIcmsStRetido = double.parse(pegarElementoXML(icms[0].findElements('vBCSTRet'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.aliquotaSuportadaConsumidor = double.parse(pegarElementoXML(icms[0].findElements('pST'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorIcmsStRetido = double.parse(pegarElementoXML(icms[0].findElements('vICMSSTRet'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.baseCalculoFcpStRetido = double.parse(pegarElementoXML(icms[0].findElements('vBCFCPSTRet'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.percentualFcpStRetido = double.parse(pegarElementoXML(icms[0].findElements('pFCPSTRet'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorFcpStRetido = double.parse(pegarElementoXML(icms[0].findElements('vFCPSTRet'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.motivoDesoneracaoIcms = pegarElementoXML(icms[0].findElements('motDesICMS'), false);
                nfeDetalhe.nfeDetalheImpostoIcms!.aliquotaCreditoIcmsSn = double.parse(pegarElementoXML(icms[0].findElements('pCredSN'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorCreditoIcmsSn = double.parse(pegarElementoXML(icms[0].findElements('vCredICMSSN'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorBcIcmsStDestino = double.parse(pegarElementoXML(icms[0].findElements('vBCSTDest'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorIcmsStDestino = double.parse(pegarElementoXML(icms[0].findElements('vICMSSTDest'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorIcmsDesonerado = double.parse(pegarElementoXML(icms[0].findElements('vICMSDeson'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorIcmsOperacao = double.parse(pegarElementoXML(icms[0].findElements('vICMSOp'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.percentualDiferimento = double.parse(pegarElementoXML(icms[0].findElements('pDif'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorIcmsDiferido = double.parse(pegarElementoXML(icms[0].findElements('vICMSDif'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.percentualReducaoBcEfetivo = double.parse(pegarElementoXML(icms[0].findElements('pRedBCEfet'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorBcEfetivo = double.parse(pegarElementoXML(icms[0].findElements('vBCEfet'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.aliquotaIcmsEfetivo = double.parse(pegarElementoXML(icms[0].findElements('pICMSEfet'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorIcmsEfetivo = double.parse(pegarElementoXML(icms[0].findElements('vICMSEfet'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorIcmsSubstituto = double.parse(pegarElementoXML(icms[0].findElements('vICMSSubstituto'), true));
                nfeDetalhe.nfeDetalheImpostoIcms!.valorIcmsDesonerado = double.parse(pegarElementoXML(icms[0].findElements('vICMSSTDeson'), true));
                break; // sai do laço, porque só haverá um tipo de ICMS no arquivo
              }             
            }

            // IPI
            nfeDetalhe.nfeDetalheImpostoIpi = NfeDetalheImpostoIpi();
            final ipi = imposto[0].findAllElements('IPI').toList();
            if (ipi.isNotEmpty) { 
              nfeDetalhe.nfeDetalheImpostoIpi!.cstIpi = pegarElementoXML(ipi[0].findElements('CST'), false);
              nfeDetalhe.nfeDetalheImpostoIpi!.valorBaseCalculoIpi = double.parse(pegarElementoXML(ipi[0].findElements('vBC'), true));
              nfeDetalhe.nfeDetalheImpostoIpi!.aliquotaIpi = double.parse(pegarElementoXML(ipi[0].findElements('pIPI'), true));
              nfeDetalhe.nfeDetalheImpostoIpi!.valorIpi = double.parse(pegarElementoXML(ipi[0].findElements('vIPI'), true));
            }        

            // PIS
            nfeDetalhe.nfeDetalheImpostoPis = NfeDetalheImpostoPis();
            final pis = imposto[0].findAllElements('PIS').toList();
            if (pis.isNotEmpty) { 
              nfeDetalhe.nfeDetalheImpostoPis!.cstPis = pegarElementoXML(pis[0].findElements('CST'), false);
              nfeDetalhe.nfeDetalheImpostoPis!.valorBaseCalculoPis = double.parse(pegarElementoXML(pis[0].findElements('vBC'), true));
              nfeDetalhe.nfeDetalheImpostoPis!.aliquotaPisPercentual = double.parse(pegarElementoXML(pis[0].findElements('pPIS'), true));
              nfeDetalhe.nfeDetalheImpostoPis!.aliquotaPisReais = double.parse(pegarElementoXML(pis[0].findElements('pPIS'), true));
              nfeDetalhe.nfeDetalheImpostoPis!.valorPis = double.parse(pegarElementoXML(pis[0].findElements('vPIS'), true));
            }  
          
             // COFINS
            nfeDetalhe.nfeDetalheImpostoCofins = NfeDetalheImpostoCofins();
            final cofins = imposto[0].findAllElements('COFINS').toList();
            if (cofins.isNotEmpty) { 
              nfeDetalhe.nfeDetalheImpostoCofins!.cstCofins = pegarElementoXML(cofins[0].findElements('CST'), false);
              nfeDetalhe.nfeDetalheImpostoCofins!.baseCalculoCofins = double.parse(pegarElementoXML(cofins[0].findElements('vBC'), true));
              nfeDetalhe.nfeDetalheImpostoCofins!.aliquotaCofinsPercentual = double.parse(pegarElementoXML(cofins[0].findElements('pCOFINS'), true));
              nfeDetalhe.nfeDetalheImpostoCofins!.aliquotaCofinsReais = double.parse(pegarElementoXML(cofins[0].findElements('pCOFINS'), true));
              nfeDetalhe.nfeDetalheImpostoCofins!.valorCofins = double.parse(pegarElementoXML(cofins[0].findElements('vCOFINS'), true));
            }       
          
            // II
            nfeDetalhe.nfeDetalheImpostoIi = NfeDetalheImpostoIi();
            final ii = imposto[0].findAllElements('II').toList();
            if (ii.isNotEmpty) { 
              nfeDetalhe.nfeDetalheImpostoIi!.valorIof = double.parse(pegarElementoXML(ii[0].findElements('vIOF'), true));
              nfeDetalhe.nfeDetalheImpostoIi!.valorBcIi = double.parse(pegarElementoXML(ii[0].findElements('vBC'), true));
              nfeDetalhe.nfeDetalheImpostoIi!.valorDespesasAduaneiras = double.parse(pegarElementoXML(ii[0].findElements('vDespAdu'), true));
              nfeDetalhe.nfeDetalheImpostoIi!.valorImpostoImportacao = double.parse(pegarElementoXML(ii[0].findElements('vII'), true));
            }

          }         

          widget.nfeCabecalho.listaNfeDetalhe!.add(nfeDetalhe);

        }            

        } else {
          if (!mounted) return;
          showInSnackBar('Seleção de arquivo inválida.', context);
        }

        setState(() {
        });
      } catch (e, stacktrace) {
        gerarDialogBoxErro(context, 'Ocorreu um problema ao tentar selecionar o arquivo: $e \n\n $stacktrace');
      }
      
    });  
      
  }    

  dynamic pegarElementoXML(Iterable<XmlElement> elemento, bool isNumber) {
    if (elemento.isEmpty) {
      if (isNumber) {
        return '0';
      } else {
        return null;
      }
    } else {
      return elemento.single.text;
    }
  }

  List<String> listaTipoIcms = [
    'ICMS00',
    'ICMS10',
    'ICMS20',
    'ICMS30',
    'ICMS40',
    'ICMS41',
    'ICMS50',
    'ICMS51',
    'ICMS60',
    'ICMS70',
    'ICMS90',
  ];
}