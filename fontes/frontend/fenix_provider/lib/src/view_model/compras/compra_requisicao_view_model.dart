/*
Title: T2Ti ERP 3.0                                                                
Description: ViewModel relacionado à tabela [COMPRA_REQUISICAO] 
                                                                                
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
import 'dart:typed_data';

import 'package:fenix/src/infra/locator.dart';
import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/model/retorno_json_erro.dart';
import 'package:fenix/src/service/service.dart';

class CompraRequisicaoViewModel extends ChangeNotifier {
  final CompraRequisicaoService _compraRequisicaoService = locator<CompraRequisicaoService>();
  List<CompraRequisicao>? listaCompraRequisicao;
  CompraRequisicao? compraRequisicao;
  RetornoJsonErro? objetoJsonErro;

  CompraRequisicaoViewModel();

  Future<List<CompraRequisicao>?> consultarLista({Filtro? filtro}) async {
    listaCompraRequisicao = await _compraRequisicaoService.consultarLista(filtro: filtro);
    if (listaCompraRequisicao == null) {
      objetoJsonErro = _compraRequisicaoService.objetoJsonErro;
    }
    notifyListeners();
    return listaCompraRequisicao;
  }

  Future<CompraRequisicao?> consultarObjeto(int id) async {
    compraRequisicao = await _compraRequisicaoService.consultarObjeto(id);
    if (compraRequisicao == null) {
      objetoJsonErro = _compraRequisicaoService.objetoJsonErro;
    }
    notifyListeners();
    return compraRequisicao;
  }

  Future<CompraRequisicao?> inserir(CompraRequisicao compraRequisicao) async {
    var result = await _compraRequisicaoService.inserir(compraRequisicao);
    if (result == null) {
      objetoJsonErro = _compraRequisicaoService.objetoJsonErro;
    }
    notifyListeners();
    return result;
  }

  Future<CompraRequisicao?> alterar(CompraRequisicao compraRequisicao) async {
    var result = await _compraRequisicaoService.alterar(compraRequisicao);
    if (result == null) {
      objetoJsonErro = _compraRequisicaoService.objetoJsonErro;
    }
    notifyListeners();
    return result;
  }

  Future<bool?> excluir(int? id) async {
    var result = await _compraRequisicaoService.excluir(id);
    if (result == false) {
      objetoJsonErro = _compraRequisicaoService.objetoJsonErro;
      notifyListeners();
    } else {
      consultarLista();
    }
    return result;
  }
  
  Future<Uint8List?> visualizarPdf({Filtro? filtro}) async {
    var result = await _compraRequisicaoService.visualizarPdf(filtro: filtro);
    if (result == null) {
      objetoJsonErro = _compraRequisicaoService.objetoJsonErro;
    }
    notifyListeners();
    return result;
  }

  Future<void> visualizarPdfWeb({Filtro? filtro}) async {
    await _compraRequisicaoService.visualizarPdfWeb(filtro: filtro);
  }
  
}