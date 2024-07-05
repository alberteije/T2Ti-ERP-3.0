{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [SEGURADORA] 
                                                                                
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
*******************************************************************************}
unit SeguradoraService;

interface

uses
  Seguradora, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TSeguradoraService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TSeguradora>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TSeguradora>;
    class function ConsultarObjeto(AId: Integer): TSeguradora;
    class procedure Inserir(ASeguradora: TSeguradora);
    class function Alterar(ASeguradora: TSeguradora): Integer;
    class function Excluir(ASeguradora: TSeguradora): Integer;
  end;

var
  sql: string;


implementation

{ TSeguradoraService }



class function TSeguradoraService.ConsultarLista: TObjectList<TSeguradora>;
begin
  sql := 'SELECT * FROM SEGURADORA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TSeguradora>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TSeguradoraService.ConsultarListaFiltro(AWhere: string): TObjectList<TSeguradora>;
begin
  sql := 'SELECT * FROM SEGURADORA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TSeguradora>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TSeguradoraService.ConsultarObjeto(AId: Integer): TSeguradora;
begin
  sql := 'SELECT * FROM SEGURADORA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TSeguradora>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TSeguradoraService.Inserir(ASeguradora: TSeguradora);
begin
  ASeguradora.ValidarInsercao;
  ASeguradora.Id := InserirBase(ASeguradora, 'SEGURADORA');
  
end;

class function TSeguradoraService.Alterar(ASeguradora: TSeguradora): Integer;
begin
  ASeguradora.ValidarAlteracao;
  Result := AlterarBase(ASeguradora, 'SEGURADORA');
  
  
end;


class function TSeguradoraService.Excluir(ASeguradora: TSeguradora): Integer;
begin
  ASeguradora.ValidarExclusao;
  
  Result := ExcluirBase(ASeguradora.Id, 'SEGURADORA');
end;


end.
