{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_HORARIO_AUTORIZADO] 
                                                                                
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
unit PontoHorarioAutorizadoService;

interface

uses
  PontoHorarioAutorizado, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPontoHorarioAutorizadoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPontoHorarioAutorizado>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPontoHorarioAutorizado>;
    class function ConsultarObjeto(AId: Integer): TPontoHorarioAutorizado;
    class procedure Inserir(APontoHorarioAutorizado: TPontoHorarioAutorizado);
    class function Alterar(APontoHorarioAutorizado: TPontoHorarioAutorizado): Integer;
    class function Excluir(APontoHorarioAutorizado: TPontoHorarioAutorizado): Integer;
  end;

var
  sql: string;


implementation

{ TPontoHorarioAutorizadoService }



class function TPontoHorarioAutorizadoService.ConsultarLista: TObjectList<TPontoHorarioAutorizado>;
begin
  sql := 'SELECT * FROM PONTO_HORARIO_AUTORIZADO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPontoHorarioAutorizado>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoHorarioAutorizadoService.ConsultarListaFiltro(AWhere: string): TObjectList<TPontoHorarioAutorizado>;
begin
  sql := 'SELECT * FROM PONTO_HORARIO_AUTORIZADO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPontoHorarioAutorizado>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoHorarioAutorizadoService.ConsultarObjeto(AId: Integer): TPontoHorarioAutorizado;
begin
  sql := 'SELECT * FROM PONTO_HORARIO_AUTORIZADO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPontoHorarioAutorizado>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPontoHorarioAutorizadoService.Inserir(APontoHorarioAutorizado: TPontoHorarioAutorizado);
begin
  APontoHorarioAutorizado.ValidarInsercao;
  APontoHorarioAutorizado.Id := InserirBase(APontoHorarioAutorizado, 'PONTO_HORARIO_AUTORIZADO');
  
end;

class function TPontoHorarioAutorizadoService.Alterar(APontoHorarioAutorizado: TPontoHorarioAutorizado): Integer;
begin
  APontoHorarioAutorizado.ValidarAlteracao;
  Result := AlterarBase(APontoHorarioAutorizado, 'PONTO_HORARIO_AUTORIZADO');
  
  
end;


class function TPontoHorarioAutorizadoService.Excluir(APontoHorarioAutorizado: TPontoHorarioAutorizado): Integer;
begin
  APontoHorarioAutorizado.ValidarExclusao;
  
  Result := ExcluirBase(APontoHorarioAutorizado.Id, 'PONTO_HORARIO_AUTORIZADO');
end;


end.
