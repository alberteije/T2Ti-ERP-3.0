/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [COLABORADOR] 
                                                                                
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

import 'package:drift/drift.dart';

import 'package:pegasus_pdv/src/database/database.dart';
import 'package:pegasus_pdv/src/database/database_classes.dart';
import 'package:pegasus_pdv/src/model/model.dart';

part 'colaborador_dao.g.dart';

@DriftAccessor(tables: [
  Colaboradors,
])
class ColaboradorDao extends DatabaseAccessor<AppDatabase> with _$ColaboradorDaoMixin {
  final AppDatabase db;

  List<Colaborador>? listaColaborador; // será usada para popular a grid na janela do colaborador

  ColaboradorDao(this.db) : super(db);

  Future<List<Colaborador>?> consultarLista() async {
    listaColaborador = await select(colaboradors).get();
    aplicarDomains();
    return listaColaborador;
  }

  Future<List<Colaborador>?> consultarListaFiltro(String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);
    listaColaborador = await (select(colaboradors)..where((t) => expression)).get();
    aplicarDomains();
    return listaColaborador;
  }

  Stream<List<Colaborador>> observarLista() => select(colaboradors).watch();

  Future<Colaborador?> consultarObjeto(int pId) {
    return (select(colaboradors)..where((t) => t.id.equals(pId))).getSingleOrNull();
  }

// CÓDIGO ANTERIOR
//  Future<Colaborador?> consultarObjetoFiltro(String campo, String valor) async {
//     final query = "SELECT * FROM produto WHERE $campo like '%$valor%'";
//     return (await customSelect(query).getSingleOrNull()) as Colaborador;
//   }
  Future<Colaborador?> consultarObjetoFiltro(String campo, String valor) async {
    final query = " $campo = '$valor'";
    final expression = CustomExpression<bool>(query);
    return await (select(colaboradors)..where((t) => expression)).getSingleOrNull();
  }

  Future<int> ultimoId() async {
    final resultado = await customSelect("select MAX(ID) as ULTIMO from COLABORADOR").getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(Colaborador pObjeto) {
    return transaction(() async {
      final colaborador = removerDomains(pObjeto);
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(colaboradors).insert(colaborador);
      return idInserido;
    });
  }

  Future<bool> alterar(Colaborador pObjeto) {
    return transaction(() async {
      final colaborador = removerDomains(pObjeto);
      return update(colaboradors).replace(colaborador);
    });
  }

  Future<int> excluir(Colaborador pObjeto) {
    return transaction(() async {
      return delete(colaboradors).delete(pObjeto);
    });
  }

  Future<void> sincronizar(ObjetoSincroniza objetoSincroniza) async {
    (delete(colaboradors)..where((t) => t.id.isNotNull())).go();
    var parsed = json.decode(objetoSincroniza.registros!) as List<dynamic>;
    for (var objetoJson in parsed) {
      final objetoDart = Colaborador.fromJson(objetoJson);
      into(colaboradors).insertOnConflictUpdate(objetoDart);
    }
  }

  Colaborador removerDomains(Colaborador colaborador) {
    if (colaborador.entregadorVeiculo != null) {
      colaborador = colaborador.copyWith(entregadorVeiculo: Value(colaborador.entregadorVeiculo!.substring(0, 1)));
    }
    return colaborador;
  }

  void aplicarDomains() {
    for (var i = 0; i < listaColaborador!.length; i++) {
      switch (listaColaborador![i].entregadorVeiculo) {
        case 'C':
          listaColaborador![i] = listaColaborador![i].copyWith(
            entregadorVeiculo: const Value('Carro'),
          );
          break;
        case 'M':
          listaColaborador![i] = listaColaborador![i].copyWith(
            entregadorVeiculo: const Value('Moto'),
          );
          break;
        case 'B':
          listaColaborador![i] = listaColaborador![i].copyWith(
            entregadorVeiculo: const Value('Bicicleta'),
          );
          break;
        case 'A':
          listaColaborador![i] = listaColaborador![i].copyWith(
            entregadorVeiculo: const Value('Aplicativo'),
          );
          break;
        default:
      }
    }
  }

  static List<String> campos = <String>[
    'ID',
    'NOME',
    'CPF',
    'TELEFONE',
    'CELULAR',
    'EMAIL',
    'COMISSAO_VISTA',
    'COMISSAO_PRAZO',
  ];

  static List<String> colunas = <String>[
    'Id',
    'Nome',
    'Cpf',
    'Telefone',
    'Celular',
    'Email',
    'Comissao Vista',
    'Comissao Prazo',
  ];
}
