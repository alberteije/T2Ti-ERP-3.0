{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [WMS_PARAMETRO] 
                                                                                
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
unit WmsParametroService;

interface

uses
  WmsParametro, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TWmsParametroService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TWmsParametro>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TWmsParametro>;
    class function ConsultarObjeto(AId: Integer): TWmsParametro;
    class procedure Inserir(AWmsParametro: TWmsParametro);
    class function Alterar(AWmsParametro: TWmsParametro): Integer;
    class function Excluir(AWmsParametro: TWmsParametro): Integer;
  end;

var
  sql: string;


implementation

{ TWmsParametroService }



class function TWmsParametroService.ConsultarLista: TObjectList<TWmsParametro>;
begin
  sql := 'SELECT * FROM WMS_PARAMETRO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TWmsParametro>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsParametroService.ConsultarListaFiltro(AWhere: string): TObjectList<TWmsParametro>;
begin
  sql := 'SELECT * FROM WMS_PARAMETRO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TWmsParametro>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsParametroService.ConsultarObjeto(AId: Integer): TWmsParametro;
begin
  sql := 'SELECT * FROM WMS_PARAMETRO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TWmsParametro>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TWmsParametroService.Inserir(AWmsParametro: TWmsParametro);
begin
  AWmsParametro.ValidarInsercao;
  AWmsParametro.Id := InserirBase(AWmsParametro, 'WMS_PARAMETRO');
  
end;

class function TWmsParametroService.Alterar(AWmsParametro: TWmsParametro): Integer;
begin
  AWmsParametro.ValidarAlteracao;
  Result := AlterarBase(AWmsParametro, 'WMS_PARAMETRO');
  
  
end;


class function TWmsParametroService.Excluir(AWmsParametro: TWmsParametro): Integer;
begin
  AWmsParametro.ValidarExclusao;
  
  Result := ExcluirBase(AWmsParametro.Id, 'WMS_PARAMETRO');
end;


end.
