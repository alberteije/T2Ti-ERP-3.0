{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [COMPRA_REQUISICAO] 
                                                                                
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
unit CompraRequisicaoService;

interface

uses
  CompraRequisicao, CompraRequisicaoDetalhe, CompraTipoRequisicao, Colaborador, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TCompraRequisicaoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaCompraRequisicao: TObjectList<TCompraRequisicao>); overload;
    class procedure AnexarObjetosVinculados(ACompraRequisicao: TCompraRequisicao); overload;
    class procedure InserirObjetosFilhos(ACompraRequisicao: TCompraRequisicao);
    class procedure ExcluirObjetosFilhos(ACompraRequisicao: TCompraRequisicao);
  public
    class function ConsultarLista: TObjectList<TCompraRequisicao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TCompraRequisicao>;
    class function ConsultarObjeto(AId: Integer): TCompraRequisicao;
    class procedure Inserir(ACompraRequisicao: TCompraRequisicao);
    class function Alterar(ACompraRequisicao: TCompraRequisicao): Integer;
    class function Excluir(ACompraRequisicao: TCompraRequisicao): Integer;
  end;

var
  sql: string;


implementation

{ TCompraRequisicaoService }

class procedure TCompraRequisicaoService.AnexarObjetosVinculados(ACompraRequisicao: TCompraRequisicao);
begin
  // CompraRequisicaoDetalhe
  sql := 'SELECT * FROM COMPRA_REQUISICAO_DETALHE WHERE ID_COMPRA_REQUISICAO = ' + ACompraRequisicao.Id.ToString;
  ACompraRequisicao.ListaCompraRequisicaoDetalhe := GetQuery(sql).AsObjectList<TCompraRequisicaoDetalhe>;

  // CompraTipoRequisicao
  sql := 'SELECT * FROM COMPRA_TIPO_REQUISICAO WHERE ID = ' + ACompraRequisicao.IdCompraTipoRequisicao.ToString;
  ACompraRequisicao.CompraTipoRequisicao := GetQuery(sql).AsObject<TCompraTipoRequisicao>;

  // Colaborador
  sql := 'SELECT * FROM COLABORADOR WHERE ID = ' + ACompraRequisicao.IdColaborador.ToString;
  ACompraRequisicao.Colaborador := GetQuery(sql).AsObject<TColaborador>;

end;

class procedure TCompraRequisicaoService.AnexarObjetosVinculados(AListaCompraRequisicao: TObjectList<TCompraRequisicao>);
var
  CompraRequisicao: TCompraRequisicao;
begin
  for CompraRequisicao in AListaCompraRequisicao do
  begin
    AnexarObjetosVinculados(CompraRequisicao);
  end;
end;

class function TCompraRequisicaoService.ConsultarLista: TObjectList<TCompraRequisicao>;
begin
  sql := 'SELECT * FROM COMPRA_REQUISICAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TCompraRequisicao>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TCompraRequisicaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TCompraRequisicao>;
begin
  sql := 'SELECT * FROM COMPRA_REQUISICAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TCompraRequisicao>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TCompraRequisicaoService.ConsultarObjeto(AId: Integer): TCompraRequisicao;
begin
  sql := 'SELECT * FROM COMPRA_REQUISICAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TCompraRequisicao>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TCompraRequisicaoService.Inserir(ACompraRequisicao: TCompraRequisicao);
begin
  ACompraRequisicao.ValidarInsercao;
  ACompraRequisicao.Id := InserirBase(ACompraRequisicao, 'COMPRA_REQUISICAO');
  InserirObjetosFilhos(ACompraRequisicao);
end;

class function TCompraRequisicaoService.Alterar(ACompraRequisicao: TCompraRequisicao): Integer;
begin
  ACompraRequisicao.ValidarAlteracao;
  Result := AlterarBase(ACompraRequisicao, 'COMPRA_REQUISICAO');
  ExcluirObjetosFilhos(ACompraRequisicao);
  InserirObjetosFilhos(ACompraRequisicao);
end;

class procedure TCompraRequisicaoService.InserirObjetosFilhos(ACompraRequisicao: TCompraRequisicao);
var
  CompraRequisicaoDetalhe: TCompraRequisicaoDetalhe;
begin
  // CompraRequisicaoDetalhe
  for CompraRequisicaoDetalhe in ACompraRequisicao.ListaCompraRequisicaoDetalhe do
  begin
    CompraRequisicaoDetalhe.IdCompraRequisicao := ACompraRequisicao.Id;
    InserirBase(CompraRequisicaoDetalhe, 'COMPRA_REQUISICAO_DETALHE');
  end;

end;

class function TCompraRequisicaoService.Excluir(ACompraRequisicao: TCompraRequisicao): Integer;
begin
  ACompraRequisicao.ValidarExclusao;
  ExcluirObjetosFilhos(ACompraRequisicao);
  Result := ExcluirBase(ACompraRequisicao.Id, 'COMPRA_REQUISICAO');
end;

class procedure TCompraRequisicaoService.ExcluirObjetosFilhos(ACompraRequisicao: TCompraRequisicao);
begin
  ExcluirFilho(ACompraRequisicao.Id, 'COMPRA_REQUISICAO_DETALHE', 'ID_COMPRA_REQUISICAO');
end;

end.
