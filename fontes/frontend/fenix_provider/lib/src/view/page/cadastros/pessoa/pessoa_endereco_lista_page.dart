/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [PESSOA_ENDERECO] 
                                                                                
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

import 'package:fenix/src/infra/constantes.dart';

import 'package:fenix/src/model/model.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';


//import 'pessoa_endereco_detalhe_page.dart';
import 'pessoa_endereco_persiste_page.dart';

class PessoaEnderecoListaPage extends StatefulWidget {
  final Pessoa? pessoa;
  final FocusNode? foco;
  final Function? salvarPessoaCallBack;

  const PessoaEnderecoListaPage({Key? key, this.pessoa, this.foco, this.salvarPessoaCallBack}) : super(key: key);

  @override
  PessoaEnderecoListaPageState createState() => PessoaEnderecoListaPageState();
}

class PessoaEnderecoListaPageState extends State<PessoaEnderecoListaPage> {
  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void initState() {
    super.initState();
    _shortcutMap = getAtalhosAbaPage();

    _actionMap = <Type, Action<Intent>>{
      AtalhoTelaIntent: CallbackAction<AtalhoTelaIntent>(
        onInvoke: _tratarAcoesAtalhos,
      ),
    };
  }

  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      case AtalhoTelaType.inserir:
        _inserir();
        break;
      case AtalhoTelaType.salvar:
        widget.salvarPessoaCallBack!();
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
          floatingActionButton: FloatingActionButton(
            focusNode: widget.foco,
            autofocus: true,
            focusColor: ViewUtilLib.getBotaoFocusColor(),
            tooltip: Constantes.botaoInserirDica,
            backgroundColor: ViewUtilLib.getBackgroundColorBotaoInserir(),
            child: ViewUtilLib.getIconBotaoInserir(),
            onPressed: () {
              _inserir();
            }),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: Scrollbar(
            child: ListView(
              padding: const EdgeInsets.all(2.0),
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: DataTable(columns: _getColumns(), rows: _getRows()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _inserir() {
    var pessoaEndereco = PessoaEndereco();
    widget.pessoa!.listaPessoaEndereco!.add(pessoaEndereco);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          PessoaEnderecoPersistePage(
            pessoa: widget.pessoa,
            pessoaEndereco: pessoaEndereco,
            title: 'Pessoa Endereco - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (pessoaEndereco.cep == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.pessoa!.listaPessoaEndereco!.remove(pessoaEndereco);
          }
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('Id Pessoa')));
    lista.add(const DataColumn(label: Text('Logradouro')));
    lista.add(const DataColumn(label: Text('Numero')));
    lista.add(const DataColumn(label: Text('Bairro')));
    lista.add(const DataColumn(numeric: true, label: Text('Municipio Ibge')));
    lista.add(const DataColumn(label: Text('Uf')));
    lista.add(const DataColumn(label: Text('Cep')));
    lista.add(const DataColumn(label: Text('Cidade')));
    lista.add(const DataColumn(label: Text('Complemento')));
    lista.add(const DataColumn(label: Text('Principal')));
    lista.add(const DataColumn(label: Text('Entrega')));
    lista.add(const DataColumn(label: Text('Cobranca')));
    lista.add(const DataColumn(label: Text('Correspondencia')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.pessoa!.listaPessoaEndereco == null) {
      widget.pessoa!.listaPessoaEndereco = [];
    }
    List<DataRow> lista = [];
    for (var pessoaEndereco in widget.pessoa!.listaPessoaEndereco!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ pessoaEndereco.id ?? ''}'), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text(pessoaEndereco.pessoa?.nome ?? ''), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text(pessoaEndereco.logradouro ?? ''), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text(pessoaEndereco.numero ?? ''), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text(pessoaEndereco.bairro ?? ''), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text('${pessoaEndereco.municipioIbge ?? ''}'), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text(pessoaEndereco.uf ?? ''), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text(pessoaEndereco.cep ?? ''), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text(pessoaEndereco.cidade ?? ''), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text(pessoaEndereco.complemento ?? ''), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text(pessoaEndereco.principal ?? ''), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text(pessoaEndereco.entrega ?? ''), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text(pessoaEndereco.cobranca ?? ''), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
        DataCell(Text(pessoaEndereco.correspondencia ?? ''), onTap: () {
          _detalharPessoaEndereco(widget.pessoa, pessoaEndereco, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharPessoaEndereco(Pessoa? pessoa, PessoaEndereco pessoaEndereco, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PessoaEnderecoPersistePage(
              pessoa: pessoa,
              pessoaEndereco: pessoaEndereco,
			  title: "Pessoa Endereco - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}