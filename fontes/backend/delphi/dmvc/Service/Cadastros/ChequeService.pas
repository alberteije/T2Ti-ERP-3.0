{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [CHEQUE] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
*******************************************************************************}
unit ChequeService;

interface

uses
  Cheque, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TChequeService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TCheque>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TCheque>;
    class function ConsultarObjeto(AId: Integer): TCheque;
    class procedure Inserir(ACheque: TCheque);
    class function Alterar(ACheque: TCheque): Integer;
    class function Excluir(ACheque: TCheque): Integer;
  end;

var
  sql: string;


implementation

{ TChequeService }



class function TChequeService.ConsultarLista: TObjectList<TCheque>;
begin
  sql := 'SELECT * FROM CHEQUE ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TCheque>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TChequeService.ConsultarListaFiltro(AWhere: string): TObjectList<TCheque>;
begin
  sql := 'SELECT * FROM CHEQUE where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TCheque>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TChequeService.ConsultarObjeto(AId: Integer): TCheque;
begin
  sql := 'SELECT * FROM CHEQUE WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TCheque>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TChequeService.Inserir(ACheque: TCheque);
begin
  ACheque.ValidarInsercao;
  ACheque.Id := InserirBase(ACheque, 'CHEQUE');
  
end;

class function TChequeService.Alterar(ACheque: TCheque): Integer;
begin
  ACheque.ValidarAlteracao;
  Result := AlterarBase(ACheque, 'CHEQUE');
  
  
end;


class function TChequeService.Excluir(ACheque: TCheque): Integer;
begin
  ACheque.ValidarExclusao;
  
  Result := ExcluirBase(ACheque.Id, 'CHEQUE');
end;


end.
