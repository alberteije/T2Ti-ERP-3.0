{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [WMS_CAIXA] 
                                                                                
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
unit WmsCaixaService;

interface

uses
  WmsCaixa, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TWmsCaixaService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TWmsCaixa>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TWmsCaixa>;
    class function ConsultarObjeto(AId: Integer): TWmsCaixa;
    class procedure Inserir(AWmsCaixa: TWmsCaixa);
    class function Alterar(AWmsCaixa: TWmsCaixa): Integer;
    class function Excluir(AWmsCaixa: TWmsCaixa): Integer;
  end;

var
  sql: string;


implementation

{ TWmsCaixaService }



class function TWmsCaixaService.ConsultarLista: TObjectList<TWmsCaixa>;
begin
  sql := 'SELECT * FROM WMS_CAIXA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TWmsCaixa>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsCaixaService.ConsultarListaFiltro(AWhere: string): TObjectList<TWmsCaixa>;
begin
  sql := 'SELECT * FROM WMS_CAIXA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TWmsCaixa>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsCaixaService.ConsultarObjeto(AId: Integer): TWmsCaixa;
begin
  sql := 'SELECT * FROM WMS_CAIXA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TWmsCaixa>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TWmsCaixaService.Inserir(AWmsCaixa: TWmsCaixa);
begin
  AWmsCaixa.ValidarInsercao;
  AWmsCaixa.Id := InserirBase(AWmsCaixa, 'WMS_CAIXA');
  
end;

class function TWmsCaixaService.Alterar(AWmsCaixa: TWmsCaixa): Integer;
begin
  AWmsCaixa.ValidarAlteracao;
  Result := AlterarBase(AWmsCaixa, 'WMS_CAIXA');
  
  
end;


class function TWmsCaixaService.Excluir(AWmsCaixa: TWmsCaixa): Integer;
begin
  AWmsCaixa.ValidarExclusao;
  
  Result := ExcluirBase(AWmsCaixa.Id, 'WMS_CAIXA');
end;


end.
