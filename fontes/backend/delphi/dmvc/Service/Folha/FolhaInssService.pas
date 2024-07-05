{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_INSS] 
                                                                                
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
unit FolhaInssService;

interface

uses
  FolhaInss, FolhaInssRetencao, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaInssService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFolhaInss: TObjectList<TFolhaInss>); overload;
    class procedure AnexarObjetosVinculados(AFolhaInss: TFolhaInss); overload;
    class procedure AtualizarObjetosFilhos(AFolhaInss: TFolhaInss);
    class procedure ExcluirObjetosFilhos(AFolhaInss: TFolhaInss);
  public
    class function ConsultarLista: TObjectList<TFolhaInss>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaInss>;
    class function ConsultarObjeto(AId: Integer): TFolhaInss;
    class procedure Inserir(AFolhaInss: TFolhaInss);
    class function Alterar(AFolhaInss: TFolhaInss): Integer;
    class function Excluir(AFolhaInss: TFolhaInss): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaInssService }

class procedure TFolhaInssService.AnexarObjetosVinculados(AFolhaInss: TFolhaInss);
begin
  // FolhaInssRetencao
  sql := 'SELECT * FROM FOLHA_INSS_RETENCAO WHERE ID_FOLHA_INSS = ' + AFolhaInss.Id.ToString;
  AFolhaInss.ListaFolhaInssRetencao := GetQuery(sql).AsObjectList<TFolhaInssRetencao>;

end;

class procedure TFolhaInssService.AtualizarObjetosFilhos(
  AFolhaInss: TFolhaInss);
begin
//
end;

class procedure TFolhaInssService.AnexarObjetosVinculados(AListaFolhaInss: TObjectList<TFolhaInss>);
var
  FolhaInss: TFolhaInss;
begin
  for FolhaInss in AListaFolhaInss do
  begin
    AnexarObjetosVinculados(FolhaInss);
  end;
end;

class function TFolhaInssService.ConsultarLista: TObjectList<TFolhaInss>;
begin
  sql := 'SELECT * FROM FOLHA_INSS ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaInss>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaInssService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaInss>;
begin
  sql := 'SELECT * FROM FOLHA_INSS where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaInss>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaInssService.ConsultarObjeto(AId: Integer): TFolhaInss;
begin
  sql := 'SELECT * FROM FOLHA_INSS WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaInss>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaInssService.Inserir(AFolhaInss: TFolhaInss);
begin
  AFolhaInss.ValidarInsercao;
  AFolhaInss.Id := InserirBase(AFolhaInss, 'FOLHA_INSS');
  
end;

class function TFolhaInssService.Alterar(AFolhaInss: TFolhaInss): Integer;
begin
  AFolhaInss.ValidarAlteracao;
  Result := AlterarBase(AFolhaInss, 'FOLHA_INSS');
  ExcluirObjetosFilhos(AFolhaInss);
  
end;


class function TFolhaInssService.Excluir(AFolhaInss: TFolhaInss): Integer;
begin
  AFolhaInss.ValidarExclusao;
  ExcluirObjetosFilhos(AFolhaInss);
  Result := ExcluirBase(AFolhaInss.Id, 'FOLHA_INSS');
end;

class procedure TFolhaInssService.ExcluirObjetosFilhos(AFolhaInss: TFolhaInss);
begin
  ExcluirFilho(AFolhaInss.Id, 'FOLHA_INSS_RETENCAO', 'ID_FOLHA_INSS');
end;

end.
