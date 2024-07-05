/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre Page relacionada à tabela [VENDA_CABECALHO] 
                                                                                
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

import 'package:fenix/src/view/page/vendas/venda_cabecalho/venda_frete_persiste_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:fenix/src/infra/constantes.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/view/shared/widgets_abas.dart';

import 'venda_cabecalho_persiste_page.dart';
// import 'venda_comissao_lista_page.dart';
import 'venda_detalhe_lista_page.dart';

List<Aba> _todasAsAbas = <Aba>[];

List<Aba> _getAbasAtivas() {
  List<Aba> retorno = [];
  for (var item in _todasAsAbas) {
    if (item.visible!) retorno.add(item);
  }
  return retorno;
}

class VendaCabecalhoPage extends StatefulWidget {
  final VendaCabecalho vendaCabecalho;
  final String title;
  final String operacao;

  const VendaCabecalhoPage({required this.vendaCabecalho, required this.title, required this.operacao, Key? key})
      : super(key: key);

  @override
  VendaCabecalhoPageState createState() => VendaCabecalhoPageState();
}

class VendaCabecalhoPageState extends State<VendaCabecalhoPage> with SingleTickerProviderStateMixin {
  TabController? _abasController;
  String _estiloBotoesAba = 'iconsAndText';

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;
  FocusNode? myFocusNode;
  
  // VendaCabecalho
  final GlobalKey<FormState> _vendaCabecalhoPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _vendaCabecalhoPersisteScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _vendaFretePersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _vendaFretePersisteScaffoldKey = GlobalKey<ScaffoldState>();

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
        _salvarVendaCabecalho();
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
        _salvarVendaCabecalho,
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
      pagina: VendaCabecalhoPersistePage(
        formKey: _vendaCabecalhoPersisteFormKey,
        scaffoldKey: _vendaCabecalhoPersisteScaffoldKey,
        vendaCabecalho: widget.vendaCabecalho,
        foco: myFocusNode,
        salvarVendaCabecalhoCallBack: _salvarVendaCabecalho,
        atualizarVendaCabecalhoCallBack: _atualizarDados,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Frete',
      visible: true,
      pagina: VendaFretePersistePage(
        formKey: _vendaFretePersisteFormKey,
        scaffoldKey: _vendaFretePersisteScaffoldKey,
        vendaCabecalho: widget.vendaCabecalho,
        foco: myFocusNode,
        salvarVendaCabecalhoCallBack: _salvarVendaCabecalho,
    )));    
    // _todasAsAbas.add(Aba(
    //   icon: Icons.group,
    //   text: 'Relação - Venda Comissao',
    //   visible: true,
    //   pagina: VendaComissaoListaPage(
    //     vendaCabecalho: widget.vendaCabecalho,
    //     foco: myFocusNode,
    //     salvarVendaCabecalhoCallBack: _salvarVendaCabecalho,
    // )));
    _todasAsAbas.add(Aba(
      icon: Icons.group,
      text: 'Relação - Venda Detalhe',
      visible: true,
      pagina: VendaDetalheListaPage(
        vendaCabecalho: widget.vendaCabecalho,
        foco: myFocusNode,
        salvarVendaCabecalhoCallBack: _salvarVendaCabecalho,
    )));
  }

  void _atualizarDados() { // serve para atualizar algum dado após alguma ação numa página filha
    setState(() {
		// implemente este método de acordo com a necessidade
    });
  }

  bool _salvarForms() {
	  
    // valida e salva o form VendaCabecalhoDetalhe
    FormState? formVendaCabecalho = _vendaCabecalhoPersisteFormKey.currentState;
    if (formVendaCabecalho != null) {
      if (!formVendaCabecalho.validate()) {
        _abasController!.animateTo(0);
		return false;
      } else {
        _vendaCabecalhoPersisteFormKey.currentState?.save();
		return true;
      }
    }

    // valida e salva os forms OneToOne
    FormState? formvendaFrete = _vendaFretePersisteFormKey.currentState;
    if (formvendaFrete != null) {
      if (!formvendaFrete.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _vendaFretePersisteFormKey.currentState?.save();
        return true;
      }
    }

	return true;
  }

  void _salvarVendaCabecalho() async {
	if (_salvarForms()) {  
		gerarDialogBoxConfirmacao(context, Constantes.perguntaSalvarAlteracoes, () async {
		  var vendaCabecalhoProvider = Provider.of<VendaCabecalhoViewModel>(context, listen: false);
		  if (widget.operacao == 'A') {
        await vendaCabecalhoProvider.alterar(widget.vendaCabecalho);
		  } else {
        await vendaCabecalhoProvider.inserir(widget.vendaCabecalho);
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
      var vendaCabecalhoProvider = Provider.of<VendaCabecalhoViewModel>(context, listen: false);
      await vendaCabecalhoProvider.excluir(widget.vendaCabecalho.id!);
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
		await gerarDialogBoxFormAlterado(context);
		return false;
	}
  }
}