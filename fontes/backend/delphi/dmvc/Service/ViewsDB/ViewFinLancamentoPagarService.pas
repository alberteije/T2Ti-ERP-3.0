{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VIEW_FIN_LANCAMENTO_PAGAR] 
                                                                                
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
unit ViewFinLancamentoPagarService;

interface

uses
  ViewFinLancamentoPagar, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TViewFinLancamentoPagarService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaViewFinLancamentoPagar: TObjectList<TViewFinLancamentoPagar>); overload;
    class procedure AnexarObjetosVinculados(AViewFinLancamentoPagar: TViewFinLancamentoPagar); overload;
  public
    class function ConsultarLista: TObjectList<TViewFinLancamentoPagar>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TViewFinLancamentoPagar>;
    class function ConsultarObjeto(AId: Integer): TViewFinLancamentoPagar;
    class procedure Inserir(AViewFinLancamentoPagar: TViewFinLancamentoPagar);
    class function Alterar(AViewFinLancamentoPagar: TViewFinLancamentoPagar): Integer;
    class function Excluir(AViewFinLancamentoPagar: TViewFinLancamentoPagar): Integer;
  end;

var
  sql: string;


implementation

{ TViewFinLancamentoPagarService }

class procedure TViewFinLancamentoPagarService.AnexarObjetosVinculados(AViewFinLancamentoPagar: TViewFinLancamentoPagar);
begin
end;

class procedure TViewFinLancamentoPagarService.AnexarObjetosVinculados(AListaViewFinLancamentoPagar: TObjectList<TViewFinLancamentoPagar>);
var
  ViewFinLancamentoPagar: TViewFinLancamentoPagar;
begin
  for ViewFinLancamentoPagar in AListaViewFinLancamentoPagar do
  begin
    AnexarObjetosVinculados(ViewFinLancamentoPagar);
  end;
end;

class function TViewFinLancamentoPagarService.ConsultarLista: TObjectList<TViewFinLancamentoPagar>;
begin
  sql := 'SELECT * FROM VIEW_FIN_LANCAMENTO_PAGAR ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TViewFinLancamentoPagar>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewFinLancamentoPagarService.ConsultarListaFiltro(AWhere: string): TObjectList<TViewFinLancamentoPagar>;
begin
  sql := 'SELECT * FROM VIEW_FIN_LANCAMENTO_PAGAR where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TViewFinLancamentoPagar>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewFinLancamentoPagarService.ConsultarObjeto(AId: Integer): TViewFinLancamentoPagar;
begin
  sql := 'SELECT * FROM VIEW_FIN_LANCAMENTO_PAGAR WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TViewFinLancamentoPagar>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TViewFinLancamentoPagarService.Inserir(AViewFinLancamentoPagar: TViewFinLancamentoPagar);
begin
  AViewFinLancamentoPagar.ValidarInsercao;
  AViewFinLancamentoPagar.Id := InserirBase(AViewFinLancamentoPagar, 'VIEW_FIN_LANCAMENTO_PAGAR');
  
end;

class function TViewFinLancamentoPagarService.Alterar(AViewFinLancamentoPagar: TViewFinLancamentoPagar): Integer;
begin
  AViewFinLancamentoPagar.ValidarAlteracao;
  Result := AlterarBase(AViewFinLancamentoPagar, 'VIEW_FIN_LANCAMENTO_PAGAR');
  
  
end;


class function TViewFinLancamentoPagarService.Excluir(AViewFinLancamentoPagar: TViewFinLancamentoPagar): Integer;
begin
  AViewFinLancamentoPagar.ValidarExclusao;
  
  Result := ExcluirBase(AViewFinLancamentoPagar.Id, 'VIEW_FIN_LANCAMENTO_PAGAR');
end;


end.
