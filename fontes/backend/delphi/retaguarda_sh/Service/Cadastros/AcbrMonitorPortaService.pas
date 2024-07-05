﻿{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [ACBR_MONITOR_PORTA] 
                                                                                
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
unit AcbrMonitorPortaService;

interface

uses
  AcbrMonitorPorta, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TAcbrMonitorPortaService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TAcbrMonitorPorta>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TAcbrMonitorPorta>;
    class function ConsultarObjeto(AId: Integer): TAcbrMonitorPorta;
    class function ConsultarObjetoFiltro(AWhere: string): TAcbrMonitorPorta;
    class procedure Inserir(AAcbrMonitorPorta: TAcbrMonitorPorta);
    class function Alterar(AAcbrMonitorPorta: TAcbrMonitorPorta): Integer;
    class function Excluir(AAcbrMonitorPorta: TAcbrMonitorPorta): Integer;
  end;

var
  sql: string;


implementation

{ TAcbrMonitorPortaService }



class function TAcbrMonitorPortaService.ConsultarLista: TObjectList<TAcbrMonitorPorta>;
begin
  sql := 'SELECT * FROM ACBR_MONITOR_PORTA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TAcbrMonitorPorta>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TAcbrMonitorPortaService.ConsultarListaFiltro(AWhere: string): TObjectList<TAcbrMonitorPorta>;
begin
  sql := 'SELECT * FROM ACBR_MONITOR_PORTA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TAcbrMonitorPorta>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TAcbrMonitorPortaService.ConsultarObjeto(AId: Integer): TAcbrMonitorPorta;
begin
  sql := 'SELECT * FROM ACBR_MONITOR_PORTA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TAcbrMonitorPorta>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TAcbrMonitorPortaService.ConsultarObjetoFiltro(AWhere: string): TAcbrMonitorPorta;
begin
  sql := 'SELECT * FROM ACBR_MONITOR_PORTA where ' + AWhere;
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TAcbrMonitorPorta>;

    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TAcbrMonitorPortaService.Inserir(AAcbrMonitorPorta: TAcbrMonitorPorta);
begin
  AAcbrMonitorPorta.ValidarInsercao;
  AAcbrMonitorPorta.Id := InserirBase(AAcbrMonitorPorta, 'ACBR_MONITOR_PORTA');
  
end;

class function TAcbrMonitorPortaService.Alterar(AAcbrMonitorPorta: TAcbrMonitorPorta): Integer;
begin
  AAcbrMonitorPorta.ValidarAlteracao;
  Result := AlterarBase(AAcbrMonitorPorta, 'ACBR_MONITOR_PORTA');
  
  
end;


class function TAcbrMonitorPortaService.Excluir(AAcbrMonitorPorta: TAcbrMonitorPorta): Integer;
begin
  AAcbrMonitorPorta.ValidarExclusao;
  
  Result := ExcluirBase(AAcbrMonitorPorta.Id, 'ACBR_MONITOR_PORTA');
end;


end.
