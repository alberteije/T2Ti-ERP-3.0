{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_PLANO_SAUDE] 
                                                                                
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
unit FolhaPlanoSaudeService;

interface

uses
  FolhaPlanoSaude, Colaborador, OperadoraPlanoSaude, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaPlanoSaudeService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFolhaPlanoSaude: TObjectList<TFolhaPlanoSaude>); overload;
    class procedure AnexarObjetosVinculados(AFolhaPlanoSaude: TFolhaPlanoSaude); overload;
    class procedure AtualizarObjetosFilhos(AFolhaPlanoSaude: TFolhaPlanoSaude);
    class procedure ExcluirObjetosFilhos(AFolhaPlanoSaude: TFolhaPlanoSaude);
  public
    class function ConsultarLista: TObjectList<TFolhaPlanoSaude>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaPlanoSaude>;
    class function ConsultarObjeto(AId: Integer): TFolhaPlanoSaude;
    class procedure Inserir(AFolhaPlanoSaude: TFolhaPlanoSaude);
    class function Alterar(AFolhaPlanoSaude: TFolhaPlanoSaude): Integer;
    class function Excluir(AFolhaPlanoSaude: TFolhaPlanoSaude): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaPlanoSaudeService }

class procedure TFolhaPlanoSaudeService.AnexarObjetosVinculados(AFolhaPlanoSaude: TFolhaPlanoSaude);
begin
  // Colaborador
  sql := 'SELECT * FROM COLABORADOR WHERE ID = ' + AFolhaPlanoSaude.IdColaborador.ToString;
  AFolhaPlanoSaude.Colaborador := GetQuery(sql).AsObject<TColaborador>;

  // OperadoraPlanoSaude
  sql := 'SELECT * FROM OPERADORA_PLANO_SAUDE WHERE ID = ' + AFolhaPlanoSaude.IdOperadoraPlanoSaude.ToString;
  AFolhaPlanoSaude.OperadoraPlanoSaude := GetQuery(sql).AsObject<TOperadoraPlanoSaude>;

end;

class procedure TFolhaPlanoSaudeService.AtualizarObjetosFilhos(
  AFolhaPlanoSaude: TFolhaPlanoSaude);
begin
//
end;

class procedure TFolhaPlanoSaudeService.AnexarObjetosVinculados(AListaFolhaPlanoSaude: TObjectList<TFolhaPlanoSaude>);
var
  FolhaPlanoSaude: TFolhaPlanoSaude;
begin
  for FolhaPlanoSaude in AListaFolhaPlanoSaude do
  begin
    AnexarObjetosVinculados(FolhaPlanoSaude);
  end;
end;

class function TFolhaPlanoSaudeService.ConsultarLista: TObjectList<TFolhaPlanoSaude>;
begin
  sql := 'SELECT * FROM FOLHA_PLANO_SAUDE ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaPlanoSaude>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaPlanoSaudeService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaPlanoSaude>;
begin
  sql := 'SELECT * FROM FOLHA_PLANO_SAUDE where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaPlanoSaude>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaPlanoSaudeService.ConsultarObjeto(AId: Integer): TFolhaPlanoSaude;
begin
  sql := 'SELECT * FROM FOLHA_PLANO_SAUDE WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaPlanoSaude>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaPlanoSaudeService.Inserir(AFolhaPlanoSaude: TFolhaPlanoSaude);
begin
  AFolhaPlanoSaude.ValidarInsercao;
  AFolhaPlanoSaude.Id := InserirBase(AFolhaPlanoSaude, 'FOLHA_PLANO_SAUDE');
  
end;

class function TFolhaPlanoSaudeService.Alterar(AFolhaPlanoSaude: TFolhaPlanoSaude): Integer;
begin
  AFolhaPlanoSaude.ValidarAlteracao;
  Result := AlterarBase(AFolhaPlanoSaude, 'FOLHA_PLANO_SAUDE');
  ExcluirObjetosFilhos(AFolhaPlanoSaude);
  
end;


class function TFolhaPlanoSaudeService.Excluir(AFolhaPlanoSaude: TFolhaPlanoSaude): Integer;
begin
  AFolhaPlanoSaude.ValidarExclusao;
  ExcluirObjetosFilhos(AFolhaPlanoSaude);
  Result := ExcluirBase(AFolhaPlanoSaude.Id, 'FOLHA_PLANO_SAUDE');
end;

class procedure TFolhaPlanoSaudeService.ExcluirObjetosFilhos(AFolhaPlanoSaude: TFolhaPlanoSaude);
begin
end;

end.
