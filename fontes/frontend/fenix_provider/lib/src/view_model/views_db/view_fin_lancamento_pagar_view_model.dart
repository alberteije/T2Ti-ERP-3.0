/*
Title: T2Ti ERP 3.0                                                                
Description: ViewModel relacionado à tabela [VIEW_FIN_LANCAMENTO_PAGAR] 
                                                                                
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

import 'package:fenix/src/infra/locator.dart';
import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/model/retorno_json_erro.dart';
import 'package:fenix/src/service/service.dart';

class ViewFinLancamentoPagarViewModel extends ChangeNotifier {
  final ViewFinLancamentoPagarService _viewFinLancamentoPagarService = locator<ViewFinLancamentoPagarService>();
  List<ViewFinLancamentoPagar>? listaViewFinLancamentoPagar;
  RetornoJsonErro? objetoJsonErro;

  ViewFinLancamentoPagarViewModel();

  Future<List<ViewFinLancamentoPagar>?> consultarLista({Filtro? filtro}) async {
    listaViewFinLancamentoPagar = await _viewFinLancamentoPagarService.consultarLista(filtro: filtro);
    if (listaViewFinLancamentoPagar == null) {
      objetoJsonErro = _viewFinLancamentoPagarService.objetoJsonErro;
    }
    notifyListeners();
    return listaViewFinLancamentoPagar;
  }

  Future<ViewFinLancamentoPagar?> consultarObjeto(int id) async {
    var result = await _viewFinLancamentoPagarService.consultarObjeto(id);
    if (result == null) {
      objetoJsonErro = _viewFinLancamentoPagarService.objetoJsonErro;
    }
    notifyListeners();
    return result;
  }

  Future<ViewFinLancamentoPagar?> inserir(ViewFinLancamentoPagar viewFinLancamentoPagar) async {
    var result = await _viewFinLancamentoPagarService.inserir(viewFinLancamentoPagar);
    if (result == null) {
      objetoJsonErro = _viewFinLancamentoPagarService.objetoJsonErro;
    }
    notifyListeners();
    return result;
  }

  Future<ViewFinLancamentoPagar?> alterar(ViewFinLancamentoPagar viewFinLancamentoPagar) async {
    var result = await _viewFinLancamentoPagarService.alterar(viewFinLancamentoPagar);
    if (result == null) {
      objetoJsonErro = _viewFinLancamentoPagarService.objetoJsonErro;
    }
    notifyListeners();
    return result;
  }

  Future<bool?> excluir(int id) async {
    var result = await _viewFinLancamentoPagarService.excluir(id);
    if (result == false) {
      objetoJsonErro = _viewFinLancamentoPagarService.objetoJsonErro;
      notifyListeners();
    } else {
      consultarLista();
    }
    return result;
  }
}