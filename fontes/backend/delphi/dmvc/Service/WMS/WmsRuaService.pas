{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [WMS_RUA] 
                                                                                
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
unit WmsRuaService;

interface

uses
  WmsRua, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TWmsRuaService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TWmsRua>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TWmsRua>;
    class function ConsultarObjeto(AId: Integer): TWmsRua;
    class procedure Inserir(AWmsRua: TWmsRua);
    class function Alterar(AWmsRua: TWmsRua): Integer;
    class function Excluir(AWmsRua: TWmsRua): Integer;
  end;

var
  sql: string;


implementation

{ TWmsRuaService }



class function TWmsRuaService.ConsultarLista: TObjectList<TWmsRua>;
begin
  sql := 'SELECT * FROM WMS_RUA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TWmsRua>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsRuaService.ConsultarListaFiltro(AWhere: string): TObjectList<TWmsRua>;
begin
  sql := 'SELECT * FROM WMS_RUA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TWmsRua>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsRuaService.ConsultarObjeto(AId: Integer): TWmsRua;
begin
  sql := 'SELECT * FROM WMS_RUA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TWmsRua>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TWmsRuaService.Inserir(AWmsRua: TWmsRua);
begin
  AWmsRua.ValidarInsercao;
  AWmsRua.Id := InserirBase(AWmsRua, 'WMS_RUA');
  
end;

class function TWmsRuaService.Alterar(AWmsRua: TWmsRua): Integer;
begin
  AWmsRua.ValidarAlteracao;
  Result := AlterarBase(AWmsRua, 'WMS_RUA');
  
  
end;


class function TWmsRuaService.Excluir(AWmsRua: TWmsRua): Integer;
begin
  AWmsRua.ValidarExclusao;
  
  Result := ExcluirBase(AWmsRua.Id, 'WMS_RUA');
end;


end.
