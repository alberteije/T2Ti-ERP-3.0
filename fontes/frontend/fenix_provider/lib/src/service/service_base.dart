/*
Title: T2Ti ERP 3.0                                                                
Description: Configuração base para os serviços REST
                                                                                
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
import 'dart:convert';

import 'package:catcher/catcher.dart';
import 'package:fenix/src/infra/sessao.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/model/retorno_json_erro.dart';
import 'package:recase/recase.dart';
// ignore: avoid_web_libraries_in_flutter
//import 'dart:html' as html;

class ServiceBase {
  /// defina a linguagem do servidor para controle de alguns aspectos do filtro, autorização jwt, etc
  static const String linguagemServidor = 'node';

  /// define o cabeçalho enviado em todas as requisições que segue com o Token JWT
  // static Map<String, String> cabecalhoRequisicao = linguagemServidor == 'delphi' 
  //                             ? {"content-type": "application/json", "authentication": "Bearer ${Sessao.tokenJWT}"} 
  //                             : {"content-type": "application/json", "authorization": "Bearer ${Sessao.tokenJWT}"};

  static Map<String, String> cabecalhoRequisicao = {"content-type": "application/json", "authentication": "Bearer ${Sessao.tokenJWT}"};

  // Servidor ERP
  static const String _porta = '3000';
  static const String _enderecoServidor = 'http://localhost';
  static const String _endpoint = '$_enderecoServidor:$_porta'; 
  //comente a linha acima e descomente a linha abaixo para o PHP
  // static const String _endpoint = '$_enderecoServidor:$_porta/fenix';

  get endpoint => _endpoint;
  static var _url = '';
  get url => _url;

  // Servidor de Relatórios
  static const String _portaRelatorios = '8090';
  static const String _enderecoServidorRelatorios = 'http://localhost';
  static const String _complementoRelatorios = '/cgi-bin/repwebserver.dll/execute.pdf';
  static const String _endpointRelatorios = '$_enderecoServidorRelatorios:$_portaRelatorios$_complementoRelatorios';
  get endpointRelatorios => _endpointRelatorios;
  static var _urlRelatorios = '';
  get urlRelatorios => _urlRelatorios;


  static final _objetoJsonErro = RetornoJsonErro();
  get objetoJsonErro => _objetoJsonErro;

  // o filtro deve ser enviado da seguinte forma: ?filter=field||$condition||value
  // referência: https://github.com/nestjsx/crud/wiki/Requests
  void tratarFiltro(Filtro? filtro, String entidade) {
    String? stringFiltro = '';

    if (filtro != null) {

      if(linguagemServidor == 'node') {
        filtro.campo = filtro.campo?.camelCase;
      }

      if (filtro.condicao == 'cont') {
        stringFiltro = '?filter=${filtro.campo!}||\$cont||${filtro.valor!}';
      } else if (filtro.condicao == 'eq') {
        stringFiltro = '?filter=${filtro.campo!}||\$eq||${filtro.valor!}';
      } else if (filtro.condicao == 'between') {
        stringFiltro = '?filter=${filtro.campo!}||\$between||${filtro.dataInicial!},${filtro.dataFinal!}';
      } else if (filtro.condicao == 'where') { // nesse caso o filtro já foi montado na janela
        if (linguagemServidor != 'node') {
          filtro.where = filtro.where!.replaceAll('&filter=', '?');
        }
        stringFiltro = filtro.where;
      }
    }

    _url = _endpoint + entidade + stringFiltro!;
  }

  void tratarFiltroRelatorio(Filtro? filtro, String entidade) {
    var stringFiltro = "";

    if (filtro != null) {
      if (filtro.condicao != null) {
        stringFiltro = "WHERE ";
      }

      if (filtro.condicao == 'cont') {
        stringFiltro = "$stringFiltro${filtro.campo!} LIKE '%25${filtro.valor!}%25'";
      } else if (filtro.condicao == 'eq') {
        stringFiltro = '$stringFiltro${filtro.campo!} = ${filtro.valor!}';
      } else if (filtro.condicao == 'between') {
        stringFiltro = '$stringFiltro${filtro.campo!} between ${filtro.dataInicial!} and ${filtro.dataFinal!}';
      }
    }

    var stringParametros = "?reportname=$entidade&aliasname=T2TIERP&username=Admin&password=&ParamFILTRO=$stringFiltro";
    _urlRelatorios = _endpointRelatorios + stringParametros;
  }

  void visualizarRelatorioPdfWeb(Filtro? filtro, String titulo) {
  // html.window.open(_urlRelatorios, titulo);
  }

  Future tratarRetornoErro(String? corpo, Map<String, String>? headers, {Exception? exception}) async {
    if (exception != null) {
        _objetoJsonErro.error = 'Ocorreu um erro na comunicação com o servidor.';
        _objetoJsonErro.message = exception.toString();
        _objetoJsonErro.trace = exception.toString();
        _objetoJsonErro.tipo = 'text';      
    }
    else {
      if(headers!["content-type"] != null) {
        if (headers["content-type"]!.contains("application/json")) {
          Map<String, dynamic> body = json.decode(corpo!);  
          _objetoJsonErro.status = body['status']?.toString() ?? body['statuscode'].toString();
          _objetoJsonErro.error = body['error'] ?? body['classname'].toString();
          _objetoJsonErro.message = body['message'];
          _objetoJsonErro.trace = body['trace'];
          _objetoJsonErro.tipo = 'json';
        } else if (headers["content-type"]!.contains("html")) {
          _objetoJsonErro.message = corpo;
          _objetoJsonErro.tipo = 'html';
        } else if (headers["content-type"]!.contains("plain")) { // texto puro
          //if (headers["connection"] != null && headers["connection"].contains("close")) {
            _objetoJsonErro.error = 'Ocorreu um erro na comunicação com o servidor.';
          //}
          _objetoJsonErro.message = corpo;
          _objetoJsonErro.tipo = 'text';
        }
      } else {
          _objetoJsonErro.error = 'Ocorreu um erro desconhecido.';
          _objetoJsonErro.message = corpo;
          _objetoJsonErro.tipo = 'text';
      }

    }

    StackTrace stack = StackTrace.fromString(_objetoJsonErro.message ?? '');

    Catcher.reportCheckedError(
      _objetoJsonErro.error, 
      stack
    );

  }

  // Future tratarRetornoErro(String? corpo, Map<String, String>? headers, {Exception? exception}) async {
  //   // throw ('Erro: ' + DateTime.now().toIso8601String() + ' - Exceção: ' + (exception?.toString() ?? '') + ' - Mensagem: ' + (corpo?.toString() ?? ''));
  //   String erro = 'Erro: ${DateTime.now().toIso8601String()} - Exceção: ${exception?.toString() ?? ''}';
  //   StackTrace stack = StackTrace.fromString('Mensagem: ${corpo?.toString() ?? ''}');
    
  //   Catcher.reportCheckedError(
  //     erro, 
  //     stack
  //   );
  // }
}