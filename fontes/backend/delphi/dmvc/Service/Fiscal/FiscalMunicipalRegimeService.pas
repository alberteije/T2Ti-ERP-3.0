{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FISCAL_MUNICIPAL_REGIME] 
                                                                                
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
unit FiscalMunicipalRegimeService;

interface

uses
  FiscalMunicipalRegime, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFiscalMunicipalRegimeService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TFiscalMunicipalRegime>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalMunicipalRegime>;
    class function ConsultarObjeto(AId: Integer): TFiscalMunicipalRegime;
    class procedure Inserir(AFiscalMunicipalRegime: TFiscalMunicipalRegime);
    class function Alterar(AFiscalMunicipalRegime: TFiscalMunicipalRegime): Integer;
    class function Excluir(AFiscalMunicipalRegime: TFiscalMunicipalRegime): Integer;
  end;

var
  sql: string;


implementation

{ TFiscalMunicipalRegimeService }



class function TFiscalMunicipalRegimeService.ConsultarLista: TObjectList<TFiscalMunicipalRegime>;
begin
  sql := 'SELECT * FROM FISCAL_MUNICIPAL_REGIME ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFiscalMunicipalRegime>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalMunicipalRegimeService.ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalMunicipalRegime>;
begin
  sql := 'SELECT * FROM FISCAL_MUNICIPAL_REGIME where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFiscalMunicipalRegime>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalMunicipalRegimeService.ConsultarObjeto(AId: Integer): TFiscalMunicipalRegime;
begin
  sql := 'SELECT * FROM FISCAL_MUNICIPAL_REGIME WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFiscalMunicipalRegime>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFiscalMunicipalRegimeService.Inserir(AFiscalMunicipalRegime: TFiscalMunicipalRegime);
begin
  AFiscalMunicipalRegime.ValidarInsercao;
  AFiscalMunicipalRegime.Id := InserirBase(AFiscalMunicipalRegime, 'FISCAL_MUNICIPAL_REGIME');
  
end;

class function TFiscalMunicipalRegimeService.Alterar(AFiscalMunicipalRegime: TFiscalMunicipalRegime): Integer;
begin
  AFiscalMunicipalRegime.ValidarAlteracao;
  Result := AlterarBase(AFiscalMunicipalRegime, 'FISCAL_MUNICIPAL_REGIME');
  
  
end;


class function TFiscalMunicipalRegimeService.Excluir(AFiscalMunicipalRegime: TFiscalMunicipalRegime): Integer;
begin
  AFiscalMunicipalRegime.ValidarExclusao;
  
  Result := ExcluirBase(AFiscalMunicipalRegime.Id, 'FISCAL_MUNICIPAL_REGIME');
end;


end.
