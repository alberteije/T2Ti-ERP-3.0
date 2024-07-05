{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [FIN_PARCELA_PAGAR] 
                                                                                
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
unit FinParcelaPagarService;

interface

uses
  FinParcelaPagar, FinStatusParcela, FinTipoPagamento, FinChequeEmitido, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFinParcelaPagarService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFinParcelaPagar: TObjectList<TFinParcelaPagar>); overload;
    class procedure AnexarObjetosVinculados(AFinParcelaPagar: TFinParcelaPagar); overload;
  public
    class function ConsultarLista: TObjectList<TFinParcelaPagar>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFinParcelaPagar>;
    class function ConsultarObjeto(AId: Integer): TFinParcelaPagar;
    class procedure Inserir(AFinParcelaPagar: TFinParcelaPagar);
    class function Alterar(AFinParcelaPagar: TFinParcelaPagar): Integer;
    class function Excluir(AFinParcelaPagar: TFinParcelaPagar): Integer;
  end;

var
  sql: string;


implementation

{ TFinParcelaPagarService }

class procedure TFinParcelaPagarService.AnexarObjetosVinculados(AFinParcelaPagar: TFinParcelaPagar);
begin
  // FinStatusParcela
  sql := 'SELECT * FROM FIN_STATUS_PARCELA WHERE ID = ' + AFinParcelaPagar.IdFinStatusParcela.ToString;
  AFinParcelaPagar.FinStatusParcela := GetQuery(sql).AsObject<TFinStatusParcela>;

  // FinTipoPagamento
  sql := 'SELECT * FROM FIN_TIPO_PAGAMENTO WHERE ID = ' + AFinParcelaPagar.IdFinTipoPagamento.ToString;
  AFinParcelaPagar.FinTipoPagamento := GetQuery(sql).AsObject<TFinTipoPagamento>;

  // FinChequeEmitido
  sql := 'SELECT * FROM FIN_CHEQUE_EMITIDO WHERE ID = ' + AFinParcelaPagar.IdFinChequeEmitido.ToString;
  AFinParcelaPagar.FinChequeEmitido := GetQuery(sql).AsObject<TFinChequeEmitido>;

end;

class procedure TFinParcelaPagarService.AnexarObjetosVinculados(AListaFinParcelaPagar: TObjectList<TFinParcelaPagar>);
var
  FinParcelaPagar: TFinParcelaPagar;
begin
  for FinParcelaPagar in AListaFinParcelaPagar do
  begin
    AnexarObjetosVinculados(FinParcelaPagar);
  end;
end;

class function TFinParcelaPagarService.ConsultarLista: TObjectList<TFinParcelaPagar>;
begin
  sql := 'SELECT * FROM FIN_PARCELA_PAGAR ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFinParcelaPagar>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFinParcelaPagarService.ConsultarListaFiltro(AWhere: string): TObjectList<TFinParcelaPagar>;
begin
  sql := 'SELECT * FROM FIN_PARCELA_PAGAR where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFinParcelaPagar>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFinParcelaPagarService.ConsultarObjeto(AId: Integer): TFinParcelaPagar;
begin
  sql := 'SELECT * FROM FIN_PARCELA_PAGAR WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFinParcelaPagar>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFinParcelaPagarService.Inserir(AFinParcelaPagar: TFinParcelaPagar);
begin
  AFinParcelaPagar.ValidarInsercao;
  AFinParcelaPagar.Id := InserirBase(AFinParcelaPagar, 'FIN_PARCELA_PAGAR');

end;

class function TFinParcelaPagarService.Alterar(AFinParcelaPagar: TFinParcelaPagar): Integer;
begin
  AFinParcelaPagar.ValidarAlteracao;

  // 16-10-2020 - EIJE - inserir o cheque emitido, caso tenha sido selecionado pelo usuário
  if AFinParcelaPagar.FinChequeEmitido.IdCheque > 0 then
  begin
    AFinParcelaPagar.IdFinChequeEmitido := InserirBase(AFinParcelaPagar.FinChequeEmitido, 'FIN_CHEQUE_EMITIDO');
  end;

  Result := AlterarBase(AFinParcelaPagar, 'FIN_PARCELA_PAGAR');


end;


class function TFinParcelaPagarService.Excluir(AFinParcelaPagar: TFinParcelaPagar): Integer;
begin
  AFinParcelaPagar.ValidarExclusao;
  
  Result := ExcluirBase(AFinParcelaPagar.Id, 'FIN_PARCELA_PAGAR');
end;


end.
