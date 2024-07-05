{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [FIN_TIPO_PAGAMENTO] 
                                                                                
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
unit FinTipoPagamentoService;

interface

uses
  FinTipoPagamento, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFinTipoPagamentoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFinTipoPagamento: TObjectList<TFinTipoPagamento>); overload;
    class procedure AnexarObjetosVinculados(AFinTipoPagamento: TFinTipoPagamento); overload;
  public
    class function ConsultarLista: TObjectList<TFinTipoPagamento>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFinTipoPagamento>;
    class function ConsultarObjeto(AId: Integer): TFinTipoPagamento;
    class procedure Inserir(AFinTipoPagamento: TFinTipoPagamento);
    class function Alterar(AFinTipoPagamento: TFinTipoPagamento): Integer;
    class function Excluir(AFinTipoPagamento: TFinTipoPagamento): Integer;
  end;

var
  sql: string;


implementation

{ TFinTipoPagamentoService }

class procedure TFinTipoPagamentoService.AnexarObjetosVinculados(AFinTipoPagamento: TFinTipoPagamento);
begin
end;

class procedure TFinTipoPagamentoService.AnexarObjetosVinculados(AListaFinTipoPagamento: TObjectList<TFinTipoPagamento>);
var
  FinTipoPagamento: TFinTipoPagamento;
begin
  for FinTipoPagamento in AListaFinTipoPagamento do
  begin
    AnexarObjetosVinculados(FinTipoPagamento);
  end;
end;

class function TFinTipoPagamentoService.ConsultarLista: TObjectList<TFinTipoPagamento>;
begin
  sql := 'SELECT * FROM FIN_TIPO_PAGAMENTO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFinTipoPagamento>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFinTipoPagamentoService.ConsultarListaFiltro(AWhere: string): TObjectList<TFinTipoPagamento>;
begin
  sql := 'SELECT * FROM FIN_TIPO_PAGAMENTO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFinTipoPagamento>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFinTipoPagamentoService.ConsultarObjeto(AId: Integer): TFinTipoPagamento;
begin
  sql := 'SELECT * FROM FIN_TIPO_PAGAMENTO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFinTipoPagamento>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFinTipoPagamentoService.Inserir(AFinTipoPagamento: TFinTipoPagamento);
begin
  AFinTipoPagamento.ValidarInsercao;
  AFinTipoPagamento.Id := InserirBase(AFinTipoPagamento, 'FIN_TIPO_PAGAMENTO');
  
end;

class function TFinTipoPagamentoService.Alterar(AFinTipoPagamento: TFinTipoPagamento): Integer;
begin
  AFinTipoPagamento.ValidarAlteracao;
  Result := AlterarBase(AFinTipoPagamento, 'FIN_TIPO_PAGAMENTO');
  
  
end;


class function TFinTipoPagamentoService.Excluir(AFinTipoPagamento: TFinTipoPagamento): Integer;
begin
  AFinTipoPagamento.ValidarExclusao;
  
  Result := ExcluirBase(AFinTipoPagamento.Id, 'FIN_TIPO_PAGAMENTO');
end;


end.
