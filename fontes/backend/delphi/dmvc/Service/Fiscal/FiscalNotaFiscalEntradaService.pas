{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FISCAL_NOTA_FISCAL_ENTRADA] 
                                                                                
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
unit FiscalNotaFiscalEntradaService;

interface

uses
  FiscalNotaFiscalEntrada, NfeCabecalho, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFiscalNotaFiscalEntradaService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFiscalNotaFiscalEntrada: TObjectList<TFiscalNotaFiscalEntrada>); overload;
    class procedure AnexarObjetosVinculados(AFiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada); overload;
    class procedure AtualizarObjetosFilhos(AFiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada);
    class procedure ExcluirObjetosFilhos(AFiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada);
  public
    class function ConsultarLista: TObjectList<TFiscalNotaFiscalEntrada>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalNotaFiscalEntrada>;
    class function ConsultarObjeto(AId: Integer): TFiscalNotaFiscalEntrada;
    class procedure Inserir(AFiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada);
    class function Alterar(AFiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada): Integer;
    class function Excluir(AFiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada): Integer;
  end;

var
  sql: string;


implementation

{ TFiscalNotaFiscalEntradaService }

class procedure TFiscalNotaFiscalEntradaService.AnexarObjetosVinculados(AFiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada);
begin
  // NfeCabecalho
  sql := 'SELECT * FROM NFE_CABECALHO WHERE ID = ' + AFiscalNotaFiscalEntrada.IdNfeCabecalho.ToString;
  AFiscalNotaFiscalEntrada.NfeCabecalho := GetQuery(sql).AsObject<TNfeCabecalho>;

end;

class procedure TFiscalNotaFiscalEntradaService.AtualizarObjetosFilhos(
  AFiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada);
begin
//
end;

class procedure TFiscalNotaFiscalEntradaService.AnexarObjetosVinculados(AListaFiscalNotaFiscalEntrada: TObjectList<TFiscalNotaFiscalEntrada>);
var
  FiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada;
begin
  for FiscalNotaFiscalEntrada in AListaFiscalNotaFiscalEntrada do
  begin
    AnexarObjetosVinculados(FiscalNotaFiscalEntrada);
  end;
end;

class function TFiscalNotaFiscalEntradaService.ConsultarLista: TObjectList<TFiscalNotaFiscalEntrada>;
begin
  sql := 'SELECT * FROM FISCAL_NOTA_FISCAL_ENTRADA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFiscalNotaFiscalEntrada>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalNotaFiscalEntradaService.ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalNotaFiscalEntrada>;
begin
  sql := 'SELECT * FROM FISCAL_NOTA_FISCAL_ENTRADA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFiscalNotaFiscalEntrada>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalNotaFiscalEntradaService.ConsultarObjeto(AId: Integer): TFiscalNotaFiscalEntrada;
begin
  sql := 'SELECT * FROM FISCAL_NOTA_FISCAL_ENTRADA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFiscalNotaFiscalEntrada>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFiscalNotaFiscalEntradaService.Inserir(AFiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada);
begin
  AFiscalNotaFiscalEntrada.ValidarInsercao;
  AFiscalNotaFiscalEntrada.Id := InserirBase(AFiscalNotaFiscalEntrada, 'FISCAL_NOTA_FISCAL_ENTRADA');
  
end;

class function TFiscalNotaFiscalEntradaService.Alterar(AFiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada): Integer;
begin
  AFiscalNotaFiscalEntrada.ValidarAlteracao;
  Result := AlterarBase(AFiscalNotaFiscalEntrada, 'FISCAL_NOTA_FISCAL_ENTRADA');
  ExcluirObjetosFilhos(AFiscalNotaFiscalEntrada);
  
end;


class function TFiscalNotaFiscalEntradaService.Excluir(AFiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada): Integer;
begin
  AFiscalNotaFiscalEntrada.ValidarExclusao;
  ExcluirObjetosFilhos(AFiscalNotaFiscalEntrada);
  Result := ExcluirBase(AFiscalNotaFiscalEntrada.Id, 'FISCAL_NOTA_FISCAL_ENTRADA');
end;

class procedure TFiscalNotaFiscalEntradaService.ExcluirObjetosFilhos(AFiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada);
begin
end;

end.
