/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre Page relacionada à tabela [NFE_CABECALHO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2023 T2Ti.COM                                          
                                                                                
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

import 'package:fenix/src/infra/infra.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/widgets_abas.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';

import 'estoque_nfe_cabecalho_persiste_page.dart';
import 'estoque_nfe_emitente_persiste_page.dart';
import 'estoque_nfe_detalhe_lista_page.dart';

List<Aba> _todasAsAbas = <Aba>[];

List<Aba> _getAbasAtivas() {
  List<Aba> retorno = [];
  for (var item in _todasAsAbas) {
    if (item.visible!) retorno.add(item);
  }
  return retorno;
}

class EstoqueNfeCabecalhoPage extends StatefulWidget {
  final NfeCabecalho nfeCabecalho;
  final String title;
  final String operacao;

  const EstoqueNfeCabecalhoPage({required this.nfeCabecalho, required this.title, required this.operacao, Key? key})
      : super(key: key);

  @override
  EstoqueNfeCabecalhoPageState createState() => EstoqueNfeCabecalhoPageState();
}

class EstoqueNfeCabecalhoPageState extends State<EstoqueNfeCabecalhoPage> with SingleTickerProviderStateMixin {
  TabController? _abasController;
  String _estiloBotoesAba = 'iconsAndText';

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;
  FocusNode? myFocusNode;
  
  // NfeCabecalho
  final GlobalKey<FormState> _nfeCabecalhoPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _nfeCabecalhoPersisteScaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _nfeDestinatarioPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _nfeDestinatarioPersisteScaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _nfeCanaPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nfeEmitentePersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nfeFaturaPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nfeInformacaoPagamentoPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nfeLocalEntregaPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nfeLocalRetiradaPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nfeResponsavelTecnicoPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nfeTransportePersisteFormKey = GlobalKey<FormState>();

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
        _salvarNfeCabecalho();
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
          _salvarNfeCabecalho,
          _alterarEstiloBotoes,
          _avisarUsuarioAlteracoesNaPagina,
          excluir: widget.operacao == 'A' ? _excluir : null,
        ),
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
      pagina: EstoqueNfeCabecalhoPersistePage(
        formKey: _nfeCabecalhoPersisteFormKey,
        scaffoldKey: _nfeCabecalhoPersisteScaffoldKey,
        nfeCabecalho: widget.nfeCabecalho,
        foco: myFocusNode,
        salvarNfeCabecalhoCallBack: _salvarNfeCabecalho,
        atualizarNfeCabecalhoCallBack: _atualizarDados,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Emitente',
      visible: true,
      pagina: EstoqueNfeEmitentePersistePage(
        formKey: _nfeDestinatarioPersisteFormKey,
        scaffoldKey: _nfeDestinatarioPersisteScaffoldKey,
        nfeCabecalho: widget.nfeCabecalho,
        foco: myFocusNode,
        salvarNfeCabecalhoCallBack: _salvarNfeCabecalho,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.group,
      text: 'Itens da Nf-e',
      visible: true,
      pagina: EstoqueNfeDetalheListaPage(
        nfeCabecalho: widget.nfeCabecalho,
        foco: myFocusNode,
        salvarNfeCabecalhoCallBack: _salvarNfeCabecalho,
    )));    
  }

  void _atualizarDados() { // serve para atualizar algum dado após alguma ação numa página filha
    setState(() {
		// implemente este método de acordo com a necessidade
    });
  }

  bool _salvarForms() {
	  
    // valida e salva o form NfeCabecalhoDetalhe
    FormState? formNfeCabecalho = _nfeCabecalhoPersisteFormKey.currentState;
    if (formNfeCabecalho != null) {
      if (!formNfeCabecalho.validate()) {
        _abasController!.animateTo(0);
		return false;
      } else {
        _nfeCabecalhoPersisteFormKey.currentState?.save();
		return true;
      }
    }

    // valida e salva os forms OneToOne
    FormState? formNfeCana = _nfeCanaPersisteFormKey.currentState;
    if (formNfeCana != null) {
      if (!formNfeCana.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _nfeCanaPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formNfeDestinatario = _nfeDestinatarioPersisteFormKey.currentState;
    if (formNfeDestinatario != null) {
      if (!formNfeDestinatario.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _nfeDestinatarioPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formNfeEmitente = _nfeEmitentePersisteFormKey.currentState;
    if (formNfeEmitente != null) {
      if (!formNfeEmitente.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _nfeEmitentePersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formNfeFatura = _nfeFaturaPersisteFormKey.currentState;
    if (formNfeFatura != null) {
      if (!formNfeFatura.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _nfeFaturaPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formNfeInformacaoPagamento = _nfeInformacaoPagamentoPersisteFormKey.currentState;
    if (formNfeInformacaoPagamento != null) {
      if (!formNfeInformacaoPagamento.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _nfeInformacaoPagamentoPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formNfeLocalEntrega = _nfeLocalEntregaPersisteFormKey.currentState;
    if (formNfeLocalEntrega != null) {
      if (!formNfeLocalEntrega.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _nfeLocalEntregaPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formNfeLocalRetirada = _nfeLocalRetiradaPersisteFormKey.currentState;
    if (formNfeLocalRetirada != null) {
      if (!formNfeLocalRetirada.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _nfeLocalRetiradaPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formNfeResponsavelTecnico = _nfeResponsavelTecnicoPersisteFormKey.currentState;
    if (formNfeResponsavelTecnico != null) {
      if (!formNfeResponsavelTecnico.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _nfeResponsavelTecnicoPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formNfeTransporte = _nfeTransportePersisteFormKey.currentState;
    if (formNfeTransporte != null) {
      if (!formNfeTransporte.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _nfeTransportePersisteFormKey.currentState?.save();
        return true;
      }
    }
	
	return true;
  }

  void _salvarNfeCabecalho() async {
	if (_salvarForms()) {  
		gerarDialogBoxConfirmacao(context, Constantes.perguntaSalvarAlteracoes, () async {
		  var nfeCabecalhoProvider = Provider.of<NfeCabecalhoViewModel>(context, listen: false);
		  if (widget.operacao == 'A') {
  			await nfeCabecalhoProvider.alterar(widget.nfeCabecalho);
		  } else {
  			await nfeCabecalhoProvider.inserir(widget.nfeCabecalho);
		  }
      if (!mounted) return;
      if (nfeCabecalhoProvider.objetoJsonErro == null) {
  			showInSnackBar("Registro atualizado com sucesso.", context, corFundo: Colors.green);
      } else {
  			nfeCabecalhoProvider.objetoJsonErro = null;      
      }
		  Navigator.pop(context);
		});
	} else {
      showInSnackBar("Por favor, corrija os erros apresentados antes de continuar.", context);
    }
  }

  void _excluir() {
    gerarDialogBoxExclusao(context, () async {
      var nfeCabecalhoProvider = Provider.of<NfeCabecalhoViewModel>(context, listen: false);
      await nfeCabecalhoProvider.excluir(widget.nfeCabecalho.id!);
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