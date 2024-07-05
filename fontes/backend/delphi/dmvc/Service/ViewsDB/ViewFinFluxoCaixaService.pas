{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VIEW_FIN_FLUXO_CAIXA] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
unit ViewFinFluxoCaixaService;

interface

uses
  ViewFinFluxoCaixa, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TViewFinFluxoCaixaService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaViewFinFluxoCaixa: TObjectList<TViewFinFluxoCaixa>); overload;
    class procedure AnexarObjetosVinculados(AViewFinFluxoCaixa: TViewFinFluxoCaixa); overload;
  public
    class function ConsultarLista: TObjectList<TViewFinFluxoCaixa>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TViewFinFluxoCaixa>;
    class function ConsultarObjeto(AId: Integer): TViewFinFluxoCaixa;
    class procedure Inserir(AViewFinFluxoCaixa: TViewFinFluxoCaixa);
    class function Alterar(AViewFinFluxoCaixa: TViewFinFluxoCaixa): Integer;
    class function Excluir(AViewFinFluxoCaixa: TViewFinFluxoCaixa): Integer;
  end;

var
  sql: string;


implementation

{ TViewFinFluxoCaixaService }

class procedure TViewFinFluxoCaixaService.AnexarObjetosVinculados(AViewFinFluxoCaixa: TViewFinFluxoCaixa);
begin
end;

class procedure TViewFinFluxoCaixaService.AnexarObjetosVinculados(AListaViewFinFluxoCaixa: TObjectList<TViewFinFluxoCaixa>);
var
  ViewFinFluxoCaixa: TViewFinFluxoCaixa;
begin
  for ViewFinFluxoCaixa in AListaViewFinFluxoCaixa do
  begin
    AnexarObjetosVinculados(ViewFinFluxoCaixa);
  end;
end;

class function TViewFinFluxoCaixaService.ConsultarLista: TObjectList<TViewFinFluxoCaixa>;
begin
  sql := 'SELECT * FROM VIEW_FIN_FLUXO_CAIXA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TViewFinFluxoCaixa>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewFinFluxoCaixaService.ConsultarListaFiltro(AWhere: string): TObjectList<TViewFinFluxoCaixa>;
begin
  sql := 'SELECT * FROM VIEW_FIN_FLUXO_CAIXA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TViewFinFluxoCaixa>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewFinFluxoCaixaService.ConsultarObjeto(AId: Integer): TViewFinFluxoCaixa;
begin
  sql := 'SELECT * FROM VIEW_FIN_FLUXO_CAIXA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TViewFinFluxoCaixa>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TViewFinFluxoCaixaService.Inserir(AViewFinFluxoCaixa: TViewFinFluxoCaixa);
begin
  AViewFinFluxoCaixa.ValidarInsercao;
  AViewFinFluxoCaixa.Id := InserirBase(AViewFinFluxoCaixa, 'VIEW_FIN_FLUXO_CAIXA');
  
end;

class function TViewFinFluxoCaixaService.Alterar(AViewFinFluxoCaixa: TViewFinFluxoCaixa): Integer;
begin
  AViewFinFluxoCaixa.ValidarAlteracao;
  Result := AlterarBase(AViewFinFluxoCaixa, 'VIEW_FIN_FLUXO_CAIXA');
  
  
end;


class function TViewFinFluxoCaixaService.Excluir(AViewFinFluxoCaixa: TViewFinFluxoCaixa): Integer;
begin
  AViewFinFluxoCaixa.ValidarExclusao;
  
  Result := ExcluirBase(AViewFinFluxoCaixa.Id, 'VIEW_FIN_FLUXO_CAIXA');
end;


end.
