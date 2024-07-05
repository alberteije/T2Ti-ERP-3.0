/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre Page relacionada à tabela [NFSE_CABECALHO] 
                                                                                
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

import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';
import 'package:fenix/src/view/shared/widgets_abas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'nfse_cabecalho_persiste_page.dart';
import 'nfse_detalhe_lista_page.dart';
import 'nfse_intermediario_persiste_page.dart';

List<Aba> _todasAsAbas = <Aba>[];

List<Aba> getAbasAtivas() {
  List<Aba> retorno = [];
  for (var item in _todasAsAbas) {
    if (item.visible!) retorno.add(item);
  }
  return retorno;
}

class NfseCabecalhoPage extends StatefulWidget {
  final NfseCabecalho nfseCabecalho;
  final String title;
  final String operacao;

  const NfseCabecalhoPage({ required this.nfseCabecalho, required this.title, required this.operacao, Key? key})
      : super(key: key);

  @override
  NfseCabecalhoPageState createState() => NfseCabecalhoPageState();
}

class NfseCabecalhoPageState extends State<NfseCabecalhoPage>
    with SingleTickerProviderStateMixin {
  TabController? _abasController;
  String _estiloBotoesAba = 'iconsAndText';

  // NfseCabecalho
  final GlobalKey<FormState> _nfseCabecalhoPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _nfseCabecalhoPersisteScaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _nfseIntermediarioPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _nfseIntermediarioPersisteScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    atualizarAbas();
    _abasController = TabController(vsync: this, length: getAbasAtivas().length);
    _abasController!.addListener(salvarForms);
    paginaMestreDetalheFoiAlterada = false; // vamos controlar as alterações nas paginas filhas aqui para alertar ao usuario sobre possivel perda de dados
  }

  @override
  void dispose() {
    _abasController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getScaffoldAbaPage(
        widget.title,
        context,
        _abasController,
        getAbasAtivas(),
        getIndicator(),
        _estiloBotoesAba,
        salvarNfseCabecalho,
        alterarEstiloBotoes,
        _avisarUsuarioAlteracoesNaPagina);
  }

  void atualizarAbas() {
    _todasAsAbas.clear();
	 // a primeira aba sempre é a de Persistencia da tabela Mestre
    _todasAsAbas.add(Aba(
        icon: Icons.receipt,
        text: 'Detalhes',
        visible: true,
        pagina: NfseCabecalhoPersistePage(
          formKey: _nfseCabecalhoPersisteFormKey,
          scaffoldKey: _nfseCabecalhoPersisteScaffoldKey,
          nfseCabecalho: widget.nfseCabecalho,
          atualizaNfseCabecalhoCallBack: atualizarDados,
        )));
    _todasAsAbas.add(Aba(
    	icon: Icons.person,
    	text: 'Nfse Intermediario',
    	visible: true,
    	pagina: NfseIntermediarioPersistePage(
    		formKey: _nfseIntermediarioPersisteFormKey,
    		scaffoldKey: _nfseIntermediarioPersisteScaffoldKey,
    		nfseCabecalho: widget.nfseCabecalho)));
    _todasAsAbas.add(Aba(
    	icon: Icons.group,
    	text: 'Relação - Nfse Detalhe',
    	visible: true,
    	pagina: NfseDetalheListaPage(nfseCabecalho: widget.nfseCabecalho)));
  }

  void atualizarDados() { // serve para atualizar algum dado após alguma ação numa página filha
    setState(() {
    });
  }

  void salvarForms() {
    // valida e salva o form NfseCabecalhoDetalhe
    FormState? formNfseCabecalho = _nfseCabecalhoPersisteFormKey.currentState;
    if (formNfseCabecalho != null) {
      if (!formNfseCabecalho.validate()) {
        _abasController!.animateTo(0);
      } else {
        _nfseCabecalhoPersisteFormKey.currentState?.save();
      }
    }

    // valida e salva os forms OneToOne
    FormState? formNfseIntermediario = _nfseIntermediarioPersisteFormKey.currentState;
    if (formNfseIntermediario != null) {
    	if (!formNfseIntermediario.validate()) {
    		_abasController!.animateTo(1);
    	} else {
    		_nfseIntermediarioPersisteFormKey.currentState?.save();
    	}
    }
  }

  void salvarNfseCabecalho() async {
    salvarForms();
    var nfseCabecalhoProvider = Provider.of<NfseCabecalhoViewModel>(context);
    if (widget.operacao == 'A') {
      await nfseCabecalhoProvider.alterar(widget.nfseCabecalho);
    } else {
      await nfseCabecalhoProvider.inserir(widget.nfseCabecalho);
    }
    if (!mounted) return;
    Navigator.pop(context);
  }

  void alterarEstiloBotoes(String style) {
    setState(() {
      _estiloBotoesAba = style;
    });
  }

  Decoration? getIndicator() {
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