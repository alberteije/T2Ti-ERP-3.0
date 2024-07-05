{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [RECADO_REMETENTE] 
                                                                                
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
unit RecadoRemetenteService;

interface

uses
  RecadoRemetente, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TRecadoRemetenteService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TRecadoRemetente>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TRecadoRemetente>;
    class function ConsultarObjeto(AId: Integer): TRecadoRemetente;
    class procedure Inserir(ARecadoRemetente: TRecadoRemetente);
    class function Alterar(ARecadoRemetente: TRecadoRemetente): Integer;
    class function Excluir(ARecadoRemetente: TRecadoRemetente): Integer;
  end;

var
  sql: string;


implementation

{ TRecadoRemetenteService }



class function TRecadoRemetenteService.ConsultarLista: TObjectList<TRecadoRemetente>;
begin
  sql := 'SELECT * FROM RECADO_REMETENTE ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TRecadoRemetente>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TRecadoRemetenteService.ConsultarListaFiltro(AWhere: string): TObjectList<TRecadoRemetente>;
begin
  sql := 'SELECT * FROM RECADO_REMETENTE where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TRecadoRemetente>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TRecadoRemetenteService.ConsultarObjeto(AId: Integer): TRecadoRemetente;
begin
  sql := 'SELECT * FROM RECADO_REMETENTE WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TRecadoRemetente>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TRecadoRemetenteService.Inserir(ARecadoRemetente: TRecadoRemetente);
begin
  ARecadoRemetente.ValidarInsercao;
  ARecadoRemetente.Id := InserirBase(ARecadoRemetente, 'RECADO_REMETENTE');
  
end;

class function TRecadoRemetenteService.Alterar(ARecadoRemetente: TRecadoRemetente): Integer;
begin
  ARecadoRemetente.ValidarAlteracao;
  Result := AlterarBase(ARecadoRemetente, 'RECADO_REMETENTE');
  
  
end;


class function TRecadoRemetenteService.Excluir(ARecadoRemetente: TRecadoRemetente): Integer;
begin
  ARecadoRemetente.ValidarExclusao;
  
  Result := ExcluirBase(ARecadoRemetente.Id, 'RECADO_REMETENTE');
end;


end.
