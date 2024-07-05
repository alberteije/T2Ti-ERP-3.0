{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [WMS_EXPEDICAO] 
                                                                                
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
unit WmsExpedicaoService;

interface

uses
  WmsExpedicao, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TWmsExpedicaoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TWmsExpedicao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TWmsExpedicao>;
    class function ConsultarObjeto(AId: Integer): TWmsExpedicao;
    class procedure Inserir(AWmsExpedicao: TWmsExpedicao);
    class function Alterar(AWmsExpedicao: TWmsExpedicao): Integer;
    class function Excluir(AWmsExpedicao: TWmsExpedicao): Integer;
  end;

var
  sql: string;


implementation

{ TWmsExpedicaoService }



class function TWmsExpedicaoService.ConsultarLista: TObjectList<TWmsExpedicao>;
begin
  sql := 'SELECT * FROM WMS_EXPEDICAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TWmsExpedicao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsExpedicaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TWmsExpedicao>;
begin
  sql := 'SELECT * FROM WMS_EXPEDICAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TWmsExpedicao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsExpedicaoService.ConsultarObjeto(AId: Integer): TWmsExpedicao;
begin
  sql := 'SELECT * FROM WMS_EXPEDICAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TWmsExpedicao>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TWmsExpedicaoService.Inserir(AWmsExpedicao: TWmsExpedicao);
begin
  AWmsExpedicao.ValidarInsercao;
  AWmsExpedicao.Id := InserirBase(AWmsExpedicao, 'WMS_EXPEDICAO');
  
end;

class function TWmsExpedicaoService.Alterar(AWmsExpedicao: TWmsExpedicao): Integer;
begin
  AWmsExpedicao.ValidarAlteracao;
  Result := AlterarBase(AWmsExpedicao, 'WMS_EXPEDICAO');
  
  
end;


class function TWmsExpedicaoService.Excluir(AWmsExpedicao: TWmsExpedicao): Integer;
begin
  AWmsExpedicao.ValidarExclusao;
  
  Result := ExcluirBase(AWmsExpedicao.Id, 'WMS_EXPEDICAO');
end;


end.
