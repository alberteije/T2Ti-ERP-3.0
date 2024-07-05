/*
Title: T2Ti ERP 3.0                                                                
Description: Armazena os objetos para a sessão
                                                                                
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
import 'dart:io';

import 'package:fenix/src/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:catcher/core/catcher.dart';

import 'package:fenix/src/infra/biblioteca.dart';

import 'package:fenix/src/model/retorno_json_erro.dart';
import 'package:fenix/src/model/filtro.dart';

import 'constantes.dart';

class Sessao {
  /// singleton
  factory Sessao() {
    _this ??= Sessao._();
    return _this!;
  }
  static Sessao? _this;
  Sessao._() : super();


// #region objetos globais
  static Filtro filtroGlobal = Filtro();
  static String tokenJWT = '';

  static Empresa empresa = Empresa();

// #endregion objetos globais

  /// popula os objetos principais para a sessão
  static Future popularObjetosPrincipais(BuildContext context) async {
    // empresa = (await EmpresaService().consultarObjeto(1))!;
    if (kDebugMode && Biblioteca.isDesktop()) {
      await _gerarArquivoEnvProtegido();  
    }
  }

  static void fecharDialogBoxEspera(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future<void> _gerarArquivoEnvProtegido() async {
    var conteudoEnvProtegido = '';

    conteudoEnvProtegido += 'SENTRY_DNS=${Constantes.encrypter.encrypt(Constantes.sentryDns!, iv: Constantes.iv).base64}\n';
    conteudoEnvProtegido += 'LINGUAGEM_SERVIDOR=${Constantes.encrypter.encrypt(Constantes.linguagemServidor!, iv: Constantes.iv).base64}\n';
    conteudoEnvProtegido += 'ENDERECO_SERVIDOR=${Constantes.encrypter.encrypt(Constantes.enderecoServidor!, iv: Constantes.iv).base64}\n';
    // conteudoEnvProtegido += 'COMPLEMENTO_ENDERECO_SERVIDOR=${Constantes.encrypter.encrypt(Constantes.complementoEnderecoServidor!, iv: Constantes.iv).base64}\n';
    if (Constantes.complementoEnderecoServidor!.isEmpty) {
      conteudoEnvProtegido += 'COMPLEMENTO_ENDERECO_SERVIDOR=\n';
    } else {
      conteudoEnvProtegido += 'COMPLEMENTO_ENDERECO_SERVIDOR=${Constantes.encrypter.encrypt(Constantes.complementoEnderecoServidor!, iv: Constantes.iv).base64}\n';
    }
    conteudoEnvProtegido += 'PORTA_SERVIDOR=${Constantes.encrypter.encrypt(Constantes.portaServidor!, iv: Constantes.iv).base64}';

    final File file = File('.env-cifrado');
    await file.writeAsString(conteudoEnvProtegido);
  }

  static void tratarErrosSessao(BuildContext context, RetornoJsonErro? objetoJsonErro) {
    if (objetoJsonErro != null) {
      Catcher.reportCheckedError(
        'ERROR: ${objetoJsonErro.error ?? ''} - MESSAGE: ${objetoJsonErro.message ?? ''} - STATUS: ${objetoJsonErro.status ?? ''}', 
        StackTrace.fromString(objetoJsonErro.trace ?? ''), 
      );
      Navigator.pop(context);
    }
  }

}