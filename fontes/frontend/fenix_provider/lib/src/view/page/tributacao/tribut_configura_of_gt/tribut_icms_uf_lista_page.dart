/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [TRIBUT_ICMS_UF] 
                                                                                
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


//import 'tribut_icms_uf_detalhe_page.dart';
import 'tribut_icms_uf_persiste_page.dart';

class TributIcmsUfListaPage extends StatefulWidget {
  final TributConfiguraOfGt? tributConfiguraOfGt;
  final FocusNode? foco;
  final Function? salvarTributConfiguraOfGtCallBack;

  const TributIcmsUfListaPage({Key? key, this.tributConfiguraOfGt, this.foco, this.salvarTributConfiguraOfGtCallBack}) : super(key: key);

  @override
  TributIcmsUfListaPageState createState() => TributIcmsUfListaPageState();
}

class TributIcmsUfListaPageState extends State<TributIcmsUfListaPage> {
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
        widget.salvarTributConfiguraOfGtCallBack!();
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
    var tributIcmsUf = TributIcmsUf();
    widget.tributConfiguraOfGt!.listaTributIcmsUf!.add(tributIcmsUf);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          TributIcmsUfPersistePage(
            tributConfiguraOfGt: widget.tributConfiguraOfGt,
            tributIcmsUf: tributIcmsUf,
            title: 'Tribut Icms Uf - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (tributIcmsUf.ufDestino == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.tributConfiguraOfGt!.listaTributIcmsUf!.remove(tributIcmsUf);
          }
          _getRows();
        });
      });
  }
  
  List<DataColumn> _getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(numeric: true, label: Text('Id')));
    lista.add(const DataColumn(label: Text('UF')));
    lista.add(const DataColumn(numeric: true, label: Text('CFOP')));
    lista.add(const DataColumn(label: Text('CSOSN')));
    lista.add(const DataColumn(label: Text('CST')));
    lista.add(const DataColumn(label: Text('Modalidade Base Cálculo')));
    lista.add(const DataColumn(numeric: true, label: Text('Alíquota')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Pauta')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Preço Máximo')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor MVA')));
    lista.add(const DataColumn(numeric: true, label: Text('Porcento Base Cálculo')));
    lista.add(const DataColumn(label: Text('Modalidade Base Cálculo ST')));
    lista.add(const DataColumn(numeric: true, label: Text('Alíquota Interna ST')));
    lista.add(const DataColumn(numeric: true, label: Text('Alíquota Interestadual ST')));
    lista.add(const DataColumn(numeric: true, label: Text('Porcento Base Cálculo ST')));
    lista.add(const DataColumn(numeric: true, label: Text('Alíquota ICMS ST')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Pauta ST')));
    lista.add(const DataColumn(numeric: true, label: Text('Valor Preço Máximo ST')));
    return lista;
  }

  List<DataRow> _getRows() {
    if (widget.tributConfiguraOfGt!.listaTributIcmsUf == null) {
      widget.tributConfiguraOfGt!.listaTributIcmsUf = [];
    }
    List<DataRow> lista = [];
    for (var tributIcmsUf in widget.tributConfiguraOfGt!.listaTributIcmsUf!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ tributIcmsUf.id ?? ''}'), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(tributIcmsUf.ufDestino ?? ''), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(tributIcmsUf.cfop?.toString() ?? ''), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(tributIcmsUf.csosn ?? ''), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(tributIcmsUf.cst ?? ''), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(tributIcmsUf.modalidadeBc ?? ''), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIcmsUf.aliquota ?? 0)), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(tributIcmsUf.valorPauta ?? 0)), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(tributIcmsUf.valorPrecoMaximo ?? 0)), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(tributIcmsUf.mva ?? 0)), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIcmsUf.porcentoBc ?? 0)), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(tributIcmsUf.modalidadeBcSt ?? ''), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIcmsUf.aliquotaInternaSt ?? 0)), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIcmsUf.aliquotaInterestadualSt ?? 0)), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIcmsUf.porcentoBcSt ?? 0)), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIcmsUf.aliquotaIcmsSt ?? 0)), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(tributIcmsUf.valorPautaSt ?? 0)), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(tributIcmsUf.valorPrecoMaximoSt ?? 0)), onTap: () {
          _detalharTributIcmsUf(widget.tributConfiguraOfGt, tributIcmsUf, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharTributIcmsUf(TributConfiguraOfGt? tributConfiguraOfGt, TributIcmsUf tributIcmsUf, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => TributIcmsUfPersistePage(
              tributConfiguraOfGt: tributConfiguraOfGt,
              tributIcmsUf: tributIcmsUf,
			  title: "Tribut Icms Uf - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}