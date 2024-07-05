{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [PRODUTO_UNIDADE] 
                                                                                
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
unit ProdutoUnidadeService;

interface

uses
  ProdutoUnidade, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TProdutoUnidadeService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaProdutoUnidade: TObjectList<TProdutoUnidade>); overload;
    class procedure AnexarObjetosVinculados(AProdutoUnidade: TProdutoUnidade); overload;
  public
    class function ConsultarLista: TObjectList<TProdutoUnidade>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TProdutoUnidade>;
    class function ConsultarObjeto(AId: Integer): TProdutoUnidade;
    class procedure Inserir(AProdutoUnidade: TProdutoUnidade);
    class function Alterar(AProdutoUnidade: TProdutoUnidade): Integer;
    class function Excluir(AProdutoUnidade: TProdutoUnidade): Integer;
  end;

var
  sql: string;


implementation

{ TProdutoUnidadeService }

class procedure TProdutoUnidadeService.AnexarObjetosVinculados(AProdutoUnidade: TProdutoUnidade);
begin
end;

class procedure TProdutoUnidadeService.AnexarObjetosVinculados(AListaProdutoUnidade: TObjectList<TProdutoUnidade>);
var
  ProdutoUnidade: TProdutoUnidade;
begin
  for ProdutoUnidade in AListaProdutoUnidade do
  begin
    AnexarObjetosVinculados(ProdutoUnidade);
  end;
end;

class function TProdutoUnidadeService.ConsultarLista: TObjectList<TProdutoUnidade>;
begin
  sql := 'SELECT * FROM PRODUTO_UNIDADE ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TProdutoUnidade>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TProdutoUnidadeService.ConsultarListaFiltro(AWhere: string): TObjectList<TProdutoUnidade>;
begin
  sql := 'SELECT * FROM PRODUTO_UNIDADE where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TProdutoUnidade>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TProdutoUnidadeService.ConsultarObjeto(AId: Integer): TProdutoUnidade;
begin
  sql := 'SELECT * FROM PRODUTO_UNIDADE WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TProdutoUnidade>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TProdutoUnidadeService.Inserir(AProdutoUnidade: TProdutoUnidade);
begin
  AProdutoUnidade.ValidarInsercao;
  AProdutoUnidade.Id := InserirBase(AProdutoUnidade, 'PRODUTO_UNIDADE');
  
end;

class function TProdutoUnidadeService.Alterar(AProdutoUnidade: TProdutoUnidade): Integer;
begin
  AProdutoUnidade.ValidarAlteracao;
  Result := AlterarBase(AProdutoUnidade, 'PRODUTO_UNIDADE');
  
  
end;


class function TProdutoUnidadeService.Excluir(AProdutoUnidade: TProdutoUnidade): Integer;
begin
  AProdutoUnidade.ValidarExclusao;
  
  Result := ExcluirBase(AProdutoUnidade.Id, 'PRODUTO_UNIDADE');
end;


end.
