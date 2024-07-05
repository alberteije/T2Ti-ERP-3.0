{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [WMS_ARMAZENAMENTO] 
                                                                                
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
unit WmsArmazenamentoService;

interface

uses
  WmsArmazenamento, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TWmsArmazenamentoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TWmsArmazenamento>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TWmsArmazenamento>;
    class function ConsultarObjeto(AId: Integer): TWmsArmazenamento;
    class procedure Inserir(AWmsArmazenamento: TWmsArmazenamento);
    class function Alterar(AWmsArmazenamento: TWmsArmazenamento): Integer;
    class function Excluir(AWmsArmazenamento: TWmsArmazenamento): Integer;
  end;

var
  sql: string;


implementation

{ TWmsArmazenamentoService }



class function TWmsArmazenamentoService.ConsultarLista: TObjectList<TWmsArmazenamento>;
begin
  sql := 'SELECT * FROM WMS_ARMAZENAMENTO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TWmsArmazenamento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsArmazenamentoService.ConsultarListaFiltro(AWhere: string): TObjectList<TWmsArmazenamento>;
begin
  sql := 'SELECT * FROM WMS_ARMAZENAMENTO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TWmsArmazenamento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsArmazenamentoService.ConsultarObjeto(AId: Integer): TWmsArmazenamento;
begin
  sql := 'SELECT * FROM WMS_ARMAZENAMENTO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TWmsArmazenamento>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TWmsArmazenamentoService.Inserir(AWmsArmazenamento: TWmsArmazenamento);
begin
  AWmsArmazenamento.ValidarInsercao;
  AWmsArmazenamento.Id := InserirBase(AWmsArmazenamento, 'WMS_ARMAZENAMENTO');
  
end;

class function TWmsArmazenamentoService.Alterar(AWmsArmazenamento: TWmsArmazenamento): Integer;
begin
  AWmsArmazenamento.ValidarAlteracao;
  Result := AlterarBase(AWmsArmazenamento, 'WMS_ARMAZENAMENTO');
  
  
end;


class function TWmsArmazenamentoService.Excluir(AWmsArmazenamento: TWmsArmazenamento): Integer;
begin
  AWmsArmazenamento.ValidarExclusao;
  
  Result := ExcluirBase(AWmsArmazenamento.Id, 'WMS_ARMAZENAMENTO');
end;


end.
