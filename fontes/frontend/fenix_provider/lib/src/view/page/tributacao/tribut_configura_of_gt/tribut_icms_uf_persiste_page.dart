/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe PersistePage relacionada à tabela [TRIBUT_ICMS_UF] 
                                                                                
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
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';
import 'package:fenix/src/view/shared/botoes.dart';

import 'package:fenix/src/view/shared/page/lookup_page.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:fenix/src/view/shared/dropdown_lista.dart';

class TributIcmsUfPersistePage extends StatefulWidget {
  final TributConfiguraOfGt? tributConfiguraOfGt;
  final TributIcmsUf? tributIcmsUf;
  final String? title;
  final String? operacao;

  const TributIcmsUfPersistePage(
      {Key? key, this.tributConfiguraOfGt, this.tributIcmsUf, this.title, this.operacao})
      : super(key: key);

  @override
  TributIcmsUfPersistePageState createState() => TributIcmsUfPersistePageState();
}

class TributIcmsUfPersistePageState extends State<TributIcmsUfPersistePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _formFoiAlterado = false;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

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
  }

  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      case AtalhoTelaType.salvar:
        _salvar();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
	final importaCfopController = TextEditingController();
	importaCfopController.text = widget.tributIcmsUf?.cfop.toString() ?? '';
	final importaCsosnController = TextEditingController();
	importaCsosnController.text = widget.tributIcmsUf?.csosn ?? '';
	final importaCstController = TextEditingController();
	importaCstController.text = widget.tributIcmsUf?.cst ?? '';
	final aliquotaController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.tributIcmsUf?.aliquota ?? 0);
	final valorPautaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.tributIcmsUf?.valorPauta ?? 0);
	final valorPrecoMaximoController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.tributIcmsUf?.valorPrecoMaximo ?? 0);
	final mvaController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.tributIcmsUf?.mva ?? 0);
	final porcentoBcController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.tributIcmsUf?.porcentoBc ?? 0);
	final aliquotaInternaStController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.tributIcmsUf?.aliquotaInternaSt ?? 0);
	final aliquotaInterestadualStController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.tributIcmsUf?.aliquotaInterestadualSt ?? 0);
	final porcentoBcStController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.tributIcmsUf?.porcentoBcSt ?? 0);
	final aliquotaIcmsStController = MoneyMaskedTextController(precision: Constantes.decimaisTaxa, initialValue: widget.tributIcmsUf?.aliquotaIcmsSt ?? 0);
	final valorPautaStController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.tributIcmsUf?.valorPautaSt ?? 0);
	final valorPrecoMaximoStController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: widget.tributIcmsUf?.valorPrecoMaximoSt ?? 0);

    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        autofocus: true,
        child: Scaffold(
          drawerDragStartBehavior: DragStartBehavior.down,
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(widget.title!), 
            actions: widget.operacao == 'I'
              ? getBotoesAppBarPersistePage(context: context, salvar: _salvar)
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
                      children: <Widget>[			  			  
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
                                    'Informe a UF de Destino',
                                    'UF',
                                    true),
                                  isEmpty: widget.tributIcmsUf?.ufDestino == null,
                                  child: getDropDownButton(widget.tributIcmsUf?.ufDestino,
                                    (String? newValue) {
                                      paginaMestreDetalheFoiAlterada = true;
                                      setState(() {
                                        widget.tributIcmsUf?.ufDestino = newValue;
                                      });
                                  }, DropdownLista.listaUF)),
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
                                        controller: importaCfopController,
                                        readOnly: true,
                                        decoration: getInputDecoration(
                                          'Informe o CFOP',
                                          'CFOP',
                                          false),
                                        onSaved: (String? value) {
                                        },
                                        onChanged: (text) {
                                          widget.tributIcmsUf?.cfop = int.tryParse(text);
                                    paginaMestreDetalheFoiAlterada = true;
                                          _formFoiAlterado = true;
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
                                                  campoPesquisaPadrao: 'codigo',
                                                  valorPesquisaPadrao: '',
                                                ),
                                                fullscreenDialog: true,
                                              ));
                                        if (objetoJsonRetorno != null) {
                                          if (objetoJsonRetorno['codigo'] != null) {
                                            importaCfopController.text = objetoJsonRetorno['codigo'];
                                            widget.tributIcmsUf?.cfop = objetoJsonRetorno['codigo'];
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
                                        controller: importaCsosnController,
                                        readOnly: true,
                                        decoration: getInputDecoration(
                                          'Informe o CSOSN',
                                          'CSOSN',
                                          false),
                                        onSaved: (String? value) {
                                        },
                                        onChanged: (text) {
                                          widget.tributIcmsUf?.csosn = text;
                                    paginaMestreDetalheFoiAlterada = true;
                                          _formFoiAlterado = true;
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child: IconButton(
                                      tooltip: 'Importar CSOSN',
                                      icon: ViewUtilLib.getIconBotaoLookup(),
                                      onPressed: () async {
                                        ///chamando o lookup
                                        Map<String, dynamic>? objetoJsonRetorno =
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                LookupPage(
                                                  title: 'Importar CSOSN',
                                                  colunas: Csosn.colunas,
                                                  campos: Csosn.campos,
                                                  rota: '/csosn/',
                                                  campoPesquisaPadrao: 'codigo',
                                                  valorPesquisaPadrao: '',
                                                ),
                                                fullscreenDialog: true,
                                              ));
                                        if (objetoJsonRetorno != null) {
                                          if (objetoJsonRetorno['codigo'] != null) {
                                            importaCsosnController.text = objetoJsonRetorno['codigo'];
                                            widget.tributIcmsUf?.csosn = objetoJsonRetorno['codigo'];
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
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      child: TextFormField(
                                        controller: importaCstController,
                                        readOnly: true,
                                        decoration: getInputDecoration(
                                          'Informe o CST',
                                          'CST',
                                          false),
                                        onSaved: (String? value) {
                                        },
                                        onChanged: (text) {
                                          widget.tributIcmsUf?.cst = text;
                                    paginaMestreDetalheFoiAlterada = true;
                                          _formFoiAlterado = true;
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child: IconButton(
                                      tooltip: 'Importar CST',
                                      icon: ViewUtilLib.getIconBotaoLookup(),
                                      onPressed: () async {
                                        ///chamando o lookup
                                        Map<String, dynamic>? objetoJsonRetorno =
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                LookupPage(
                                                  title: 'Importar CST',
                                                  colunas: CstIcms.colunas,
                                                  campos: CstIcms.campos,
                                                  rota: '/cst-icms/',
                                                  campoPesquisaPadrao: 'codigo',
                                                  valorPesquisaPadrao: '',
                                                ),
                                                fullscreenDialog: true,
                                              ));
                                        if (objetoJsonRetorno != null) {
                                          if (objetoJsonRetorno['codigo'] != null) {
                                            importaCstController.text = objetoJsonRetorno['codigo'];
                                            widget.tributIcmsUf?.cst = objetoJsonRetorno['codigo'];
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
                                  isEmpty: widget.tributIcmsUf?.modalidadeBc == null,
                                  child: getDropDownButton(widget.tributIcmsUf?.modalidadeBc,
                                    (String? newValue) {
                                      paginaMestreDetalheFoiAlterada = true;
                                      setState(() {
                                        widget.tributIcmsUf?.modalidadeBc = newValue;
                                      });
                                  }, <String>[
                                    '0-Margem Valor Agregado (%)',
                                    '1-Pauta (Valor)',
                                    '2-Preço Tabelado Máx. (valor)',
                                    '3-Valor da Operação',
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
                                  controller: aliquotaController,
                                  decoration: getInputDecoration(
                                    'Informe o Alíquota caso Modalidade BC=3',
                                    'Alíquota',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.tributIcmsUf?.aliquota = aliquotaController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
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
                                  controller: valorPautaController,
                                  decoration: getInputDecoration(
                                    'Informe o Valor Pauta, caso Modalidade BC=1',
                                    'Valor Pauta',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.tributIcmsUf?.valorPauta = valorPautaController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
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
                                  controller: valorPrecoMaximoController,
                                  decoration: getInputDecoration(
                                    'Informe o Valor Preço Máximo, caso Modalidade BC=2',
                                    'Valor Preço Máximo',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.tributIcmsUf?.valorPrecoMaximo = valorPrecoMaximoController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
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
                                  controller: mvaController,
                                  decoration: getInputDecoration(
                                    'Informe o Valor da Margem Valor Agregado',
                                    'Valor MVA',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.tributIcmsUf?.mva = mvaController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
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
                                  controller: porcentoBcController,
                                  decoration: getInputDecoration(
                                    'Informe o Porcentual da Base de Cálculo',
                                    'Porcento Base Cálculo',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.tributIcmsUf?.porcentoBc = porcentoBcController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
                                    _formFoiAlterado = true;
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
                                    'Selecione a Opção Desejada',
                                    'Modalidade Base Cálculo ST',
                                    true),
                                  isEmpty: widget.tributIcmsUf?.modalidadeBcSt == null,
                                  child: getDropDownButton(widget.tributIcmsUf?.modalidadeBcSt,
                                    (String? newValue) {
                                      paginaMestreDetalheFoiAlterada = true;
                                      setState(() {
                                        widget.tributIcmsUf?.modalidadeBcSt = newValue;
                                      });
                                  }, <String>[
                                    '0-Preço tabelado ou máximo sugerido',
                                    '1-Lista Negativa (valor)',
                                    '2-Lista Positiva (valor)',
                                    '3-Lista Neutra (valor)',
                                    '4-Margem Valor Agregado (%)',
                                    '5-Pauta (valor)',
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
                                  controller: aliquotaInternaStController,
                                  decoration: getInputDecoration(
                                    'Informe a Alíquota Interna ST',
                                    'Alíquota Interna ST',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.tributIcmsUf?.aliquotaInternaSt = aliquotaInternaStController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
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
                                  controller: aliquotaInterestadualStController,
                                  decoration: getInputDecoration(
                                    'Informe a Alíquota Interestadual ST',
                                    'Alíquota Interestadual ST',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.tributIcmsUf?.aliquotaInterestadualSt = aliquotaInterestadualStController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
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
                                  controller: porcentoBcStController,
                                  decoration: getInputDecoration(
                                    'Informe o Porcentual da Base de Cálculo ST',
                                    'Porcento Base Cálculo ST',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.tributIcmsUf?.porcentoBcSt = porcentoBcStController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
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
                                  controller: aliquotaIcmsStController,
                                  decoration: getInputDecoration(
                                    'Informe o Alíquota ICMS ST',
                                    'Alíquota ICMS ST',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.tributIcmsUf?.aliquotaIcmsSt = aliquotaIcmsStController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
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
                                  controller: valorPautaStController,
                                  decoration: getInputDecoration(
                                    'Informe o Valor Pauta ST, caso Modalidade BC ST=5',
                                    'Valor Pauta ST',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.tributIcmsUf?.valorPautaSt = valorPautaStController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
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
                                  controller: valorPrecoMaximoStController,
                                  decoration: getInputDecoration(
                                    'Informe o Valor Preço Máximo ST, caso Modalidade BC ST=0',
                                    'Valor Preço Máximo ST',
                                    false),
                                  onSaved: (String? value) {
                                  },
                                  onChanged: (text) {
                                    widget.tributIcmsUf?.valorPrecoMaximoSt = valorPrecoMaximoStController.numberValue;
                                    paginaMestreDetalheFoiAlterada = true;
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
                                Text('* indica que o campo é obrigatório',
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
      form.save();
      Navigator.of(context).pop();
    }
  }
  
  void _excluir() {
    gerarDialogBoxExclusao(context, () {
      widget.tributConfiguraOfGt!.listaTributIcmsUf!.remove(widget.tributIcmsUf);
      Navigator.of(context).pop();
    });
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
}