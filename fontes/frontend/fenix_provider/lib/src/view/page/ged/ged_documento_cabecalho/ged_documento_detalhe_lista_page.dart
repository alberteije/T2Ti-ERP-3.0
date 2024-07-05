/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [GED_DOCUMENTO_DETALHE] 
                                                                                
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

import 'package:intl/intl.dart';

//import 'ged_documento_detalhe_detalhe_page.dart';
import 'ged_documento_detalhe_persiste_page.dart';

class GedDocumentoDetalheListaPage extends StatefulWidget {
  final GedDocumentoCabecalho? gedDocumentoCabecalho;
  final FocusNode? foco;
  final Function? salvarGedDocumentoCabecalhoCallBack;

  const GedDocumentoDetalheListaPage({Key? key, this.gedDocumentoCabecalho, this.foco, this.salvarGedDocumentoCabecalhoCallBack}) : super(key: key);

  @override
  GedDocumentoDetalheListaPageState createState() => GedDocumentoDetalheListaPageState();
}

class GedDocumentoDetalheListaPageState extends State<GedDocumentoDetalheListaPage> {
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
        widget.salvarGedDocumentoCabecalhoCallBack!();
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
    var gedDocumentoDetalhe = GedDocumentoDetalhe();
    widget.gedDocumentoCabecalho!.listaGedDocumentoDetalhe!.add(gedDocumentoDetalhe);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          GedDocumentoDetalhePersistePage(
            gedDocumentoCabecalho: widget.gedDocumentoCabecalho,
            gedDocumentoDetalhe: gedDocumentoDetalhe,
            title: 'Ged Documento Detalhe - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (gedDocumentoDetalhe.nome == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.gedDocumentoCabecalho!.listaGedDocumentoDetalhe!.remove(gedDocumentoDetalhe);
          }
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('Tipo Documento')));
    lista.add(const DataColumn(label: Text('Nome')));
    lista.add(const DataColumn(label: Text('Descrição')));
    lista.add(const DataColumn(label: Text('Palavras Chave')));
    lista.add(const DataColumn(label: Text('Pode Excluir')));
    lista.add(const DataColumn(label: Text('Pode Alterar')));
    lista.add(const DataColumn(label: Text('Assinatura Digital')));
    lista.add(const DataColumn(label: Text('Data Fim Vigência')));
    lista.add(const DataColumn(label: Text('Data Exclusão')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.gedDocumentoCabecalho!.listaGedDocumentoDetalhe == null) {
      widget.gedDocumentoCabecalho!.listaGedDocumentoDetalhe = [];
    }
    List<DataRow> lista = [];
    for (var gedDocumentoDetalhe in widget.gedDocumentoCabecalho!.listaGedDocumentoDetalhe!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ gedDocumentoDetalhe.id ?? ''}'), onTap: () {
          _detalharGedDocumentoDetalhe(widget.gedDocumentoCabecalho, gedDocumentoDetalhe, context);
        }),
        DataCell(Text(gedDocumentoDetalhe.gedTipoDocumento?.nome ?? ''), onTap: () {
          _detalharGedDocumentoDetalhe(widget.gedDocumentoCabecalho, gedDocumentoDetalhe, context);
        }),
        DataCell(Text(gedDocumentoDetalhe.nome ?? ''), onTap: () {
          _detalharGedDocumentoDetalhe(widget.gedDocumentoCabecalho, gedDocumentoDetalhe, context);
        }),
        DataCell(Text(gedDocumentoDetalhe.descricao ?? ''), onTap: () {
          _detalharGedDocumentoDetalhe(widget.gedDocumentoCabecalho, gedDocumentoDetalhe, context);
        }),
        DataCell(Text(gedDocumentoDetalhe.palavrasChave ?? ''), onTap: () {
          _detalharGedDocumentoDetalhe(widget.gedDocumentoCabecalho, gedDocumentoDetalhe, context);
        }),
        DataCell(Text(gedDocumentoDetalhe.podeExcluir ?? ''), onTap: () {
          _detalharGedDocumentoDetalhe(widget.gedDocumentoCabecalho, gedDocumentoDetalhe, context);
        }),
        DataCell(Text(gedDocumentoDetalhe.podeAlterar ?? ''), onTap: () {
          _detalharGedDocumentoDetalhe(widget.gedDocumentoCabecalho, gedDocumentoDetalhe, context);
        }),
        DataCell(Text(gedDocumentoDetalhe.assinado ?? ''), onTap: () {
          _detalharGedDocumentoDetalhe(widget.gedDocumentoCabecalho, gedDocumentoDetalhe, context);
        }),
        DataCell(Text(gedDocumentoDetalhe.dataFimVigencia != null ? DateFormat('dd/MM/yyyy').format(gedDocumentoDetalhe.dataFimVigencia!) : ''), onTap: () {
          _detalharGedDocumentoDetalhe(widget.gedDocumentoCabecalho, gedDocumentoDetalhe, context);
        }),
        DataCell(Text(gedDocumentoDetalhe.dataExclusao != null ? DateFormat('dd/MM/yyyy').format(gedDocumentoDetalhe.dataExclusao!) : ''), onTap: () {
          _detalharGedDocumentoDetalhe(widget.gedDocumentoCabecalho, gedDocumentoDetalhe, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharGedDocumentoDetalhe(GedDocumentoCabecalho? gedDocumentoCabecalho, GedDocumentoDetalhe gedDocumentoDetalhe, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => GedDocumentoDetalhePersistePage(
              gedDocumentoCabecalho: gedDocumentoCabecalho,
              gedDocumentoDetalhe: gedDocumentoDetalhe,
			  title: "Ged Documento Detalhe - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}