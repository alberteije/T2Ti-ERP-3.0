/*
Title: T2Ti ERP Pegasus                                                                
Description: Table Moor relacionada à tabela [ECF_SINTEGRA_60A] 
                                                                                
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

@DataClassName("EcfSintegra60A")
//@UseRowClass(EcfSintegra60A)
class EcfSintegra60As extends Table {
  @override
  String get tableName => 'ECF_SINTEGRA_60A';

  IntColumn get id => integer().named('ID').nullable()();
  IntColumn get idEcfSintegra60M => integer().named('ID_ECF_SINTEGRA_60M').nullable().customConstraint('NULLABLE REFERENCES ECF_SINTEGRA_60M(ID)')();
  TextColumn get situacaoTributaria => text().named('SITUACAO_TRIBUTARIA').withLength(min: 0, max: 4).nullable()();
  RealColumn get valor => real().named('VALOR').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
