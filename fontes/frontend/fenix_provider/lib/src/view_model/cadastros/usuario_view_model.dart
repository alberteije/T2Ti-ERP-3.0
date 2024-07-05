/*
Title: T2Ti ERP 3.0                                                                
Description: ViewModel relacionado à tabela [USUARIO] 
                                                                                
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

class UsuarioViewModel extends ChangeNotifier {
  final UsuarioService _usuarioService = locator<UsuarioService>();
  List<Usuario>? listaUsuario;
  Usuario? usuario;
  RetornoJsonErro? objetoJsonErro;

  UsuarioViewModel();

  Future<List<Usuario>?> consultarLista({Filtro? filtro}) async {
    listaUsuario = await _usuarioService.consultarLista(filtro: filtro);
    if (listaUsuario == null) {
      objetoJsonErro = _usuarioService.objetoJsonErro;
    }
    notifyListeners();
    return listaUsuario;
  }

  Future<Usuario?> consultarObjeto(int id) async {
    usuario = await _usuarioService.consultarObjeto(id);
    if (usuario == null) {
      objetoJsonErro = _usuarioService.objetoJsonErro;
    }
    notifyListeners();
    return usuario;
  }

  Future<Usuario?> inserir(Usuario usuario) async {
    var result = await _usuarioService.inserir(usuario);
    if (result == null) {
      objetoJsonErro = _usuarioService.objetoJsonErro;
    }
    notifyListeners();
    return result;
  }

  Future<Usuario?> alterar(Usuario usuario) async {
    var result = await _usuarioService.alterar(usuario);
    if (result == null) {
      objetoJsonErro = _usuarioService.objetoJsonErro;
    }
    notifyListeners();
    return result;
  }

  Future<bool?> excluir(int id) async {
    var result = await _usuarioService.excluir(id);
    if (result == false) {
      objetoJsonErro = _usuarioService.objetoJsonErro;
      notifyListeners();
    } else {
      consultarLista();
    }
    return result;
  }
  
  Future<Uint8List?> visualizarPdf({Filtro? filtro}) async {
    var result = await _usuarioService.visualizarPdf(filtro: filtro);
    if (result == null) {
      objetoJsonErro = _usuarioService.objetoJsonErro;
    }
    notifyListeners();
    return result;
  }

  Future<void> visualizarPdfWeb({Filtro? filtro}) async {
    await _usuarioService.visualizarPdfWeb(filtro: filtro);
  }
  
}