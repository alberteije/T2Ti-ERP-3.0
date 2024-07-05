{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FISCAL_TERMO] 
                                                                                
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
unit FiscalTermoService;

interface

uses
  FiscalTermo, FiscalLivro, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFiscalTermoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFiscalTermo: TObjectList<TFiscalTermo>); overload;
    class procedure AnexarObjetosVinculados(AFiscalTermo: TFiscalTermo); overload;
    class procedure AtualizarObjetosFilhos(AFiscalTermo: TFiscalTermo);
    class procedure ExcluirObjetosFilhos(AFiscalTermo: TFiscalTermo);
  public
    class function ConsultarLista: TObjectList<TFiscalTermo>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalTermo>;
    class function ConsultarObjeto(AId: Integer): TFiscalTermo;
    class procedure Inserir(AFiscalTermo: TFiscalTermo);
    class function Alterar(AFiscalTermo: TFiscalTermo): Integer;
    class function Excluir(AFiscalTermo: TFiscalTermo): Integer;
  end;

var
  sql: string;


implementation

{ TFiscalTermoService }

class procedure TFiscalTermoService.AnexarObjetosVinculados(AFiscalTermo: TFiscalTermo);
begin
  // FiscalLivro
  sql := 'SELECT * FROM FISCAL_LIVRO WHERE ID = ' + AFiscalTermo.IdFiscalLivro.ToString;
  AFiscalTermo.FiscalLivro := GetQuery(sql).AsObject<TFiscalLivro>;

end;

class procedure TFiscalTermoService.AtualizarObjetosFilhos(
  AFiscalTermo: TFiscalTermo);
begin
//
end;

class procedure TFiscalTermoService.AnexarObjetosVinculados(AListaFiscalTermo: TObjectList<TFiscalTermo>);
var
  FiscalTermo: TFiscalTermo;
begin
  for FiscalTermo in AListaFiscalTermo do
  begin
    AnexarObjetosVinculados(FiscalTermo);
  end;
end;

class function TFiscalTermoService.ConsultarLista: TObjectList<TFiscalTermo>;
begin
  sql := 'SELECT * FROM FISCAL_TERMO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFiscalTermo>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalTermoService.ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalTermo>;
begin
  sql := 'SELECT * FROM FISCAL_TERMO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFiscalTermo>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalTermoService.ConsultarObjeto(AId: Integer): TFiscalTermo;
begin
  sql := 'SELECT * FROM FISCAL_TERMO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFiscalTermo>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFiscalTermoService.Inserir(AFiscalTermo: TFiscalTermo);
begin
  AFiscalTermo.ValidarInsercao;
  AFiscalTermo.Id := InserirBase(AFiscalTermo, 'FISCAL_TERMO');
  
end;

class function TFiscalTermoService.Alterar(AFiscalTermo: TFiscalTermo): Integer;
begin
  AFiscalTermo.ValidarAlteracao;
  Result := AlterarBase(AFiscalTermo, 'FISCAL_TERMO');
  ExcluirObjetosFilhos(AFiscalTermo);
  
end;


class function TFiscalTermoService.Excluir(AFiscalTermo: TFiscalTermo): Integer;
begin
  AFiscalTermo.ValidarExclusao;
  ExcluirObjetosFilhos(AFiscalTermo);
  Result := ExcluirBase(AFiscalTermo.Id, 'FISCAL_TERMO');
end;

class procedure TFiscalTermoService.ExcluirObjetosFilhos(AFiscalTermo: TFiscalTermo);
begin
end;

end.
