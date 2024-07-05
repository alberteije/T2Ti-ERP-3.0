{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PATRIM_BEM] 
                                                                                
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
unit PatrimBemService;

interface

uses
  PatrimBem, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPatrimBemService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPatrimBem>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPatrimBem>;
    class function ConsultarObjeto(AId: Integer): TPatrimBem;
    class procedure Inserir(APatrimBem: TPatrimBem);
    class function Alterar(APatrimBem: TPatrimBem): Integer;
    class function Excluir(APatrimBem: TPatrimBem): Integer;
  end;

var
  sql: string;


implementation

{ TPatrimBemService }



class function TPatrimBemService.ConsultarLista: TObjectList<TPatrimBem>;
begin
  sql := 'SELECT * FROM PATRIM_BEM ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPatrimBem>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPatrimBemService.ConsultarListaFiltro(AWhere: string): TObjectList<TPatrimBem>;
begin
  sql := 'SELECT * FROM PATRIM_BEM where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPatrimBem>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPatrimBemService.ConsultarObjeto(AId: Integer): TPatrimBem;
begin
  sql := 'SELECT * FROM PATRIM_BEM WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPatrimBem>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPatrimBemService.Inserir(APatrimBem: TPatrimBem);
begin
  APatrimBem.ValidarInsercao;
  APatrimBem.Id := InserirBase(APatrimBem, 'PATRIM_BEM');
  
end;

class function TPatrimBemService.Alterar(APatrimBem: TPatrimBem): Integer;
begin
  APatrimBem.ValidarAlteracao;
  Result := AlterarBase(APatrimBem, 'PATRIM_BEM');
  
  
end;


class function TPatrimBemService.Excluir(APatrimBem: TPatrimBem): Integer;
begin
  APatrimBem.ValidarExclusao;
  
  Result := ExcluirBase(APatrimBem.Id, 'PATRIM_BEM');
end;


end.
