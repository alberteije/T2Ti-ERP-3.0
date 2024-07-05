/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre Page relacionada à tabela [CTE_CABECALHO] 
                                                                                
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
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:fenix/src/infra/constantes.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/view/shared/widgets_abas.dart';

import 'cte_cabecalho_persiste_page.dart';
import 'cte_carga_lista_page.dart';
import 'cte_destinatario_persiste_page.dart';
import 'cte_local_entrega_persiste_page.dart';
import 'cte_remetente_persiste_page.dart';
import 'cte_rodoviario_persiste_page.dart';
// import 'cte_tomador_persiste_page.dart';

List<Aba> _todasAsAbas = <Aba>[];

List<Aba> _getAbasAtivas() {
  List<Aba> retorno = [];
  for (var item in _todasAsAbas) {
    if (item.visible!) retorno.add(item);
  }
  return retorno;
}

class CteCabecalhoPage extends StatefulWidget {
  final CteCabecalho cteCabecalho;
  final String title;
  final String operacao;

  const CteCabecalhoPage({required this.cteCabecalho, required this.title, required this.operacao, Key? key})
      : super(key: key);

  @override
  CteCabecalhoPageState createState() => CteCabecalhoPageState();
}

class CteCabecalhoPageState extends State<CteCabecalhoPage> with SingleTickerProviderStateMixin {
  TabController? _abasController;
  String _estiloBotoesAba = 'iconsAndText';

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;
  FocusNode? myFocusNode;
  
  // CteCabecalho
  final GlobalKey<FormState> _cteCabecalhoPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _cteCabecalhoPersisteScaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _cteDestinatarioPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _cteDestinatarioPersisteScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _cteLocalEntregaPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _cteLocalEntregaPersisteScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _cteRemetentePersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _cteRemetentePersisteScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _cteRodoviarioPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _cteRodoviarioPersisteScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _cteTomadorPersisteFormKey = GlobalKey<FormState>();
  // final GlobalKey<ScaffoldState> _cteTomadorPersisteScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _atualizarAbas();
    _abasController = TabController(vsync: this, length: _getAbasAtivas().length);
    _abasController!.addListener(_salvarForms);
    paginaMestreDetalheFoiAlterada = false; // vamos controlar as alterações nas paginas filhas aqui para alertar ao usuario sobre possivel perda de dados
  
    bootstrapGridParameters(
      gutterSize: Constantes.flutterBootstrapGutterSize,
    );

    _shortcutMap = getAtalhosPersistePage();

    _actionMap = <Type, Action<Intent>>{
      AtalhoTelaIntent: CallbackAction<AtalhoTelaIntent>(
        onInvoke: _tratarAcoesAtalhos,
      ),
    };

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode!.dispose();
    _abasController!.dispose();
    super.dispose();
  }
  
  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      case AtalhoTelaType.salvar:
        _salvarCteCabecalho();
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
        autofocus: false, //o foco deve ser enviado para as páginas filhas e elas devem chamar o método salvar
        child: getScaffoldAbaPage(
        widget.title,
        context,
        _abasController,
        _getAbasAtivas(),
        _getIndicator(),
        _estiloBotoesAba,
        _salvarCteCabecalho,
        _alterarEstiloBotoes,
        _avisarUsuarioAlteracoesNaPagina,
        excluir: widget.operacao == 'A' ? _excluir : null),
      ),
    );
  }
  
  void _atualizarAbas() {
    _todasAsAbas.clear();
    // a primeira aba sempre é a de Persistencia da tabela Mestre
    _todasAsAbas.add(Aba(
      icon: Icons.receipt,
      text: Constantes.tituloAbaDetalhePrincipal,
      visible: true,
      pagina: CteCabecalhoPersistePage(
        formKey: _cteCabecalhoPersisteFormKey,
        scaffoldKey: _cteCabecalhoPersisteScaffoldKey,
        cteCabecalho: widget.cteCabecalho,
        foco: myFocusNode,
        salvarCteCabecalhoCallBack: _salvarCteCabecalho,
        atualizarCteCabecalhoCallBack: _atualizarDados,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Cte Destinatario',
      visible: true,
      pagina: CteDestinatarioPersistePage(
        formKey: _cteDestinatarioPersisteFormKey,
        scaffoldKey: _cteDestinatarioPersisteScaffoldKey,
        cteCabecalho: widget.cteCabecalho,
        foco: myFocusNode,
        salvarCteCabecalhoCallBack: _salvarCteCabecalho,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Cte Local Entrega',
      visible: true,
      pagina: CteLocalEntregaPersistePage(
        formKey: _cteLocalEntregaPersisteFormKey,
        scaffoldKey: _cteLocalEntregaPersisteScaffoldKey,
        cteCabecalho: widget.cteCabecalho,
        foco: myFocusNode,
        salvarCteCabecalhoCallBack: _salvarCteCabecalho,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Cte Remetente',
      visible: true,
      pagina: CteRemetentePersistePage(
        formKey: _cteRemetentePersisteFormKey,
        scaffoldKey: _cteRemetentePersisteScaffoldKey,
        cteCabecalho: widget.cteCabecalho,
        foco: myFocusNode,
        salvarCteCabecalhoCallBack: _salvarCteCabecalho,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Cte Rodoviario',
      visible: true,
      pagina: CteRodoviarioPersistePage(
        formKey: _cteRodoviarioPersisteFormKey,
        scaffoldKey: _cteRodoviarioPersisteScaffoldKey,
        cteCabecalho: widget.cteCabecalho,
        foco: myFocusNode,
        salvarCteCabecalhoCallBack: _salvarCteCabecalho,
    )));
    // _todasAsAbas.add(Aba(
    //   icon: Icons.person,
    //   text: 'Cte Tomador',
    //   visible: true,
    //   pagina: CteTomadorPersistePage(
    //     formKey: _cteTomadorPersisteFormKey,
    //     scaffoldKey: _cteTomadorPersisteScaffoldKey,
    //     cteCabecalho: widget.cteCabecalho,
    //     foco: myFocusNode,
    //     salvarCteCabecalhoCallBack: _salvarCteCabecalho,
    // )));
    _todasAsAbas.add(Aba(
      icon: Icons.group,
      text: 'Relação - Cte Carga',
      visible: true,
      pagina: CteCargaListaPage(
        cteCabecalho: widget.cteCabecalho,
        foco: myFocusNode,
        salvarCteCabecalhoCallBack: _salvarCteCabecalho,
    )));
  }

  void _atualizarDados() { // serve para atualizar algum dado após alguma ação numa página filha
    setState(() {
		// implemente este método de acordo com a necessidade
    });
  }

  bool _salvarForms() {
	  
    // valida e salva o form CteCabecalhoDetalhe
    FormState? formCteCabecalho = _cteCabecalhoPersisteFormKey.currentState;
    if (formCteCabecalho != null) {
      if (!formCteCabecalho.validate()) {
        _abasController!.animateTo(0);
		return false;
      } else {
        _cteCabecalhoPersisteFormKey.currentState?.save();
        return true;
      }
    }

    // valida e salva os forms OneToOne
    FormState? formCteDestinatario = _cteDestinatarioPersisteFormKey.currentState;
    if (formCteDestinatario != null) {
      if (!formCteDestinatario.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _cteDestinatarioPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formCteLocalEntrega = _cteLocalEntregaPersisteFormKey.currentState;
    if (formCteLocalEntrega != null) {
      if (!formCteLocalEntrega.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _cteLocalEntregaPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formCteRemetente = _cteRemetentePersisteFormKey.currentState;
    if (formCteRemetente != null) {
      if (!formCteRemetente.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _cteRemetentePersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formCteRodoviario = _cteRodoviarioPersisteFormKey.currentState;
    if (formCteRodoviario != null) {
      if (!formCteRodoviario.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _cteRodoviarioPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formCteTomador = _cteTomadorPersisteFormKey.currentState;
    if (formCteTomador != null) {
      if (!formCteTomador.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _cteTomadorPersisteFormKey.currentState?.save();
        return true;
      }
    }
	
	return true;
  }

  void _salvarCteCabecalho() async {
	if (_salvarForms()) {  
		gerarDialogBoxConfirmacao(context, Constantes.perguntaSalvarAlteracoes, () async {
		  var cteCabecalhoProvider = Provider.of<CteCabecalhoViewModel>(context, listen: false);
		  if (widget.operacao == 'A') {
            await cteCabecalhoProvider.alterar(widget.cteCabecalho);
		  } else {
            await cteCabecalhoProvider.inserir(widget.cteCabecalho);
		  }
      if (!mounted) return;
      showInSnackBar("Registro atualizado com sucesso.", context, corFundo: Colors.green);
		  Navigator.pop(context);
		  Navigator.pop(context);
		});
	} else {
      showInSnackBar("Por favor, corrija os erros apresentados antes de continuar.", context);
    }
  }

  void _excluir() {
    gerarDialogBoxExclusao(context, () async {
      var cteCabecalhoProvider = Provider.of<CteCabecalhoViewModel>(context, listen: false);
      await cteCabecalhoProvider.excluir(widget.cteCabecalho.id!);
      if (!mounted) return;
      Navigator.of(context).pop();
      Navigator.of(context).pop();
  	  showInSnackBar("Registro excluído com sucesso!", context, corFundo: Colors.green);
    });
  }

  void _alterarEstiloBotoes(String style) {
    setState(() {
      _estiloBotoesAba = style;
    });
  }

  Decoration? _getIndicator() {
    return getShapeDecorationAbaPage(_estiloBotoesAba);
  }

  Future<bool> _avisarUsuarioAlteracoesNaPagina() async {
    if (!paginaMestreDetalheFoiAlterada) {
      return true;
    } else {
      await (gerarDialogBoxFormAlterado(context));
      return false;
    }
  }
}