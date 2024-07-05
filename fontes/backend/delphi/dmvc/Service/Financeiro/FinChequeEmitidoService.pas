{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [FIN_CHEQUE_EMITIDO] 
                                                                                
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
unit FinChequeEmitidoService;

interface

uses
  FinChequeEmitido, Cheque, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFinChequeEmitidoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFinChequeEmitido: TObjectList<TFinChequeEmitido>); overload;
    class procedure AnexarObjetosVinculados(AFinChequeEmitido: TFinChequeEmitido); overload;
  public
    class function ConsultarLista: TObjectList<TFinChequeEmitido>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFinChequeEmitido>;
    class function ConsultarObjeto(AId: Integer): TFinChequeEmitido;
    class procedure Inserir(AFinChequeEmitido: TFinChequeEmitido);
    class function Alterar(AFinChequeEmitido: TFinChequeEmitido): Integer;
    class function Excluir(AFinChequeEmitido: TFinChequeEmitido): Integer;
  end;

var
  sql: string;


implementation

{ TFinChequeEmitidoService }

class procedure TFinChequeEmitidoService.AnexarObjetosVinculados(AFinChequeEmitido: TFinChequeEmitido);
begin
  // Cheque
  sql := 'SELECT * FROM CHEQUE WHERE ID = ' + AFinChequeEmitido.IdCheque.ToString;
  AFinChequeEmitido.Cheque := GetQuery(sql).AsObject<TCheque>;

end;

class procedure TFinChequeEmitidoService.AnexarObjetosVinculados(AListaFinChequeEmitido: TObjectList<TFinChequeEmitido>);
var
  FinChequeEmitido: TFinChequeEmitido;
begin
  for FinChequeEmitido in AListaFinChequeEmitido do
  begin
    AnexarObjetosVinculados(FinChequeEmitido);
  end;
end;

class function TFinChequeEmitidoService.ConsultarLista: TObjectList<TFinChequeEmitido>;
begin
  sql := 'SELECT * FROM FIN_CHEQUE_EMITIDO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFinChequeEmitido>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFinChequeEmitidoService.ConsultarListaFiltro(AWhere: string): TObjectList<TFinChequeEmitido>;
begin
  sql := 'SELECT * FROM FIN_CHEQUE_EMITIDO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFinChequeEmitido>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFinChequeEmitidoService.ConsultarObjeto(AId: Integer): TFinChequeEmitido;
begin
  sql := 'SELECT * FROM FIN_CHEQUE_EMITIDO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFinChequeEmitido>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFinChequeEmitidoService.Inserir(AFinChequeEmitido: TFinChequeEmitido);
begin
  AFinChequeEmitido.ValidarInsercao;
  AFinChequeEmitido.Id := InserirBase(AFinChequeEmitido, 'FIN_CHEQUE_EMITIDO');
  
end;

class function TFinChequeEmitidoService.Alterar(AFinChequeEmitido: TFinChequeEmitido): Integer;
begin
  AFinChequeEmitido.ValidarAlteracao;
  Result := AlterarBase(AFinChequeEmitido, 'FIN_CHEQUE_EMITIDO');
  
  
end;


class function TFinChequeEmitidoService.Excluir(AFinChequeEmitido: TFinChequeEmitido): Integer;
begin
  AFinChequeEmitido.ValidarExclusao;
  
  Result := ExcluirBase(AFinChequeEmitido.Id, 'FIN_CHEQUE_EMITIDO');
end;


end.
