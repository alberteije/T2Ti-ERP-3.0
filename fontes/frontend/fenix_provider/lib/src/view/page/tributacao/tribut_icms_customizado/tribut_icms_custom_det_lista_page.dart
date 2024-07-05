/*
Title: T2Ti ERP 3.0                                                                
Description: AbaDetalhe ListaPage relacionada à tabela [TRIBUT_ICMS_CUSTOM_DET] 
                                                                                
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


//import 'tribut_icms_custom_det_detalhe_page.dart';
import 'tribut_icms_custom_det_persiste_page.dart';

class TributIcmsCustomDetListaPage extends StatefulWidget {
  final TributIcmsCustomCab? tributIcmsCustomCab;
  final FocusNode? foco;
  final Function? salvarTributIcmsCustomCabCallBack;

  const TributIcmsCustomDetListaPage({Key? key, this.tributIcmsCustomCab, this.foco, this.salvarTributIcmsCustomCabCallBack}) : super(key: key);

  @override
  TributIcmsCustomDetListaPageState createState() => TributIcmsCustomDetListaPageState();
}

class TributIcmsCustomDetListaPageState extends State<TributIcmsCustomDetListaPage> {
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
        widget.salvarTributIcmsCustomCabCallBack!();
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
    var tributIcmsCustomDet = TributIcmsCustomDet();
    widget.tributIcmsCustomCab!.listaTributIcmsCustomDet!.add(tributIcmsCustomDet);
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) =>
          TributIcmsCustomDetPersistePage(
            tributIcmsCustomCab: widget.tributIcmsCustomCab,
            tributIcmsCustomDet: tributIcmsCustomDet,
            title: 'Tribut Icms Custom Det - Inserindo',
            operacao: 'I')))
      .then((_) {
        setState(() {
          if (tributIcmsCustomDet.aliquota == null) { // se esse atributo estiver vazio, o objeto será removido
            widget.tributIcmsCustomCab!.listaTributIcmsCustomDet!.remove(tributIcmsCustomDet);
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
    if (widget.tributIcmsCustomCab!.listaTributIcmsCustomDet == null) {
      widget.tributIcmsCustomCab!.listaTributIcmsCustomDet = [];
    }
    List<DataRow> lista = [];
    for (var tributIcmsCustomDet in widget.tributIcmsCustomCab!.listaTributIcmsCustomDet!) {
      List<DataCell> celulas = [];

      celulas = [
        DataCell(Text('${ tributIcmsCustomDet.id ?? ''}'), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(tributIcmsCustomDet.ufDestino ?? ''), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text('${tributIcmsCustomDet.cfop ?? ''}'), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(tributIcmsCustomDet.csosn ?? ''), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(tributIcmsCustomDet.cst ?? ''), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(tributIcmsCustomDet.modalidadeBc ?? ''), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIcmsCustomDet.aliquota ?? 0)), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(tributIcmsCustomDet.valorPauta ?? 0)), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(tributIcmsCustomDet.valorPrecoMaximo ?? 0)), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(tributIcmsCustomDet.mva ?? 0)), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIcmsCustomDet.porcentoBc ?? 0)), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(tributIcmsCustomDet.modalidadeBcSt ?? ''), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIcmsCustomDet.aliquotaInternaSt ?? 0)), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIcmsCustomDet.aliquotaInterestadualSt ?? 0)), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIcmsCustomDet.porcentoBcSt ?? 0)), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIcmsCustomDet.aliquotaIcmsSt ?? 0)), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(tributIcmsCustomDet.valorPautaSt ?? 0)), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(tributIcmsCustomDet.valorPrecoMaximoSt ?? 0)), onTap: () {
          _detalharTributIcmsCustomDet(widget.tributIcmsCustomCab, tributIcmsCustomDet, context);
        }),
      ];

      lista.add(DataRow(cells: celulas));
    }
    return lista;
  }

  void _detalharTributIcmsCustomDet(TributIcmsCustomCab? tributIcmsCustomCab, TributIcmsCustomDet tributIcmsCustomDet, BuildContext context) {
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => TributIcmsCustomDetPersistePage(
              tributIcmsCustomCab: tributIcmsCustomCab,
              tributIcmsCustomDet: tributIcmsCustomDet,
			  title: "Tribut Icms Custom Det - Editando",
			  operacao: "A"
			)))
          .then((_) {
            setState(() {
              _getRows();
            });
          });
  }
  
}