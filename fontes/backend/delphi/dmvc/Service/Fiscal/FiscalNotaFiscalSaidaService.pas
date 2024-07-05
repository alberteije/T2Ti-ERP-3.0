{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FISCAL_NOTA_FISCAL_SAIDA] 
                                                                                
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
unit FiscalNotaFiscalSaidaService;

interface

uses
  FiscalNotaFiscalSaida, NfeCabecalho, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFiscalNotaFiscalSaidaService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFiscalNotaFiscalSaida: TObjectList<TFiscalNotaFiscalSaida>); overload;
    class procedure AnexarObjetosVinculados(AFiscalNotaFiscalSaida: TFiscalNotaFiscalSaida); overload;
    class procedure AtualizarObjetosFilhos(AFiscalNotaFiscalSaida: TFiscalNotaFiscalSaida);
    class procedure ExcluirObjetosFilhos(AFiscalNotaFiscalSaida: TFiscalNotaFiscalSaida);
  public
    class function ConsultarLista: TObjectList<TFiscalNotaFiscalSaida>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalNotaFiscalSaida>;
    class function ConsultarObjeto(AId: Integer): TFiscalNotaFiscalSaida;
    class procedure Inserir(AFiscalNotaFiscalSaida: TFiscalNotaFiscalSaida);
    class function Alterar(AFiscalNotaFiscalSaida: TFiscalNotaFiscalSaida): Integer;
    class function Excluir(AFiscalNotaFiscalSaida: TFiscalNotaFiscalSaida): Integer;
  end;

var
  sql: string;


implementation

{ TFiscalNotaFiscalSaidaService }

class procedure TFiscalNotaFiscalSaidaService.AnexarObjetosVinculados(AFiscalNotaFiscalSaida: TFiscalNotaFiscalSaida);
begin
  // NfeCabecalho
  sql := 'SELECT * FROM NFE_CABECALHO WHERE ID = ' + AFiscalNotaFiscalSaida.IdNfeCabecalho.ToString;
  AFiscalNotaFiscalSaida.NfeCabecalho := GetQuery(sql).AsObject<TNfeCabecalho>;

end;

class procedure TFiscalNotaFiscalSaidaService.AtualizarObjetosFilhos(
  AFiscalNotaFiscalSaida: TFiscalNotaFiscalSaida);
begin
//
end;

class procedure TFiscalNotaFiscalSaidaService.AnexarObjetosVinculados(AListaFiscalNotaFiscalSaida: TObjectList<TFiscalNotaFiscalSaida>);
var
  FiscalNotaFiscalSaida: TFiscalNotaFiscalSaida;
begin
  for FiscalNotaFiscalSaida in AListaFiscalNotaFiscalSaida do
  begin
    AnexarObjetosVinculados(FiscalNotaFiscalSaida);
  end;
end;

class function TFiscalNotaFiscalSaidaService.ConsultarLista: TObjectList<TFiscalNotaFiscalSaida>;
begin
  sql := 'SELECT * FROM FISCAL_NOTA_FISCAL_SAIDA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFiscalNotaFiscalSaida>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalNotaFiscalSaidaService.ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalNotaFiscalSaida>;
begin
  sql := 'SELECT * FROM FISCAL_NOTA_FISCAL_SAIDA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFiscalNotaFiscalSaida>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalNotaFiscalSaidaService.ConsultarObjeto(AId: Integer): TFiscalNotaFiscalSaida;
begin
  sql := 'SELECT * FROM FISCAL_NOTA_FISCAL_SAIDA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFiscalNotaFiscalSaida>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFiscalNotaFiscalSaidaService.Inserir(AFiscalNotaFiscalSaida: TFiscalNotaFiscalSaida);
begin
  AFiscalNotaFiscalSaida.ValidarInsercao;
  AFiscalNotaFiscalSaida.Id := InserirBase(AFiscalNotaFiscalSaida, 'FISCAL_NOTA_FISCAL_SAIDA');
  
end;

class function TFiscalNotaFiscalSaidaService.Alterar(AFiscalNotaFiscalSaida: TFiscalNotaFiscalSaida): Integer;
begin
  AFiscalNotaFiscalSaida.ValidarAlteracao;
  Result := AlterarBase(AFiscalNotaFiscalSaida, 'FISCAL_NOTA_FISCAL_SAIDA');
  ExcluirObjetosFilhos(AFiscalNotaFiscalSaida);
  
end;


class function TFiscalNotaFiscalSaidaService.Excluir(AFiscalNotaFiscalSaida: TFiscalNotaFiscalSaida): Integer;
begin
  AFiscalNotaFiscalSaida.ValidarExclusao;
  ExcluirObjetosFilhos(AFiscalNotaFiscalSaida);
  Result := ExcluirBase(AFiscalNotaFiscalSaida.Id, 'FISCAL_NOTA_FISCAL_SAIDA');
end;

class procedure TFiscalNotaFiscalSaidaService.ExcluirObjetosFilhos(AFiscalNotaFiscalSaida: TFiscalNotaFiscalSaida);
begin
end;

end.
