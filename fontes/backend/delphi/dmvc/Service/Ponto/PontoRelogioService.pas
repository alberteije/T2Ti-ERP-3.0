{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_RELOGIO] 
                                                                                
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
unit PontoRelogioService;

interface

uses
  PontoRelogio, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPontoRelogioService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPontoRelogio>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPontoRelogio>;
    class function ConsultarObjeto(AId: Integer): TPontoRelogio;
    class procedure Inserir(APontoRelogio: TPontoRelogio);
    class function Alterar(APontoRelogio: TPontoRelogio): Integer;
    class function Excluir(APontoRelogio: TPontoRelogio): Integer;
  end;

var
  sql: string;


implementation

{ TPontoRelogioService }



class function TPontoRelogioService.ConsultarLista: TObjectList<TPontoRelogio>;
begin
  sql := 'SELECT * FROM PONTO_RELOGIO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPontoRelogio>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoRelogioService.ConsultarListaFiltro(AWhere: string): TObjectList<TPontoRelogio>;
begin
  sql := 'SELECT * FROM PONTO_RELOGIO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPontoRelogio>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoRelogioService.ConsultarObjeto(AId: Integer): TPontoRelogio;
begin
  sql := 'SELECT * FROM PONTO_RELOGIO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPontoRelogio>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPontoRelogioService.Inserir(APontoRelogio: TPontoRelogio);
begin
  APontoRelogio.ValidarInsercao;
  APontoRelogio.Id := InserirBase(APontoRelogio, 'PONTO_RELOGIO');
  
end;

class function TPontoRelogioService.Alterar(APontoRelogio: TPontoRelogio): Integer;
begin
  APontoRelogio.ValidarAlteracao;
  Result := AlterarBase(APontoRelogio, 'PONTO_RELOGIO');
  
  
end;


class function TPontoRelogioService.Excluir(APontoRelogio: TPontoRelogio): Integer;
begin
  APontoRelogio.ValidarExclusao;
  
  Result := ExcluirBase(APontoRelogio.Id, 'PONTO_RELOGIO');
end;


end.
