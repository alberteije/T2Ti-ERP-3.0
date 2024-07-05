{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [AGENDA_COMPROMISSO] 
                                                                                
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
unit AgendaCompromissoService;

interface

uses
  AgendaCompromisso, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TAgendaCompromissoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TAgendaCompromisso>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TAgendaCompromisso>;
    class function ConsultarObjeto(AId: Integer): TAgendaCompromisso;
    class procedure Inserir(AAgendaCompromisso: TAgendaCompromisso);
    class function Alterar(AAgendaCompromisso: TAgendaCompromisso): Integer;
    class function Excluir(AAgendaCompromisso: TAgendaCompromisso): Integer;
  end;

var
  sql: string;


implementation

{ TAgendaCompromissoService }



class function TAgendaCompromissoService.ConsultarLista: TObjectList<TAgendaCompromisso>;
begin
  sql := 'SELECT * FROM AGENDA_COMPROMISSO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TAgendaCompromisso>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TAgendaCompromissoService.ConsultarListaFiltro(AWhere: string): TObjectList<TAgendaCompromisso>;
begin
  sql := 'SELECT * FROM AGENDA_COMPROMISSO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TAgendaCompromisso>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TAgendaCompromissoService.ConsultarObjeto(AId: Integer): TAgendaCompromisso;
begin
  sql := 'SELECT * FROM AGENDA_COMPROMISSO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TAgendaCompromisso>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TAgendaCompromissoService.Inserir(AAgendaCompromisso: TAgendaCompromisso);
begin
  AAgendaCompromisso.ValidarInsercao;
  AAgendaCompromisso.Id := InserirBase(AAgendaCompromisso, 'AGENDA_COMPROMISSO');
  
end;

class function TAgendaCompromissoService.Alterar(AAgendaCompromisso: TAgendaCompromisso): Integer;
begin
  AAgendaCompromisso.ValidarAlteracao;
  Result := AlterarBase(AAgendaCompromisso, 'AGENDA_COMPROMISSO');
  
  
end;


class function TAgendaCompromissoService.Excluir(AAgendaCompromisso: TAgendaCompromisso): Integer;
begin
  AAgendaCompromisso.ValidarExclusao;
  
  Result := ExcluirBase(AAgendaCompromisso.Id, 'AGENDA_COMPROMISSO');
end;


end.
