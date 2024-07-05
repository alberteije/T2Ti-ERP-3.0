{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_PPP] 
                                                                                
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
unit FolhaPppService;

interface

uses
  FolhaPpp, FolhaPppAtividade, FolhaPppCat, FolhaPppExameMedico, FolhaPppFatorRisco, Colaborador, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaPppService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFolhaPpp: TObjectList<TFolhaPpp>); overload;
    class procedure AnexarObjetosVinculados(AFolhaPpp: TFolhaPpp); overload;
    class procedure AtualizarObjetosFilhos(AFolhaPpp: TFolhaPpp);
    class procedure ExcluirObjetosFilhos(AFolhaPpp: TFolhaPpp);
  public
    class function ConsultarLista: TObjectList<TFolhaPpp>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaPpp>;
    class function ConsultarObjeto(AId: Integer): TFolhaPpp;
    class procedure Inserir(AFolhaPpp: TFolhaPpp);
    class function Alterar(AFolhaPpp: TFolhaPpp): Integer;
    class function Excluir(AFolhaPpp: TFolhaPpp): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaPppService }

class procedure TFolhaPppService.AnexarObjetosVinculados(AFolhaPpp: TFolhaPpp);
begin
  // FolhaPppAtividade
  sql := 'SELECT * FROM FOLHA_PPP_ATIVIDADE WHERE ID_FOLHA_PPP = ' + AFolhaPpp.Id.ToString;
  AFolhaPpp.ListaFolhaPppAtividade := GetQuery(sql).AsObjectList<TFolhaPppAtividade>;

  // FolhaPppCat
  sql := 'SELECT * FROM FOLHA_PPP_CAT WHERE ID_FOLHA_PPP = ' + AFolhaPpp.Id.ToString;
  AFolhaPpp.ListaFolhaPppCat := GetQuery(sql).AsObjectList<TFolhaPppCat>;

  // FolhaPppExameMedico
  sql := 'SELECT * FROM FOLHA_PPP_EXAME_MEDICO WHERE ID_FOLHA_PPP = ' + AFolhaPpp.Id.ToString;
  AFolhaPpp.ListaFolhaPppExameMedico := GetQuery(sql).AsObjectList<TFolhaPppExameMedico>;

  // FolhaPppFatorRisco
  sql := 'SELECT * FROM FOLHA_PPP_FATOR_RISCO WHERE ID_FOLHA_PPP = ' + AFolhaPpp.Id.ToString;
  AFolhaPpp.ListaFolhaPppFatorRisco := GetQuery(sql).AsObjectList<TFolhaPppFatorRisco>;

  // Colaborador
  sql := 'SELECT * FROM COLABORADOR WHERE ID = ' + AFolhaPpp.IdColaborador.ToString;
  AFolhaPpp.Colaborador := GetQuery(sql).AsObject<TColaborador>;

end;

class procedure TFolhaPppService.AtualizarObjetosFilhos(AFolhaPpp: TFolhaPpp);
begin
//
end;

class procedure TFolhaPppService.AnexarObjetosVinculados(AListaFolhaPpp: TObjectList<TFolhaPpp>);
var
  FolhaPpp: TFolhaPpp;
begin
  for FolhaPpp in AListaFolhaPpp do
  begin
    AnexarObjetosVinculados(FolhaPpp);
  end;
end;

class function TFolhaPppService.ConsultarLista: TObjectList<TFolhaPpp>;
begin
  sql := 'SELECT * FROM FOLHA_PPP ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaPpp>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaPppService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaPpp>;
begin
  sql := 'SELECT * FROM FOLHA_PPP where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaPpp>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaPppService.ConsultarObjeto(AId: Integer): TFolhaPpp;
begin
  sql := 'SELECT * FROM FOLHA_PPP WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaPpp>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaPppService.Inserir(AFolhaPpp: TFolhaPpp);
begin
  AFolhaPpp.ValidarInsercao;
  AFolhaPpp.Id := InserirBase(AFolhaPpp, 'FOLHA_PPP');
  
end;

class function TFolhaPppService.Alterar(AFolhaPpp: TFolhaPpp): Integer;
begin
  AFolhaPpp.ValidarAlteracao;
  Result := AlterarBase(AFolhaPpp, 'FOLHA_PPP');
  ExcluirObjetosFilhos(AFolhaPpp);
  
end;


class function TFolhaPppService.Excluir(AFolhaPpp: TFolhaPpp): Integer;
begin
  AFolhaPpp.ValidarExclusao;
  ExcluirObjetosFilhos(AFolhaPpp);
  Result := ExcluirBase(AFolhaPpp.Id, 'FOLHA_PPP');
end;

class procedure TFolhaPppService.ExcluirObjetosFilhos(AFolhaPpp: TFolhaPpp);
begin
  ExcluirFilho(AFolhaPpp.Id, 'FOLHA_PPP_ATIVIDADE', 'ID_FOLHA_PPP');
  ExcluirFilho(AFolhaPpp.Id, 'FOLHA_PPP_CAT', 'ID_FOLHA_PPP');
  ExcluirFilho(AFolhaPpp.Id, 'FOLHA_PPP_EXAME_MEDICO', 'ID_FOLHA_PPP');
  ExcluirFilho(AFolhaPpp.Id, 'FOLHA_PPP_FATOR_RISCO', 'ID_FOLHA_PPP');
end;

end.
