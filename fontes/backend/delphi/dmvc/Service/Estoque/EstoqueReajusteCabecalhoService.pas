{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
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
unit EstoqueReajusteCabecalhoService;

interface

uses
  EstoqueReajusteCabecalho, EstoqueReajusteDetalhe, Colaborador, Produto, ProdutoService,
  ViewPessoaColaborador,
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TEstoqueReajusteCabecalhoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaEstoqueReajusteCabecalho: TObjectList<TEstoqueReajusteCabecalho>); overload;
    class procedure AnexarObjetosVinculados(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho); overload;
    class procedure InserirObjetosFilhos(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho);
    class procedure ExcluirObjetosFilhos(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho);
  public
    class function ConsultarLista: TObjectList<TEstoqueReajusteCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TEstoqueReajusteCabecalho>;
    class function ConsultarObjeto(AId: Integer): TEstoqueReajusteCabecalho;
    class procedure Inserir(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho);
    class function Alterar(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho): Integer;
    class function Excluir(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho): Integer;
    class procedure FormarPreco(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho);
  end;

var
  sql: string;


implementation

{ TEstoqueReajusteCabecalhoService }

class procedure TEstoqueReajusteCabecalhoService.AnexarObjetosVinculados(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho);
var
  EstoqueReajusteDetalhe: TEstoqueReajusteDetalhe;
begin
  // EstoqueReajusteDetalhe
  sql := 'SELECT * FROM ESTOQUE_REAJUSTE_DETALHE WHERE ID_ESTOQUE_REAJUSTE_CABECALHO = ' + AEstoqueReajusteCabecalho.Id.ToString;
  AEstoqueReajusteCabecalho.ListaEstoqueReajusteDetalhe := GetQuery(sql).AsObjectList<TEstoqueReajusteDetalhe>;

  // Produto
  for EstoqueReajusteDetalhe in AEstoqueReajusteCabecalho.ListaEstoqueReajusteDetalhe do
  begin
    sql := 'SELECT * FROM PRODUTO WHERE ID = ' + EstoqueReajusteDetalhe.IdProduto.ToString;
    EstoqueReajusteDetalhe.Produto := GetQuery(sql).AsObject<TProduto>;
  end;

  // Colaborador
  sql := 'SELECT * FROM COLABORADOR WHERE ID = ' + AEstoqueReajusteCabecalho.IdColaborador.ToString;
  AEstoqueReajusteCabecalho.Colaborador := GetQuery(sql).AsObject<TColaborador>;

  // ViewPessoaColaborador
  if assigned(AEstoqueReajusteCabecalho.Colaborador) then
  begin
    sql := 'SELECT * FROM VIEW_PESSOA_COLABORADOR WHERE ID = ' + AEstoqueReajusteCabecalho.IdColaborador.ToString;
    AEstoqueReajusteCabecalho.Colaborador.ViewPessoaColaborador := GetQuery(sql).AsObject<TViewPessoaColaborador>;
  end;
end;

class procedure TEstoqueReajusteCabecalhoService.AnexarObjetosVinculados(AListaEstoqueReajusteCabecalho: TObjectList<TEstoqueReajusteCabecalho>);
var
  EstoqueReajusteCabecalho: TEstoqueReajusteCabecalho;
begin
  for EstoqueReajusteCabecalho in AListaEstoqueReajusteCabecalho do
  begin
    AnexarObjetosVinculados(EstoqueReajusteCabecalho);
  end;
end;

class function TEstoqueReajusteCabecalhoService.ConsultarLista: TObjectList<TEstoqueReajusteCabecalho>;
begin
  sql := 'SELECT * FROM ESTOQUE_REAJUSTE_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TEstoqueReajusteCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEstoqueReajusteCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TEstoqueReajusteCabecalho>;
begin
  sql := 'SELECT * FROM ESTOQUE_REAJUSTE_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TEstoqueReajusteCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEstoqueReajusteCabecalhoService.ConsultarObjeto(AId: Integer): TEstoqueReajusteCabecalho;
begin
  sql := 'SELECT * FROM ESTOQUE_REAJUSTE_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TEstoqueReajusteCabecalho>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TEstoqueReajusteCabecalhoService.Inserir(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho);
begin
  AEstoqueReajusteCabecalho.ValidarInsercao;
  AEstoqueReajusteCabecalho.Id := InserirBase(AEstoqueReajusteCabecalho, 'ESTOQUE_REAJUSTE_CABECALHO');
  InserirObjetosFilhos(AEstoqueReajusteCabecalho);
end;

class function TEstoqueReajusteCabecalhoService.Alterar(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho): Integer;
begin
  AEstoqueReajusteCabecalho.ValidarAlteracao;
  Result := AlterarBase(AEstoqueReajusteCabecalho, 'ESTOQUE_REAJUSTE_CABECALHO');
  ExcluirObjetosFilhos(AEstoqueReajusteCabecalho);
  InserirObjetosFilhos(AEstoqueReajusteCabecalho);
end;

class procedure TEstoqueReajusteCabecalhoService.InserirObjetosFilhos(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho);
var
  EstoqueReajusteDetalhe: TEstoqueReajusteDetalhe;
  Produto: TProduto;
begin
  // EstoqueReajusteDetalhe
  for EstoqueReajusteDetalhe in AEstoqueReajusteCabecalho.ListaEstoqueReajusteDetalhe do
  begin
    EstoqueReajusteDetalhe.IdEstoqueReajusteCabecalho := AEstoqueReajusteCabecalho.Id;
    InserirBase(EstoqueReajusteDetalhe, 'ESTOQUE_REAJUSTE_DETALHE');

    // reajusta o preço do produto
    Produto := TProdutoService.ConsultarObjeto(EstoqueReajusteDetalhe.IdProduto);
    if Assigned(Produto) then
    begin
      Produto.ValorVenda := EstoqueReajusteDetalhe.ValorReajuste;
      AlterarBase(Produto, 'PRODUTO');
    end;
  end;

end;

class function TEstoqueReajusteCabecalhoService.Excluir(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho): Integer;
begin
  AEstoqueReajusteCabecalho.ValidarExclusao;
  ExcluirObjetosFilhos(AEstoqueReajusteCabecalho);
  Result := ExcluirBase(AEstoqueReajusteCabecalho.Id, 'ESTOQUE_REAJUSTE_CABECALHO');
end;

class procedure TEstoqueReajusteCabecalhoService.ExcluirObjetosFilhos(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho);
begin
  ExcluirFilho(AEstoqueReajusteCabecalho.Id, 'ESTOQUE_REAJUSTE_DETALHE', 'ID_ESTOQUE_REAJUSTE_CABECALHO');
end;

class procedure TEstoqueReajusteCabecalhoService.FormarPreco(AEstoqueReajusteCabecalho: TEstoqueReajusteCabecalho);
var
  EstoqueReajusteDetalhe: TEstoqueReajusteDetalhe;
  Produto: TProduto;
begin
  // EstoqueReajusteDetalhe
  for EstoqueReajusteDetalhe in AEstoqueReajusteCabecalho.ListaEstoqueReajusteDetalhe do
  begin
    // reajusta o preço do produto formado
    Produto := TProdutoService.ConsultarObjeto(EstoqueReajusteDetalhe.IdProduto);
    if Assigned(Produto) then
    begin
      Produto.ValorVenda := EstoqueReajusteDetalhe.ValorReajuste;
      AlterarBase(Produto, 'PRODUTO');
    end;
  end;

end;

end.
