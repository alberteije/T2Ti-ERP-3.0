{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_HISTORICO_SALARIAL] 
                                                                                
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
unit FolhaHistoricoSalarialService;

interface

uses
  FolhaHistoricoSalarial, Colaborador, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaHistoricoSalarialService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFolhaHistoricoSalarial: TObjectList<TFolhaHistoricoSalarial>); overload;
    class procedure AnexarObjetosVinculados(AFolhaHistoricoSalarial: TFolhaHistoricoSalarial); overload;
    class procedure AtualizarObjetosFilhos(AFolhaHistoricoSalarial: TFolhaHistoricoSalarial);
    class procedure ExcluirObjetosFilhos(AFolhaHistoricoSalarial: TFolhaHistoricoSalarial);
  public
    class function ConsultarLista: TObjectList<TFolhaHistoricoSalarial>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaHistoricoSalarial>;
    class function ConsultarObjeto(AId: Integer): TFolhaHistoricoSalarial;
    class procedure Inserir(AFolhaHistoricoSalarial: TFolhaHistoricoSalarial);
    class function Alterar(AFolhaHistoricoSalarial: TFolhaHistoricoSalarial): Integer;
    class function Excluir(AFolhaHistoricoSalarial: TFolhaHistoricoSalarial): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaHistoricoSalarialService }

class procedure TFolhaHistoricoSalarialService.AnexarObjetosVinculados(AFolhaHistoricoSalarial: TFolhaHistoricoSalarial);
begin
  // Colaborador
  sql := 'SELECT * FROM COLABORADOR WHERE ID = ' + AFolhaHistoricoSalarial.IdColaborador.ToString;
  AFolhaHistoricoSalarial.Colaborador := GetQuery(sql).AsObject<TColaborador>;

end;

class procedure TFolhaHistoricoSalarialService.AtualizarObjetosFilhos(
  AFolhaHistoricoSalarial: TFolhaHistoricoSalarial);
begin
//
end;

class procedure TFolhaHistoricoSalarialService.AnexarObjetosVinculados(AListaFolhaHistoricoSalarial: TObjectList<TFolhaHistoricoSalarial>);
var
  FolhaHistoricoSalarial: TFolhaHistoricoSalarial;
begin
  for FolhaHistoricoSalarial in AListaFolhaHistoricoSalarial do
  begin
    AnexarObjetosVinculados(FolhaHistoricoSalarial);
  end;
end;

class function TFolhaHistoricoSalarialService.ConsultarLista: TObjectList<TFolhaHistoricoSalarial>;
begin
  sql := 'SELECT * FROM FOLHA_HISTORICO_SALARIAL ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaHistoricoSalarial>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaHistoricoSalarialService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaHistoricoSalarial>;
begin
  sql := 'SELECT * FROM FOLHA_HISTORICO_SALARIAL where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaHistoricoSalarial>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaHistoricoSalarialService.ConsultarObjeto(AId: Integer): TFolhaHistoricoSalarial;
begin
  sql := 'SELECT * FROM FOLHA_HISTORICO_SALARIAL WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaHistoricoSalarial>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaHistoricoSalarialService.Inserir(AFolhaHistoricoSalarial: TFolhaHistoricoSalarial);
begin
  AFolhaHistoricoSalarial.ValidarInsercao;
  AFolhaHistoricoSalarial.Id := InserirBase(AFolhaHistoricoSalarial, 'FOLHA_HISTORICO_SALARIAL');
  
end;

class function TFolhaHistoricoSalarialService.Alterar(AFolhaHistoricoSalarial: TFolhaHistoricoSalarial): Integer;
begin
  AFolhaHistoricoSalarial.ValidarAlteracao;
  Result := AlterarBase(AFolhaHistoricoSalarial, 'FOLHA_HISTORICO_SALARIAL');
  ExcluirObjetosFilhos(AFolhaHistoricoSalarial);
  
end;


class function TFolhaHistoricoSalarialService.Excluir(AFolhaHistoricoSalarial: TFolhaHistoricoSalarial): Integer;
begin
  AFolhaHistoricoSalarial.ValidarExclusao;
  ExcluirObjetosFilhos(AFolhaHistoricoSalarial);
  Result := ExcluirBase(AFolhaHistoricoSalarial.Id, 'FOLHA_HISTORICO_SALARIAL');
end;

class procedure TFolhaHistoricoSalarialService.ExcluirObjetosFilhos(AFolhaHistoricoSalarial: TFolhaHistoricoSalarial);
begin
end;

end.
