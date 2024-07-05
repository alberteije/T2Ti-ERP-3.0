/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [PESSOA_CONTATO] 
                                                                                
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


//import 'pessoa_contato_detalhe_page.dart';
import 'pessoa_contato_persiste_page.dart';

class PessoaContatoListaPage extends StatefulWidget {
  final Pessoa? pessoa;
  final FocusNode? foco;
  final Function? salvarPessoaCallBack;

  const PessoaContatoListaPage({Key? key, this.pessoa, this.foco, this.salvarPessoaCallBack}) : super(key: key);

  @override
  PessoaContatoListaPageState createState() => PessoaContatoListaPageState();
}

class PessoaContatoListaPageState extends State<PessoaContatoListaPage> {
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
    var pessoaContato = PessoaContato();
    widget.pessoa!.listaPessoaContato!.add(pessoaContato);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          PessoaContatoPersistePage(
            pessoa: widget.pessoa,
            pessoaContato: pessoaContato,
            title: 'Pessoa Contato - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (pessoaContato.nome == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.pessoa!.listaPessoaContato!.remove(pessoaContato);
          }
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('Nome')));
    lista.add(const DataColumn(label: Text('EMail')));
    lista.add(const DataColumn(label: Text('Observação')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.pessoa!.listaPessoaContato == null) {
      widget.pessoa!.listaPessoaContato = [];
    }
    List<DataRow> lista = [];
    for (var pessoaContato in widget.pessoa!.listaPessoaContato!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ pessoaContato.id ?? ''}'), onTap: () {
          _detalharPessoaContato(widget.pessoa, pessoaContato, context);
        }),
        DataCell(Text(pessoaContato.nome ?? ''), onTap: () {
          _detalharPessoaContato(widget.pessoa, pessoaContato, context);
        }),
        DataCell(Text(pessoaContato.email ?? ''), onTap: () {
          _detalharPessoaContato(widget.pessoa, pessoaContato, context);
        }),
        DataCell(Text(pessoaContato.observacao ?? ''), onTap: () {
          _detalharPessoaContato(widget.pessoa, pessoaContato, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharPessoaContato(Pessoa? pessoa, PessoaContato pessoaContato, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PessoaContatoPersistePage(
              pessoa: pessoa,
              pessoaContato: pessoaContato,
			  title: "Pessoa Contato - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}