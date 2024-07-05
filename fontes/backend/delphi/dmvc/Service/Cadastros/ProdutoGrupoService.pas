{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [PRODUTO_GRUPO] 
                                                                                
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
unit ProdutoGrupoService;

interface

uses
  ProdutoGrupo, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TProdutoGrupoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaProdutoGrupo: TObjectList<TProdutoGrupo>); overload;
    class procedure AnexarObjetosVinculados(AProdutoGrupo: TProdutoGrupo); overload;
  public
    class function ConsultarLista: TObjectList<TProdutoGrupo>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TProdutoGrupo>;
    class function ConsultarObjeto(AId: Integer): TProdutoGrupo;
    class procedure Inserir(AProdutoGrupo: TProdutoGrupo);
    class function Alterar(AProdutoGrupo: TProdutoGrupo): Integer;
    class function Excluir(AProdutoGrupo: TProdutoGrupo): Integer;
  end;

var
  sql: string;


implementation

{ TProdutoGrupoService }

class procedure TProdutoGrupoService.AnexarObjetosVinculados(AProdutoGrupo: TProdutoGrupo);
begin
end;

class procedure TProdutoGrupoService.AnexarObjetosVinculados(AListaProdutoGrupo: TObjectList<TProdutoGrupo>);
var
  ProdutoGrupo: TProdutoGrupo;
begin
  for ProdutoGrupo in AListaProdutoGrupo do
  begin
    AnexarObjetosVinculados(ProdutoGrupo);
  end;
end;

class function TProdutoGrupoService.ConsultarLista: TObjectList<TProdutoGrupo>;
begin
  sql := 'SELECT * FROM PRODUTO_GRUPO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TProdutoGrupo>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TProdutoGrupoService.ConsultarListaFiltro(AWhere: string): TObjectList<TProdutoGrupo>;
begin
  sql := 'SELECT * FROM PRODUTO_GRUPO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TProdutoGrupo>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TProdutoGrupoService.ConsultarObjeto(AId: Integer): TProdutoGrupo;
begin
  sql := 'SELECT * FROM PRODUTO_GRUPO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TProdutoGrupo>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TProdutoGrupoService.Inserir(AProdutoGrupo: TProdutoGrupo);
begin
  AProdutoGrupo.ValidarInsercao;
  AProdutoGrupo.Id := InserirBase(AProdutoGrupo, 'PRODUTO_GRUPO');
  
end;

class function TProdutoGrupoService.Alterar(AProdutoGrupo: TProdutoGrupo): Integer;
begin
  AProdutoGrupo.ValidarAlteracao;
  Result := AlterarBase(AProdutoGrupo, 'PRODUTO_GRUPO');
  
  
end;


class function TProdutoGrupoService.Excluir(AProdutoGrupo: TProdutoGrupo): Integer;
begin
  AProdutoGrupo.ValidarExclusao;
  
  Result := ExcluirBase(AProdutoGrupo.Id, 'PRODUTO_GRUPO');
end;


end.
