{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [TRIBUT_GRUPO_TRIBUTARIO] 
                                                                                
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
unit TributGrupoTributarioService;

interface

uses
  TributGrupoTributario, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TTributGrupoTributarioService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaTributGrupoTributario: TObjectList<TTributGrupoTributario>); overload;
    class procedure AnexarObjetosVinculados(ATributGrupoTributario: TTributGrupoTributario); overload;
  public
    class function ConsultarLista: TObjectList<TTributGrupoTributario>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TTributGrupoTributario>;
    class function ConsultarObjeto(AId: Integer): TTributGrupoTributario;
    class procedure Inserir(ATributGrupoTributario: TTributGrupoTributario);
    class function Alterar(ATributGrupoTributario: TTributGrupoTributario): Integer;
    class function Excluir(ATributGrupoTributario: TTributGrupoTributario): Integer;
  end;

var
  sql: string;


implementation

{ TTributGrupoTributarioService }

class procedure TTributGrupoTributarioService.AnexarObjetosVinculados(ATributGrupoTributario: TTributGrupoTributario);
begin
end;

class procedure TTributGrupoTributarioService.AnexarObjetosVinculados(AListaTributGrupoTributario: TObjectList<TTributGrupoTributario>);
var
  TributGrupoTributario: TTributGrupoTributario;
begin
  for TributGrupoTributario in AListaTributGrupoTributario do
  begin
    AnexarObjetosVinculados(TributGrupoTributario);
  end;
end;

class function TTributGrupoTributarioService.ConsultarLista: TObjectList<TTributGrupoTributario>;
begin
  sql := 'SELECT * FROM TRIBUT_GRUPO_TRIBUTARIO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TTributGrupoTributario>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTributGrupoTributarioService.ConsultarListaFiltro(AWhere: string): TObjectList<TTributGrupoTributario>;
begin
  sql := 'SELECT * FROM TRIBUT_GRUPO_TRIBUTARIO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TTributGrupoTributario>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTributGrupoTributarioService.ConsultarObjeto(AId: Integer): TTributGrupoTributario;
begin
  sql := 'SELECT * FROM TRIBUT_GRUPO_TRIBUTARIO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TTributGrupoTributario>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TTributGrupoTributarioService.Inserir(ATributGrupoTributario: TTributGrupoTributario);
begin
  ATributGrupoTributario.ValidarInsercao;
  ATributGrupoTributario.Id := InserirBase(ATributGrupoTributario, 'TRIBUT_GRUPO_TRIBUTARIO');
  
end;

class function TTributGrupoTributarioService.Alterar(ATributGrupoTributario: TTributGrupoTributario): Integer;
begin
  ATributGrupoTributario.ValidarAlteracao;
  Result := AlterarBase(ATributGrupoTributario, 'TRIBUT_GRUPO_TRIBUTARIO');
  
  
end;


class function TTributGrupoTributarioService.Excluir(ATributGrupoTributario: TTributGrupoTributario): Integer;
begin
  ATributGrupoTributario.ValidarExclusao;
  
  Result := ExcluirBase(ATributGrupoTributario.Id, 'TRIBUT_GRUPO_TRIBUTARIO');
end;


end.
