/*
Title: T2Ti ERP Pegasus                                                                
Description: Table Moor relacionada à tabela [NFE_DETALHE_IMPOSTO_IPI] 
                                                                                
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
import 'package:drift/drift.dart';

@DataClassName("NfeDetalheImpostoIpi")
//@UseRowClass(NfeDetalheImpostoIpi)
class NfeDetalheImpostoIpis extends Table {
  @override
  String get tableName => 'NFE_DETALHE_IMPOSTO_IPI';

  IntColumn get id => integer().named('ID').nullable()();
  IntColumn get idNfeDetalhe => integer().named('ID_NFE_DETALHE').nullable().customConstraint('NULLABLE REFERENCES NFE_DETALHE(ID)')();
  TextColumn get cnpjProdutor => text().named('CNPJ_PRODUTOR').withLength(min: 0, max: 14).nullable()();
  TextColumn get codigoSeloIpi => text().named('CODIGO_SELO_IPI').withLength(min: 0, max: 60).nullable()();
  IntColumn get quantidadeSeloIpi => integer().named('QUANTIDADE_SELO_IPI').nullable()();
  TextColumn get enquadramentoLegalIpi => text().named('ENQUADRAMENTO_LEGAL_IPI').withLength(min: 0, max: 3).nullable()();
  TextColumn get cstIpi => text().named('CST_IPI').withLength(min: 0, max: 2).nullable()();
  RealColumn get valorBaseCalculoIpi => real().named('VALOR_BASE_CALCULO_IPI').nullable()();
  RealColumn get quantidadeUnidadeTributavel => real().named('QUANTIDADE_UNIDADE_TRIBUTAVEL').nullable()();
  RealColumn get valorUnidadeTributavel => real().named('VALOR_UNIDADE_TRIBUTAVEL').nullable()();
  RealColumn get aliquotaIpi => real().named('ALIQUOTA_IPI').nullable()();
  RealColumn get valorIpi => real().named('VALOR_IPI').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
