{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_LANCAMENTO_CABECALHO] 
                                                                                
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
unit FolhaLancamentoCabecalhoService;

interface

uses
  FolhaLancamentoCabecalho, FolhaLancamentoDetalhe, Colaborador, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaLancamentoCabecalhoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFolhaLancamentoCabecalho: TObjectList<TFolhaLancamentoCabecalho>); overload;
    class procedure AnexarObjetosVinculados(AFolhaLancamentoCabecalho: TFolhaLancamentoCabecalho); overload;
    class procedure AtualizarObjetosFilhos(AFolhaLancamentoCabecalho: TFolhaLancamentoCabecalho);
    class procedure ExcluirObjetosFilhos(AFolhaLancamentoCabecalho: TFolhaLancamentoCabecalho);
  public
    class function ConsultarLista: TObjectList<TFolhaLancamentoCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaLancamentoCabecalho>;
    class function ConsultarObjeto(AId: Integer): TFolhaLancamentoCabecalho;
    class procedure Inserir(AFolhaLancamentoCabecalho: TFolhaLancamentoCabecalho);
    class function Alterar(AFolhaLancamentoCabecalho: TFolhaLancamentoCabecalho): Integer;
    class function Excluir(AFolhaLancamentoCabecalho: TFolhaLancamentoCabecalho): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaLancamentoCabecalhoService }

class procedure TFolhaLancamentoCabecalhoService.AnexarObjetosVinculados(AFolhaLancamentoCabecalho: TFolhaLancamentoCabecalho);
begin
  // FolhaLancamentoDetalhe
  sql := 'SELECT * FROM FOLHA_LANCAMENTO_DETALHE WHERE ID_FOLHA_LANCAMENTO_CABECALHO = ' + AFolhaLancamentoCabecalho.Id.ToString;
  AFolhaLancamentoCabecalho.ListaFolhaLancamentoDetalhe := GetQuery(sql).AsObjectList<TFolhaLancamentoDetalhe>;

  // Colaborador
  sql := 'SELECT * FROM COLABORADOR WHERE ID = ' + AFolhaLancamentoCabecalho.IdColaborador.ToString;
  AFolhaLancamentoCabecalho.Colaborador := GetQuery(sql).AsObject<TColaborador>;

end;

class procedure TFolhaLancamentoCabecalhoService.AtualizarObjetosFilhos(
  AFolhaLancamentoCabecalho: TFolhaLancamentoCabecalho);
begin
//
end;

class procedure TFolhaLancamentoCabecalhoService.AnexarObjetosVinculados(AListaFolhaLancamentoCabecalho: TObjectList<TFolhaLancamentoCabecalho>);
var
  FolhaLancamentoCabecalho: TFolhaLancamentoCabecalho;
begin
  for FolhaLancamentoCabecalho in AListaFolhaLancamentoCabecalho do
  begin
    AnexarObjetosVinculados(FolhaLancamentoCabecalho);
  end;
end;

class function TFolhaLancamentoCabecalhoService.ConsultarLista: TObjectList<TFolhaLancamentoCabecalho>;
begin
  sql := 'SELECT * FROM FOLHA_LANCAMENTO_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaLancamentoCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaLancamentoCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaLancamentoCabecalho>;
begin
  sql := 'SELECT * FROM FOLHA_LANCAMENTO_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaLancamentoCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaLancamentoCabecalhoService.ConsultarObjeto(AId: Integer): TFolhaLancamentoCabecalho;
begin
  sql := 'SELECT * FROM FOLHA_LANCAMENTO_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaLancamentoCabecalho>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaLancamentoCabecalhoService.Inserir(AFolhaLancamentoCabecalho: TFolhaLancamentoCabecalho);
begin
  AFolhaLancamentoCabecalho.ValidarInsercao;
  AFolhaLancamentoCabecalho.Id := InserirBase(AFolhaLancamentoCabecalho, 'FOLHA_LANCAMENTO_CABECALHO');
  
end;

class function TFolhaLancamentoCabecalhoService.Alterar(AFolhaLancamentoCabecalho: TFolhaLancamentoCabecalho): Integer;
begin
  AFolhaLancamentoCabecalho.ValidarAlteracao;
  Result := AlterarBase(AFolhaLancamentoCabecalho, 'FOLHA_LANCAMENTO_CABECALHO');
  ExcluirObjetosFilhos(AFolhaLancamentoCabecalho);
  
end;


class function TFolhaLancamentoCabecalhoService.Excluir(AFolhaLancamentoCabecalho: TFolhaLancamentoCabecalho): Integer;
begin
  AFolhaLancamentoCabecalho.ValidarExclusao;
  ExcluirObjetosFilhos(AFolhaLancamentoCabecalho);
  Result := ExcluirBase(AFolhaLancamentoCabecalho.Id, 'FOLHA_LANCAMENTO_CABECALHO');
end;

class procedure TFolhaLancamentoCabecalhoService.ExcluirObjetosFilhos(AFolhaLancamentoCabecalho: TFolhaLancamentoCabecalho);
begin
  ExcluirFilho(AFolhaLancamentoCabecalho.Id, 'FOLHA_LANCAMENTO_DETALHE', 'ID_FOLHA_LANCAMENTO_CABECALHO');
end;

end.
