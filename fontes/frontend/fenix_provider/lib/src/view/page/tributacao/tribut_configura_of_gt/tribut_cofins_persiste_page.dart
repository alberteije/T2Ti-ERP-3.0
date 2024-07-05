/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage OneToOne relacionada à tabela [TRIBUT_COFINS] 
                                                                                
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

class TributCofinsPersistePage extends StatefulWidget {
  final TributConfiguraOfGt? tributConfiguraOfGt;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarTributConfiguraOfGtCallBack;

  const TributCofinsPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.tributConfiguraOfGt, this.foco, this.salvarTributConfiguraOfGtCallBack})
      : super(key: key);

  @override
  TributCofinsPersistePageState createState() => TributCofinsPersistePageState();
}

class TributCofinsPersistePageState extends State<TributCofinsPersistePage> {
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
        widget.salvarTributConfiguraOfGtCallBack!();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var importaCstCofinsController = TextEditingController();
    importaCstCofinsController.text = widget.tributConfiguraOfGt?.tributCofins?.cstCofins ?? '';
    var importaEfd435Controller = TextEditingController();
    importaEfd435Controller.text = widget.tributConfiguraOfGt?.tributCofins?.efdTabela435 ?? '';
    var porcentoBaseCalculoController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.tributConfiguraOfGt?.tributCofins?.porcentoBaseCalculo ?? 0);
    var aliquotaPorcentoController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.tributConfiguraOfGt?.tributCofins?.aliquotaPorcento ?? 0);
    var aliquotaUnidadeController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.tributConfiguraOfGt?.tributCofins?.aliquotaUnidade ?? 0);
    var valorPrecoMaximoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.tributConfiguraOfGt?.tributCofins?.valorPrecoMaximo ?? 0);
    var valorPautaFiscalController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.tributConfiguraOfGt?.tributCofins?.valorPautaFiscal ?? 0);
	
    if (widget.tributConfiguraOfGt!.tributCofins == null) {
      widget.tributConfiguraOfGt!.tributCofins = TributCofins();
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
					        sizes: 'col-12 col-md-4',
					        child: Padding(
					          padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
					        child: Row(
					          children: <Widget>[
					            Expanded(
					              flex: 1,
					              child: SizedBox(
					                child: TextFormField(
					                  controller: importaCstCofinsController,
					                  focusNode: widget.foco,
					                  autofocus: true,
					                  readOnly: true,
					                  decoration: getInputDecoration(
					                    'Informe o CST COFINS',
					                    'CST COFINS',
					                    false),
					                  onSaved: (String? value) {
					                  },
					                  onChanged: (text) {
					                    widget.tributConfiguraOfGt?.tributCofins?.cstCofins = text;
					                    paginaMestreDetalheFoiAlterada = true;
					                  },
					                ),
					              ),
					            ),
					            Expanded(
					              flex: 0,
					              child: IconButton(
					                tooltip: 'Importar CST COFINS',
					                icon: ViewUtilLib.getIconBotaoLookup(),
					                onPressed: () async {
					                  ///chamando o lookup
					                  Map<String, dynamic>? objetoJsonRetorno =
					                    await Navigator.push(
					                      context,
					                      MaterialPageRoute(
					                        builder: (BuildContext context) =>
					                          LookupPage(
					                            title: 'Importar CST COFINS',
					                            colunas: CstCofins.colunas,
					                            campos: CstCofins.campos,
					                            rota: '/cst-cofins/',
					                            campoPesquisaPadrao: 'codigo',
					                            valorPesquisaPadrao: '',
					                          ),
					                          fullscreenDialog: true,
					                        ));
					                  if (objetoJsonRetorno != null) {
					                    if (objetoJsonRetorno['codigo'] != null) {
					                      importaCstCofinsController.text = objetoJsonRetorno['codigo'];
					                      widget.tributConfiguraOfGt?.tributCofins?.cstCofins = objetoJsonRetorno['codigo'];
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
					        child: Row(
					          children: <Widget>[
					            Expanded(
					              flex: 1,
					              child: SizedBox(
					                child: TextFormField(
					                  controller: importaEfd435Controller,
					                  readOnly: true,
					                  decoration: getInputDecoration(
					                    'Informe o EFD 435',
					                    'EFD 435',
					                    false),
					                  onSaved: (String? value) {
					                  },
					                  onChanged: (text) {
					                    widget.tributConfiguraOfGt?.tributCofins?.efdTabela435 = text;
					                    paginaMestreDetalheFoiAlterada = true;
					                  },
					                ),
					              ),
					            ),
					            Expanded(
					              flex: 0,
					              child: IconButton(
					                tooltip: 'Importar EFD 435',
					                icon: ViewUtilLib.getIconBotaoLookup(),
					                onPressed: () async {
					                  ///chamando o lookup
					                  Map<String, dynamic>? objetoJsonRetorno =
					                    await Navigator.push(
					                      context,
					                      MaterialPageRoute(
					                        builder: (BuildContext context) =>
					                          LookupPage(
					                            title: 'Importar EFD 435',
					                            colunas: EfdTabela435.colunas,
					                            campos: EfdTabela435.campos,
					                            rota: '/efd-tabela-435/',
					                            campoPesquisaPadrao: 'codigo',
					                            valorPesquisaPadrao: '',
					                          ),
					                          fullscreenDialog: true,
					                        ));
					                  if (objetoJsonRetorno != null) {
					                    if (objetoJsonRetorno['codigo'] != null) {
					                      importaEfd435Controller.text = objetoJsonRetorno['codigo'];
					                      widget.tributConfiguraOfGt?.tributCofins?.efdTabela435 = objetoJsonRetorno['codigo'];
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
					          child: InputDecorator(
					            decoration: getInputDecoration(
					              'Selecione a Opção Desejada',
					              'Modalidade Base Cálculo',
					              true),
					            isEmpty: widget.tributConfiguraOfGt?.tributCofins?.modalidadeBaseCalculo == null || widget.tributConfiguraOfGt?.tributCofins == null,
					            child: getDropDownButton(widget.tributConfiguraOfGt?.tributCofins?.modalidadeBaseCalculo, (String? newValue) {
					              paginaMestreDetalheFoiAlterada = true;
					              setState(() {
					                widget.tributConfiguraOfGt?.tributCofins?.modalidadeBaseCalculo = newValue;
					                });
					            }, <String>[
					              '0-Percentual',
					              '1-Unidade',
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
					        sizes: 'col-12 col-md-4',
					        child: Padding(
					          padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
					          child: TextFormField(
					            keyboardType: TextInputType.number,
					            textAlign: TextAlign.end,
					            controller: porcentoBaseCalculoController,
					            decoration: getInputDecoration(
					              'Informe o Porcento da Base de Cálculo',
					              'Porcento Base Cálculo',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.tributConfiguraOfGt?.tributCofins?.porcentoBaseCalculo = porcentoBaseCalculoController.numberValue;
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
					            controller: aliquotaPorcentoController,
					            decoration: getInputDecoration(
					              'Informe a Alíquota do Porcento',
					              'Alíquota Porcento',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.tributConfiguraOfGt?.tributCofins?.aliquotaPorcento = aliquotaPorcentoController.numberValue;
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
					            controller: aliquotaUnidadeController,
					            decoration: getInputDecoration(
					              'Informe a Alíquota da Unidade',
					              'Alíquota Unidade',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.tributConfiguraOfGt?.tributCofins?.aliquotaUnidade = aliquotaUnidadeController.numberValue;
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
					            controller: valorPrecoMaximoController,
					            decoration: getInputDecoration(
					              'Informe o Valor Preço Máximo',
					              'Valor Preço Máximo',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.tributConfiguraOfGt?.tributCofins?.valorPrecoMaximo = valorPrecoMaximoController.numberValue;
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
					            controller: valorPautaFiscalController,
					            decoration: getInputDecoration(
					              'Informe o Valor da Pauta Fiscal',
					              'Valor Pauta Fiscal',
					              false),
					            onSaved: (String? value) {
					            },
					            onChanged: (text) {
					              widget.tributConfiguraOfGt?.tributCofins?.valorPautaFiscal = valorPautaFiscalController.numberValue;
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