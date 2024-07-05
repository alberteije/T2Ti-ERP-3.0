/*
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [NFE_CABECALHO] 
                                                                                
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
import 'dart:typed_data';

import 'package:fenix/src/infra/infra.dart';
import 'package:http/http.dart' show Client;

import 'package:fenix/src/service/service_base.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/model/model.dart';

/// classe responsável por requisições ao servidor REST
class NfeCabecalhoService extends ServiceBase {
  var clienteHTTP = Client();

  Future<List<NfeCabecalho>?> consultarLista({Filtro? filtro}) async {
    List<NfeCabecalho> listaNfeCabecalho =  [];

    try {
      tratarFiltro(filtro, '/nfe-cabecalho/');
	  	
      final response = await clienteHTTP.get(Uri.tryParse(url)!, headers: ServiceBase.cabecalhoRequisicao);

      if (response.statusCode == 200) {
        if (response.headers["content-type"]!.contains("html")) {
          tratarRetornoErro(response.body, response.headers);
          return null;
        } else {
          var parsed = json.decode(response.body) as List<dynamic>;
          for (var nfeCabecalho in parsed) {
            listaNfeCabecalho.add(NfeCabecalho.fromJson(nfeCabecalho));
          }
          return listaNfeCabecalho;
        }
      } else {
        tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      tratarRetornoErro(null, null, exception: e);
    }
    return null;
  }

  Future<NfeCabecalho?> consultarObjeto(int id) async {
    try {
      final response = await clienteHTTP.get(Uri.tryParse('$endpoint/nfe-cabecalho/$id')!, headers: ServiceBase.cabecalhoRequisicao);

      if (response.statusCode == 200) {
        if (response.headers["content-type"]!.contains("html")) {
          tratarRetornoErro(response.body, response.headers);
          return null;
        } else {
          var nfeCabecalhoJson = json.decode(response.body);
          return NfeCabecalho.fromJson(nfeCabecalhoJson);
        }
      } else {
        tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      tratarRetornoErro(null, null, exception: e);
    }
    return null;
  }

  Future<NfeCabecalho?> inserir(NfeCabecalho nfeCabecalho) async {
    try {
      final response = await clienteHTTP.post(
        Uri.tryParse('$endpoint/nfe-cabecalho')!,
        headers: ServiceBase.cabecalhoRequisicao,
        body: nfeCabecalho.objetoEncodeJson(nfeCabecalho),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.headers["content-type"]!.contains("html")) {
          tratarRetornoErro(response.body, response.headers);
          return null;
        } else {
          var nfeCabecalhoJson = json.decode(response.body);
          return NfeCabecalho.fromJson(nfeCabecalhoJson);
        }
      } else {
        tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      tratarRetornoErro(null, null, exception: e);
    }
    return null;
  }

  Future<NfeCabecalho?> alterar(NfeCabecalho nfeCabecalho) async {
    try {
      var id = nfeCabecalho.id;
      final response = await clienteHTTP.put(
        Uri.tryParse('$endpoint/nfe-cabecalho/$id')!,
        headers: ServiceBase.cabecalhoRequisicao,
        body: nfeCabecalho.objetoEncodeJson(nfeCabecalho),
      );

      if (response.statusCode == 200) {
        if (response.headers["content-type"]!.contains("html")) {
          tratarRetornoErro(response.body, response.headers);
          return null;
        } else {
          var nfeCabecalhoJson = json.decode(response.body);
          return NfeCabecalho.fromJson(nfeCabecalhoJson);
        }
      } else {
        tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      tratarRetornoErro(null, null, exception: e);
    }
    return null;
  }

  Future<bool?> excluir(int? id) async {
    try {
      final response = await clienteHTTP.delete(
        Uri.tryParse('$endpoint/nfe-cabecalho/$id')!,
        headers: ServiceBase.cabecalhoRequisicao,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      tratarRetornoErro(null, null, exception: e);
    }
    return null;
  }
  
  Future<Uint8List?> visualizarPdf({Filtro? filtro}) async {
    try {
      tratarFiltroRelatorio(filtro, 'NfeCabecalho');
      final response = await clienteHTTP.get(Uri.tryParse(urlRelatorios)!);
      if (response.statusCode == 200) {
        if (response.headers["content-type"]!.contains("html")) {
          tratarRetornoErro(response.body, response.headers);
          return null;
        } else {
          final pdf = response.bodyBytes;
          return pdf;        
        }
      } else {
        tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      tratarRetornoErro(null, null, exception: e);
    }
    return null;
  }

  Future<void> visualizarPdfWeb({Filtro? filtro}) async {
    try {
      tratarFiltroRelatorio(filtro, 'NfeCabecalho');
      visualizarRelatorioPdfWeb(filtro, 'Relatório Nfe Cabecalho');
    } on Exception catch (e) {
      tratarRetornoErro(null, null, exception: e);
    }
  }
  
    Future<dynamic> transmitirNfe(NfeCabecalho nfeCabecalho) async {
    try {
      final response = await clienteHTTP.post(
        Uri.tryParse('$endpoint/nfe-cabecalho/transmite-nfe/')!,
        headers: ServiceBase.cabecalhoRequisicao,
        body: nfeCabecalho.objetoEncodeJson(nfeCabecalho),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.headers["content-type"]!.contains("html")) {
          tratarRetornoErro(response.body, response.headers);
          return null;
        } else {
          final danfe = response.bodyBytes;
          return danfe;  
        }
      } else if (response.statusCode == 418) {
        return json.decode(response.body)["message"];
      } else {
        tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      tratarRetornoErro(null, null, exception: e);
    }
    return null;
  }

  Future<dynamic> gerarPdfDanfe(String chave) async {
    try {
      ServiceBase.cabecalhoRequisicao = 
                            {
                              "content-type": "application/json", 
                              "authentication": "Bearer ${Sessao.tokenJWT}", 
                              "chave": chave, 
                            };      
      final response = await clienteHTTP.get(
        Uri.tryParse('$endpoint/nfe-cabecalho/gera-pdf-nfe/')!, 
        headers: ServiceBase.cabecalhoRequisicao);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.headers["content-type"]!.contains("html")) {
          tratarRetornoErro(response.body, response.headers);
          return null;
        } else {
          final danfe = response.bodyBytes;
          return danfe;          
        }
      } else if (response.statusCode == 418) {
        return json.decode(response.body)["message"];
      } else {
        tratarRetornoErro(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      tratarRetornoErro(null, null, exception: e);
      return null;
    }
  }
}