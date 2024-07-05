/*
Title: T2Ti ERP 3.0                                                                
Description: AbaMestre Page relacionada à tabela [PESSOA] 
                                                                                
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

import 'pessoa_persiste_page.dart';
import 'cliente_persiste_page.dart';
import 'colaborador_persiste_page.dart';
import 'contador_persiste_page.dart';
import 'fornecedor_persiste_page.dart';
import 'pessoa_contato_lista_page.dart';
import 'pessoa_fisica_persiste_page.dart';
import 'pessoa_juridica_persiste_page.dart';
import 'transportadora_persiste_page.dart';

List<Aba> _todasAsAbas = <Aba>[];

List<Aba> _getAbasAtivas() {
  List<Aba> retorno = [];
  for (var item in _todasAsAbas) {
    if (item.visible!) retorno.add(item);
  }
  return retorno;
}

class PessoaPage extends StatefulWidget {
  final Pessoa pessoa;
  final String title;
  final String operacao;

  const PessoaPage({required this.pessoa, required this.title, required this.operacao, Key? key})
      : super(key: key);

  @override
  PessoaPageState createState() => PessoaPageState();
}

class PessoaPageState extends State<PessoaPage> with SingleTickerProviderStateMixin {
  TabController? _abasController;
  String _estiloBotoesAba = 'iconsAndText';

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;
  FocusNode? myFocusNode;
  
  // Pessoa
  final GlobalKey<FormState> _pessoaPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _pessoaPersisteScaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _clientePersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _clientePersisteScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _colaboradorPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _colaboradorPersisteScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _contadorPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _contadorPersisteScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _fornecedorPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _fornecedorPersisteScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _pessoaFisicaPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _pessoaFisicaPersisteScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _pessoaJuridicaPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _pessoaJuridicaPersisteScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _transportadoraPersisteFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _transportadoraPersisteScaffoldKey = GlobalKey<ScaffoldState>();

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
        _salvarPessoa();
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
        _salvarPessoa,
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
      pagina: PessoaPersistePage(
        formKey: _pessoaPersisteFormKey,
        scaffoldKey: _pessoaPersisteScaffoldKey,
        pessoa: widget.pessoa,
        foco: myFocusNode,
        salvarPessoaCallBack: _salvarPessoa,
        atualizarPessoaCallBack: _atualizarDados,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Cliente',
      visible: true,
      pagina: ClientePersistePage(
        formKey: _clientePersisteFormKey,
        scaffoldKey: _clientePersisteScaffoldKey,
        pessoa: widget.pessoa,
        foco: myFocusNode,
        salvarPessoaCallBack: _salvarPessoa,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Colaborador',
      visible: true,
      pagina: ColaboradorPersistePage(
        formKey: _colaboradorPersisteFormKey,
        scaffoldKey: _colaboradorPersisteScaffoldKey,
        pessoa: widget.pessoa,
        foco: myFocusNode,
        salvarPessoaCallBack: _salvarPessoa,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Contador',
      visible: true,
      pagina: ContadorPersistePage(
        formKey: _contadorPersisteFormKey,
        scaffoldKey: _contadorPersisteScaffoldKey,
        pessoa: widget.pessoa,
        foco: myFocusNode,
        salvarPessoaCallBack: _salvarPessoa,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Fornecedor',
      visible: true,
      pagina: FornecedorPersistePage(
        formKey: _fornecedorPersisteFormKey,
        scaffoldKey: _fornecedorPersisteScaffoldKey,
        pessoa: widget.pessoa,
        foco: myFocusNode,
        salvarPessoaCallBack: _salvarPessoa,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Pessoa Fisica',
      visible: true,
      pagina: PessoaFisicaPersistePage(
        formKey: _pessoaFisicaPersisteFormKey,
        scaffoldKey: _pessoaFisicaPersisteScaffoldKey,
        pessoa: widget.pessoa,
        foco: myFocusNode,
        salvarPessoaCallBack: _salvarPessoa,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Pessoa Juridica',
      visible: true,
      pagina: PessoaJuridicaPersistePage(
        formKey: _pessoaJuridicaPersisteFormKey,
        scaffoldKey: _pessoaJuridicaPersisteScaffoldKey,
        pessoa: widget.pessoa,
        foco: myFocusNode,
        salvarPessoaCallBack: _salvarPessoa,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.person,
      text: 'Transportadora',
      visible: true,
      pagina: TransportadoraPersistePage(
        formKey: _transportadoraPersisteFormKey,
        scaffoldKey: _transportadoraPersisteScaffoldKey,
        pessoa: widget.pessoa,
        foco: myFocusNode,
        salvarPessoaCallBack: _salvarPessoa,
    )));
    _todasAsAbas.add(Aba(
      icon: Icons.group,
      text: 'Relação - Pessoa Contato',
      visible: true,
      pagina: PessoaContatoListaPage(
        pessoa: widget.pessoa,
        foco: myFocusNode,
        salvarPessoaCallBack: _salvarPessoa,
    )));
  }

  void _atualizarDados() { // serve para atualizar algum dado após alguma ação numa página filha
    setState(() {
		// implemente este método de acordo com a necessidade
    });
  }

  bool _salvarForms() {
	  
    // valida e salva o form PessoaDetalhe
    FormState? formPessoa = _pessoaPersisteFormKey.currentState;
    if (formPessoa != null) {
      if (!formPessoa.validate()) {
        _abasController!.animateTo(0);
		return false;
      } else {
        _pessoaPersisteFormKey.currentState?.save();
        return true;
      }
    }

    // valida e salva os forms OneToOne
    FormState? formCliente = _clientePersisteFormKey.currentState;
    if (formCliente != null) {
      if (!formCliente.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _clientePersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formColaborador = _colaboradorPersisteFormKey.currentState;
    if (formColaborador != null) {
      if (!formColaborador.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _colaboradorPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formContador = _contadorPersisteFormKey.currentState;
    if (formContador != null) {
      if (!formContador.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _contadorPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formFornecedor = _fornecedorPersisteFormKey.currentState;
    if (formFornecedor != null) {
      if (!formFornecedor.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _fornecedorPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formPessoaFisica = _pessoaFisicaPersisteFormKey.currentState;
    if (formPessoaFisica != null) {
      if (!formPessoaFisica.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _pessoaFisicaPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formPessoaJuridica = _pessoaJuridicaPersisteFormKey.currentState;
    if (formPessoaJuridica != null) {
      if (!formPessoaJuridica.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _pessoaJuridicaPersisteFormKey.currentState?.save();
        return true;
      }
    }
    FormState? formTransportadora = _transportadoraPersisteFormKey.currentState;
    if (formTransportadora != null) {
      if (!formTransportadora.validate()) {
        _abasController!.animateTo(1);
        return false;
      } else {
        _transportadoraPersisteFormKey.currentState?.save();
        return true;
      }
    }
	
	return true;
  }

  void _salvarPessoa() async {
	if (_salvarForms()) {  
		gerarDialogBoxConfirmacao(context, Constantes.perguntaSalvarAlteracoes, () async {
		  var pessoaProvider = Provider.of<PessoaViewModel>(context, listen: false);
		  if (widget.operacao == 'A') {
            await pessoaProvider.alterar(widget.pessoa);
		  } else {
            await pessoaProvider.inserir(widget.pessoa);
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
      var pessoaProvider = Provider.of<PessoaViewModel>(context, listen: false);
      await pessoaProvider.excluir(widget.pessoa.id!);
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