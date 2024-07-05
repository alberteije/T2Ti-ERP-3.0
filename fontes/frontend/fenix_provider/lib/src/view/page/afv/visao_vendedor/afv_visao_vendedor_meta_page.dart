/*
Title: T2Ti ERP 3.0
Description: Página AFV - Visão Vendedor - Metas

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

class AfvVisaoVendedorMetaPage extends StatelessWidget {

  const AfvVisaoVendedorMetaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return Theme(
          data: getThemeDataDetalhePage(context),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Detalhamento das metas para o cliente João Paulo'),           
              backgroundColor: ViewUtilLib.getBackgroundColorBarraTelaDetalhe(),
              leading: Container(),
              actions: const <Widget>[
            ]),
            body: SingleChildScrollView(
              child: Theme(
                data: ThemeData(fontFamily: 'Raleway'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    getPaddingDetalhePage(''),
                    Card(
                      color: Colors.white,
                      elevation: 2.0,
                      child: Column(
                        children: <Widget>[
                            getListTileDataDetalhePage(
                            	'Mensal', 'Período'),
                            getListTileDataDetalhePage(
                            	1200.toStringAsFixed(Constantes.decimaisValor), 'Meta Orçada'),
                            getListTileDataDetalhePage(
                            	625.toStringAsFixed(Constantes.decimaisValor), 'Meta Realizada'),
                            getListTileDataDetalhePage(
                            	'01/07/2020', 'Data Inicial'),
                            getListTileDataDetalhePage(
                            	'31/07/2020', 'Data Final'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
    
  }
}