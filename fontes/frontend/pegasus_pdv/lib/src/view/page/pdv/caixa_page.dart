/*
Title: T2Ti ERP Pegasus                                                                
Description: Tela do caixa do Pegasus PDV
                                                                                
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
import 'dart:convert';

// import 'package:crypto/crypto.dart'; // TODO: descomente para usar o SAT
import 'package:drift/drift.dart' hide Column;

import 'package:flutter/material.dart';

import 'package:bottomreveal/bottomreveal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:pegasus_pdv/src/database/database_classes.dart';
import 'package:pegasus_pdv/src/database/database.dart';

import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:pegasus_pdv/src/infra/atalhos_pdv.dart';
import 'package:pegasus_pdv/src/controller/controller.dart';
import 'package:pegasus_pdv/src/service/service.dart';

import 'package:pegasus_pdv/src/view/menu/menu_lateral_pdv.dart';
import 'package:pegasus_pdv/src/view/login/registro_page.dart';
import 'package:pegasus_pdv/src/view/page/page.dart';
import 'package:pegasus_pdv/src/view/shared/page/lookup_local_page.dart';
import 'package:pegasus_pdv/src/view/shared/page/pdf_page.dart';
import 'package:pegasus_pdv/src/view/shared/view_util_lib.dart';
import 'package:pegasus_pdv/src/view/shared/widgets_caixa.dart';
import 'package:pegasus_pdv/src/view/shared/botoes.dart';
import 'package:pegasus_pdv/src/view/shared/caixas_de_dialogo.dart';
import 'package:pegasus_pdv/src/view/shared/widgets_input.dart';


class CaixaPage extends StatefulWidget {
  const CaixaPage({Key? key}) : super(key: key);

  @override
  CaixaPageState createState() => CaixaPageState();
}

class CaixaPageState extends State<CaixaPage> {
  final BottomRevealController _menuController = BottomRevealController();
  final _pesquisaProdutoController = TextEditingController();
  final _focusNode = FocusNode();

  String? _codigoDeBarras;
  double? _quantidadeInformada = 1;
  bool _fornecidoDescontoNoItem = false;
  String _tituloJanela = Constantes.tituloCaixaAberto;
  String _modulo = "Pegasus PDV";
  bool _emitindoNota = false;

  Produto? _produto = const Produto(id: null);

  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  void refresh() {
    setState(() {
      _atualizarTotais();
    });
  }

  @override
  void initState() {
    super.initState();
    _shortcutMap = getAtalhosCaixa();
    _actionMap = <Type, Action<Intent>>{
      AtalhoTelaIntent: CallbackAction<AtalhoTelaIntent>(
        onInvoke: _tratarAcoesAtalhos,
      ),
    };

    Sessao.refrescarCaixaCallBack = refresh;

    WidgetsBinding.instance.addPostFrameCallback((_) => _verificarRegistro());
    WidgetsBinding.instance.addPostFrameCallback((_) => _verificarNotasPendentesContingencia());
    // TODO: comentado para fazer testes para o SAT - descomente para produção WidgetsBinding.instance.addPostFrameCallback((_) => _verificarPlanoNfcePertoExpirar());
  }

  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      case AtalhoTelaType.identificarVendedor:
        _identificarVendedor();
        break;
      case AtalhoTelaType.identificarCliente:
        _identificarCliente();
        break;
      case AtalhoTelaType.acessarOpcoesGerenciais:
        _acessarOpcoesGerenciais();
        break;
      case AtalhoTelaType.recuperarVenda:
        _recuperarVenda();
        break;
      case AtalhoTelaType.concederDesconto:
        _concederDesconto();
        break;
      case AtalhoTelaType.cancelar:
        _cancelarVenda();
        break;
      case AtalhoTelaType.confirmar:
        _salvarVenda();
        break;
      case AtalhoTelaType.importarProduto:
        _importarProduto();
        break;
      case AtalhoTelaType.encerrarVenda:
        _encerrarVenda();
        break;
      case AtalhoTelaType.escape:
        _fecharMenus();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      enabled: !_emitindoNota, // libera os atalhos se não tiver emitindo nota
      actions: _actionMap,
      shortcuts: _shortcutMap,
      descendantsAreFocusable: true,
      child: Focus(
        autofocus: true,
        child: AbsorbPointer(
          absorbing: _emitindoNota, // desabilita os controles se tiver emitindo nota
          child: GestureDetector(
            onTap: () { _focusNode.requestFocus(); },
            child: Scaffold(
              key: _keyScaffold,
              endDrawer: const MenuLateralPDV(),
              endDrawerEnableOpenDragGesture: true,
              appBar: AppBar(
                title: Column(
                  children: [
                    Text(_tituloJanela),
                    Text(_modulo,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 9.0, color: Colors.white, fontStyle: FontStyle.italic)
                    ),
                  ],
                ),
                actions: _getBotoesAppBar(context: context),
                ),
              body: BottomReveal(
                openIcon: Icons.menu,
                closeIcon: Icons.close,
                revealWidth: Biblioteca.isTelaPequena(context)! ? 90 : 100,
                revealHeight: Biblioteca.isTelaPequena(context)! ? 120 : 100,
                backColor: Colors.grey.shade600,
                frontColor: Colors.grey.shade300,
                rightContent: menuInternoDireita(context),
                bottomContent: menuInternoRodape(context),
                controller: _menuController,
                body: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: TextField(
                                readOnly: _emitindoNota, // deixa somente leitura se tiver emitindo nota
                                focusNode: _focusNode,
                                // autofocus: true,
                                controller: _pesquisaProdutoController,
                                onSubmitted: (value) { _localizarProduto(value); _pesquisaProdutoController.text = ''; },
                                decoration: getInputDecoration(
                                  'Pesquise Nome ou Código de Barras',
                                  'Pesquisar Produto',
                                  false),
                                onChanged: (text) {
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: IconButton(
                              tooltip: 'Pesquisar Produto',
                              icon: ViewUtilLib.getIconBotaoLookup(),
                              onPressed: () {
                                _localizarProduto(_pesquisaProdutoController.text); _pesquisaProdutoController.text = '';
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: Sessao.listaVendaAtualDetalhe.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              _excluirProduto(index: index, perguntaAntes: false);
                            },
                            background: Container(color: Colors.red),
                            child: itensDaVenda(context, index, onDelete: () => _excluirProduto(index: index, perguntaAntes: true)),
                          );
                        },
                      ),
                    ),
                    clienteSelecionado(context),
                    vendedorSelecionado(context),
                    rodape(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// #region widgets Caixa

  Widget itensDaVenda(BuildContext context, int index, {Function? onDelete}) {
    var item = index + 1;
    return Card(child:
      ListTile(
        minLeadingWidth: Biblioteca.isTelaPequena(context)! ? 0 : 20,
        onTap: () {
          Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (BuildContext context) => ProdutoDetalhePage(title: 'Detalhe do Produto', item: Sessao.listaVendaAtualDetalhe[index])))
            .then((_) {
              if (Sessao.listaVendaAtualDetalhe[index].pdvVendaDetalhe!.quantidade! <= 0) {
                _excluirProduto(index: index, perguntaAntes: false);
              }
              else {
                setState(() {
                  _atualizarTotais();
                });
              }
            });
        },
        title: 
        Text(montarDescricaoItem(index),
          style: 
          (Sessao.listaVendaAtualDetalhe[index].pdvVendaDetalhe!.valorDesconto ?? 0) > 0 
          ? const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Colors.red, fontStyle: FontStyle.italic)
          : const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
        ),
        leading: Text(
          item.toString(),
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13.0),
        ),
        subtitle: Row(          
          mainAxisAlignment: Biblioteca.isTelaPequena(context)! ? MainAxisAlignment.center : MainAxisAlignment.end,
          children: <Widget>[
            // valor unitário
            getCardValorUnitario(context: context, valorUnitario: Sessao.listaVendaAtualDetalhe[index].pdvVendaDetalhe!.valorUnitario),
            const SizedBox(
              width: 8,
            ),
            getBotaoDecrementaCaixa(decrementar: () {_decrementarItem(item: Sessao.listaVendaAtualDetalhe[index]);} ),
            // quantidade e unidade
            getCardQuantidade(context: context, quantidade: Sessao.listaVendaAtualDetalhe[index].pdvVendaDetalhe!.quantidade),
            getBotaoIncrementaCaixa(incrementar: () {_incrementarItem(item: Sessao.listaVendaAtualDetalhe[index]);} ),
            const SizedBox(
              width: 8,
            ),
            // valor total
            getCardValorTotal(context: context, valorTotal: Sessao.listaVendaAtualDetalhe[index].pdvVendaDetalhe!.valorTotal),
          ],
        ),
        trailing: 
          Biblioteca.isTelaPequena(context)!
          ? null
          : IconButton(
            onPressed: onDelete as void Function()?,
            color: Colors.red,
            icon: const Icon(Icons.delete),
            iconSize: 20,
          ),
      ),
    );
  }

  String montarDescricaoItem(int index) {
    if ((Sessao.listaVendaAtualDetalhe[index].pdvVendaDetalhe!.valorDesconto ?? 0) > 0 ) {
      String retorno = '${Sessao.listaVendaAtualDetalhe[index].produto!.gtin!} - ${Sessao.listaVendaAtualDetalhe[index].produto!.nome!}';
      // ignore: prefer_interpolation_to_compose_strings
      retorno = retorno + ' [desconto: (' + 
      Constantes.formatoDecimalValor.format(Sessao.listaVendaAtualDetalhe[index].pdvVendaDetalhe!.taxaDesconto ?? 0) + '%) R\$ ' + 
      Constantes.formatoDecimalValor.format(Sessao.listaVendaAtualDetalhe[index].pdvVendaDetalhe!.valorDesconto ?? 0) + ']';
      return retorno;
    } else {
      return '${Sessao.listaVendaAtualDetalhe[index].produto!.gtin!} - ${Sessao.listaVendaAtualDetalhe[index].produto!.nome!}';
    }
  }

  Widget clienteSelecionado(BuildContext context) {
    if ((Sessao.vendaAtual!.nomeCliente != null && Sessao.vendaAtual!.nomeCliente != '') 
    ||  (Sessao.vendaAtual!.cpfCnpjCliente != null && Sessao.vendaAtual!.cpfCnpjCliente != '')) {
      return Material(
        color: Colors.blueGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 0, right: 0),
              child: Text(
                // ignore: prefer_interpolation_to_compose_strings
                "Cliente: " + (Sessao.vendaAtual!.nomeCliente ?? '') + ' - CPF: ' + (Sessao.vendaAtual!.cpfCnpjCliente ?? ''),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white),
              ),
            ),
          ],
        ),
      );
    } else {
      return const Material();
    }
  }

  Widget vendedorSelecionado(BuildContext context) {
    if (Sessao.vendaAtual!.idColaborador != null) {
      return Material(
        color: Colors.blueGrey.shade900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 0, right: 0),
              child: Text(
                "Vendedor: ${Sessao.vendaAtual!.idColaborador}",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white),
              ),
            ),
          ],
        ),
      );
    } else {
      return const Material();
    }
  }

  Widget rodape(BuildContext context) {
    return Material(
      color: Colors.lightBlue.shade900,
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 0, left: 10, right: 10),
                    child: Text(
                      "Itens: ${Sessao.listaVendaAtualDetalhe.length}", 
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 15, left: 10, right: 10),
                child: Text(
                  Constantes.formatoDecimalValor.format(Sessao.vendaAtual!.valorFinal ?? 0),
                  style: 
                  (Sessao.vendaAtual!.valorDesconto ?? 0) > 0 
                  ? const TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.amberAccent, fontStyle: FontStyle.italic)
                  : const TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.yellow),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 90, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: Biblioteca.isTelaPequena(context)! ? 130 : 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 4, backgroundColor: Colors.green.shade700,
                      padding: Biblioteca.isTelaPequena(context)! 
                                ? const EdgeInsets.only(left: 6.0, right: 6.0, top: 12.0, bottom: 12.0) 
                                : const EdgeInsets.all(15.0), 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                    ),
                    onPressed: () {
                      _encerrarVenda();
                    },
                    child: Text(Biblioteca.isTelaPequena(context)! ? "Encerrar Venda" : "Encerrar Venda [F7]", 
                      style: Biblioteca.isTelaPequena(context)! ? const TextStyle(fontSize: 15) : const TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            )
          ),        
        ],
      ),
    );
  }

  Row menuInternoRodape(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        getBotaoInternoCaixa(
          texto: Constantes.botaoCaixaVendedor,
          icone: FontAwesomeIcons.userTie,
          tamanhoIcone: 35,
          corBotao: Colors.black54,
          paddingAll: 15,
          onPressed: () {
            _identificarVendedor();
          },
        ),
        const SizedBox(width: 10.0),
        getBotaoInternoCaixa(
          texto: Constantes.botaoCaixaCliente,
          icone: FontAwesomeIcons.userTag,
          tamanhoIcone: 35,
          corBotao: Colors.black45,
          paddingAll: 15,
          onPressed: () {
            _identificarCliente();
          },
        ),
        const SizedBox(width: 10.0),
        getBotaoInternoCaixa(
          texto: Constantes.botaoCaixaOpcoes,
            icone: FontAwesomeIcons.imagePortrait,
            tamanhoIcone: 35,
            corBotao: Colors.black38,
            paddingAll: 15,
            onPressed: () {
              _acessarOpcoesGerenciais();
            }),
      ],
    );
  }

  FittedBox menuInternoDireita(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          getBotaoInternoCaixa(
              texto: Constantes.botaoCaixaSalvar,
              icone: FontAwesomeIcons.floppyDisk,
              tamanhoIcone: 30,
              corBotao: Colors.blue.shade900,
              paddingAll: 0,
              onPressed: () {
                _salvarVenda();
              }),
          const SizedBox(height: 10.0),
          getBotaoInternoCaixa(
              texto: Constantes.botaoCaixaCancelar,
              icone: FontAwesomeIcons.doorClosed,
              tamanhoIcone: 30,
              corBotao: Colors.red.shade900,
              paddingAll: 0,
              onPressed: () {
                _cancelarVenda();
              }),
          const SizedBox(height: 10.0),
          getBotaoInternoCaixa(
            texto: Constantes.botaoCaixaRecuperar,
            icone: FontAwesomeIcons.receipt,
            tamanhoIcone: 30,
            corBotao: Colors.orange.shade900,
            paddingAll: 0,
            onPressed: () {
              _recuperarVenda();
            },
          ),
          const SizedBox(height: 10.0),
          getBotaoInternoCaixa(
              texto: Constantes.botaoCaixaDesconto,
              icone: FontAwesomeIcons.moneyBill,
              tamanhoIcone: 30,
              corBotao: Colors.green.shade900,
              paddingAll: 0,
              onPressed: () {
                _concederDesconto();
              }),
        ],
      )
    );
  }

  List<Widget> _getBotoesAppBar({BuildContext? context}) {
    List<Widget> listaBotoes = [];
    listaBotoes.add(
      IconButton(
        icon: ViewUtilLib.getIconBotaoInserir(),
        tooltip: Constantes.botaoCaixaImportarProdutoDica,
        onPressed: () {
          _importarProduto();
        },
      ),
    );

    // só adiciona o botão para reimpressão do recibo se estiver no módulo gratuito
    if (Sessao.configuracaoPdv!.modulo == 'G') {
      listaBotoes.add(
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.fileInvoice),
          tooltip: 'Reimpressão de Recibo',
          onPressed: () async {
            _reimprimirRecibo();
          },
        ),
      );
    } 

    // se a plataforma for mobile, insere o botão para ler o código de barras com o celular
    if (Biblioteca.isMobile()) {
      listaBotoes.add(
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.barcode),
          tooltip: "Ler código de barras",
          onPressed: () async {
            try {
              _codigoDeBarras = await FlutterBarcodeScanner.scanBarcode(
                  "#ff6666", "Cancelar", true, ScanMode.BARCODE);
            } catch (e) {
              throw ('Erro lendo código de barras: ${DateTime.now().toIso8601String()} - $e');
            }
            _localizarProduto(_codigoDeBarras);
          },
        ),
      );
    }
    return listaBotoes;
  }

// #endregion widgets Caixa


// #region métodos Caixa

  void _acessarOpcoesGerenciais() {
    if (Sessao.statusCaixa == StatusCaixa.vendaEmAndamento) {
      _exibirMensagemExisteVendaEmAndamento();
    } else {
      _keyScaffold.currentState!.openEndDrawer();
    }
  }

  void _salvarVenda() {
    if (Sessao.statusCaixa == StatusCaixa.vendaEmAndamento) {
      if (Sessao.listaVendaAtualDetalhe.isNotEmpty) {
        gerarDialogBoxConfirmacao(context, 'Deseja salvar a venda e iniciar uma nova?', () async {
          await Sessao.db.pdvVendaCabecalhoDao.alterar(Sessao.vendaAtual!, Sessao.listaVendaAtualDetalhe);
          // Navigator.of(context).pop();
          _configurarDadosTelaPadrao();
        });
      } else {
        _exibirMensagemExisteVendaSemItens();
      }
    } else {
      _exibirMensagemNaoExisteVendaEmAndamento();
    }
  }

  void _cancelarVenda() {
    if (Sessao.statusCaixa == StatusCaixa.vendaEmAndamento) {
      gerarDialogBoxConfirmacao(context, 'Deseja cancelar o processo e iniciar novamente?', () async {
        // no caso de um cancelamento, vamos apenas salvar a venda com o status "A - Aberto", pois ela pode estar vinculada a uma NFC-e
        Sessao.vendaAtual = 
        Sessao.vendaAtual!.copyWith(
          statusVenda: const Value('A'),
        );        
        await Sessao.db.pdvVendaCabecalhoDao.alterar(Sessao.vendaAtual!, Sessao.listaVendaAtualDetalhe);
        _configurarDadosTelaPadrao();
      });
    } else {
      _exibirMensagemNaoExisteVendaEmAndamento();
    }
  }

  void _encerrarVenda() async {
    if (Sessao.statusCaixa == StatusCaixa.vendaEmAndamento) {
      if (Sessao.listaVendaAtualDetalhe.isNotEmpty) {
        _emitindoNota = true;
        bool? encerrouVenda = await Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const EfetuaPagamentoPage(title: 'Encerramento da Venda')));
          if (encerrouVenda ?? false) {
            Sessao.vendaAtual = 
            Sessao.vendaAtual!.copyWith(
              statusVenda: const Value('F')
            );
            await Sessao.db.pdvVendaCabecalhoDao.alterar(Sessao.vendaAtual!, Sessao.listaVendaAtualDetalhe, listaDadosPagamento: Sessao.listaDadosPagamento);
            if (Sessao.configuracaoPdv!.moduloFiscalPrincipal == 'NFC') {
              await _encerrarVendaComNfce();
            }
            else if (Sessao.configuracaoPdv!.moduloFiscalPrincipal == 'SAT') {
              await _encerrarVendaComCfe();
            } else {
              _imprimirRecibo();
            }
          } else {
            _emitindoNota = false;
          }
      }  else {
        _exibirMensagemExisteVendaSemItens();
      }
    } else {
      _exibirMensagemNaoExisteVendaEmAndamento();
    }
  }

  Future _encerrarVendaComCfe() async {
    gerarDialogBoxEspera(context);
    final gerouDadosOK = await SatController.gerarDadosCfe();
    if (gerouDadosOK) {
      Sessao.ultimoIniCfeEnviado = await SatController.montarCfe();
      final retorno = await ACBrMonitorController.emitirCfe();        
      _imprimirCupomSat(retorno);
    } else {
      if (!mounted) return;
      Sessao.fecharDialogBoxEspera(context);
      gerarDialogBoxErro(context, 'Ocorreu um problema na geração do Cfe-Sat');
    }      
  }

  Future _encerrarVendaComNfce() async {
    gerarDialogBoxEspera(context);
    final gerouDadosOK = await NfceController.gerarDadosNfce();
    if (gerouDadosOK) {
      Sessao.ultimoIniNfceEnviado = await NfceController.montarNfce();
      final bytesNfce = utf8.encode(Sessao.ultimoIniNfceEnviado);      
      NfceService nfceService = NfceService();
      final retorno = await nfceService.emitirNfce(
        base64.encode(bytesNfce),
        Sessao.numeroNfce!.numero!.toString()
      );        
      if (!mounted) return;
      if (retorno != null) {
        if (retorno is String) {
          if (retorno.contains('12002') || retorno.contains('109') || retorno.contains('999')) {
            Sessao.fecharDialogBoxEspera(context);
            gerarDialogBoxConfirmacao(context, 
              'O servidor da Sefaz não responde. Deseja IMPRIMIR a nota em contingência off-line?', 
              () async {
                gerarDialogBoxEspera(context);
                if (await NfceController.gerarDadosNfceContingencia()) {
                  final bytesNfceContingencia = utf8.encode(Sessao.ultimoIniNfceEnviado);      
                  NfceService nfceService = NfceService();
                  final retornoContingencia = await nfceService.emitirNfceContingencia(
                    base64.encode(bytesNfceContingencia),
                    Sessao.numeroNfce!.numero!.toString()
                  );       
                  if (!mounted) return; 
                  if (retornoContingencia != null) {
                    if (retornoContingencia is String) {
                      Sessao.fecharDialogBoxEspera(context);
                      gerarDialogBoxErro(context, 'Ocorreu um problema na geração da NFC-e: \n$retorno');          
                    } else if (retornoContingencia is Uint8List) {
                      await NfceController.atualizarDadosNfce(chaveAcesso: Sessao.ultimaChaveDeAcesso, statusNota: '6'); // 6=contingencia
                      _imprimirDanfe(retornoContingencia);
                    }
                  }
                }
              },
              onCancelPressed: () {
                Sessao.fecharDialogBoxEspera(context);
              }
            );
          } else {
            Sessao.fecharDialogBoxEspera(context);
            gerarDialogBoxErro(context, 'Ocorreu um problema na geração da NFC-e: \n$retorno');          
          }
        } else if (retorno is Uint8List) {
          await NfceController.atualizarDadosNfce(chaveAcesso: Sessao.ultimaChaveDeAcesso, statusNota: '4'); // 4=autorizada
          _imprimirDanfe(retorno);
        }
      } else {
        Sessao.fecharDialogBoxEspera(context);
      }
    } else {
      if (!mounted) return;
      Sessao.fecharDialogBoxEspera(context);
      gerarDialogBoxErro(context, 'Ocorreu um problema na geração da NFC-e');
    }      

    /////////////////////////////////////////
    /// Utilize o código abaixo para se comunicar diretamente com o ACBrMonitor
    /////////////////////////////////////////

    // NfceAcbrService servicoNfce = NfceAcbrService();
    // Socket? socket;
    // try {
    //   // ignore: close_sinks
    //   socket = await servicoNfce.conectar(
    //     context, 
    //     funcaoDeCallBack: _imprimirDanfe, 
    //     operacao: 'INICIO', 
    //     formaEmissao: '1'
    //   );
    //   final gerouDadosOK = await NfceController.gerarDadosNfce();
    //   if (gerouDadosOK) {
    //     Sessao.ultimoIniNfceEnviado = await NfceController.montarNfce();
    //     socket!.write('NFE.SetFormaEmissao(1)")\r\n.\r\n'); // 1=normal
    //   } else {
    //     gerarDialogBoxErro(context, 'Ocorreu um problema na geração da NFC-e');
    //   }
    // } catch (e) {
    //   if (socket != null) {
    //     socket.close();
    //     socket.destroy();
    //   }
    //   gerarDialogBoxErro(context, 'Ocorreu um problema ao tentar emitir a NFC-e: ' + e.toString());
    // }
  }

  void _imprimirRecibo() {
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) { 
          if (Sessao.configuracaoPdv!.reciboFormatoPagina == 'A4') {
            return const ReciboRelatorioA4(); 
          } else if (Sessao.configuracaoPdv!.reciboFormatoPagina == '80') {
            return const ReciboRelatorio80(); 
          } else {
            return const ReciboRelatorio57(); 
          }
        }))
      .then((_) {
        _configurarDadosTelaPadrao();
      });
  }

  void _imprimirDanfe(Uint8List danfe) {
    Sessao.fecharDialogBoxEspera(context);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) => PdfPage(
          arquivoPdf: danfe, title: 'NFC-e')
        )
      ).then(
        (value) {
          _configurarDadosTelaPadrao();
        }
      );          
  }

  void _imprimirCupomSat(Uint8List cupom) {
    Sessao.fecharDialogBoxEspera(context);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) => PdfPage(
          arquivoPdf: cupom, title: 'Cfe-Sat')
        )
      ).then(
        (value) {
          _configurarDadosTelaPadrao();
        }
      );          
  }

  /////////////////////////////////////////
  /// Utilize o código abaixo para se comunicar diretamente com o ACBrMonitor
  /////////////////////////////////////////
  // void _imprimirDanfe(String danfeBase64) {
  //   var decodeB64 = base64.decode(danfeBase64); 
  //   Navigator.of(context)
  //     .push(MaterialPageRoute(
  //       builder: (BuildContext context) => PdfPage(
  //         arquivoPdf: decodeB64, title: 'NFC-e')
  //       )
  //     ).then(
  //       (value) {
  //         _configurarDadosTelaPadrao();
  //       }
  //     );          
  // }

  void _reimprimirRecibo() async {
    if (Sessao.statusCaixa == StatusCaixa.vendaEmAndamento) {
      _exibirMensagemExisteVendaEmAndamento();
    } else {
      Map<String, dynamic>? objetoJsonRetorno = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LookupLocalPage(
              title: 'Reimprimir Recibo de Venda',
              colunas: PdvVendaCabecalhoDao.colunas,
              campos: PdvVendaCabecalhoDao.campos,
              campoPesquisaPadrao: 'id',
              valorPesquisaPadrao: '%',
              metodoConsultaCallBack: _filtrarVendaFechadaLookup,
            ),
            fullscreenDialog: true,
          ));
      if (objetoJsonRetorno != null) {
        Sessao.vendaAtual = await Sessao.db.pdvVendaCabecalhoDao.consultarObjeto(objetoJsonRetorno['id']);
        Sessao.listaVendaAtualDetalhe = await Sessao.db.pdvVendaDetalheDao.consultarListaComProduto(objetoJsonRetorno['id']);
        Sessao.listaDadosPagamento = await Sessao.db.pdvTotalTipoPagamentoDao.consultarPagamentosDeUmaVenda(Sessao.vendaAtual!.id!);
        _imprimirRecibo();
      }          
    }
  }

  void _recuperarVenda() async {
    if (Sessao.statusCaixa == StatusCaixa.vendaEmAndamento) {
      _exibirMensagemExisteVendaEmAndamento();
    } else {
      Map<String, dynamic>? objetoJsonRetorno = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LookupLocalPage(
              title: 'Recuperar Venda',
              colunas: PdvVendaCabecalhoDao.colunas,
              campos: PdvVendaCabecalhoDao.campos,
              campoPesquisaPadrao: 'id',
              valorPesquisaPadrao: '%',
              metodoConsultaCallBack: _filtrarVendaLookup,
            ),
            fullscreenDialog: true,
          ));
      if (objetoJsonRetorno != null) {
        Sessao.vendaAtual = await Sessao.db.pdvVendaCabecalhoDao.consultarObjeto(objetoJsonRetorno['id']);
        Sessao.listaVendaAtualDetalhe = await Sessao.db.pdvVendaDetalheDao.consultarListaComProduto(objetoJsonRetorno['id']);
        // atualiza data e hora
        Sessao.vendaAtual = 
        Sessao.vendaAtual!.copyWith(
          dataVenda: Value(DateTime.now()),
          horaVenda: Value(Biblioteca.formatarHora(DateTime.now())),
        );
        setState(() {
          Sessao.statusCaixa = StatusCaixa.vendaEmAndamento;
        });
      } 
      _menuController.close!();         
    }
  }

  void _filtrarVendaLookup(String campo, String valor) async {
    const filtroAdicional = "STATUS_VENDA='A'";
    var listaFiltrada = await Sessao.db.pdvVendaCabecalhoDao.consultarListaFiltro(campo, valor, filtroAdicional: filtroAdicional);
    Sessao.retornoJsonLookup = jsonEncode(listaFiltrada);
  }

  void _filtrarVendaFechadaLookup(String campo, String valor) async {
    const filtroAdicional = "STATUS_VENDA='F'";
    var listaFiltrada = await Sessao.db.pdvVendaCabecalhoDao.consultarListaFiltro(campo, valor, filtroAdicional: filtroAdicional);
    Sessao.retornoJsonLookup = jsonEncode(listaFiltrada);
  }

  void _concederDesconto() {
    if (Sessao.statusCaixa == StatusCaixa.vendaEmAndamento) {
      if (_fornecidoDescontoNoItem) {
        gerarDialogBoxInformacao(context, 'Não é possível fornecer desconto nos itens e no total da venda.');
      } else {
        if (Sessao.listaVendaAtualDetalhe.isNotEmpty) {
          Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (BuildContext context) => const InformaValorPage(title: 'Desconto na Venda', operacao: 'DESCONTO', )))
            .then((_) {
              setState(() {
                _atualizarTotais();
              });
            });
        } else {
          _exibirMensagemExisteVendaSemItens();
        }
      }
    } else {
      _exibirMensagemNaoExisteVendaEmAndamento();
    }
  }

  void _incrementarItem({VendaDetalhe? item}) {
    setState(() {
      _removerDescontoVenda();
      item!.pdvVendaDetalhe = item.pdvVendaDetalhe!.copyWith(
        taxaDesconto: const Value(0),
        valorDesconto: const Value(0),
        quantidade: Value(item.pdvVendaDetalhe!.quantidade! + 1),
        valorTotalItem: Value((item.pdvVendaDetalhe!.quantidade! + 1) * item.pdvVendaDetalhe!.valorUnitario!),
        valorTotal: Value((item.pdvVendaDetalhe!.quantidade! + 1) * item.pdvVendaDetalhe!.valorUnitario!),
      );
      _atualizarTotais();
    });
  }

  void _decrementarItem({required VendaDetalhe item}) {
    if (item.pdvVendaDetalhe!.quantidade! > 1) {
      setState(() {
        _removerDescontoVenda();
        item.pdvVendaDetalhe = item.pdvVendaDetalhe!.copyWith(
          taxaDesconto: const Value(0),
          valorDesconto: const Value(0),
          quantidade: Value(item.pdvVendaDetalhe!.quantidade! - 1),
          valorTotalItem: Value((item.pdvVendaDetalhe!.quantidade! - 1) * item.pdvVendaDetalhe!.valorUnitario!),
          valorTotal: Value((item.pdvVendaDetalhe!.quantidade! - 1) * item.pdvVendaDetalhe!.valorUnitario!),
        );
        _atualizarTotais();
      });
    }
  }

  void _removerDescontoVenda() {
    Sessao.vendaAtual = 
      Sessao.vendaAtual!.copyWith(
        taxaDesconto: const Value(0),
        valorDesconto: const Value(0),
      );
  }

  void _excluirProduto({int? index, required bool perguntaAntes}) {
    if (perguntaAntes) {
      gerarDialogBoxExclusao(context, () async {
        setState(() {
          Sessao.listaVendaAtualDetalhe = List.from(Sessao.listaVendaAtualDetalhe)..removeAt(index!);
          _removerDescontoVenda();
          _atualizarTotais();
        });
        // Navigator.of(context).pop();
      });
    } else {
      setState(() {
        Sessao.listaVendaAtualDetalhe = List.from(Sessao.listaVendaAtualDetalhe)..removeAt(index!);
        _removerDescontoVenda();
        _atualizarTotais();
      });
    }
    _focusNode.requestFocus();
  }    

  void _configurarDadosTelaPadrao() {
    _fecharMenus();
    final tipoOperacao = Sessao.configuracaoPdv!.moduloFiscalPrincipal ?? 'REC';
    setState(() {
      if (Sessao.configuracaoPdv!.modulo == 'G') {
        _modulo = 'Pegasus PDV Lite - Gratuito';
      } else {
        if (Sessao.configuracaoPdv!.moduloFiscalPrincipal == 'NFC') {
          _modulo = 'Pegasus PDV - Versão NFC-e';
        } else if (Sessao.configuracaoPdv!.moduloFiscalPrincipal == 'SAT') {
          _modulo = 'Pegasus PDV - Versão SAT/MFE';
        }
      }
      
      Sessao.vendaAtual = PdvVendaCabecalho(id: null, idPdvMovimento: Sessao.movimento!.id, tipoOperacao: tipoOperacao);
      Sessao.listaVendaAtualDetalhe = [];
      Sessao.listaDadosPagamento = [];
      Sessao.listaParcelamento = [];
      Sessao.statusCaixa = StatusCaixa.aberto;
      Sessao.objetoJsonErro = null;
      NfceController.nfeCabecalhoMontado = null;
      _tituloJanela = Constantes.tituloCaixaAberto;
      _fornecidoDescontoNoItem = false;
      _emitindoNota = false;
      _focusNode.requestFocus();
    });

    EmpresaController.obrigarCadastroCnpj(context);
  }
  
  Future<void> _instanciarVendaAtual() async {
    if (Sessao.vendaAtual!.id == null) {
      Sessao.vendaAtual = 
      Sessao.vendaAtual!.copyWith(
        idPdvMovimento: Value(Sessao.movimento!.id),
        dataVenda: Value(DateTime.now()),
        horaVenda: Value(Biblioteca.formatarHora(DateTime.now())),
        statusVenda: const Value('A')
      );

      int idInserido = await Sessao.db.pdvVendaCabecalhoDao.inserir(Sessao.vendaAtual!);
      Sessao.vendaAtual = await Sessao.db.pdvVendaCabecalhoDao.consultarObjeto(idInserido);
      setState(() {
        _tituloJanela = Constantes.tituloCaixaVendaEmAndamento;
        Sessao.statusCaixa = StatusCaixa.vendaEmAndamento;
      });
    }
  }

  void _localizarProduto(String? dadoInformado) async {
    bool podeRealizarVenda = false;
    if (Sessao.configuracaoPdv!.modulo != 'G') {
      if (Sessao.configuracaoPdv!.moduloFiscalPrincipal == 'NFC') {
        String mensagemRetorno = await NfceController.verificarSeAptoParaEmitirNfce();
        if (mensagemRetorno.isNotEmpty) {
          if (!mounted) return;
          gerarDialogBoxInformacao(context, mensagemRetorno);
        } else {
          podeRealizarVenda = true;
        }
      } else if (Sessao.configuracaoPdv!.moduloFiscalPrincipal == 'SAT') {
        String mensagemRetorno = await SatController.verificarSeAptoParaEmitirCfe();
        if (mensagemRetorno.isNotEmpty) {
          if (!mounted) return;
          gerarDialogBoxInformacao(context, mensagemRetorno);
        } else {
          podeRealizarVenda = true;
        }
      }
    } else {
      if (EmpresaController.podeUsarSistemaGratuito()) {
        podeRealizarVenda = true;
      } else {
        gerarDialogBoxInformacao(context, 'Apenas empresas MEI podem usar o sistema gratuito com emissão de recibo. Utilize o módulo NFC-e.');
      }
    }

    if (podeRealizarVenda) {
      await _instanciarVendaAtual();
      _quantidadeInformada = 1;
      final digitouQuantidade = dadoInformado!.split('*');
      if (digitouQuantidade.length > 1) {
        _quantidadeInformada = double.tryParse(digitouQuantidade[0].replaceAll(',', '.'));
        dadoInformado = digitouQuantidade[1];
      }

      var campoParaConsulta = '';
      int? dadoNumerico = int.tryParse(dadoInformado);
      if (dadoNumerico != null) {
        if (dadoInformado.length == 13 || dadoInformado.length == 14) {
          campoParaConsulta = 'GTIN';
        } else {
          campoParaConsulta = 'CODIGO_INTERNO';
        }
      } else {
        campoParaConsulta = 'NOME';
      }
      _produto = await Sessao.db.produtoDao.consultarObjetoFiltro(campoParaConsulta, dadoInformado);   

      if (_produto != null) {
        bool podeComporItemParaVenda = true;
        if (Sessao.configuracaoPdv!.moduloFiscalPrincipal == 'NFC') {
          // verifica se a tributação para o produto está OK antes mesmo de incluí-lo na venda
          final produtoMontado = await Sessao.db.produtoDao.consultarObjetoMontado(pId: _produto!.id!);
          final tributacao = await Sessao.db.tributConfiguraOfGtDao.consultarObjetoMontado(
            Sessao.configuracaoPdv!.idTributOperacaoFiscalPadrao!, produtoMontado!.tributGrupoTributario!.id!); 
          if (tributacao == null) {
            if (!mounted) return;
            podeComporItemParaVenda = false;
            gerarDialogBoxErro(context, 'Existe um problema com a tributação deste produto. Informe o Grupo Tributário para o Produto e vincule a Operação Fiscal para o mesmo na tela "Configura Tributação"');
          } else {
            podeComporItemParaVenda = true;
          }
        }
        if (podeComporItemParaVenda) {
          _comporItemParaVenda();
        }
      } else {
        _importarProduto(criterioPesquisa: dadoInformado);
      }
    }
    _focusNode.requestFocus();
  }

  void _comporItemParaVenda() {
    final quantidadeFutura = (_produto!.quantidadeEstoque ?? 0) - _quantidadeInformada!;

    if(Sessao.configuracaoPdv!.modulo != 'G' && _produto!.idTributGrupoTributario == null) {
      _exibirMensagemGrupoTributario();
    } else if ((Sessao.configuracaoPdv!.permiteEstoqueNegativo ?? 'S') == 'N' && quantidadeFutura < 0) {
      _exibirMensagemEstoqueNegativo();
    } else {
      PdvVendaDetalhe pdvVendaDetalhe = 
      PdvVendaDetalhe(
        id: null, 
        idProduto: _produto!.id,
        gtin: _produto!.gtin == '' ? _produto!.id.toString() : _produto!.gtin,
        cst: _produto!.cst,
        movimentaEstoque: _produto!.ippt == 'T' ? 'S' : 'N',
        quantidade: _quantidadeInformada,
        valorUnitario: _produto!.valorVenda,
        valorTotalItem: _quantidadeInformada! * _produto!.valorVenda!,
        valorTotal: _quantidadeInformada! * _produto!.valorVenda!,
      );

      VendaDetalhe vendaDetalhe = VendaDetalhe(pdvVendaDetalhe: pdvVendaDetalhe, produto: _produto);
      setState(() {
        Sessao.listaVendaAtualDetalhe.add(vendaDetalhe);
        _atualizarTotais();
      });      
    }
  }
  
  void _atualizarTotais() {
    double totalGeral = 0;
    double subTotal = 0;        
    double totalDescontosItens = 0;
    for (var item in Sessao.listaVendaAtualDetalhe) {
      totalGeral = totalGeral + item.pdvVendaDetalhe!.valorTotalItem!;
      subTotal = subTotal + item.pdvVendaDetalhe!.valorTotal!;
      totalDescontosItens = totalDescontosItens + (item.pdvVendaDetalhe!.valorDesconto ?? 0);
      VendaController.calcularImpostosTransparencia(item);
    }
    double? taxaDesconto = 0;
    double valorDesconto = 0;
    if (totalDescontosItens > 0) {
      valorDesconto = totalDescontosItens;
      taxaDesconto = valorDesconto / totalGeral * 100;
      taxaDesconto = num.parse(taxaDesconto.toStringAsFixed(Constantes.decimaisValor)) as double?;
      _fornecidoDescontoNoItem = true;
    } else {
      taxaDesconto = Sessao.vendaAtual!.taxaDesconto;
      valorDesconto = Biblioteca.calcularDesconto(subTotal, Sessao.vendaAtual!.taxaDesconto);
      // distribui o desconto nos itens
      for (var item in Sessao.listaVendaAtualDetalhe) {
        var valorDescontoPorItem = Biblioteca.calcularDesconto(item.pdvVendaDetalhe!.valorTotalItem, Sessao.vendaAtual!.taxaDesconto);
        item.pdvVendaDetalhe = item.pdvVendaDetalhe!.copyWith(
          valorDesconto: Value(valorDescontoPorItem),
          taxaDesconto: Value(taxaDesconto),
          valorTotal: Value(item.pdvVendaDetalhe!.valorTotalItem! - valorDescontoPorItem),
        );
      }      
      _fornecidoDescontoNoItem = false;
    }
    Sessao.vendaAtual = 
    Sessao.vendaAtual!.copyWith(
      valorVenda: Value(totalGeral),
      taxaDesconto: Value(taxaDesconto),
      valorDesconto: Value(valorDesconto),
      valorFinal: Value(totalGeral - valorDesconto),
      valorBaseIcms: Value(totalGeral - valorDesconto),
    );
  }

  void _fecharMenus() {
    _menuController.close!();
    if (_keyScaffold.currentState!.isEndDrawerOpen) {
      Navigator.pop(context);
    }
  }

  void _identificarVendedor() async {  
    if (Sessao.statusCaixa == StatusCaixa.vendaEmAndamento) {
      Map<String, dynamic>? objetoJsonRetorno = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LookupLocalPage(
              title: 'Importar Vendedor',
              colunas: ColaboradorDao.colunas,
              campos: ColaboradorDao.campos,
              campoPesquisaPadrao: 'nome',
              valorPesquisaPadrao: '%',
              metodoConsultaCallBack: _filtrarVendedorLookup,
            ),
            fullscreenDialog: true,
          ));
      if (objetoJsonRetorno != null) {
        setState(() {
          Sessao.vendaAtual = 
          Sessao.vendaAtual!.copyWith(
            idColaborador: Value(objetoJsonRetorno['id']),
          );
        });
      }
      _fecharMenus();
    } else {
      _exibirMensagemNaoExisteVendaEmAndamento();
    }
 }

  void _filtrarVendedorLookup(String campo, String valor) async {
    var listaFiltrada = await Sessao.db.colaboradorDao.consultarListaFiltro(campo, valor);
    Sessao.retornoJsonLookup = jsonEncode(listaFiltrada);
  }

  void _identificarCliente() async {
    if (Sessao.statusCaixa == StatusCaixa.vendaEmAndamento) {
      Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (BuildContext context) => const IdentificaClientePage(title: 'Identifica Cliente')))
        .then((_) {
          setState(() {
          });
        });      
      _fecharMenus();
    } else {
      _exibirMensagemNaoExisteVendaEmAndamento();
    }
  }

  void _importarProduto({String? criterioPesquisa}) async {
    Map<String, dynamic>? objetoJsonRetorno = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LookupLocalPage(
            title: 'Importar Produto',
            colunas: ProdutoDao.colunas,
            campos: ProdutoDao.campos,
            campoPesquisaPadrao: 'nome',
            valorPesquisaPadrao: (criterioPesquisa == null || criterioPesquisa == '') ? '%' : criterioPesquisa,
            metodoConsultaCallBack: _filtrarProdutoLookup,
            permiteCadastro: true,
            metodoCadastroCallBack: () { Navigator.pushNamed(context, '/produtoLista',); },
          ),
          fullscreenDialog: true,
        ));
    if (objetoJsonRetorno != null) {
      _localizarProduto(objetoJsonRetorno['gtin']);
    }    
  }  

  void _filtrarProdutoLookup(String campo, String valor) async {
    var listaFiltrada = await Sessao.db.produtoDao.consultarListaFiltro(campo, valor);
    Sessao.retornoJsonLookup = jsonEncode(listaFiltrada);
  }

  void _exibirMensagemNaoExisteVendaEmAndamento() {
    gerarDialogBoxInformacao(context, 'Não existe uma venda em andamento.');
  }

  void _exibirMensagemExisteVendaEmAndamento() {
    gerarDialogBoxInformacao(context, 'Existe uma venda em andamento.');
  }

  void _exibirMensagemExisteVendaSemItens() {
    gerarDialogBoxInformacao(context, 'Não existem itens na venda.');
  }

  void _exibirMensagemEstoqueNegativo() {
    gerarDialogBoxInformacao(context, 'Não é permitido vender um item com estoque negativo.');
  }

  void _exibirMensagemGrupoTributario() {
    gerarDialogBoxInformacao(context, 'Produto sem Grupo Tributário vinculado.');
  }

  Future _verificarRegistro() async {
    // se a empresa não está registrada ainda no banco de dados da SH, verifica se chegou a hora do registro
    if (Sessao.empresa!.registrado == null || Sessao.empresa!.registrado == false) {
      showDialog(
        context: context, 
        builder: (BuildContext context){
          return const RegistroPage(title: 'Registro do Usuário');
        })
        .then((_) {
        });
    }
    _configurarDadosTelaPadrao();
  }

  Future _verificarNotasPendentesContingencia() async {
    if (Sessao.configuracaoPdv!.modulo == 'F' && Sessao.configuracaoPdv!.moduloFiscalPrincipal == 'NFC') {
      final notasEmContingencia = await Sessao.db.nfeCabecalhoDao.consultarListaFiltro('STATUS_NOTA', '6');
      if (notasEmContingencia != null && notasEmContingencia.isNotEmpty) {
        if (!mounted) return;
        gerarDialogBoxConfirmacao(context, 
          'Existem ${notasEmContingencia.length} notas impressas em contingência. Deseja transmiti-las agora?', 
          () {
            Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (BuildContext context) => const NfeCabecalhoListaPage()))
              .then((_) {
              });            
          },
          onCancelPressed: () {
          }
        );
      }   
    }
  }

  // TODO: descomente para usar o SAT 
  // Future _verificarPlanoNfcePertoExpirar() async {
  //   if (Sessao.nfcePlanoPagamento != null) {
  //     final dataPlanoExpiraFormatada = Biblioteca.formatarData(Sessao.nfcePlanoPagamento!.dataPlanoExpira);
  //     final hashDataExpira = md5.convert(utf8.encode(dataPlanoExpiraFormatada + Constantes.chave)).toString();
  //     if (hashDataExpira != Sessao.nfcePlanoPagamento!.hashRegistro) {
  //       Sessao.abriuDialogBoxEspera = true;
  //       gerarDialogBoxEspera(context);
  //       gerarDialogBoxInformacao(context, 'Banco de dados corrompido. Não é permitido realizar alterações no banco de dados.');
  //     } else {
  //       final dias = Sessao.nfcePlanoPagamento!.dataPlanoExpira!.difference(DateTime.now()).inDays;
  //       if (dias <= 5) {
  //         gerarDialogBoxInformacao(context, 'Faltam $dias dia(s) para que seu plano NFC-e expire.');
  //       }
  //       // verifica se o plano está ativo no servidor, pois o usuário pode cancelar o plano a qualquer tempo
  //       // TODO: essa verificação deve ser feita também randomicamente no momento da emissão da NFC-e
  //       if (await Biblioteca.hasNetwork()) {
  //         NfceService servicoNfce = NfceService();
  //         final nfcePlanoPagamentoModel = await servicoNfce.verificarPlano();          
  //         if (nfcePlanoPagamentoModel == null || nfcePlanoPagamentoModel.statusPagamento != '3') {
  //           Sessao.configuracaoPdv = 
  //           Sessao.configuracaoPdv!.copyWith(
  //             modulo: const Value('G'),
  //             moduloFiscalPrincipal: const Value(''),
  //             planoSituacao: const Value('B'),
  //             planoValor: const Value(0),
  //             plano: const Value(''),
  //           );
  //           await Sessao.db.pdvConfiguracaoDao.alterar(Sessao.configuracaoPdv!);                 
  //           Sessao.db.nfcePlanoPagamentoDao.excluir(Sessao.nfcePlanoPagamento!);
  //           if (!mounted) return;
  //           Navigator.of(context)
  //             .push(MaterialPageRoute(
  //                 builder: (BuildContext context) =>
  //                     const NfceContrataPage()))
  //             .then((_) {
  //             });       
  //         }  
  //       }
  //     }
  //   } else {
  //     Sessao.configuracaoPdv = 
  //     Sessao.configuracaoPdv!.copyWith(
  //       modulo: const Value('G'),
  //       moduloFiscalPrincipal: const Value(''),
  //       planoSituacao: const Value('B'),
  //       planoValor: const Value(0),
  //       plano: const Value(''),
  //     );
  //     await Sessao.db.pdvConfiguracaoDao.alterar(Sessao.configuracaoPdv!);    
  //     setState(() {
  //     });
  //   }
  // }
// #endregion métodos Caixa

}