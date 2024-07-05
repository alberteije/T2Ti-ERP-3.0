{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [WMS_AGENDAMENTO] 
                                                                                
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
unit WmsAgendamentoService;

interface

uses
  WmsAgendamento, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TWmsAgendamentoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TWmsAgendamento>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TWmsAgendamento>;
    class function ConsultarObjeto(AId: Integer): TWmsAgendamento;
    class procedure Inserir(AWmsAgendamento: TWmsAgendamento);
    class function Alterar(AWmsAgendamento: TWmsAgendamento): Integer;
    class function Excluir(AWmsAgendamento: TWmsAgendamento): Integer;
  end;

var
  sql: string;


implementation

{ TWmsAgendamentoService }



class function TWmsAgendamentoService.ConsultarLista: TObjectList<TWmsAgendamento>;
begin
  sql := 'SELECT * FROM WMS_AGENDAMENTO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TWmsAgendamento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsAgendamentoService.ConsultarListaFiltro(AWhere: string): TObjectList<TWmsAgendamento>;
begin
  sql := 'SELECT * FROM WMS_AGENDAMENTO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TWmsAgendamento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsAgendamentoService.ConsultarObjeto(AId: Integer): TWmsAgendamento;
begin
  sql := 'SELECT * FROM WMS_AGENDAMENTO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TWmsAgendamento>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TWmsAgendamentoService.Inserir(AWmsAgendamento: TWmsAgendamento);
begin
  AWmsAgendamento.ValidarInsercao;
  AWmsAgendamento.Id := InserirBase(AWmsAgendamento, 'WMS_AGENDAMENTO');
  
end;

class function TWmsAgendamentoService.Alterar(AWmsAgendamento: TWmsAgendamento): Integer;
begin
  AWmsAgendamento.ValidarAlteracao;
  Result := AlterarBase(AWmsAgendamento, 'WMS_AGENDAMENTO');
  
  
end;


class function TWmsAgendamentoService.Excluir(AWmsAgendamento: TWmsAgendamento): Integer;
begin
  AWmsAgendamento.ValidarExclusao;
  
  Result := ExcluirBase(AWmsAgendamento.Id, 'WMS_AGENDAMENTO');
end;


end.
