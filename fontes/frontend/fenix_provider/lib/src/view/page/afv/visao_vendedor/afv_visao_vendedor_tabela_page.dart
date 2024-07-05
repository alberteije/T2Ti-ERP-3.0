/*
Title: T2Ti ERP 3.0
Description: Página AFV - Visão Vendedor - Tabelas de Preço

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
import 'package:fenix/src/infra/constantes.dart';
import 'package:fenix/src/view/shared/widgets_pagina_detalhe.dart';
import 'package:flutter/material.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';

class AfvVisaoVendedorTabelaPage extends StatelessWidget {

  const AfvVisaoVendedorTabelaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return Theme(
          data: getThemeDataDetalhePage(context),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Tabela de preço para o cliente João Paulo'),           
              backgroundColor: ViewUtilLib.getBackgroundColorBarraTelaDetalhe(),
              leading: Container(),
              actions: const <Widget>[
            ]),
 
            body: Scrollbar(
              child: ListView(
                padding: const EdgeInsets.all(2.0),
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Card(
                      color: Colors.white,
                      elevation: 2.0,
                      child: DataTable(columns: getColumns(), rows: getRows()),
                    ),
                  ),
                ],
              ),
            ),
          )); 
  }

  List<DataColumn> getColumns() {
    List<DataColumn> lista = [];
    lista.add(const DataColumn(label: Text('GTIN')));
    lista.add(const DataColumn(label: Text('Descrição')));
    lista.add(const DataColumn(label: Text('Valor Original')));
    lista.add(const DataColumn(label: Text('Valor Tabelado')));
    return lista;
  }

  List<DataRow> getRows() {
    List<DataRow> lista = [];
    List<DataCell> celulas = [];

    // produto 01
      celulas = [
        const DataCell(Text('12345678910'),),
        const DataCell(Text('Livro Pequeno Príncipe'),),
        DataCell(Text(12.toStringAsFixed(Constantes.decimaisValor)),),
        DataCell(Text(10.toStringAsFixed(Constantes.decimaisValor)),),
      ];
      lista.add(DataRow(cells: celulas));

    // produto 02
      celulas = [
        const DataCell(Text('84578965247'),),
        const DataCell(Text('Caixa Caneta BIC'),),
        DataCell(Text(50.toStringAsFixed(Constantes.decimaisValor)),),
        DataCell(Text(39.toStringAsFixed(Constantes.decimaisValor)),),
      ];
      lista.add(DataRow(cells: celulas));

    return lista;
  }

}