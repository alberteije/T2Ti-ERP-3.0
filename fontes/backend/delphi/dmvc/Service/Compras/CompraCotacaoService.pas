{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [COMPRA_COTACAO] 
                                                                                
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
unit CompraCotacaoService;

interface

uses
  CompraCotacao, CompraFornecedorCotacao, CompraRequisicao, CompraCotacaoDetalhe,
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TCompraCotacaoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaCompraCotacao: TObjectList<TCompraCotacao>); overload;
    class procedure AnexarObjetosVinculados(ACompraCotacao: TCompraCotacao); overload;
    class procedure InserirObjetosFilhos(ACompraCotacao: TCompraCotacao);
    class procedure ExcluirObjetosFilhos(ACompraCotacao: TCompraCotacao);
  public
    class function ConsultarLista: TObjectList<TCompraCotacao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TCompraCotacao>;
    class function ConsultarObjeto(AId: Integer): TCompraCotacao;
    class procedure Inserir(ACompraCotacao: TCompraCotacao);
    class function Alterar(ACompraCotacao: TCompraCotacao): Integer;
    class function Excluir(ACompraCotacao: TCompraCotacao): Integer;
  end;

var
  sql: string;


implementation

{ TCompraCotacaoService }

class procedure TCompraCotacaoService.AnexarObjetosVinculados(ACompraCotacao: TCompraCotacao);
var
  FornecedorCotacao: TCompraFornecedorCotacao;
begin
  // CompraFornecedorCotacao
  sql := 'SELECT * FROM COMPRA_FORNECEDOR_COTACAO WHERE ID_COMPRA_COTACAO = ' + ACompraCotacao.Id.ToString;
  ACompraCotacao.ListaCompraFornecedorCotacao := GetQuery(sql).AsObjectList<TCompraFornecedorCotacao>;

  // CompraCotacaoDetalhe
  for FornecedorCotacao in ACompraCotacao.ListaCompraFornecedorCotacao do
  begin
  	sql := 'SELECT * FROM COMPRA_COTACAO_DETALHE WHERE ID_COMPRA_FORNECEDOR_COTACAO = ' + FornecedorCotacao.Id.ToString;
    FornecedorCotacao.ListaCompraCotacaoDetalhe := GetQuery(sql).AsObjectList<TCompraCotacaoDetalhe>;
  end;
 
  // CompraRequisicao
  sql := 'SELECT * FROM COMPRA_REQUISICAO WHERE ID = ' + ACompraCotacao.IdCompraRequisicao.ToString;
  ACompraCotacao.CompraRequisicao := GetQuery(sql).AsObject<TCompraRequisicao>;

end;

class procedure TCompraCotacaoService.AnexarObjetosVinculados(AListaCompraCotacao: TObjectList<TCompraCotacao>);
var
  CompraCotacao: TCompraCotacao;
begin
  for CompraCotacao in AListaCompraCotacao do
  begin
    AnexarObjetosVinculados(CompraCotacao);
  end;
end;

class function TCompraCotacaoService.ConsultarLista: TObjectList<TCompraCotacao>;
begin
  sql := 'SELECT * FROM COMPRA_COTACAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TCompraCotacao>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TCompraCotacaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TCompraCotacao>;
begin
  sql := 'SELECT * FROM COMPRA_COTACAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TCompraCotacao>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TCompraCotacaoService.ConsultarObjeto(AId: Integer): TCompraCotacao;
begin
  sql := 'SELECT * FROM COMPRA_COTACAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TCompraCotacao>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TCompraCotacaoService.Inserir(ACompraCotacao: TCompraCotacao);
begin
  ACompraCotacao.ValidarInsercao;
  ACompraCotacao.Id := InserirBase(ACompraCotacao, 'COMPRA_COTACAO');
  InserirObjetosFilhos(ACompraCotacao);
end;

class function TCompraCotacaoService.Alterar(ACompraCotacao: TCompraCotacao): Integer;
begin
  ACompraCotacao.ValidarAlteracao;
  Result := AlterarBase(ACompraCotacao, 'COMPRA_COTACAO');
  ExcluirObjetosFilhos(ACompraCotacao);
  InserirObjetosFilhos(ACompraCotacao);
end;

class procedure TCompraCotacaoService.InserirObjetosFilhos(ACompraCotacao: TCompraCotacao);
var
  CompraFornecedorCotacao: TCompraFornecedorCotacao;
begin
  // CompraFornecedorCotacao
  for CompraFornecedorCotacao in ACompraCotacao.ListaCompraFornecedorCotacao do
  begin
    CompraFornecedorCotacao.IdCompraCotacao := ACompraCotacao.Id;
    InserirBase(CompraFornecedorCotacao, 'COMPRA_FORNECEDOR_COTACAO');
  end;

end;

class function TCompraCotacaoService.Excluir(ACompraCotacao: TCompraCotacao): Integer;
begin
  ACompraCotacao.ValidarExclusao;
  ExcluirObjetosFilhos(ACompraCotacao);
  Result := ExcluirBase(ACompraCotacao.Id, 'COMPRA_COTACAO');
end;

class procedure TCompraCotacaoService.ExcluirObjetosFilhos(ACompraCotacao: TCompraCotacao);
begin
  ExcluirFilho(ACompraCotacao.Id, 'COMPRA_FORNECEDOR_COTACAO', 'ID_COMPRA_COTACAO');
end;

end.
