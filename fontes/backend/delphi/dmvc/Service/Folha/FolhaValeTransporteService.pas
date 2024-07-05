{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_VALE_TRANSPORTE] 
                                                                                
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
unit FolhaValeTransporteService;

interface

uses
  FolhaValeTransporte, EmpresaTransporte, Colaborador,
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaValeTransporteService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFolhaValeTransporte: TObjectList<TFolhaValeTransporte>); overload;
    class procedure AnexarObjetosVinculados(AFolhaValeTransporte: TFolhaValeTransporte); overload;
    class procedure AtualizarObjetosFilhos(AFolhaValeTransporte: TFolhaValeTransporte);
    class procedure ExcluirObjetosFilhos(AFolhaValeTransporte: TFolhaValeTransporte);
  public
    class function ConsultarLista: TObjectList<TFolhaValeTransporte>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaValeTransporte>;
    class function ConsultarObjeto(AId: Integer): TFolhaValeTransporte;
    class procedure Inserir(AFolhaValeTransporte: TFolhaValeTransporte);
    class function Alterar(AFolhaValeTransporte: TFolhaValeTransporte): Integer;
    class function Excluir(AFolhaValeTransporte: TFolhaValeTransporte): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaValeTransporteService }

class procedure TFolhaValeTransporteService.AnexarObjetosVinculados(AFolhaValeTransporte: TFolhaValeTransporte);
begin
  // EmpresaTransporte
  sql := 'SELECT * FROM EMPRESA_TRANSP_ITIN WHERE ID = ' + AFolhaValeTransporte.IdEmpresaTransporte.ToString;
  AFolhaValeTransporte.EmpresaTransporte := GetQuery(sql).AsObject<TEmpresaTransporte>;

  // Colaborador
  sql := 'SELECT * FROM COLABORADOR WHERE ID = ' + AFolhaValeTransporte.IdColaborador.ToString;
  AFolhaValeTransporte.Colaborador := GetQuery(sql).AsObject<TColaborador>;

end;

class procedure TFolhaValeTransporteService.AtualizarObjetosFilhos(
  AFolhaValeTransporte: TFolhaValeTransporte);
begin
//
end;

class procedure TFolhaValeTransporteService.AnexarObjetosVinculados(AListaFolhaValeTransporte: TObjectList<TFolhaValeTransporte>);
var
  FolhaValeTransporte: TFolhaValeTransporte;
begin
  for FolhaValeTransporte in AListaFolhaValeTransporte do
  begin
    AnexarObjetosVinculados(FolhaValeTransporte);
  end;
end;

class function TFolhaValeTransporteService.ConsultarLista: TObjectList<TFolhaValeTransporte>;
begin
  sql := 'SELECT * FROM FOLHA_VALE_TRANSPORTE ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaValeTransporte>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaValeTransporteService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaValeTransporte>;
begin
  sql := 'SELECT * FROM FOLHA_VALE_TRANSPORTE where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaValeTransporte>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaValeTransporteService.ConsultarObjeto(AId: Integer): TFolhaValeTransporte;
begin
  sql := 'SELECT * FROM FOLHA_VALE_TRANSPORTE WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaValeTransporte>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaValeTransporteService.Inserir(AFolhaValeTransporte: TFolhaValeTransporte);
begin
  AFolhaValeTransporte.ValidarInsercao;
  AFolhaValeTransporte.Id := InserirBase(AFolhaValeTransporte, 'FOLHA_VALE_TRANSPORTE');
  
end;

class function TFolhaValeTransporteService.Alterar(AFolhaValeTransporte: TFolhaValeTransporte): Integer;
begin
  AFolhaValeTransporte.ValidarAlteracao;
  Result := AlterarBase(AFolhaValeTransporte, 'FOLHA_VALE_TRANSPORTE');
  ExcluirObjetosFilhos(AFolhaValeTransporte);
  
end;


class function TFolhaValeTransporteService.Excluir(AFolhaValeTransporte: TFolhaValeTransporte): Integer;
begin
  AFolhaValeTransporte.ValidarExclusao;
  ExcluirObjetosFilhos(AFolhaValeTransporte);
  Result := ExcluirBase(AFolhaValeTransporte.Id, 'FOLHA_VALE_TRANSPORTE');
end;

class procedure TFolhaValeTransporteService.ExcluirObjetosFilhos(AFolhaValeTransporte: TFolhaValeTransporte);
begin
end;

end.
