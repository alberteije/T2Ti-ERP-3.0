{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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
unit VendaOrcamentoCabecalhoService;

interface

uses
  VendaOrcamentoCabecalho, VendaOrcamentoDetalhe, VendaCondicoesPagamento, Vendedor,
  Cliente, Transportadora, ViewPessoaVendedor, ViewPessoaCliente, ViewPessoaTransportadora,
  Produto, Colaborador, ViewPessoaColaborador,
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TVendaOrcamentoCabecalhoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaVendaOrcamentoCabecalho: TObjectList<TVendaOrcamentoCabecalho>); overload;
    class procedure AnexarObjetosVinculados(AVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho); overload;
    class procedure InserirObjetosFilhos(AVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho);
    class procedure ExcluirObjetosFilhos(AVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho);
  public
    class function ConsultarLista: TObjectList<TVendaOrcamentoCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TVendaOrcamentoCabecalho>;
    class function ConsultarObjeto(AId: Integer): TVendaOrcamentoCabecalho;
    class procedure Inserir(AVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho);
    class function Alterar(AVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho): Integer;
    class function Excluir(AVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho): Integer;
  end;

var
  sql: string;


implementation

{ TVendaOrcamentoCabecalhoService }

class procedure TVendaOrcamentoCabecalhoService.AnexarObjetosVinculados(AVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho);
var
  Detalhe: TVendaOrcamentoDetalhe;
begin
  // VendaOrcamentoDetalhe
  sql := 'SELECT * FROM VENDA_ORCAMENTO_DETALHE WHERE ID_VENDA_ORCAMENTO_CABECALHO = ' + AVendaOrcamentoCabecalho.Id.ToString;
  AVendaOrcamentoCabecalho.ListaVendaOrcamentoDetalhe := GetQuery(sql).AsObjectList<TVendaOrcamentoDetalhe>;
  // Produto
  for Detalhe in AVendaOrcamentoCabecalho.ListaVendaOrcamentoDetalhe do
  begin
    sql := 'SELECT * FROM PRODUTO WHERE ID = ' + Detalhe.IdProduto.ToString;
    Detalhe.Produto := GetQuery(sql).AsObject<TProduto>;
  end;

  // VendaCondicoesPagamento
  sql := 'SELECT * FROM VENDA_CONDICOES_PAGAMENTO WHERE ID = ' + AVendaOrcamentoCabecalho.IdVendaCondicoesPagamento.ToString;
  AVendaOrcamentoCabecalho.VendaCondicoesPagamento := GetQuery(sql).AsObject<TVendaCondicoesPagamento>;

  // Vendedor
  sql := 'SELECT * FROM VENDEDOR WHERE ID = ' + AVendaOrcamentoCabecalho.IdVendedor.ToString;
  AVendaOrcamentoCabecalho.Vendedor := GetQuery(sql).AsObject<TVendedor>;

  // ViewPessoaVendedor
  if assigned(AVendaOrcamentoCabecalho.Vendedor) then
  begin
    sql := 'SELECT * FROM COLABORADOR WHERE ID = ' + AVendaOrcamentoCabecalho.Vendedor.IdColaborador.ToString;
    AVendaOrcamentoCabecalho.Vendedor.Colaborador := GetQuery(sql).AsObject<TColaborador>;

    sql := 'SELECT * FROM VIEW_PESSOA_COLABORADOR WHERE ID = ' + AVendaOrcamentoCabecalho.Vendedor.IdColaborador.ToString;
    AVendaOrcamentoCabecalho.Vendedor.Colaborador.ViewPessoaColaborador := GetQuery(sql).AsObject<TViewPessoaColaborador>;
  end;

  // Cliente
  sql := 'SELECT * FROM CLIENTE WHERE ID = ' + AVendaOrcamentoCabecalho.IdCliente.ToString;
  AVendaOrcamentoCabecalho.Cliente := GetQuery(sql).AsObject<TCliente>;
  // ViewPessoaCliente
  if assigned(AVendaOrcamentoCabecalho.Cliente) then
  begin
    sql := 'SELECT * FROM VIEW_PESSOA_CLIENTE WHERE ID = ' + AVendaOrcamentoCabecalho.IdCliente.ToString;
    AVendaOrcamentoCabecalho.Cliente.ViewPessoaCliente := GetQuery(sql).AsObject<TViewPessoaCliente>;
  end;

  // Transportadora
  sql := 'SELECT * FROM TRANSPORTADORA WHERE ID = ' + AVendaOrcamentoCabecalho.IdTransportadora.ToString;
  AVendaOrcamentoCabecalho.Transportadora := GetQuery(sql).AsObject<TTransportadora>;
  // ViewPessoaTransportadora
  if assigned(AVendaOrcamentoCabecalho.Transportadora) then
  begin
    sql := 'SELECT * FROM VIEW_PESSOA_TRANSPORTADORA WHERE ID = ' + AVendaOrcamentoCabecalho.IdTransportadora.ToString;
    AVendaOrcamentoCabecalho.Transportadora.ViewPessoaTransportadora := GetQuery(sql).AsObject<TViewPessoaTransportadora>;
  end;

end;

class procedure TVendaOrcamentoCabecalhoService.AnexarObjetosVinculados(AListaVendaOrcamentoCabecalho: TObjectList<TVendaOrcamentoCabecalho>);
var
  VendaOrcamentoCabecalho: TVendaOrcamentoCabecalho;
begin
  for VendaOrcamentoCabecalho in AListaVendaOrcamentoCabecalho do
  begin
    AnexarObjetosVinculados(VendaOrcamentoCabecalho);
  end;
end;

class function TVendaOrcamentoCabecalhoService.ConsultarLista: TObjectList<TVendaOrcamentoCabecalho>;
begin
  sql := 'SELECT * FROM VENDA_ORCAMENTO_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TVendaOrcamentoCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TVendaOrcamentoCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TVendaOrcamentoCabecalho>;
begin
  sql := 'SELECT * FROM VENDA_ORCAMENTO_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TVendaOrcamentoCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TVendaOrcamentoCabecalhoService.ConsultarObjeto(AId: Integer): TVendaOrcamentoCabecalho;
begin
  sql := 'SELECT * FROM VENDA_ORCAMENTO_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TVendaOrcamentoCabecalho>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TVendaOrcamentoCabecalhoService.Inserir(AVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho);
begin
  AVendaOrcamentoCabecalho.ValidarInsercao;
  AVendaOrcamentoCabecalho.Id := InserirBase(AVendaOrcamentoCabecalho, 'VENDA_ORCAMENTO_CABECALHO');
  InserirObjetosFilhos(AVendaOrcamentoCabecalho);
end;

class function TVendaOrcamentoCabecalhoService.Alterar(AVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho): Integer;
begin
  AVendaOrcamentoCabecalho.ValidarAlteracao;
  Result := AlterarBase(AVendaOrcamentoCabecalho, 'VENDA_ORCAMENTO_CABECALHO');
  ExcluirObjetosFilhos(AVendaOrcamentoCabecalho);
  InserirObjetosFilhos(AVendaOrcamentoCabecalho);
end;

class procedure TVendaOrcamentoCabecalhoService.InserirObjetosFilhos(AVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho);
var
  VendaOrcamentoDetalhe: TVendaOrcamentoDetalhe;
begin
  // VendaOrcamentoDetalhe
  for VendaOrcamentoDetalhe in AVendaOrcamentoCabecalho.ListaVendaOrcamentoDetalhe do
  begin
    VendaOrcamentoDetalhe.IdVendaOrcamentoCabecalho := AVendaOrcamentoCabecalho.Id;
    InserirBase(VendaOrcamentoDetalhe, 'VENDA_ORCAMENTO_DETALHE');
  end;

end;

class function TVendaOrcamentoCabecalhoService.Excluir(AVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho): Integer;
begin
  AVendaOrcamentoCabecalho.ValidarExclusao;
  ExcluirObjetosFilhos(AVendaOrcamentoCabecalho);
  Result := ExcluirBase(AVendaOrcamentoCabecalho.Id, 'VENDA_ORCAMENTO_CABECALHO');
end;

class procedure TVendaOrcamentoCabecalhoService.ExcluirObjetosFilhos(AVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho);
begin
  ExcluirFilho(AVendaOrcamentoCabecalho.Id, 'VENDA_ORCAMENTO_DETALHE', 'ID_VENDA_ORCAMENTO_CABECALHO');
end;

end.
