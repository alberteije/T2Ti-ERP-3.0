{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_ESCALA] 
                                                                                
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
unit PontoEscalaService;

interface

uses
  PontoEscala, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPontoEscalaService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPontoEscala>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPontoEscala>;
    class function ConsultarObjeto(AId: Integer): TPontoEscala;
    class procedure Inserir(APontoEscala: TPontoEscala);
    class function Alterar(APontoEscala: TPontoEscala): Integer;
    class function Excluir(APontoEscala: TPontoEscala): Integer;
  end;

var
  sql: string;


implementation

{ TPontoEscalaService }



class function TPontoEscalaService.ConsultarLista: TObjectList<TPontoEscala>;
begin
  sql := 'SELECT * FROM PONTO_ESCALA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPontoEscala>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoEscalaService.ConsultarListaFiltro(AWhere: string): TObjectList<TPontoEscala>;
begin
  sql := 'SELECT * FROM PONTO_ESCALA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPontoEscala>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoEscalaService.ConsultarObjeto(AId: Integer): TPontoEscala;
begin
  sql := 'SELECT * FROM PONTO_ESCALA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPontoEscala>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPontoEscalaService.Inserir(APontoEscala: TPontoEscala);
begin
  APontoEscala.ValidarInsercao;
  APontoEscala.Id := InserirBase(APontoEscala, 'PONTO_ESCALA');
  
end;

class function TPontoEscalaService.Alterar(APontoEscala: TPontoEscala): Integer;
begin
  APontoEscala.ValidarAlteracao;
  Result := AlterarBase(APontoEscala, 'PONTO_ESCALA');
  
  
end;


class function TPontoEscalaService.Excluir(APontoEscala: TPontoEscala): Integer;
begin
  APontoEscala.ValidarExclusao;
  
  Result := ExcluirBase(APontoEscala.Id, 'PONTO_ESCALA');
end;


end.
