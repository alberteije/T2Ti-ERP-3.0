/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre PersistePage relacionada à tabela [REQUISICAO_INTERNA_CABECALHO] 
                                                                                
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

class RequisicaoInternaCabecalhoPersistePage extends StatefulWidget {
  final RequisicaoInternaCabecalho? requisicaoInternaCabecalho;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FocusNode? foco;
  final Function? salvarRequisicaoInternaCabecalhoCallBack;
  final Function? atualizarRequisicaoInternaCabecalhoCallBack;

  const RequisicaoInternaCabecalhoPersistePage(
      {Key? key, this.formKey, this.scaffoldKey, this.requisicaoInternaCabecalho, this.foco, this.salvarRequisicaoInternaCabecalhoCallBack, this.atualizarRequisicaoInternaCabecalhoCallBack})
      : super(key: key);

  @override
  RequisicaoInternaCabecalhoPersistePageState createState() => RequisicaoInternaCabecalhoPersistePageState();
}

class RequisicaoInternaCabecalhoPersistePageState extends State<RequisicaoInternaCabecalhoPersistePage> {
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
        widget.salvarRequisicaoInternaCabecalhoCallBack!();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final importaColaboradorController = TextEditingController();
    importaColaboradorController.text = widget.requisicaoInternaCabecalho?.colaborador?.pessoa?.nome ?? '';

    return FocusableActionDetector(
      actions: _actionMap,
      shortcuts: _shortcutMap,
      child: Focus(
        child: Scaffold(
          appBar: AppBar(
            leading: const SizedBox(),
            actions: <Widget>[
              IconButton(
                tooltip: 'Passar Situação para Aberta',
                icon: const Icon(Icons.redo, color: Colors.white),
                onPressed: () {
                  // Navigator.pop(context);
                  widget.requisicaoInternaCabecalho!.situacao = 'Aberta';
                  widget.salvarRequisicaoInternaCabecalhoCallBack!();
                },
              ),      
              const SizedBox( width: 10,),      
              IconButton(
                tooltip: 'Deferir Requisição',
                icon: const Icon(Icons.check, color: Colors.white),
                onPressed: () {
                  widget.requisicaoInternaCabecalho!.situacao = 'Deferida';
                  widget.salvarRequisicaoInternaCabecalhoCallBack!();
                  // Navigator.pop(context);
                },
              ),
              IconButton(
                tooltip: 'Indeferir Requisição',
                icon: const Icon(Icons.cancel, color: Colors.white),
                onPressed: () {
                  widget.requisicaoInternaCabecalho!.situacao = 'Indeferida';
                  widget.salvarRequisicaoInternaCabecalhoCallBack!();
                  // Navigator.pop(context);
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
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    child: TextFormField(
                                      controller: importaColaboradorController,
                                      readOnly: true,
                                      decoration: getInputDecoration(
                                        'Importe o Colaborador Vinculado',
                                        'Colaborador *',
                                        false),
                                      onSaved: (String? value) {
                                      },
                                      validator: ValidaCampoFormulario.validarObrigatorio,
                                      onChanged: (text) {
                                        widget.requisicaoInternaCabecalho?.colaborador?.pessoa?.nome = text;
                                  paginaMestreDetalheFoiAlterada = true;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: IconButton(
                                    tooltip: 'Importar Colaborador',
                                    icon: ViewUtilLib.getIconBotaoLookup(),
                                    onPressed: () async {
                                      ///chamando o lookup
                                      Map<String, dynamic>? objetoJsonRetorno =
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                              LookupPage(
                                                title: 'Importar Colaborador',
                                                colunas: ViewPessoaColaborador.colunas,
                                                campos: ViewPessoaColaborador.campos,
                                                rota: '/view-pessoa-colaborador/',
                                                campoPesquisaPadrao: 'nome',
                                                valorPesquisaPadrao: '%',
                                              ),
                                              fullscreenDialog: true,
                                            ));
                                      if (objetoJsonRetorno != null) {
                                        if (objetoJsonRetorno['nome'] != null) {
                                          importaColaboradorController.text = objetoJsonRetorno['nome'];
                                          widget.requisicaoInternaCabecalho?.idColaborador = objetoJsonRetorno['id'];

                                          var colaborador = Colaborador();
                                          colaborador.pessoa = ViewPessoaColaborador();
                                          colaborador.id = objetoJsonRetorno['id'];
                                          colaborador.pessoa!.nome = objetoJsonRetorno['nome'];
                                          widget.requisicaoInternaCabecalho?.colaborador = colaborador;   
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
                            sizes: 'col-12 col-md-4',
                            child: Padding(
                              padding: Biblioteca.distanciaEntreColunasQuebraLinha(context)!,
                              child: InputDecorator(
                                decoration: getInputDecoration(
                                  'Informe a Data da Requisição',
                                  'Data da Requisição',
                                  true),
                                isEmpty: widget.requisicaoInternaCabecalho?.dataRequisicao == null,
                                child: DatePickerItem(
                                  mascara: 'dd/MM/yyyy',
                                  dateTime: widget.requisicaoInternaCabecalho?.dataRequisicao,
                                  firstDate: DateTime.parse('1900-01-01'),
                                  lastDate: DateTime.now(),
                                  onChanged: (DateTime? value) {
                                    paginaMestreDetalheFoiAlterada = true;
                                    setState(() {
                                      widget.requisicaoInternaCabecalho?.dataRequisicao = value;
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Situação da Requisição:',
                                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.0, color: Colors.black, fontStyle: FontStyle.italic)
                                        ),
                                  Text(widget.requisicaoInternaCabecalho?.situacao ?? "",
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black,)
                                        ),
                                ],
                              ) 
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