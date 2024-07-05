{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FISCAL_INSCRICOES_SUBSTITUTAS] 
                                                                                
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
unit FiscalInscricoesSubstitutasService;

interface

uses
  FiscalInscricoesSubstitutas, FiscalParametro,
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFiscalInscricoesSubstitutasService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFiscalInscricoesSubstitutas: TObjectList<TFiscalInscricoesSubstitutas>); overload;
    class procedure AnexarObjetosVinculados(AFiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas); overload;
    class procedure AtualizarObjetosFilhos(AFiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas);
    class procedure ExcluirObjetosFilhos(AFiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas);
  public
    class function ConsultarLista: TObjectList<TFiscalInscricoesSubstitutas>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalInscricoesSubstitutas>;
    class function ConsultarObjeto(AId: Integer): TFiscalInscricoesSubstitutas;
    class procedure Inserir(AFiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas);
    class function Alterar(AFiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas): Integer;
    class function Excluir(AFiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas): Integer;
  end;

var
  sql: string;


implementation

{ TFiscalInscricoesSubstitutasService }

class procedure TFiscalInscricoesSubstitutasService.AnexarObjetosVinculados(AFiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas);
begin
  // FiscalParametros
  sql := 'SELECT * FROM FISCAL_PARAMETROS WHERE ID = ' + AFiscalInscricoesSubstitutas.IdFiscalParametros.ToString;
  AFiscalInscricoesSubstitutas.FiscalParametros := GetQuery(sql).AsObject<TFiscalParametro>;

end;

class procedure TFiscalInscricoesSubstitutasService.AtualizarObjetosFilhos(
  AFiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas);
begin
//
end;

class procedure TFiscalInscricoesSubstitutasService.AnexarObjetosVinculados(AListaFiscalInscricoesSubstitutas: TObjectList<TFiscalInscricoesSubstitutas>);
var
  FiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas;
begin
  for FiscalInscricoesSubstitutas in AListaFiscalInscricoesSubstitutas do
  begin
    AnexarObjetosVinculados(FiscalInscricoesSubstitutas);
  end;
end;

class function TFiscalInscricoesSubstitutasService.ConsultarLista: TObjectList<TFiscalInscricoesSubstitutas>;
begin
  sql := 'SELECT * FROM FISCAL_INSCRICOES_SUBSTITUTAS ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFiscalInscricoesSubstitutas>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalInscricoesSubstitutasService.ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalInscricoesSubstitutas>;
begin
  sql := 'SELECT * FROM FISCAL_INSCRICOES_SUBSTITUTAS where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFiscalInscricoesSubstitutas>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalInscricoesSubstitutasService.ConsultarObjeto(AId: Integer): TFiscalInscricoesSubstitutas;
begin
  sql := 'SELECT * FROM FISCAL_INSCRICOES_SUBSTITUTAS WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFiscalInscricoesSubstitutas>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFiscalInscricoesSubstitutasService.Inserir(AFiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas);
begin
  AFiscalInscricoesSubstitutas.ValidarInsercao;
  AFiscalInscricoesSubstitutas.Id := InserirBase(AFiscalInscricoesSubstitutas, 'FISCAL_INSCRICOES_SUBSTITUTAS');
  
end;

class function TFiscalInscricoesSubstitutasService.Alterar(AFiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas): Integer;
begin
  AFiscalInscricoesSubstitutas.ValidarAlteracao;
  Result := AlterarBase(AFiscalInscricoesSubstitutas, 'FISCAL_INSCRICOES_SUBSTITUTAS');
  ExcluirObjetosFilhos(AFiscalInscricoesSubstitutas);
  
end;


class function TFiscalInscricoesSubstitutasService.Excluir(AFiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas): Integer;
begin
  AFiscalInscricoesSubstitutas.ValidarExclusao;
  ExcluirObjetosFilhos(AFiscalInscricoesSubstitutas);
  Result := ExcluirBase(AFiscalInscricoesSubstitutas.Id, 'FISCAL_INSCRICOES_SUBSTITUTAS');
end;

class procedure TFiscalInscricoesSubstitutasService.ExcluirObjetosFilhos(AFiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas);
begin
end;

end.
