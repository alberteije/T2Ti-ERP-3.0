/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage relacionada à tabela [CTE_CABECALHO] 
                                                                                
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
import 'package:fenix/src/view/shared/dropdown_lista.dart';

class CteCabecalhoPersistePage extends StatefulWidget {
  final CteCabecalho? cteCabecalho;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarCteCabecalhoCallBack;
  final Function? atualizarCteCabecalhoCallBack;

  const CteCabecalhoPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.cteCabecalho, this.foco, this.salvarCteCabecalhoCallBack, this.atualizarCteCabecalhoCallBack})
      : super(key: key);

  @override
  CteCabecalhoPersistePageState createState() => CteCabecalhoPersistePageState();
}

class CteCabecalhoPersistePageState extends State<CteCabecalhoPersistePage> {
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
        widget.salvarCteCabecalhoCallBack!();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final importaCfopController = TextEditingController();
    importaCfopController.text = widget.cteCabecalho?.cfop as String? ?? '';
    final valorTotalCargaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.cteCabecalho?.valorTotalCarga ?? 0);
    final valorIcmsController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.cteCabecalho?.valorIcms ?? 0);
    final valorTotalServicoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.cteCabecalho?.valorTotalServico ?? 0);
    final valorReceberController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.cteCabecalho?.valorReceber ?? 0);

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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    child: TextFormField(
                                      controller: importaCfopController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Informe o CFOP',
                                        'CFOP',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      onChanged: (text) {
                                        widget.cteCabecalho?.cfop = int.tryParse(text);
                                  paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar CFOP',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar CFOP',
                                                colunas: Cfop.colunas,
                                                campos: Cfop.campos,
                                                rota: '/cfop/',
                                                campoPesquisaPadrao: 'cfop',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['cfop'] != null) {
                                          importaCfopController.text = objetoJsonRetorno['cfop'];
                                          widget.cteCabecalho!.cfop = objetoJsonRetorno['cfop'];
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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                readOnly: true,
                                maxLength: 60,
                                maxLines: 1,
                                initialValue: widget.cteCabecalho?.naturezaOperacao ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Natureza da Operação',
                                  'Natureza da Operação',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.cteCabecalho!.naturezaOperacao = text;
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
                                  'Informe a Data de Emissão',
                                  'Data de Emissão',
                                  true),
                                isEmpty: widget.cteCabecalho!.dataHoraEmissao == null,
                                child: DatePickerItem(
                                  dateTime: widget.cteCabecalho!.dataHoraEmissao,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.cteCabecalho!.dataHoraEmissao = value;
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
                              child: TextFormField(
                                maxLength: 3,
                                maxLines: 1,
                                initialValue: widget.cteCabecalho?.serie ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Série',
                                  'Série',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarAlfanumerico,
                                onChanged: (text) {
                                  widget.cteCabecalho!.serie = text;
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
                                maxLength: 9,
                                maxLines: 1,
                                initialValue: widget.cteCabecalho?.numero ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Número',
                                  'Número',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarAlfanumerico,
                                onChanged: (text) {
                                  widget.cteCabecalho!.numero = text;
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
                                readOnly: true,
                                maxLength: 44,
                                maxLines: 1,
                                initialValue: widget.cteCabecalho?.chaveAcesso ?? '',
                                decoration: getInputDecoration(
                                  'Chave de Acesso',
                                  'Chave de Acesso',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.cteCabecalho!.chaveAcesso = text;
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
                                  'Selecione a Opção Desejada',
                                  'Forma Pagamento',
                                  true),
                                isEmpty: widget.cteCabecalho!.formaPagamento == null,
                                child: getDropDownButton(widget.cteCabecalho!.formaPagamento,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.cteCabecalho!.formaPagamento = newValue;
                                    });
                                }, <String>[
                                  '0 - Pago',
                                  '1 - A pagar',
                                  ' 2 - Outros',
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
                                  'Formato Impressão DACTE',
                                  true),
                                isEmpty: widget.cteCabecalho!.formatoImpressaoDacte == null,
                                child: getDropDownButton(widget.cteCabecalho!.formatoImpressaoDacte,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.cteCabecalho!.formatoImpressaoDacte = newValue;
                                    });
                                }, <String>[
                                  '1 - Retrato',
                                  '2 -  Paisagem',
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
                                  'Tipo Emissão',
                                  true),
                                isEmpty: widget.cteCabecalho!.tipoEmissao == null,
                                child: getDropDownButton(widget.cteCabecalho!.tipoEmissao,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.cteCabecalho!.tipoEmissao = newValue;
                                    });
                                }, <String>[
                                  '1 - Normal',
                                  '4-EPEC pela SVC',
                                  '5 - Contingência FSDA',
                                  '7 - Autorização pela SVC-RS',
                                  '8 - Autorização pela SVC-SP',
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
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Selecione a Opção Desejada',
                                  'Tipo CT-e',
                                  true),
                                isEmpty: widget.cteCabecalho!.tipoCte == null,
                                child: getDropDownButton(widget.cteCabecalho!.tipoCte,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.cteCabecalho!.tipoCte = newValue;
                                    });
                                }, <String>[
                                  '0 - CT-e Normal',
                                  '1 - CT-e de Complemento de Valores',
                                  '2 -  CT-e de Anulação',
                                  '3 - CT-e Substituto',
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
                                  'Modal',
                                  true),
                                isEmpty: widget.cteCabecalho!.modal == null,
                                child: getDropDownButton(widget.cteCabecalho!.modal,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.cteCabecalho!.modal = newValue;
                                    });
                                }, <String>[
                                  '01-Rodoviário',
                                  '02-Aéreo',
                                  '03-Aquaviário',
                                  '04-Ferroviário',
                                  '05-Dutoviário',
                                  '06-Multimodal',
                              ])),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-3',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Indicador se o Recebedor retira no  Aeroporto, Filial, Porto ou Estação de Destino?',
                                  'Retira',
                                  true),
                                isEmpty: widget.cteCabecalho!.retira == null,
                                child: getDropDownButton(widget.cteCabecalho!.retira,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.cteCabecalho!.retira = newValue;
                                    });
                                }, <String>[
                                  'Sim',
                                  'Não',
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
                                  'Tomador do Serviço',
                                  true),
                                isEmpty: widget.cteCabecalho!.tomador == null,
                                child: getDropDownButton(widget.cteCabecalho!.tomador,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.cteCabecalho!.tomador = newValue;
                                    });
                                }, <String>[
                                  '0-Remetente',
                                  '1-Expedidor',
                                  '2-Recebedor',
                                  '3-Destinatário',
                                  '4 - Outros',
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
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a UF Início Prestação',
                                  'UF Início Prestação',
                                  true),
                                isEmpty: widget.cteCabecalho!.ufIniPrestacao == null,
                                child: getDropDownButton(widget.cteCabecalho!.ufIniPrestacao,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.cteCabecalho!.ufIniPrestacao = newValue;
                                    });
                                }, DropdownLista.listaUF)),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-9',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 60,
                                maxLines: 1,
                                initialValue: widget.cteCabecalho?.nomeMunicipioIniPrestacao ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Município Início Prestação',
                                  'Município Início Prestação',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.cteCabecalho!.nomeMunicipioIniPrestacao = text;
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
                                  'Informe a UF Fim Prestação',
                                  'UF Fim Prestação',
                                  true),
                                isEmpty: widget.cteCabecalho!.ufFimPrestacao == null,
                                child: getDropDownButton(widget.cteCabecalho!.ufFimPrestacao,
                                  (String? newValue) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.cteCabecalho!.ufFimPrestacao = newValue;
                                    });
                                }, DropdownLista.listaUF)),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-9',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 60,
                                maxLines: 1,
                                initialValue: widget.cteCabecalho?.nomeMunicipioFimPrestacao ?? '',
                                decoration: getInputDecoration(
                                  'Informe o Município Fim Prestação',
                                  'Município Fim Prestação',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.cteCabecalho!.nomeMunicipioFimPrestacao = text;
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
                                textAlign: TextAlign.end,
                                controller: valorTotalCargaController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Total Carga',
                                  'Valor Total Carga',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.cteCabecalho!.valorTotalCarga = valorTotalCargaController.numberValue;
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
                                controller: valorIcmsController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Total da NF',
                                  'Valor ICMS',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.cteCabecalho!.valorIcms = valorIcmsController.numberValue;
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
                                controller: valorTotalServicoController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Total da NF',
                                  'Valor Total Serviços',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.cteCabecalho!.valorTotalServico = valorTotalServicoController.numberValue;
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
                                controller: valorReceberController,
                                decoration: getInputDecoration(
                                  'Informe o Valor Total da NF',
                                  'Valor a Receber',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.cteCabecalho!.valorReceber = valorReceberController.numberValue;
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
                                maxLength: 60,
                                maxLines: 1,
                                initialValue: widget.cteCabecalho?.produtoPredominante ?? '',
                                decoration: getInputDecoration(
                                  'Informar a descrição do produto  predominante',
                                  'Produto Predominante',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarAlfanumerico,
                                onChanged: (text) {
                                  widget.cteCabecalho!.produtoPredominante = text;
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
                                maxLength: 30,
                                maxLines: 1,
                                initialValue: widget.cteCabecalho?.cargaOutrasCaracteristicas ?? '',
                                decoration: getInputDecoration(
                                  'xOutCat - FRIA, GRANEL, REFRIGERADA,  Medidas: 12X12X12',
                                  'Outras Características Carga',
                                  false),
                                onSaved: (String? value) {
                                },
                                validator: ValidaCampoFormulario.validarAlfanumerico,
                                onChanged: (text) {
                                  widget.cteCabecalho!.cargaOutrasCaracteristicas = text;
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
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: TextFormField(
                                maxLength: 1000,
                                maxLines: 3,
                                initialValue: widget.cteCabecalho?.observacoesGerais ?? '',
                                decoration: getInputDecoration(
                                  'Observações Gerais',
                                  'Observação',
                                  false),
                                onSaved: (String? value) {
                                },
                                onChanged: (text) {
                                  widget.cteCabecalho!.observacoesGerais = text;
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