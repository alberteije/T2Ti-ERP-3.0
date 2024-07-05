/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage relacionada à tabela [INVENTARIO_CONTAGEM_CAB] 
                                                                                
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


class InventarioContagemCabPersistePage extends StatefulWidget {
  final InventarioContagemCab? inventarioContagemCab;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarInventarioContagemCabCallBack;
  final Function? atualizarInventarioContagemCabCallBack;

  const InventarioContagemCabPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.inventarioContagemCab, this.foco, this.salvarInventarioContagemCabCallBack, this.atualizarInventarioContagemCabCallBack})
      : super(key: key);

  @override
  InventarioContagemCabPersistePageState createState() => InventarioContagemCabPersistePageState();
}

class InventarioContagemCabPersistePageState extends State<InventarioContagemCabPersistePage> {
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
        widget.salvarInventarioContagemCabCallBack!();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {

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
                            child: InputDecorator(
                              decoration: getInputDecoration(
                                'Informe a Data da Contagem',
                                'Data da Contagem',
                                true),
                              isEmpty: widget.inventarioContagemCab?.dataContagem == null,
                              child: DatePickerItem(
                                mascara: 'dd/MM/yyyy',
                                dateTime: widget.inventarioContagemCab?.dataContagem,
                                firstDate: DateTime.parse('1900-01-01'),
                                lastDate: DateTime.now(),
                                onChanged: (DateTime? value) {
                                  paginaMestreDetalheFoiAlterada = true;
                                  setState(() {
                                    widget.inventarioContagemCab?.dataContagem = value;
                                  });
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
                            child: InputDecorator(
                              decoration: getInputDecoration(
                                'Selecione a Opção Desejada',
                                'Estoque Atualizado',
                                true),
                              isEmpty: widget.inventarioContagemCab?.estoqueAtualizado == null,
                              child: getDropDownButton(widget.inventarioContagemCab?.estoqueAtualizado,
                                (String? newValue) {
                                  paginaMestreDetalheFoiAlterada = true;
                                  setState(() {
                                    widget.inventarioContagemCab?.estoqueAtualizado = newValue;
                                  });
                              }, <String>[
                                'Sim',
                                'Não',
                            ])),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white,),
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12',
                            child: InputDecorator(
                              decoration: getInputDecoration(
                                'Selecione a Opção Desejada',
                                'Tipo',
                                true),
                              isEmpty: widget.inventarioContagemCab?.tipo == null,
                              child: getDropDownButton(widget.inventarioContagemCab?.tipo,
                                (String? newValue) {
                                  paginaMestreDetalheFoiAlterada = true;
                                  setState(() {
                                    widget.inventarioContagemCab?.tipo = newValue;
                                  });
                              }, <String>[
                                'G=Geral',
                                'D=Dinâmico',
                                'R=Rotativo',
                                'A=por Amostragem',
                            ])),
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