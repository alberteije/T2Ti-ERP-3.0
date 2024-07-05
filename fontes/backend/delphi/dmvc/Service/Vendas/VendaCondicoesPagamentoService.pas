{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VENDA_CONDICOES_PAGAMENTO] 
                                                                                
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
unit VendaCondicoesPagamentoService;

interface

uses
  VendaCondicoesPagamento, VendaCondicoesParcelas, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TVendaCondicoesPagamentoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaVendaCondicoesPagamento: TObjectList<TVendaCondicoesPagamento>); overload;
    class procedure AnexarObjetosVinculados(AVendaCondicoesPagamento: TVendaCondicoesPagamento); overload;
    class procedure InserirObjetosFilhos(AVendaCondicoesPagamento: TVendaCondicoesPagamento);
    class procedure ExcluirObjetosFilhos(AVendaCondicoesPagamento: TVendaCondicoesPagamento);
  public
    class function ConsultarLista: TObjectList<TVendaCondicoesPagamento>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TVendaCondicoesPagamento>;
    class function ConsultarObjeto(AId: Integer): TVendaCondicoesPagamento;
    class procedure Inserir(AVendaCondicoesPagamento: TVendaCondicoesPagamento);
    class function Alterar(AVendaCondicoesPagamento: TVendaCondicoesPagamento): Integer;
    class function Excluir(AVendaCondicoesPagamento: TVendaCondicoesPagamento): Integer;
  end;

var
  sql: string;


implementation

{ TVendaCondicoesPagamentoService }

class procedure TVendaCondicoesPagamentoService.AnexarObjetosVinculados(AVendaCondicoesPagamento: TVendaCondicoesPagamento);
begin
  // VendaCondicoesParcelas
  sql := 'SELECT * FROM VENDA_CONDICOES_PARCELAS WHERE ID_VENDA_CONDICOES_PAGAMENTO = ' + AVendaCondicoesPagamento.Id.ToString;
  AVendaCondicoesPagamento.ListaVendaCondicoesParcelas := GetQuery(sql).AsObjectList<TVendaCondicoesParcelas>;

end;

class procedure TVendaCondicoesPagamentoService.AnexarObjetosVinculados(AListaVendaCondicoesPagamento: TObjectList<TVendaCondicoesPagamento>);
var
  VendaCondicoesPagamento: TVendaCondicoesPagamento;
begin
  for VendaCondicoesPagamento in AListaVendaCondicoesPagamento do
  begin
    AnexarObjetosVinculados(VendaCondicoesPagamento);
  end;
end;

class function TVendaCondicoesPagamentoService.ConsultarLista: TObjectList<TVendaCondicoesPagamento>;
begin
  sql := 'SELECT * FROM VENDA_CONDICOES_PAGAMENTO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TVendaCondicoesPagamento>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TVendaCondicoesPagamentoService.ConsultarListaFiltro(AWhere: string): TObjectList<TVendaCondicoesPagamento>;
begin
  sql := 'SELECT * FROM VENDA_CONDICOES_PAGAMENTO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TVendaCondicoesPagamento>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TVendaCondicoesPagamentoService.ConsultarObjeto(AId: Integer): TVendaCondicoesPagamento;
begin
  sql := 'SELECT * FROM VENDA_CONDICOES_PAGAMENTO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TVendaCondicoesPagamento>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TVendaCondicoesPagamentoService.Inserir(AVendaCondicoesPagamento: TVendaCondicoesPagamento);
begin
  AVendaCondicoesPagamento.ValidarInsercao;
  AVendaCondicoesPagamento.Id := InserirBase(AVendaCondicoesPagamento, 'VENDA_CONDICOES_PAGAMENTO');
  InserirObjetosFilhos(AVendaCondicoesPagamento);
end;

class function TVendaCondicoesPagamentoService.Alterar(AVendaCondicoesPagamento: TVendaCondicoesPagamento): Integer;
begin
  AVendaCondicoesPagamento.ValidarAlteracao;
  Result := AlterarBase(AVendaCondicoesPagamento, 'VENDA_CONDICOES_PAGAMENTO');
  ExcluirObjetosFilhos(AVendaCondicoesPagamento);
  InserirObjetosFilhos(AVendaCondicoesPagamento);
end;

class procedure TVendaCondicoesPagamentoService.InserirObjetosFilhos(AVendaCondicoesPagamento: TVendaCondicoesPagamento);
var
  VendaCondicoesParcelas: TVendaCondicoesParcelas;
begin
  // VendaCondicoesParcelas
  for VendaCondicoesParcelas in AVendaCondicoesPagamento.ListaVendaCondicoesParcelas do
  begin
    VendaCondicoesParcelas.IdVendaCondicoesPagamento := AVendaCondicoesPagamento.Id;
    InserirBase(VendaCondicoesParcelas, 'VENDA_CONDICOES_PARCELAS');
  end;

end;

class function TVendaCondicoesPagamentoService.Excluir(AVendaCondicoesPagamento: TVendaCondicoesPagamento): Integer;
begin
  AVendaCondicoesPagamento.ValidarExclusao;
  ExcluirObjetosFilhos(AVendaCondicoesPagamento);
  Result := ExcluirBase(AVendaCondicoesPagamento.Id, 'VENDA_CONDICOES_PAGAMENTO');
end;

class procedure TVendaCondicoesPagamentoService.ExcluirObjetosFilhos(AVendaCondicoesPagamento: TVendaCondicoesPagamento);
begin
  ExcluirFilho(AVendaCondicoesPagamento.Id, 'VENDA_CONDICOES_PARCELAS', 'ID_VENDA_CONDICOES_PAGAMENTO');
end;

end.
