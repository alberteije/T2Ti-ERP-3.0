{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_HORARIO] 
                                                                                
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
unit PontoHorarioService;

interface

uses
  PontoHorario, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPontoHorarioService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPontoHorario>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPontoHorario>;
    class function ConsultarObjeto(AId: Integer): TPontoHorario;
    class procedure Inserir(APontoHorario: TPontoHorario);
    class function Alterar(APontoHorario: TPontoHorario): Integer;
    class function Excluir(APontoHorario: TPontoHorario): Integer;
  end;

var
  sql: string;


implementation

{ TPontoHorarioService }



class function TPontoHorarioService.ConsultarLista: TObjectList<TPontoHorario>;
begin
  sql := 'SELECT * FROM PONTO_HORARIO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPontoHorario>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoHorarioService.ConsultarListaFiltro(AWhere: string): TObjectList<TPontoHorario>;
begin
  sql := 'SELECT * FROM PONTO_HORARIO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPontoHorario>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoHorarioService.ConsultarObjeto(AId: Integer): TPontoHorario;
begin
  sql := 'SELECT * FROM PONTO_HORARIO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPontoHorario>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPontoHorarioService.Inserir(APontoHorario: TPontoHorario);
begin
  APontoHorario.ValidarInsercao;
  APontoHorario.Id := InserirBase(APontoHorario, 'PONTO_HORARIO');
  
end;

class function TPontoHorarioService.Alterar(APontoHorario: TPontoHorario): Integer;
begin
  APontoHorario.ValidarAlteracao;
  Result := AlterarBase(APontoHorario, 'PONTO_HORARIO');
  
  
end;


class function TPontoHorarioService.Excluir(APontoHorario: TPontoHorario): Integer;
begin
  APontoHorario.ValidarExclusao;
  
  Result := ExcluirBase(APontoHorario.Id, 'PONTO_HORARIO');
end;


end.
