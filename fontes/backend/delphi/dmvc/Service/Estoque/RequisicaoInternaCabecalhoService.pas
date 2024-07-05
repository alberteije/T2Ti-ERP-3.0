{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [REQUISICAO_INTERNA_CABECALHO] 
                                                                                
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
unit RequisicaoInternaCabecalhoService;

interface

uses
  RequisicaoInternaCabecalho, Colaborador, ViewPessoaColaborador, RequisicaoInternaDetalhe,
  Produto, ControleEstoqueService,
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TRequisicaoInternaCabecalhoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaRequisicaoInternaCabecalho: TObjectList<TRequisicaoInternaCabecalho>); overload;
    class procedure AnexarObjetosVinculados(ARequisicaoInternaCabecalho: TRequisicaoInternaCabecalho); overload;
    class procedure InserirObjetosFilhos(ARequisicaoInternaCabecalho: TRequisicaoInternaCabecalho);
    class procedure ExcluirObjetosFilhos(ARequisicaoInternaCabecalho: TRequisicaoInternaCabecalho);
  public
    class function ConsultarLista: TObjectList<TRequisicaoInternaCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TRequisicaoInternaCabecalho>;
    class function ConsultarObjeto(AId: Integer): TRequisicaoInternaCabecalho;
    class procedure Inserir(ARequisicaoInternaCabecalho: TRequisicaoInternaCabecalho);
    class function Alterar(ARequisicaoInternaCabecalho: TRequisicaoInternaCabecalho): Integer;
    class function Excluir(ARequisicaoInternaCabecalho: TRequisicaoInternaCabecalho): Integer;
  end;

var
  sql: string;
  RequisicaoCabOld: TRequisicaoInternaCabecalho;

implementation

{ TRequisicaoInternaCabecalhoService }

class procedure TRequisicaoInternaCabecalhoService.AnexarObjetosVinculados(ARequisicaoInternaCabecalho: TRequisicaoInternaCabecalho);
var
  RequisicaoInternaDetalhe: TRequisicaoInternaDetalhe;
begin
  // Detalhes
  sql := 'SELECT * FROM REQUISICAO_INTERNA_DETALHE WHERE ID_REQUISICAO_INTERNA_CABECALHO = ' + ARequisicaoInternaCabecalho.Id.ToString;
  ARequisicaoInternaCabecalho.ListaRequisicaoInternaDetalhe := GetQuery(sql).AsObjectList<TRequisicaoInternaDetalhe>;

  // Produto
  for RequisicaoInternaDetalhe in ARequisicaoInternaCabecalho.ListaRequisicaoInternaDetalhe do
  begin
    sql := 'SELECT * FROM PRODUTO WHERE ID = ' + RequisicaoInternaDetalhe.IdProduto.ToString;
    RequisicaoInternaDetalhe.Produto := GetQuery(sql).AsObject<TProduto>;
  end;

  // Colaborador
  sql := 'SELECT * FROM COLABORADOR WHERE ID = ' + ARequisicaoInternaCabecalho.IdColaborador.ToString;
  ARequisicaoInternaCabecalho.Colaborador := GetQuery(sql).AsObject<TColaborador>;

  // ViewPessoaColaborador
  if assigned(ARequisicaoInternaCabecalho.Colaborador) then
  begin
    sql := 'SELECT * FROM VIEW_PESSOA_COLABORADOR WHERE ID = ' + ARequisicaoInternaCabecalho.IdColaborador.ToString;
    ARequisicaoInternaCabecalho.Colaborador.ViewPessoaColaborador := GetQuery(sql).AsObject<TViewPessoaColaborador>;
  end;
end;

class procedure TRequisicaoInternaCabecalhoService.AnexarObjetosVinculados(AListaRequisicaoInternaCabecalho: TObjectList<TRequisicaoInternaCabecalho>);
var
  RequisicaoInternaCabecalho: TRequisicaoInternaCabecalho;
begin
  for RequisicaoInternaCabecalho in AListaRequisicaoInternaCabecalho do
  begin
    AnexarObjetosVinculados(RequisicaoInternaCabecalho);
  end;
end;

class function TRequisicaoInternaCabecalhoService.ConsultarLista: TObjectList<TRequisicaoInternaCabecalho>;
begin
  sql := 'SELECT * FROM REQUISICAO_INTERNA_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TRequisicaoInternaCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TRequisicaoInternaCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TRequisicaoInternaCabecalho>;
begin
  sql := 'SELECT * FROM REQUISICAO_INTERNA_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TRequisicaoInternaCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TRequisicaoInternaCabecalhoService.ConsultarObjeto(AId: Integer): TRequisicaoInternaCabecalho;
begin
  sql := 'SELECT * FROM REQUISICAO_INTERNA_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TRequisicaoInternaCabecalho>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TRequisicaoInternaCabecalhoService.Inserir(ARequisicaoInternaCabecalho: TRequisicaoInternaCabecalho);
begin
  ARequisicaoInternaCabecalho.ValidarInsercao;
  ARequisicaoInternaCabecalho.Id := InserirBase(ARequisicaoInternaCabecalho, 'REQUISICAO_INTERNA_CABECALHO');
  InserirObjetosFilhos(ARequisicaoInternaCabecalho);
end;

class function TRequisicaoInternaCabecalhoService.Alterar(ARequisicaoInternaCabecalho: TRequisicaoInternaCabecalho): Integer;
begin
  RequisicaoCabOld := ConsultarObjeto(ARequisicaoInternaCabecalho.Id);
  ARequisicaoInternaCabecalho.ValidarAlteracao;
  Result := AlterarBase(ARequisicaoInternaCabecalho, 'REQUISICAO_INTERNA_CABECALHO');
  ExcluirObjetosFilhos(ARequisicaoInternaCabecalho);
  InserirObjetosFilhos(ARequisicaoInternaCabecalho);
end;

class procedure TRequisicaoInternaCabecalhoService.InserirObjetosFilhos(ARequisicaoInternaCabecalho: TRequisicaoInternaCabecalho);
var
  RequisicaoInternaDetalhe: TRequisicaoInternaDetalhe;
begin
  // Detalhes
  for RequisicaoInternaDetalhe in ARequisicaoInternaCabecalho.ListaRequisicaoInternaDetalhe do
  begin
    RequisicaoInternaDetalhe.IdRequisicaoInternaCabecalho := ARequisicaoInternaCabecalho.Id;
    InserirBase(RequisicaoInternaDetalhe, 'REQUISICAO_INTERNA_DETALHE');

    // Atualizar Estoque
    if Assigned(RequisicaoCabOld) then
    begin
      {
        Tava Aberta OU Indeferida E foi Deferida - Drecementa Estoque
        Tava Aberta E foi Indeferida - não faz nada
        Tava Deferida E foi Indeferida OU Aberta - Incrementa Estoque
        Tava Indeferida e foi Aberta - não faz nada
      }
      if ((RequisicaoCabOld.Situacao = 'A') or (RequisicaoCabOld.Situacao = 'I')) and (ARequisicaoInternaCabecalho.Situacao = 'D') then
        TControleEstoqueService.AtualizarEstoque(RequisicaoInternaDetalhe.Produto, RequisicaoInternaDetalhe.Quantidade, 'D')
      else if (RequisicaoCabOld.Situacao = 'D') and ((ARequisicaoInternaCabecalho.Situacao = 'I') or ((ARequisicaoInternaCabecalho.Situacao = 'A'))) then
        TControleEstoqueService.AtualizarEstoque(RequisicaoInternaDetalhe.Produto, RequisicaoInternaDetalhe.Quantidade, 'I');
      end;
  end;
end;

class function TRequisicaoInternaCabecalhoService.Excluir(ARequisicaoInternaCabecalho: TRequisicaoInternaCabecalho): Integer;
begin
  ARequisicaoInternaCabecalho.ValidarExclusao;
  
  Result := ExcluirBase(ARequisicaoInternaCabecalho.Id, 'REQUISICAO_INTERNA_CABECALHO');
end;

class procedure TRequisicaoInternaCabecalhoService.ExcluirObjetosFilhos(ARequisicaoInternaCabecalho: TRequisicaoInternaCabecalho);
var
  RequisicaoInternaDetalhe: TRequisicaoInternaDetalhe;
begin
  for RequisicaoInternaDetalhe in ARequisicaoInternaCabecalho.ListaRequisicaoInternaDetalhe do
  begin
    ExcluirBase(RequisicaoInternaDetalhe.Id, 'REQUISICAO_INTERNA_DETALHE');
  end;
end;

end.
