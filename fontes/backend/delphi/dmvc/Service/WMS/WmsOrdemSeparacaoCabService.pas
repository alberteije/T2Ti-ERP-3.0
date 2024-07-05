{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [WMS_ORDEM_SEPARACAO_CAB] 
                                                                                
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
unit WmsOrdemSeparacaoCabService;

interface

uses
  WmsOrdemSeparacaoCab, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TWmsOrdemSeparacaoCabService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TWmsOrdemSeparacaoCab>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TWmsOrdemSeparacaoCab>;
    class function ConsultarObjeto(AId: Integer): TWmsOrdemSeparacaoCab;
    class procedure Inserir(AWmsOrdemSeparacaoCab: TWmsOrdemSeparacaoCab);
    class function Alterar(AWmsOrdemSeparacaoCab: TWmsOrdemSeparacaoCab): Integer;
    class function Excluir(AWmsOrdemSeparacaoCab: TWmsOrdemSeparacaoCab): Integer;
  end;

var
  sql: string;


implementation

{ TWmsOrdemSeparacaoCabService }



class function TWmsOrdemSeparacaoCabService.ConsultarLista: TObjectList<TWmsOrdemSeparacaoCab>;
begin
  sql := 'SELECT * FROM WMS_ORDEM_SEPARACAO_CAB ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TWmsOrdemSeparacaoCab>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsOrdemSeparacaoCabService.ConsultarListaFiltro(AWhere: string): TObjectList<TWmsOrdemSeparacaoCab>;
begin
  sql := 'SELECT * FROM WMS_ORDEM_SEPARACAO_CAB where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TWmsOrdemSeparacaoCab>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsOrdemSeparacaoCabService.ConsultarObjeto(AId: Integer): TWmsOrdemSeparacaoCab;
begin
  sql := 'SELECT * FROM WMS_ORDEM_SEPARACAO_CAB WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TWmsOrdemSeparacaoCab>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TWmsOrdemSeparacaoCabService.Inserir(AWmsOrdemSeparacaoCab: TWmsOrdemSeparacaoCab);
begin
  AWmsOrdemSeparacaoCab.ValidarInsercao;
  AWmsOrdemSeparacaoCab.Id := InserirBase(AWmsOrdemSeparacaoCab, 'WMS_ORDEM_SEPARACAO_CAB');
  
end;

class function TWmsOrdemSeparacaoCabService.Alterar(AWmsOrdemSeparacaoCab: TWmsOrdemSeparacaoCab): Integer;
begin
  AWmsOrdemSeparacaoCab.ValidarAlteracao;
  Result := AlterarBase(AWmsOrdemSeparacaoCab, 'WMS_ORDEM_SEPARACAO_CAB');
  
  
end;


class function TWmsOrdemSeparacaoCabService.Excluir(AWmsOrdemSeparacaoCab: TWmsOrdemSeparacaoCab): Integer;
begin
  AWmsOrdemSeparacaoCab.ValidarExclusao;
  
  Result := ExcluirBase(AWmsOrdemSeparacaoCab.Id, 'WMS_ORDEM_SEPARACAO_CAB');
end;


end.
