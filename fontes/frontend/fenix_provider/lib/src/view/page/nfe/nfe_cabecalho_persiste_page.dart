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
import 'dart:typed_data';

import 'package:fenix/src/infra/infra.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/service/nfe/nfe_cabecalho_service.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/view/shared/page/pdf_page.dart';
import 'package:fenix/src/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:fenix/src/model/model.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:fenix/src/view/shared/widgets_abas.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

class NfeCabecalhoPersistePage extends StatefulWidget {
  final NfeCabecalho? nfeCabecalho;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarNfeCabecalhoCallBack;
  final Function? atualizarNfeCabecalhoCallBack;
  final NfeCabecalhoViewModel nfeCabecalhoProvider;

  const NfeCabecalhoPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.nfeCabecalho, this.foco, this.salvarNfeCabecalhoCallBack, this.atualizarNfeCabecalhoCallBack, required this.nfeCabecalhoProvider})
      : super(key: key);

  @override
  NfeCabecalhoPersistePageState createState() => NfeCabecalhoPersistePageState();
}

class NfeCabecalhoPersistePageState extends State<NfeCabecalhoPersistePage> {
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
    final importaTributOperacaoFiscalController = TextEditingController();
    importaTributOperacaoFiscalController.text = widget.nfeCabecalho?.tributOperacaoFiscal?.descricao ?? '';
    final importaNaturezaOperacaoController = TextEditingController();
    importaNaturezaOperacaoController.text = widget.nfeCabecalho?.naturezaOperacao ?? '';
    final importaVendaCabecalhoController = TextEditingController();
    importaVendaCabecalhoController.text = widget.nfeCabecalho?.vendaCabecalho?.id?.toString() ?? '';
    final baseCalculoIcmsController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.baseCalculoIcms ?? 0);
    final valorIcmsController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.valorIcms ?? 0);
    final baseCalculoIcmsStController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.baseCalculoIcmsSt ?? 0);
    final valorIcmsStController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.valorIcmsSt ?? 0);
    final valorCofinsController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.valorCofins ?? 0);
    final valorIpiController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.valorIpi ?? 0);
    final valorFreteController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.valorFrete ?? 0);
    final valorSeguroController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.valorSeguro ?? 0);
    final valorDespesasAcessoriasController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.valorDespesasAcessorias ?? 0);
    final valorPisController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.valorPis ?? 0);
    final valorDescontoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.valorDesconto ?? 0);
    final valorImpostoImportacaoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.valorImpostoImportacao ?? 0);
    final valorTotalProdutosController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.valorTotalProdutos ?? 0);
    final valorTotalController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.nfeCabecalho?.valorTotal ?? 0);

    if (widget.nfeCabecalho!.id == null) {
      widget.nfeCabecalho!.codigoModelo = "55";
      // widget.nfeCabecalho!.serie = "001";
      widget.nfeCabecalho!.tipoOperacao = "1=Saída";
      widget.nfeCabecalho!.dataHoraEmissao = DateTime.now();
    }

    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        child: Scaffold(
          appBar: AppBar(
            leading: const SizedBox(),
            actions: <Widget>[
              IconButton(
                tooltip: 'Gerar e Transmitir NF-e',
                icon: const Icon(Icons.upload, color: Colors.white),
                onPressed: () async {
                  if (widget.nfeCabecalho!.id == null) {
                    showInSnackBar('Primeiro salve a nota para então transmiti-la.', context);
                    return;
                  }
                  if (widget.nfeCabecalho!.statusNota == '4-Autorizada') {
                    showInSnackBar('Nota já transmitida. Utilize a opção para impressão do DANFE.', context);
                    return;
                  }
                  gerarDialogBoxEspera(context);
                  final retorno = await NfeCabecalhoService().transmitirNfe(widget.nfeCabecalho!);
                  if (retorno is String) {
                    if (!mounted) return;
                    fecharDialogBoxEspera(context);
                    gerarDialogBoxErro(context, 'Ocorreu um problema na geração da NF-e: \n$retorno');  
                  } else if (retorno is Uint8List) {
                    _imprimirDanfe(retorno);
                  }
                },
              ),  
              const SizedBox( width: 10,),     
              IconButton(
                tooltip: 'Imprimir Danfe',
                icon: const Icon(Icons.print_outlined, color: Colors.white),
                onPressed: () async {
                  if (widget.nfeCabecalho!.id == null) {
                    showInSnackBar('Primeiro salve a nota para então transmiti-la.', context);
                    return;
                  }    
                  if (widget.nfeCabecalho!.statusNota != '4-Autorizada') {
                    showInSnackBar('Utilize primeiro a opção de transmissão da nota.', context);
                    return;
                  }                                
                  if (widget.nfeCabecalho!.chaveAcesso == null) {
                    showInSnackBar('Nota sem chave de acesso.', context);
                    return;
                  }                    
                  gerarDialogBoxEspera(context);
                  final retorno = await NfeCabecalhoService().gerarPdfDanfe(widget.nfeCabecalho!.chaveAcesso!);
                  if (retorno is String) {
                    if (!mounted) return;
                    fecharDialogBoxEspera(context);
                    gerarDialogBoxErro(context, 'Ocorreu um problema na Impressão do DANFE: \n$retorno');  
                  } else if (retorno is Uint8List) {
                    _imprimirDanfe(retorno);
                  }
                },
              ),               
              const SizedBox( width: 10,),      
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
                            sizes: 'col-12 col-md-6',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    child: TextFormField(
                                      controller: importaTributOperacaoFiscalController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe a Operação Fiscal Vinculada',
                                        'Operação Fiscal *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.nfeCabecalho?.tributOperacaoFiscal?.descricao = text;
                                        widget.nfeCabecalho!.naturezaOperacao = widget.nfeCabecalho?.tributOperacaoFiscal?.descricaoNaNf;
                                        paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Operação Fiscal',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Operação Fiscal',
                                                colunas: TributOperacaoFiscal.colunas,
                                                campos: TributOperacaoFiscal.campos,
                                                rota: '/tribut-operacao-fiscal/',
                                                campoPesquisaPadrao: 'descricao',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['descricao'] != null) {
                                          importaTributOperacaoFiscalController.text = objetoJsonRetorno['descricao'];
                                          widget.nfeCabecalho!.idTributOperacaoFiscal = objetoJsonRetorno['id'];
                                          widget.nfeCabecalho!.tributOperacaoFiscal = TributOperacaoFiscal.fromJson(objetoJsonRetorno);
                                          importaNaturezaOperacaoController.text = widget.nfeCabecalho!.tributOperacaoFiscal!.descricaoNaNf!;
                                          widget.nfeCabecalho?.naturezaOperacao = widget.nfeCabecalho!.tributOperacaoFiscal!.descricaoNaNf!;
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
                                      controller: importaVendaCabecalhoController,
                                      readOnly: true,
                                      //validator: ValidaCampoFormulario.validarObrigatorio,
                                      decoration: getInputDecoration(
                                        'Importe a Venda Vinculada',
                                        'Venda',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      onChanged: (text) {
                                        widget.nfeCabecalho?.vendaCabecalho?.id = int.tryParse(text);
                                        paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Venda',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Venda',
                                                colunas: VendaCabecalho.colunas,
                                                campos: VendaCabecalho.campos,
                                                rota: '/venda-cabecalho/',
                                                campoPesquisaPadrao: 'id',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['id'] != null) {
                                          importaVendaCabecalhoController.text = objetoJsonRetorno['id'];
                                          widget.nfeCabecalho!.idVendaCabecalho = objetoJsonRetorno['id'];
                                          widget.nfeCabecalho!.vendaCabecalho = VendaCabecalho.fromJson(objetoJsonRetorno);
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
                                maxLines: 1,
                                initialValue: '${widget.nfeCabecalho!.codigoModelo!} - NF-e',
                                readOnly: true,
                                decoration: getInputDecoration(
                                  'Informe o Código do Modelo',
                                  'Código Modelo *',
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
                                initialValue: widget.nfeCabecalho?.chaveAcesso ?? '',
                                decoration: getInputDecoration(
                                  'Chave de Acesso - Gerado Automaticamente',
                                  'Chave de Acesso',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.nfeCabecalho!.chaveAcesso = text;
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
                                initialValue: widget.nfeCabecalho?.codigoNumerico ?? '',
                                decoration: getInputDecoration(
                                  'Código Numérico - Gerado Automaticamente',
                                  'Código Numérico',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.nfeCabecalho!.codigoNumerico = text;
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
                                initialValue: widget.nfeCabecalho?.serie ?? '',
                                decoration: getInputDecoration(
                                  'Informe a Série',
                                  'Série',
                                  false),
                                onSaved: (String? value) {
                                },
                                // validator: ValidaCampoFormulario.validarObrigatorio,
                                onChanged: (text) {
                                  widget.nfeCabecalho!.serie = text;
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
                                initialValue: widget.nfeCabecalho?.numero ?? '',
                                decoration: getInputDecoration(
                                  'Número - Gerado Automaticamente',
                                  'Número',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.nfeCabecalho!.numero = text;
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
                                isEmpty: widget.nfeCabecalho!.dataHoraEmissao == null,
                                child: DatePickerItem(
                                  readOnly: true,
                                  mascara: "dd/MM/yyyy",
                                  dateTime: widget.nfeCabecalho!.dataHoraEmissao,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.nfeCabecalho!.dataHoraEmissao = value;
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
                                isEmpty: widget.nfeCabecalho!.dataHoraEntradaSaida == null,
                                child: DatePickerItem(
                                  mascara: "dd/MM/yyyy",
                                  dateTime: widget.nfeCabecalho!.dataHoraEntradaSaida,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.nfeCabecalho!.dataHoraEntradaSaida = value;
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
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'Tipo Operação *',
                                  true),
                                isEmpty: widget.nfeCabecalho!.tipoOperacao == null,
                                child: getDropDownButton(widget.nfeCabecalho!.tipoOperacao,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.nfeCabecalho!.tipoOperacao = newValue;
                                    });
                                }, <String>[
                                  '0=Entrada',
                                  '1=Saída',
                              ])),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'Tipo de Emissão *',
                                  true),
                                isEmpty: widget.nfeCabecalho!.tipoEmissao == null,
                                child: getDropDownButton(widget.nfeCabecalho!.tipoEmissao,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.nfeCabecalho!.tipoEmissao = newValue;
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
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'Formato de Impressão do DANFE *',
                                  true),
                                isEmpty: widget.nfeCabecalho!.formatoImpressaoDanfe == null,
                                child: getDropDownButton(widget.nfeCabecalho!.formatoImpressaoDanfe,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.nfeCabecalho!.formatoImpressaoDanfe = newValue;
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
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'Finalidade Emissão *',
                                  true),
                                isEmpty: widget.nfeCabecalho!.finalidadeEmissao == null,
                                child: getDropDownButton(widget.nfeCabecalho!.finalidadeEmissao,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.nfeCabecalho!.finalidadeEmissao = newValue;
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

  void _imprimirDanfe(Uint8List danfe) {
    Sessao.fecharDialogBoxEspera(context);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) => PdfPage(
          arquivoPdf: danfe, title: 'NF-e')
        )
      ).then(
        (value) {
          Navigator.of(context).pop();
          widget.nfeCabecalhoProvider.consultarLista(filtro: Filtro(campo: 'numero', valor: widget.nfeCabecalho!.numero!));
        }
      );          
  }  
}