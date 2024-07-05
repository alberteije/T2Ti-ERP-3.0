/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage OneToOne relacionada à tabela [VENDA_FRETE] 
                                                                                
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

import 'package:fenix/src/model/model.dart';

import 'package:fenix/src/view/shared/widgets_abas.dart';
import 'package:fenix/src/view/shared/widgets_input.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/view/shared/dropdown_lista.dart';

class VendaFretePersistePage extends StatefulWidget {
  final VendaCabecalho? vendaCabecalho;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarVendaCabecalhoCallBack;

  const VendaFretePersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.vendaCabecalho, this.foco, this.salvarVendaCabecalhoCallBack})
      : super(key: key);

  @override
  VendaFretePersistePageState createState() => VendaFretePersistePageState();
}

class VendaFretePersistePageState extends State<VendaFretePersistePage> {
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
    final importaTransportadoraController = TextEditingController();
    importaTransportadoraController.text = widget.vendaCabecalho!.vendaFrete?.transportadora?.pessoa?.nome ?? '';
    final quantidadeVolumeController = MoneyMaskedTextController(precision: Constantes.decimaisQuantidade, initialValue: widget.vendaCabecalho!.vendaFrete?.quantidadeVolume ?? 0);
    final pesoBrutoController = MoneyMaskedTextController(precision: Constantes.decimaisQuantidade, initialValue: widget.vendaCabecalho!.vendaFrete?.pesoBruto ?? 0);
    final pesoLiquidoController = MoneyMaskedTextController(precision: Constantes.decimaisQuantidade, initialValue: widget.vendaCabecalho!.vendaFrete?.pesoLiquido ?? 0);
	
    if (widget.vendaCabecalho!.vendaFrete == null) {
      widget.vendaCabecalho!.vendaFrete = VendaFrete();
    }

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
					        sizes: 'col-12',
					        child: Row(
					          children: <Widget>[
					            Expanded(
					              flex: 1,
					              child: SizedBox(
					                child: TextFormField(
					                  controller: importaTransportadoraController,
					                  focusNode: widget.foco,
					                  autofocus: true,
					                  readOnly: true,
					                  decoration: getInputDecoration(
					                    'Importe a Transportadora Vinculada',
					                    'Transportadora *',
					                    false),
					                  onSaved: (String? value) {
					                  },
					                  validator: ValidaCampoFormulario.validarObrigatorio,
					                  onChanged: (text) {
					                    widget.vendaCabecalho!.vendaFrete?.transportadora?.pessoa?.nome = text;
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
					                      widget.vendaCabecalho!.vendaFrete?.idTransportadora = objetoJsonRetorno['id'];

                                var transportadora = Transportadora();
                                transportadora.pessoa = ViewPessoaTransportadora();
                                transportadora.id = objetoJsonRetorno['id'];
                                transportadora.pessoa!.nome = objetoJsonRetorno['nome'];                             
					                      widget.vendaCabecalho!.vendaFrete?.transportadora = transportadora;
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
					          child: TextFormField(
					            keyboardType: TextInputType.number,
					            initialValue: widget.vendaCabecalho!.vendaFrete?.conhecimento?.toString() ?? '',
					            decoration: getInputDecoration(
					              'Informe o Número do Conhecimento',
					              'Conhecimento',
					              true, paddingVertical: 18),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.vendaCabecalho!.vendaFrete?.conhecimento = int.tryParse(text);
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
					              'Selecione a Opção Desejada',
					              'Responsável',
					              true),
					            isEmpty: widget.vendaCabecalho!.vendaFrete?.responsavel == null || widget.vendaCabecalho!.vendaFrete == null,
					            child: getDropDownButton(widget.vendaCabecalho!.vendaFrete?.responsavel, (String? newValue) {
					              paginaMestreDetalheFoiAlterada = true;
					              setState(() {
					                widget.vendaCabecalho!.vendaFrete?.responsavel = newValue;
					                });
					            }, <String>[
					              '1-Emitente',
					              '2-Destinatário',
					          ])),
					        ),
					      ),
					      BootstrapCol(
					        sizes: 'col-12 col-md-3',
					        child: Padding(
					          padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
					          child: TextFormField(
					            maxLength: 7,
					            maxLines: 1,
					            initialValue: widget.vendaCabecalho!.vendaFrete?.placa ?? '',
					            decoration: getInputDecoration(
					              'Informe a Placa',
					              'Placa',
					              true, paddingVertical: 18),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.vendaCabecalho!.vendaFrete?.placa = text;
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
					              'Informe a UF da Placa',
					              'UF',
					              true),
					            isEmpty: widget.vendaCabecalho!.vendaFrete?.ufPlaca == null || widget.vendaCabecalho!.vendaFrete == null,
					            child: getDropDownButton(widget.vendaCabecalho!.vendaFrete?.ufPlaca, (String? newValue) {
					              paginaMestreDetalheFoiAlterada = true;
					              setState(() {
					                widget.vendaCabecalho!.vendaFrete?.ufPlaca = newValue;
					                });
					            }, DropdownLista.listaUF)),
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

					            initialValue: widget.vendaCabecalho!.vendaFrete?.seloFiscal?.toString() ?? '',
					            decoration: getInputDecoration(
					              'Informe o Número do Selo Fiscal',
					              'Selo Fiscal',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.vendaCabecalho!.vendaFrete?.seloFiscal = int.tryParse(text);
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
					            controller: quantidadeVolumeController,
					            decoration: getInputDecoration(
					              'Informe a Quantidade de Volumes',
					              'Quantidade de Volumes',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.vendaCabecalho!.vendaFrete?.quantidadeVolume = quantidadeVolumeController.numberValue;
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
					            maxLength: 50,
					            maxLines: 1,
					            initialValue: widget.vendaCabecalho!.vendaFrete?.marcaVolume ?? '',
					            decoration: getInputDecoration(
					              'Informe a Marca da Carga',
					              'Marca Volume',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.vendaCabecalho!.vendaFrete?.marcaVolume = text;
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
					            maxLength: 20,
					            maxLines: 1,
					            initialValue: widget.vendaCabecalho!.vendaFrete?.especieVolume ?? '',
					            decoration: getInputDecoration(
					              'Informe a Espécie do Volume',
					              'Espécie do Volume',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.vendaCabecalho!.vendaFrete?.especieVolume = text;
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
					            keyboardType: TextInputType.number,
					            textAlign: TextAlign.end,
					            controller: pesoBrutoController,
					            decoration: getInputDecoration(
					              'Informe o Peso Bruto',
					              'Peso Bruto',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.vendaCabecalho!.vendaFrete?.pesoBruto = pesoBrutoController.numberValue;
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
					            keyboardType: TextInputType.number,
					            textAlign: TextAlign.end,
					            controller: pesoLiquidoController,
					            decoration: getInputDecoration(
					              'Informe o Peso Líquido',
					              'Peso Líquido',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.vendaCabecalho!.vendaFrete?.pesoLiquido = pesoLiquidoController.numberValue;
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