{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FISCAL_PARAMETRO] 
                                                                                
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
unit FiscalParametroService;

interface

uses
  FiscalParametro, FiscalEstadualPorte, FiscalEstadualRegime, FiscalMunicipalRegime, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFiscalParametroService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFiscalParametro: TObjectList<TFiscalParametro>); overload;
    class procedure AnexarObjetosVinculados(AFiscalParametro: TFiscalParametro); overload;
    class procedure AtualizarObjetosFilhos(AFiscalParametro: TFiscalParametro);
    class procedure ExcluirObjetosFilhos(AFiscalParametro: TFiscalParametro);
  public
    class function ConsultarLista: TObjectList<TFiscalParametro>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalParametro>;
    class function ConsultarObjeto(AId: Integer): TFiscalParametro;
    class procedure Inserir(AFiscalParametro: TFiscalParametro);
    class function Alterar(AFiscalParametro: TFiscalParametro): Integer;
    class function Excluir(AFiscalParametro: TFiscalParametro): Integer;
  end;

var
  sql: string;


implementation

{ TFiscalParametroService }

class procedure TFiscalParametroService.AnexarObjetosVinculados(AFiscalParametro: TFiscalParametro);
begin
  // FiscalEstadualPorte
  sql := 'SELECT * FROM FISCAL_ESTADUAL_PORTE WHERE ID = ' + AFiscalParametro.IdFiscalEstadualPorte.ToString;
  AFiscalParametro.FiscalEstadualPorte := GetQuery(sql).AsObject<TFiscalEstadualPorte>;

  // FiscalEstadualRegime
  sql := 'SELECT * FROM FISCAL_ESTADUAL_REGIME WHERE ID = ' + AFiscalParametro.IdFiscalEstadualRegime.ToString;
  AFiscalParametro.FiscalEstadualRegime := GetQuery(sql).AsObject<TFiscalEstadualRegime>;

  // FiscalMunicipalRegime
  sql := 'SELECT * FROM FISCAL_MUNICIPAL_REGIME WHERE ID = ' + AFiscalParametro.IdFiscalMunicipalRegime.ToString;
  AFiscalParametro.FiscalMunicipalRegime := GetQuery(sql).AsObject<TFiscalMunicipalRegime>;

end;

class procedure TFiscalParametroService.AtualizarObjetosFilhos(
  AFiscalParametro: TFiscalParametro);
begin
//
end;

class procedure TFiscalParametroService.AnexarObjetosVinculados(AListaFiscalParametro: TObjectList<TFiscalParametro>);
var
  FiscalParametro: TFiscalParametro;
begin
  for FiscalParametro in AListaFiscalParametro do
  begin
    AnexarObjetosVinculados(FiscalParametro);
  end;
end;

class function TFiscalParametroService.ConsultarLista: TObjectList<TFiscalParametro>;
begin
  sql := 'SELECT * FROM FISCAL_PARAMETRO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFiscalParametro>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalParametroService.ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalParametro>;
begin
  sql := 'SELECT * FROM FISCAL_PARAMETRO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFiscalParametro>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalParametroService.ConsultarObjeto(AId: Integer): TFiscalParametro;
begin
  sql := 'SELECT * FROM FISCAL_PARAMETRO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFiscalParametro>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFiscalParametroService.Inserir(AFiscalParametro: TFiscalParametro);
begin
  AFiscalParametro.ValidarInsercao;
  AFiscalParametro.Id := InserirBase(AFiscalParametro, 'FISCAL_PARAMETRO');
  
end;

class function TFiscalParametroService.Alterar(AFiscalParametro: TFiscalParametro): Integer;
begin
  AFiscalParametro.ValidarAlteracao;
  Result := AlterarBase(AFiscalParametro, 'FISCAL_PARAMETRO');
  ExcluirObjetosFilhos(AFiscalParametro);
  
end;


class function TFiscalParametroService.Excluir(AFiscalParametro: TFiscalParametro): Integer;
begin
  AFiscalParametro.ValidarExclusao;
  ExcluirObjetosFilhos(AFiscalParametro);
  Result := ExcluirBase(AFiscalParametro.Id, 'FISCAL_PARAMETRO');
end;

class procedure TFiscalParametroService.ExcluirObjetosFilhos(AFiscalParametro: TFiscalParametro);
begin
end;

end.
