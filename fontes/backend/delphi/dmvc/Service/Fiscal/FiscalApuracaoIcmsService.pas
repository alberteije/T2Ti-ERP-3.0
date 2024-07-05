{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FISCAL_APURACAO_ICMS] 
                                                                                
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
unit FiscalApuracaoIcmsService;

interface

uses
  FiscalApuracaoIcms, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFiscalApuracaoIcmsService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TFiscalApuracaoIcms>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalApuracaoIcms>;
    class function ConsultarObjeto(AId: Integer): TFiscalApuracaoIcms;
    class procedure Inserir(AFiscalApuracaoIcms: TFiscalApuracaoIcms);
    class function Alterar(AFiscalApuracaoIcms: TFiscalApuracaoIcms): Integer;
    class function Excluir(AFiscalApuracaoIcms: TFiscalApuracaoIcms): Integer;
  end;

var
  sql: string;


implementation

{ TFiscalApuracaoIcmsService }



class function TFiscalApuracaoIcmsService.ConsultarLista: TObjectList<TFiscalApuracaoIcms>;
begin
  sql := 'SELECT * FROM FISCAL_APURACAO_ICMS ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFiscalApuracaoIcms>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalApuracaoIcmsService.ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalApuracaoIcms>;
begin
  sql := 'SELECT * FROM FISCAL_APURACAO_ICMS where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFiscalApuracaoIcms>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalApuracaoIcmsService.ConsultarObjeto(AId: Integer): TFiscalApuracaoIcms;
begin
  sql := 'SELECT * FROM FISCAL_APURACAO_ICMS WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFiscalApuracaoIcms>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFiscalApuracaoIcmsService.Inserir(AFiscalApuracaoIcms: TFiscalApuracaoIcms);
begin
  AFiscalApuracaoIcms.ValidarInsercao;
  AFiscalApuracaoIcms.Id := InserirBase(AFiscalApuracaoIcms, 'FISCAL_APURACAO_ICMS');
  
end;

class function TFiscalApuracaoIcmsService.Alterar(AFiscalApuracaoIcms: TFiscalApuracaoIcms): Integer;
begin
  AFiscalApuracaoIcms.ValidarAlteracao;
  Result := AlterarBase(AFiscalApuracaoIcms, 'FISCAL_APURACAO_ICMS');
  
  
end;


class function TFiscalApuracaoIcmsService.Excluir(AFiscalApuracaoIcms: TFiscalApuracaoIcms): Integer;
begin
  AFiscalApuracaoIcms.ValidarExclusao;
  
  Result := ExcluirBase(AFiscalApuracaoIcms.Id, 'FISCAL_APURACAO_ICMS');
end;


end.
