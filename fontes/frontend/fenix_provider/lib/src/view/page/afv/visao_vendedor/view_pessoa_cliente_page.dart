/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre Page relacionada à tabela [VIEW_PESSOA_CLIENTE] 
                                                                                
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

import 'afv_visao_vendedor_rota_page.dart';
import 'afv_visao_vendedor_meta_page.dart';
import 'afv_visao_vendedor_promocao_page.dart';
import 'afv_visao_vendedor_tabela_page.dart';
import 'view_pessoa_cliente_lista_page.dart';

List<Aba> _todasAsAbas = <Aba>[];

List<Aba> getAbasAtivas() {
  List<Aba> retorno = [];
  for (var item in _todasAsAbas) {
    if (item.visible!) retorno.add(item);
  }
  return retorno;
}

class ViewPessoaClientePage extends StatefulWidget {
  final ViewPessoaCliente? viewPessoaCliente;
  final String? title;
  final String? operacao;

  const ViewPessoaClientePage({this.viewPessoaCliente, this.title, this.operacao, Key? key})
      : super(key: key);

  @override
  ViewPessoaClientePageState createState() => ViewPessoaClientePageState();
}

class ViewPessoaClientePageState extends State<ViewPessoaClientePage>
    with SingleTickerProviderStateMixin {
  TabController? _abasController;
  String _estiloBotoesAba = 'iconsAndText';

  // ViewPessoaCliente
  final GlobalKey<FormState> _viewPessoaClientePersisteFormKey = GlobalKey<FormState>();

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
        'AFV - Visão Vendedor',
        context,
        _abasController,
        getAbasAtivas(),
        getIndicator(),
        _estiloBotoesAba,
        salvarViewPessoaCliente,
        alterarEstiloBotoes,
        _avisarUsuarioAlteracoesNaPagina);
  }

  void atualizarAbas() {
    _todasAsAbas.clear();
    _todasAsAbas.add(Aba(
        icon: Icons.receipt,
        text: 'Clientes',
        visible: true,
        pagina: const ViewPessoaClienteListaPage(
          // formKey: _viewPessoaClientePersisteFormKey,
          // scaffoldKey: _viewPessoaClientePersisteScaffoldKey,
          // viewPessoaCliente: widget.viewPessoaCliente,
          // atualizaViewPessoaClienteCallBack: this.atualizarDados,
        )));
    _todasAsAbas.add(Aba(
    	icon: Icons.person,
    	text: 'Rotas',
    	visible: true,
    	pagina: const AfvVisaoVendedorRotaPage(
    		// formKey: _pessoaFisicaPersisteFormKey,
    		// scaffoldKey: _pessoaFisicaPersisteScaffoldKey,
    		// pessoa: widget.pessoa
        )));
    _todasAsAbas.add(Aba(
    	icon: Icons.person,
    	text: 'Metas',
    	visible: true,
    	pagina: const AfvVisaoVendedorMetaPage(
    		// formKey: _pessoaFisicaPersisteFormKey,
    		// scaffoldKey: _pessoaFisicaPersisteScaffoldKey,
    		// pessoa: widget.pessoa
        )));
    _todasAsAbas.add(Aba(
    	icon: Icons.person,
    	text: 'Tabelas de Preço',
    	visible: true,
    	pagina: const AfvVisaoVendedorTabelaPage(
    		// formKey: _pessoaFisicaPersisteFormKey,
    		// scaffoldKey: _pessoaFisicaPersisteScaffoldKey,
    		// pessoa: widget.pessoa
        )));
    _todasAsAbas.add(Aba(
    	icon: Icons.person,
    	text: 'Promoções',
    	visible: true,
    	pagina: const AfvVisaoVendedorPromocaoPage(
    		// formKey: _pessoaFisicaPersisteFormKey,
    		// scaffoldKey: _pessoaFisicaPersisteScaffoldKey,
    		// pessoa: widget.pessoa
        )));
  }

  void atualizarDados() { // serve para atualizar algum dado após alguma ação numa página filha
    setState(() {
    });
  }

  void salvarForms() {
    // valida e salva o form ViewPessoaClienteDetalhe
    FormState? formViewPessoaCliente = _viewPessoaClientePersisteFormKey.currentState;
    if (formViewPessoaCliente != null) {
      if (!formViewPessoaCliente.validate()) {
        _abasController!.animateTo(0);
      } else {
        _viewPessoaClientePersisteFormKey.currentState?.save();
      }
    }

    // valida e salva os forms OneToOne
  }

  void salvarViewPessoaCliente() async {
    salvarForms();
    var viewPessoaClienteProvider = Provider.of<ViewPessoaClienteViewModel>(context);
    if (widget.operacao == 'A') {
      await viewPessoaClienteProvider.alterar(widget.viewPessoaCliente!);
    } else {
      await viewPessoaClienteProvider.inserir(widget.viewPessoaCliente!);
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