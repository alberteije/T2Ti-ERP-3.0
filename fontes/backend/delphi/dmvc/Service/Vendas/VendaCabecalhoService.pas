{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VENDA_CABECALHO] 
                                                                                
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
unit VendaCabecalhoService;

interface

uses
  VendaCabecalho, VendaFrete, VendaComissao, VendaDetalhe, VendaOrcamentoCabecalho, VendaCondicoesPagamento,
  NotaFiscalTipo, Cliente, Transportadora, Vendedor, ViewPessoaCliente, ViewPessoaTransportadora, Colaborador,
  ViewPessoaVendedor, Produto, ViewPessoaColaborador,
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TVendaCabecalhoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaVendaCabecalho: TObjectList<TVendaCabecalho>); overload;
    class procedure AnexarObjetosVinculados(AVendaCabecalho: TVendaCabecalho); overload;
    class procedure InserirObjetosFilhos(AVendaCabecalho: TVendaCabecalho);
    class procedure ExcluirObjetosFilhos(AVendaCabecalho: TVendaCabecalho);
  public
    class function ConsultarLista: TObjectList<TVendaCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TVendaCabecalho>;
    class function ConsultarObjeto(AId: Integer): TVendaCabecalho;
    class procedure Inserir(AVendaCabecalho: TVendaCabecalho);
    class function Alterar(AVendaCabecalho: TVendaCabecalho): Integer;
    class function Excluir(AVendaCabecalho: TVendaCabecalho): Integer;
  end;

var
  sql: string;


implementation

{ TVendaCabecalhoService }

class procedure TVendaCabecalhoService.AnexarObjetosVinculados(AVendaCabecalho: TVendaCabecalho);
var
  Detalhe: TVendaDetalhe;
begin
  // VendaComissao
  sql := 'SELECT * FROM VENDA_COMISSAO WHERE ID_VENDA_CABECALHO = ' + AVendaCabecalho.Id.ToString;
  AVendaCabecalho.ListaVendaComissao := GetQuery(sql).AsObjectList<TVendaComissao>;

  // VendaDetalhe
  sql := 'SELECT * FROM VENDA_DETALHE WHERE ID_VENDA_CABECALHO = ' + AVendaCabecalho.Id.ToString;
  AVendaCabecalho.ListaVendaDetalhe := GetQuery(sql).AsObjectList<TVendaDetalhe>;
  // Produto
  for Detalhe in AVendaCabecalho.ListaVendaDetalhe do
  begin
    sql := 'SELECT * FROM PRODUTO WHERE ID = ' + Detalhe.IdProduto.ToString;
    Detalhe.Produto := GetQuery(sql).AsObject<TProduto>;
  end;

  // VendaOrcamentoCabecalho
  sql := 'SELECT * FROM VENDA_ORCAMENTO_CABECALHO WHERE ID = ' + AVendaCabecalho.IdVendaOrcamentoCabecalho.ToString;
  AVendaCabecalho.VendaOrcamentoCabecalho := GetQuery(sql).AsObject<TVendaOrcamentoCabecalho>;

  // VendaCondicoesPagamento
  sql := 'SELECT * FROM VENDA_CONDICOES_PAGAMENTO WHERE ID = ' + AVendaCabecalho.IdVendaCondicoesPagamento.ToString;
  AVendaCabecalho.VendaCondicoesPagamento := GetQuery(sql).AsObject<TVendaCondicoesPagamento>;

  // NotaFiscalTipo
  sql := 'SELECT * FROM NOTA_FISCAL_TIPO WHERE ID = ' + AVendaCabecalho.IdNotaFiscalTipo.ToString;
  AVendaCabecalho.NotaFiscalTipo := GetQuery(sql).AsObject<TNotaFiscalTipo>;

  // Cliente
  sql := 'SELECT * FROM CLIENTE WHERE ID = ' + AVendaCabecalho.IdCliente.ToString;
  AVendaCabecalho.Cliente := GetQuery(sql).AsObject<TCliente>;

  // ViewPessoaCliente
  if assigned(AVendaCabecalho.Cliente) then
  begin
    sql := 'SELECT * FROM VIEW_PESSOA_CLIENTE WHERE ID = ' + AVendaCabecalho.IdCliente.ToString;
    AVendaCabecalho.Cliente.ViewPessoaCliente := GetQuery(sql).AsObject<TViewPessoaCliente>;
  end;

  // Transportadora
  sql := 'SELECT * FROM TRANSPORTADORA WHERE ID = ' + AVendaCabecalho.IdTransportadora.ToString;
  AVendaCabecalho.Transportadora := GetQuery(sql).AsObject<TTransportadora>;

  // ViewPessoaTransportadora
  if assigned(AVendaCabecalho.Transportadora) then
  begin
    sql := 'SELECT * FROM VIEW_PESSOA_TRANSPORTADORA WHERE ID = ' + AVendaCabecalho.IdTransportadora.ToString;
    AVendaCabecalho.Transportadora.ViewPessoaTransportadora := GetQuery(sql).AsObject<TViewPessoaTransportadora>;
  end;

  // Vendedor
  sql := 'SELECT * FROM VENDEDOR WHERE ID = ' + AVendaCabecalho.IdVendedor.ToString;
  AVendaCabecalho.Vendedor := GetQuery(sql).AsObject<TVendedor>;

  // ViewPessoaVendedor
  if assigned(AVendaCabecalho.Vendedor) then
  begin
    sql := 'SELECT * FROM COLABORADOR WHERE ID = ' + AVendaCabecalho.Vendedor.IdColaborador.ToString;
    AVendaCabecalho.Vendedor.Colaborador := GetQuery(sql).AsObject<TColaborador>;

    sql := 'SELECT * FROM VIEW_PESSOA_COLABORADOR WHERE ID = ' + AVendaCabecalho.Vendedor.IdColaborador.ToString;
    AVendaCabecalho.Vendedor.Colaborador.ViewPessoaColaborador := GetQuery(sql).AsObject<TViewPessoaColaborador>;
  end;


  // Frete
  sql := 'SELECT * FROM VENDA_FRETE WHERE ID = ' + AVendaCabecalho.IdVendedor.ToString;
  AVendaCabecalho.VendaFrete := GetQuery(sql).AsObject<TVendaFrete>;
  // Transportadora - Frete
  sql := 'SELECT * FROM TRANSPORTADORA WHERE ID = ' + AVendaCabecalho.VendaFrete.IdTransportadora.ToString;
  AVendaCabecalho.VendaFrete.Transportadora := GetQuery(sql).AsObject<TTransportadora>;

  // ViewPessoaTransportadora - frete
  if assigned(AVendaCabecalho.VendaFrete.Transportadora) then
  begin
    sql := 'SELECT * FROM VIEW_PESSOA_TRANSPORTADORA WHERE ID = ' + AVendaCabecalho.VendaFrete.IdTransportadora.ToString;
    AVendaCabecalho.VendaFrete.Transportadora.ViewPessoaTransportadora := GetQuery(sql).AsObject<TViewPessoaTransportadora>;
  end;

end;

class procedure TVendaCabecalhoService.AnexarObjetosVinculados(AListaVendaCabecalho: TObjectList<TVendaCabecalho>);
var
  VendaCabecalho: TVendaCabecalho;
begin
  for VendaCabecalho in AListaVendaCabecalho do
  begin
    AnexarObjetosVinculados(VendaCabecalho);
  end;
end;

class function TVendaCabecalhoService.ConsultarLista: TObjectList<TVendaCabecalho>;
begin
  sql := 'SELECT * FROM VENDA_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TVendaCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TVendaCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TVendaCabecalho>;
begin
  sql := 'SELECT * FROM VENDA_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TVendaCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TVendaCabecalhoService.ConsultarObjeto(AId: Integer): TVendaCabecalho;
begin
  sql := 'SELECT * FROM VENDA_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TVendaCabecalho>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TVendaCabecalhoService.Inserir(AVendaCabecalho: TVendaCabecalho);
begin
  AVendaCabecalho.ValidarInsercao;
  AVendaCabecalho.Id := InserirBase(AVendaCabecalho, 'VENDA_CABECALHO');
  InserirObjetosFilhos(AVendaCabecalho);
end;

class function TVendaCabecalhoService.Alterar(AVendaCabecalho: TVendaCabecalho): Integer;
begin
  AVendaCabecalho.ValidarAlteracao;
  Result := AlterarBase(AVendaCabecalho, 'VENDA_CABECALHO');
  ExcluirObjetosFilhos(AVendaCabecalho);
  InserirObjetosFilhos(AVendaCabecalho);
end;

class procedure TVendaCabecalhoService.InserirObjetosFilhos(AVendaCabecalho: TVendaCabecalho);
var
  VendaComissao: TVendaComissao;
  VendaDetalhe: TVendaDetalhe;
begin
  // VendaComissao
  for VendaComissao in AVendaCabecalho.ListaVendaComissao do
  begin
    VendaComissao.IdVendaCabecalho := AVendaCabecalho.Id;
    InserirBase(VendaComissao, 'VENDA_COMISSAO');
  end;

  // VendaDetalhe
  for VendaDetalhe in AVendaCabecalho.ListaVendaDetalhe do
  begin
    VendaDetalhe.IdVendaCabecalho := AVendaCabecalho.Id;
    InserirBase(VendaDetalhe, 'VENDA_DETALHE');
  end;

  // Frete
  if AVendaCabecalho.VendaFrete.IdTransportadora > 0 then
  begin
    AVendaCabecalho.VendaFrete.IdVendaCabecalho := AVendaCabecalho.Id;
    InserirBase(AVendaCabecalho.VendaFrete, 'VENDA_FRETE');
  end;
end;

class function TVendaCabecalhoService.Excluir(AVendaCabecalho: TVendaCabecalho): Integer;
begin
  AVendaCabecalho.ValidarExclusao;
  ExcluirObjetosFilhos(AVendaCabecalho);
  Result := ExcluirBase(AVendaCabecalho.Id, 'VENDA_CABECALHO');
end;

class procedure TVendaCabecalhoService.ExcluirObjetosFilhos(AVendaCabecalho: TVendaCabecalho);
begin
  ExcluirFilho(AVendaCabecalho.Id, 'VENDA_COMISSAO', 'ID_VENDA_CABECALHO');
  ExcluirFilho(AVendaCabecalho.Id, 'VENDA_DETALHE', 'ID_VENDA_CABECALHO');
end;

end.
