/*
Title: T2Ti ERP Pegasus                                                                
Description: Table Moor relacionada à tabela [CLIENTE_FIADO] 
                                                                                
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
import 'package:pegasus_pdv/src/database/database.dart';

@DataClassName("ClienteFiado")
@UseRowClass(ClienteFiado)
class ClienteFiados extends Table {
  @override
  String get tableName => 'CLIENTE_FIADO';

  IntColumn get id => integer().named('ID').nullable()();
  IntColumn get idCliente => integer().named('ID_CLIENTE').nullable().customConstraint('NULLABLE REFERENCES CLIENTE(ID)')();
  IntColumn get idPdvVendaCabecalho => integer().named('ID_PDV_VENDA_CABECALHO').nullable().customConstraint('NULLABLE REFERENCES PDV_VENDA_CABECALHO(ID)')();
  RealColumn get valorPendente => real().named('VALOR_PENDENTE').nullable()();
  DateTimeColumn get dataPagamento => dateTime().named('DATA_PAGAMENTO').nullable()();
  DateTimeColumn get dataLancamento => dateTime().named('DATA_LANCAMENTO').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class ClienteFiadoMontado {
  ClienteFiado? clienteFiado;
  Cliente? cliente;
  PdvVendaCabecalho? pdvVendaCabecalho;

  ClienteFiadoMontado({
    this.clienteFiado,
    this.cliente,
    this.pdvVendaCabecalho,
  });
}
