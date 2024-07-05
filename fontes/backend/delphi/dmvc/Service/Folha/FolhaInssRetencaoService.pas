{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_INSS_RETENCAO] 
                                                                                
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
unit FolhaInssRetencaoService;

interface

uses
  FolhaInssRetencao, FolhaInssServico, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaInssRetencaoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFolhaInssRetencao: TObjectList<TFolhaInssRetencao>); overload;
    class procedure AnexarObjetosVinculados(AFolhaInssRetencao: TFolhaInssRetencao); overload;
    class procedure AtualizarObjetosFilhos(AFolhaInssRetencao: TFolhaInssRetencao);
    class procedure ExcluirObjetosFilhos(AFolhaInssRetencao: TFolhaInssRetencao);
  public
    class function ConsultarLista: TObjectList<TFolhaInssRetencao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaInssRetencao>;
    class function ConsultarObjeto(AId: Integer): TFolhaInssRetencao;
    class procedure Inserir(AFolhaInssRetencao: TFolhaInssRetencao);
    class function Alterar(AFolhaInssRetencao: TFolhaInssRetencao): Integer;
    class function Excluir(AFolhaInssRetencao: TFolhaInssRetencao): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaInssRetencaoService }

class procedure TFolhaInssRetencaoService.AnexarObjetosVinculados(AFolhaInssRetencao: TFolhaInssRetencao);
begin
  // FolhaInssServico
  sql := 'SELECT * FROM FOLHA_INSS_SERVICO WHERE ID = ' + AFolhaInssRetencao.IdFolhaInssServico.ToString;
  AFolhaInssRetencao.FolhaInssServico := GetQuery(sql).AsObject<TFolhaInssServico>;

end;

class procedure TFolhaInssRetencaoService.AtualizarObjetosFilhos(
  AFolhaInssRetencao: TFolhaInssRetencao);
begin
//
end;

class procedure TFolhaInssRetencaoService.AnexarObjetosVinculados(AListaFolhaInssRetencao: TObjectList<TFolhaInssRetencao>);
var
  FolhaInssRetencao: TFolhaInssRetencao;
begin
  for FolhaInssRetencao in AListaFolhaInssRetencao do
  begin
    AnexarObjetosVinculados(FolhaInssRetencao);
  end;
end;

class function TFolhaInssRetencaoService.ConsultarLista: TObjectList<TFolhaInssRetencao>;
begin
  sql := 'SELECT * FROM FOLHA_INSS_RETENCAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaInssRetencao>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaInssRetencaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaInssRetencao>;
begin
  sql := 'SELECT * FROM FOLHA_INSS_RETENCAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaInssRetencao>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaInssRetencaoService.ConsultarObjeto(AId: Integer): TFolhaInssRetencao;
begin
  sql := 'SELECT * FROM FOLHA_INSS_RETENCAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaInssRetencao>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaInssRetencaoService.Inserir(AFolhaInssRetencao: TFolhaInssRetencao);
begin
  AFolhaInssRetencao.ValidarInsercao;
  AFolhaInssRetencao.Id := InserirBase(AFolhaInssRetencao, 'FOLHA_INSS_RETENCAO');
  
end;

class function TFolhaInssRetencaoService.Alterar(AFolhaInssRetencao: TFolhaInssRetencao): Integer;
begin
  AFolhaInssRetencao.ValidarAlteracao;
  Result := AlterarBase(AFolhaInssRetencao, 'FOLHA_INSS_RETENCAO');
  ExcluirObjetosFilhos(AFolhaInssRetencao);
  
end;


class function TFolhaInssRetencaoService.Excluir(AFolhaInssRetencao: TFolhaInssRetencao): Integer;
begin
  AFolhaInssRetencao.ValidarExclusao;
  ExcluirObjetosFilhos(AFolhaInssRetencao);
  Result := ExcluirBase(AFolhaInssRetencao.Id, 'FOLHA_INSS_RETENCAO');
end;

class procedure TFolhaInssRetencaoService.ExcluirObjetosFilhos(AFolhaInssRetencao: TFolhaInssRetencao);
begin
end;

end.
