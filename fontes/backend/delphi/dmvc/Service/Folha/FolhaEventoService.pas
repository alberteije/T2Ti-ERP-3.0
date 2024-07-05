{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_EVENTO] 
                                                                                
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
unit FolhaEventoService;

interface

uses
  FolhaEvento, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaEventoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TFolhaEvento>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaEvento>;
    class function ConsultarObjeto(AId: Integer): TFolhaEvento;
    class procedure Inserir(AFolhaEvento: TFolhaEvento);
    class function Alterar(AFolhaEvento: TFolhaEvento): Integer;
    class function Excluir(AFolhaEvento: TFolhaEvento): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaEventoService }



class function TFolhaEventoService.ConsultarLista: TObjectList<TFolhaEvento>;
begin
  sql := 'SELECT * FROM FOLHA_EVENTO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaEvento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaEventoService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaEvento>;
begin
  sql := 'SELECT * FROM FOLHA_EVENTO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaEvento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaEventoService.ConsultarObjeto(AId: Integer): TFolhaEvento;
begin
  sql := 'SELECT * FROM FOLHA_EVENTO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaEvento>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaEventoService.Inserir(AFolhaEvento: TFolhaEvento);
begin
  AFolhaEvento.ValidarInsercao;
  AFolhaEvento.Id := InserirBase(AFolhaEvento, 'FOLHA_EVENTO');
  
end;

class function TFolhaEventoService.Alterar(AFolhaEvento: TFolhaEvento): Integer;
begin
  AFolhaEvento.ValidarAlteracao;
  Result := AlterarBase(AFolhaEvento, 'FOLHA_EVENTO');
  
  
end;


class function TFolhaEventoService.Excluir(AFolhaEvento: TFolhaEvento): Integer;
begin
  AFolhaEvento.ValidarExclusao;
  
  Result := ExcluirBase(AFolhaEvento.Id, 'FOLHA_EVENTO');
end;


end.
