{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_LANCAMENTO_COMISSAO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
unit FolhaLancamentoComissaoService;

interface

uses
  FolhaLancamentoComissao, Vendedor, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaLancamentoComissaoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFolhaLancamentoComissao: TObjectList<TFolhaLancamentoComissao>); overload;
    class procedure AnexarObjetosVinculados(AFolhaLancamentoComissao: TFolhaLancamentoComissao); overload;
    class procedure AtualizarObjetosFilhos(AFolhaLancamentoComissao: TFolhaLancamentoComissao);
    class procedure ExcluirObjetosFilhos(AFolhaLancamentoComissao: TFolhaLancamentoComissao);
  public
    class function ConsultarLista: TObjectList<TFolhaLancamentoComissao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaLancamentoComissao>;
    class function ConsultarObjeto(AId: Integer): TFolhaLancamentoComissao;
    class procedure Inserir(AFolhaLancamentoComissao: TFolhaLancamentoComissao);
    class function Alterar(AFolhaLancamentoComissao: TFolhaLancamentoComissao): Integer;
    class function Excluir(AFolhaLancamentoComissao: TFolhaLancamentoComissao): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaLancamentoComissaoService }

class procedure TFolhaLancamentoComissaoService.AnexarObjetosVinculados(AFolhaLancamentoComissao: TFolhaLancamentoComissao);
begin
  // Vendedor
  sql := 'SELECT * FROM VENDEDOR WHERE ID = ' + AFolhaLancamentoComissao.IdVendedor.ToString;
  AFolhaLancamentoComissao.Vendedor := GetQuery(sql).AsObject<TVendedor>;

end;

class procedure TFolhaLancamentoComissaoService.AtualizarObjetosFilhos(
  AFolhaLancamentoComissao: TFolhaLancamentoComissao);
begin
//
end;

class procedure TFolhaLancamentoComissaoService.AnexarObjetosVinculados(AListaFolhaLancamentoComissao: TObjectList<TFolhaLancamentoComissao>);
var
  FolhaLancamentoComissao: TFolhaLancamentoComissao;
begin
  for FolhaLancamentoComissao in AListaFolhaLancamentoComissao do
  begin
    AnexarObjetosVinculados(FolhaLancamentoComissao);
  end;
end;

class function TFolhaLancamentoComissaoService.ConsultarLista: TObjectList<TFolhaLancamentoComissao>;
begin
  sql := 'SELECT * FROM FOLHA_LANCAMENTO_COMISSAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaLancamentoComissao>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaLancamentoComissaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaLancamentoComissao>;
begin
  sql := 'SELECT * FROM FOLHA_LANCAMENTO_COMISSAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaLancamentoComissao>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaLancamentoComissaoService.ConsultarObjeto(AId: Integer): TFolhaLancamentoComissao;
begin
  sql := 'SELECT * FROM FOLHA_LANCAMENTO_COMISSAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaLancamentoComissao>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaLancamentoComissaoService.Inserir(AFolhaLancamentoComissao: TFolhaLancamentoComissao);
begin
  AFolhaLancamentoComissao.ValidarInsercao;
  AFolhaLancamentoComissao.Id := InserirBase(AFolhaLancamentoComissao, 'FOLHA_LANCAMENTO_COMISSAO');
  
end;

class function TFolhaLancamentoComissaoService.Alterar(AFolhaLancamentoComissao: TFolhaLancamentoComissao): Integer;
begin
  AFolhaLancamentoComissao.ValidarAlteracao;
  Result := AlterarBase(AFolhaLancamentoComissao, 'FOLHA_LANCAMENTO_COMISSAO');
  ExcluirObjetosFilhos(AFolhaLancamentoComissao);
  
end;


class function TFolhaLancamentoComissaoService.Excluir(AFolhaLancamentoComissao: TFolhaLancamentoComissao): Integer;
begin
  AFolhaLancamentoComissao.ValidarExclusao;
  ExcluirObjetosFilhos(AFolhaLancamentoComissao);
  Result := ExcluirBase(AFolhaLancamentoComissao.Id, 'FOLHA_LANCAMENTO_COMISSAO');
end;

class procedure TFolhaLancamentoComissaoService.ExcluirObjetosFilhos(AFolhaLancamentoComissao: TFolhaLancamentoComissao);
begin
end;

end.
