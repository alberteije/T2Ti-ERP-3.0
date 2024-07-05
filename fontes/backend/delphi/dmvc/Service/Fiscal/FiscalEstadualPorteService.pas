{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FISCAL_ESTADUAL_PORTE] 
                                                                                
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
unit FiscalEstadualPorteService;

interface

uses
  FiscalEstadualPorte, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFiscalEstadualPorteService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TFiscalEstadualPorte>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalEstadualPorte>;
    class function ConsultarObjeto(AId: Integer): TFiscalEstadualPorte;
    class procedure Inserir(AFiscalEstadualPorte: TFiscalEstadualPorte);
    class function Alterar(AFiscalEstadualPorte: TFiscalEstadualPorte): Integer;
    class function Excluir(AFiscalEstadualPorte: TFiscalEstadualPorte): Integer;
  end;

var
  sql: string;


implementation

{ TFiscalEstadualPorteService }



class function TFiscalEstadualPorteService.ConsultarLista: TObjectList<TFiscalEstadualPorte>;
begin
  sql := 'SELECT * FROM FISCAL_ESTADUAL_PORTE ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFiscalEstadualPorte>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalEstadualPorteService.ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalEstadualPorte>;
begin
  sql := 'SELECT * FROM FISCAL_ESTADUAL_PORTE where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFiscalEstadualPorte>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalEstadualPorteService.ConsultarObjeto(AId: Integer): TFiscalEstadualPorte;
begin
  sql := 'SELECT * FROM FISCAL_ESTADUAL_PORTE WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFiscalEstadualPorte>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFiscalEstadualPorteService.Inserir(AFiscalEstadualPorte: TFiscalEstadualPorte);
begin
  AFiscalEstadualPorte.ValidarInsercao;
  AFiscalEstadualPorte.Id := InserirBase(AFiscalEstadualPorte, 'FISCAL_ESTADUAL_PORTE');
  
end;

class function TFiscalEstadualPorteService.Alterar(AFiscalEstadualPorte: TFiscalEstadualPorte): Integer;
begin
  AFiscalEstadualPorte.ValidarAlteracao;
  Result := AlterarBase(AFiscalEstadualPorte, 'FISCAL_ESTADUAL_PORTE');
  
  
end;


class function TFiscalEstadualPorteService.Excluir(AFiscalEstadualPorte: TFiscalEstadualPorte): Integer;
begin
  AFiscalEstadualPorte.ValidarExclusao;
  
  Result := ExcluirBase(AFiscalEstadualPorte.Id, 'FISCAL_ESTADUAL_PORTE');
end;


end.
