/*
Title: T2Ti ERP 3.0                                                                
Description: Caixa - Página de Fechamento da Venda - Efetua Pagamento
                                                                                
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

Based on: Flutter UI Challenges by Many - https://github.com/lohanidamodar/flutter_ui_challenges
*******************************************************************************/
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:pegasus_pdv/src/database/database.dart';

import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:pegasus_pdv/src/infra/atalhos_pdv.dart';

import 'package:pegasus_pdv/src/view/shared/botoes.dart';
import 'package:pegasus_pdv/src/view/shared/widgets_input.dart';
import 'package:pegasus_pdv/src/view/shared/widgets_caixa.dart';
import 'package:pegasus_pdv/src/view/shared/caixas_de_dialogo.dart';
import 'package:pegasus_pdv/src/view/shared/view_util_lib.dart';

import 'package:pegasus_pdv/src/view/page/pdv/parcelamento_receitas_page.dart';

class EfetuaPagamentoPage extends StatefulWidget {
  final String? title;

  const EfetuaPagamentoPage({Key? key, this.title}) : super(key: key);

  @override
  EfetuaPagamentoPageState createState() => EfetuaPagamentoPageState();
}

class EfetuaPagamentoPageState extends State<EfetuaPagamentoPage> {
  final _valorController = MoneyMaskedTextController(precision: Constantes.decimaisValor, initialValue: Sessao.vendaAtual!.valorFinal ?? 0);
  
  final _tipoPagamentoFoco = FocusNode();
  final _valorFoco = FocusNode();

  final ScrollController controllerScroll = ScrollController();

  double _saldoRestante = 0;
  double _totalRecebido = 0;
  PdvTipoPagamento? _tipoPagamento = Sessao.listaTipoPagamento![0];

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void initState() {
    super.initState();

    _valorFoco.addListener(() {
      if(_valorFoco.hasFocus) {
        _valorController.selection = TextSelection(baseOffset: 0, extentOffset: _valorController.text.length);
      }
    });

    _shortcutMap = getAtalhosCaixa();
    _actionMap = <Type, Action<Intent>>{
      AtalhoTelaIntent: CallbackAction<AtalhoTelaIntent>(
        onInvoke: _tratarAcoesAtalhos,
      ),
    };
    bootstrapGridParameters(
      gutterSize: Constantes.flutterBootstrapGutterSize,
    );
    Sessao.listaDadosPagamento.clear();
    _valorFoco.requestFocus();        

    WidgetsBinding.instance.addPostFrameCallback((_) => _zerarTotalRecebido());
  }

  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      case AtalhoTelaType.cancelar:
        Navigator.pop(context);
        break;
      case AtalhoTelaType.confirmar:
        _confirmar();
        break;
      case AtalhoTelaType.fechamentoRapido:
        _fechamentoRapido();
        break;
      case AtalhoTelaType.escape:
        Navigator.pop(context);
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
        autofocus: true,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.deepPurple.shade200, Colors.deepPurple.shade600]),
                ),
              ),
              ListView.builder(
                itemCount: 3,
                itemBuilder: _mainListBuilder,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainListBuilder(BuildContext context, int index) {
    if (index == 0) return cabecalhoTela(context);
    // if (index == 1) return dadosFechamento(context);
    if (index == 1) return rodapeTela(context);
    return const SizedBox();
  }

  SizedBox cabecalhoTela(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    widget.title!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),

                  BootstrapContainer(                    
                    fluid: true,
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: Biblioteca.isTelaPequena(context) == true ? ViewUtilLib.paddingBootstrapContainerTelaPequena : ViewUtilLib.paddingBootstrapContainerTelaGrande,
                    children: <Widget>[			  			  
                      BootstrapRow(
                        height: 60,
                        children: <BootstrapCol>[
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Card(
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                                child: Column(
                                  children: <Widget>[
                                    const Text("Informe os dados do pagamento"),
                                    const Divider(
                                      indent: 10,
                                      endIndent: 10,
                                      thickness: 2,
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                    getBotaoGenericoPdv(
                                      descricao: Biblioteca.isMobile() ? 'Fechamento Rápido em Dinheiro' : 'Fechamento Rápido em Dinheiro [F2]',
                                      cor: Colors.blue, 
                                      onPressed: () {
                                        _fechamentoRapido();
                                      }
                                    ),                                         
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                    InputDecorator(
                                      decoration: const InputDecoration(
                                        labelText: 'Tipo Pagamento',
                                        hintText: 'Selecione o tipo de pagamento desejado',
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      isEmpty: _tipoPagamento == null,
                                      child: DropdownButton<PdvTipoPagamento>(
                                        focusNode: _tipoPagamentoFoco,
                                        isExpanded: true,
                                        value: _tipoPagamento,
                                        onChanged: (PdvTipoPagamento? newValue) {
                                          setState(() {
                                            _tipoPagamento = newValue;
                                          });
                                        },
                                        items: Sessao.listaTipoPagamento!.map<DropdownMenuItem<PdvTipoPagamento>>((PdvTipoPagamento value) {
                                          return DropdownMenuItem<PdvTipoPagamento>(
                                            value: value,
                                            child: Text(value.descricao!),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                    TextField(
                                      // enableInteractiveSelection: !Biblioteca.isDesktop(),
                                      textAlign: TextAlign.end,
                                      focusNode: _valorFoco,
                                      keyboardType: TextInputType.number,
                                      controller: _valorController,
                                      decoration: getInputDecoration(
                                              'Informe o valor para o tipo',
                                              'Valor',
                                              false),
                                      onSubmitted: (value) {
                                        _adicionarPagamento();
                                      },
                                      onChanged: (text) {
                                        // _formFoiAlterado = true;
                                      },
                                    ),                                    
                                    const Divider(
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 2,
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                    SizedBox(
                                      height: 170.0,
                                      child: Scrollbar(
                                        controller: controllerScroll,
                                        child: ListView(
                                          controller: controllerScroll,
                                          padding: const EdgeInsets.all(2.0),
                                          children: <Widget>[
                                            SingleChildScrollView(
                                              controller: controllerScroll,
                                              scrollDirection: Axis.horizontal,
                                              child: Card(
                                                color: Colors.white,
                                                elevation: 2.0,
                                                child: DataTable(
                                                    columns: getColumnsFechamento(),
                                                    rows: getRowsFechamento()),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                    const Divider(
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-md-6',
                            child: Card(
                              elevation: 4,
                              child: Column(
                                children: <Widget>[                                        
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  const Text("Resumo da venda"),
                                  const Divider(
                                    indent: 10,
                                    endIndent: 10,
                                    thickness: 2,
                                  ),
                                  getItemResumoValor(
                                    descricao: 'Total Venda: ',
                                    valor: 'R\$ ${Constantes.formatoDecimalValor.format(Sessao.vendaAtual!.valorVenda ?? 0)}',
                                    corFundo: Colors.blue.shade100,
                                  ),
                                  getItemResumoValor(
                                    descricao: 'Desconto: ',
                                    valor: 'R\$ ${Constantes.formatoDecimalValor.format(Sessao.vendaAtual!.valorDesconto ?? 0)}',
                                    corFundo: Colors.red.shade100,
                                  ),
                                  // getItemResumoValor(
                                  //   descricao: 'Acréscimo: ',
                                  //   valor: 'R\$ ${0 != null ? Constantes.formatoDecimalValor.format(0) : 0.toStringAsFixed(Constantes.decimaisValor)}',
                                  //   corFundo: Colors.blue.shade100,
                                  // ),
                                  getItemResumoValor(
                                    descricao: 'Total a Receber: ',
                                    valor: 'R\$ ${Constantes.formatoDecimalValor.format(Sessao.vendaAtual!.valorFinal ?? 0)}',
                                    corFundo: Colors.blue.shade100,
                                  ),
                                  getItemResumoValor(
                                    descricao: 'Total Recebido: ',
                                    valor: 'R\$ ${Constantes.formatoDecimalValor.format(Sessao.vendaAtual!.valorRecebido ?? 0)}',
                                    corFundo: Colors.green.shade100,
                                  ),
                                  getItemResumoValor(
                                    descricao: 'Saldo Restante: ',
                                    valor: 'R\$ ${Constantes.formatoDecimalValor.format(_saldoRestante)}',
                                    corFundo: Colors.blue.shade100,
                                  ),
                                  getItemResumoValor(
                                    descricao: 'Troco: ',
                                    valor: 'R\$ ${Constantes.formatoDecimalValor.format(Sessao.vendaAtual!.valorTroco ?? 0)}',
                                    corFundo: Colors.red.shade100,
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                ],
                              ),
                            ),                                  
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage(Constantes.pagamentoIcon),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<DataColumn> getColumnsFechamento() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(
      label: Text(
        "Tipo",
        style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    ));
    lista.add(const DataColumn(
      numeric: true,
      label: Text(
        "Valor",
        style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    ));
    return lista;
  }

  List<DataRow> getRowsFechamento() {
    List<DataRow> lista = [];
    for (var itemPagamento in Sessao.listaDadosPagamento) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(
          Text(
            _getDescricaoTipoPagamento(itemPagamento)!,
          ), 
          onTap: () => _excluirPagamento(itemPagamento)),
        DataCell(
          Text(itemPagamento.valor != null ? Constantes.formatoDecimalValor.format(itemPagamento.valor) : 0.toStringAsFixed(Constantes.decimaisValor)),
          onTap: () => _excluirPagamento(itemPagamento)),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  Container rodapeTela(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _getBotoesRodape(context: context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getBotoesRodape({required BuildContext context}) {
    List<Widget> listaBotoes = [];
    listaBotoes.add(
      SizedBox(
        width: Biblioteca.isTelaPequena(context)! ? 130 : 150,
        child: getBotaoGenericoPdv(
          descricao: Biblioteca.isMobile() ? 'Cancelar' : 'Cancelar [F11]',
          cor: Colors.red, 
          onPressed: () {
            Navigator.pop(context, false);
          }
        ),        
      ),
    );
    listaBotoes.add(
      const SizedBox(width: 10.0),
    );
    listaBotoes.add(
      SizedBox(
        width: Biblioteca.isTelaPequena(context)! ? 130 : 150,
        child: getBotaoGenericoPdv(
          descricao: Biblioteca.isMobile() ? 'Confirmar' : 'Confirmar [F12]',
          cor: Colors.green, 
          onPressed: () {
            _confirmar();
          }
        ),
      ),
    );
    return listaBotoes;
  }

  String? _getDescricaoTipoPagamento(PdvTotalTipoPagamento itemPagamento){
    final tipoFiltrado = Sessao.listaTipoPagamento!.where( ((tipo) => tipo.id == itemPagamento.idPdvTipoPagamento)).toList();    
    return tipoFiltrado[0].descricao;
  }

  void _fechamentoRapido() {
    PdvTotalTipoPagamento itemPagamento = PdvTotalTipoPagamento(
      id: null,
      idPdvTipoPagamento: _tipoPagamento!.id,
      dataVenda: DateTime.now(),
      horaVenda: Biblioteca.formatarHora(DateTime.now()),
      valor: Sessao.vendaAtual!.valorFinal
    );
    Sessao.listaDadosPagamento.clear();
    Sessao.listaDadosPagamento.add(itemPagamento);
    _atualizarTotais();
    Navigator.pop(context, true);
  }

  void _adicionarPagamento() {
    if (_valorController.numberValue > 0) {
      final pagamentoFiltrado = Sessao.listaDadosPagamento.where(((pagamento) => pagamento.idPdvTipoPagamento == _tipoPagamento!.id!)).toList();    
      if (pagamentoFiltrado.isEmpty) {
        PdvTotalTipoPagamento itemPagamento = PdvTotalTipoPagamento(
          id: null,
          idPdvTipoPagamento: _tipoPagamento!.id,
          dataVenda: DateTime.now(),
          horaVenda: Biblioteca.formatarHora(DateTime.now()),
          valor: _valorController.numberValue
        );
        Sessao.listaDadosPagamento.add(itemPagamento);
      }
    }
    setState(() {
      _atualizarTotais();
      _tipoPagamentoFoco.requestFocus();
    });
  }

  void _excluirPagamento(PdvTotalTipoPagamento itemPagamento) {
    gerarDialogBoxExclusao(context, () {
      // Navigator.of(context).pop();
      setState(() {
        Sessao.listaDadosPagamento.removeWhere((item) => item.idPdvTipoPagamento == itemPagamento.idPdvTipoPagamento);
        _atualizarTotais();
      });
      _tipoPagamentoFoco.requestFocus();
    });
  }  

  void _atualizarTotais() {
    _totalRecebido = 0;
    for (var item in Sessao.listaDadosPagamento) {
      _totalRecebido = _totalRecebido + item.valor!;
    }
    _saldoRestante = Sessao.vendaAtual!.valorFinal! - _totalRecebido;
    _saldoRestante = _saldoRestante > 0 ? _saldoRestante : 0;
    double troco = _totalRecebido - Sessao.vendaAtual!.valorFinal!;
    troco = troco < 0 ? 0 : troco;
    //
    _valorController.text = _saldoRestante.toStringAsFixed(2);
    Sessao.vendaAtual = 
    Sessao.vendaAtual!.copyWith(
      valorRecebido: Value(_totalRecebido),
      valorTroco: Value(troco),
    );
  }

  void _zerarTotalRecebido() {
    setState(() {
      Sessao.vendaAtual = 
      Sessao.vendaAtual!.copyWith(
        valorRecebido: const Value(0),
        valorTroco: const Value(0),
      );  
    });    
  }  

  Future<void> _confirmar() async {
    _atualizarTotais();
    if (_totalRecebido < Sessao.vendaAtual!.valorFinal!) {
      gerarDialogBoxInformacao(context, 'Valores informados não são suficientes para finalizar a venda.');
    } else {
      bool passouFiado = false;
      final totalFiado = _verificarFiado();
      if (totalFiado > 0) {
        if (Sessao.vendaAtual!.idCliente == null) {
          showInSnackBar("Para o controle de FIADO é preciso informar o cliente na venda.", context);          
        } else {
          ClienteFiado clienteFiado = ClienteFiado(
            id: null,
            idPdvVendaCabecalho: Sessao.vendaAtual!.id,
            valorPendente: totalFiado,
            dataLancamento: Sessao.vendaAtual!.dataVenda,
            idCliente: Sessao.vendaAtual!.idCliente,
          );
          await Sessao.db.clienteFiadoDao.inserir(clienteFiado);
          passouFiado = true;
        }
      }
      if (passouFiado) {
        _verificarParcelamento();
      } else {
        if (!mounted) return;
        Navigator.pop(context, true);
      }
    }
  }

  bool _getPagamentoFiado(PdvTotalTipoPagamento itemPagamento){
    final tipoFiltrado = Sessao.listaTipoPagamento!.where( ((tipo) => tipo.id == itemPagamento.idPdvTipoPagamento)).toList();    
    return tipoFiltrado[0].codigo == '99';
  }

  double _verificarFiado() {
    double totalFiado = 0;
    for (var itemPagamento in Sessao.listaDadosPagamento) {
      if (_getPagamentoFiado(itemPagamento)) {
        totalFiado = totalFiado + itemPagamento.valor!;
      }
    }
    return totalFiado;
  }

  bool _getPagamentoGeraParcelas(PdvTotalTipoPagamento itemPagamento){
    final tipoFiltrado = Sessao.listaTipoPagamento!.where( ((tipo) => tipo.id == itemPagamento.idPdvTipoPagamento)).toList();    
    return tipoFiltrado[0].geraParcelas == 'S';
  }

  void _verificarParcelamento() async {
    double totalParcelamento = 0;
    for (var itemPagamento in Sessao.listaDadosPagamento) {
      if (_getPagamentoGeraParcelas(itemPagamento)) {
        totalParcelamento = totalParcelamento + itemPagamento.valor!;
      }
    }
    if (totalParcelamento > 0) {
      bool? finalizouParcelamento = await Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (BuildContext context) => ParcelamentoReceitasPage(title: 'Parcelamento da Venda', totalParcelamento: totalParcelamento,)));
      if (!mounted) return;
      if (finalizouParcelamento ?? false) {
        Navigator.pop(context, true);
      } else {
        Navigator.pop(context, false);
      }
    } else {
      Navigator.pop(context, true);
    }
  }
}

