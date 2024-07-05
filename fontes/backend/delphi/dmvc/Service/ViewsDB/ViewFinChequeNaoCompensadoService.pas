{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VIEW_FIN_CHEQUE_NAO_COMPENSADO] 
                                                                                
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
unit ViewFinChequeNaoCompensadoService;

interface

uses
  ViewFinChequeNaoCompensado, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TViewFinChequeNaoCompensadoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaViewFinChequeNaoCompensado: TObjectList<TViewFinChequeNaoCompensado>); overload;
    class procedure AnexarObjetosVinculados(AViewFinChequeNaoCompensado: TViewFinChequeNaoCompensado); overload;
  public
    class function ConsultarLista: TObjectList<TViewFinChequeNaoCompensado>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TViewFinChequeNaoCompensado>;
    class function ConsultarObjeto(AId: Integer): TViewFinChequeNaoCompensado;
    class procedure Inserir(AViewFinChequeNaoCompensado: TViewFinChequeNaoCompensado);
    class function Alterar(AViewFinChequeNaoCompensado: TViewFinChequeNaoCompensado): Integer;
    class function Excluir(AViewFinChequeNaoCompensado: TViewFinChequeNaoCompensado): Integer;
  end;

var
  sql: string;


implementation

{ TViewFinChequeNaoCompensadoService }

class procedure TViewFinChequeNaoCompensadoService.AnexarObjetosVinculados(AViewFinChequeNaoCompensado: TViewFinChequeNaoCompensado);
begin
end;

class procedure TViewFinChequeNaoCompensadoService.AnexarObjetosVinculados(AListaViewFinChequeNaoCompensado: TObjectList<TViewFinChequeNaoCompensado>);
var
  ViewFinChequeNaoCompensado: TViewFinChequeNaoCompensado;
begin
  for ViewFinChequeNaoCompensado in AListaViewFinChequeNaoCompensado do
  begin
    AnexarObjetosVinculados(ViewFinChequeNaoCompensado);
  end;
end;

class function TViewFinChequeNaoCompensadoService.ConsultarLista: TObjectList<TViewFinChequeNaoCompensado>;
begin
  sql := 'SELECT * FROM VIEW_FIN_CHEQUE_NAO_COMPENSADO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TViewFinChequeNaoCompensado>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewFinChequeNaoCompensadoService.ConsultarListaFiltro(AWhere: string): TObjectList<TViewFinChequeNaoCompensado>;
begin
  sql := 'SELECT * FROM VIEW_FIN_CHEQUE_NAO_COMPENSADO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TViewFinChequeNaoCompensado>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewFinChequeNaoCompensadoService.ConsultarObjeto(AId: Integer): TViewFinChequeNaoCompensado;
begin
  sql := 'SELECT * FROM VIEW_FIN_CHEQUE_NAO_COMPENSADO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TViewFinChequeNaoCompensado>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TViewFinChequeNaoCompensadoService.Inserir(AViewFinChequeNaoCompensado: TViewFinChequeNaoCompensado);
begin
  AViewFinChequeNaoCompensado.ValidarInsercao;
  AViewFinChequeNaoCompensado.Id := InserirBase(AViewFinChequeNaoCompensado, 'VIEW_FIN_CHEQUE_NAO_COMPENSADO');
  
end;

class function TViewFinChequeNaoCompensadoService.Alterar(AViewFinChequeNaoCompensado: TViewFinChequeNaoCompensado): Integer;
begin
  AViewFinChequeNaoCompensado.ValidarAlteracao;
  Result := AlterarBase(AViewFinChequeNaoCompensado, 'VIEW_FIN_CHEQUE_NAO_COMPENSADO');
  
  
end;


class function TViewFinChequeNaoCompensadoService.Excluir(AViewFinChequeNaoCompensado: TViewFinChequeNaoCompensado): Integer;
begin
  AViewFinChequeNaoCompensado.ValidarExclusao;
  
  Result := ExcluirBase(AViewFinChequeNaoCompensado.Id, 'VIEW_FIN_CHEQUE_NAO_COMPENSADO');
end;


end.
