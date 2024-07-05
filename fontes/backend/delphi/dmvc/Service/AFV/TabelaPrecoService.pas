{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [TABELA_PRECO] 
                                                                                
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
unit TabelaPrecoService;

interface

uses
  TabelaPreco, TabelaPrecoProduto, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TTabelaPrecoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaTabelaPreco: TObjectList<TTabelaPreco>); overload;
    class procedure AnexarObjetosVinculados(ATabelaPreco: TTabelaPreco); overload;
    class procedure InserirObjetosFilhos(ATabelaPreco: TTabelaPreco);
    class procedure ExcluirObjetosFilhos(ATabelaPreco: TTabelaPreco);
  public
    class function ConsultarLista: TObjectList<TTabelaPreco>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TTabelaPreco>;
    class function ConsultarObjeto(AId: Integer): TTabelaPreco;
    class procedure Inserir(ATabelaPreco: TTabelaPreco);
    class function Alterar(ATabelaPreco: TTabelaPreco): Integer;
    class function Excluir(ATabelaPreco: TTabelaPreco): Integer;
  end;

var
  sql: string;


implementation

{ TTabelaPrecoService }

class procedure TTabelaPrecoService.AnexarObjetosVinculados(ATabelaPreco: TTabelaPreco);
begin
  // TabelaPrecoProduto
  sql := 'SELECT * FROM TABELA_PRECO_PRODUTO WHERE ID_TABELA_PRECO = ' + ATabelaPreco.Id.ToString;
  ATabelaPreco.ListaTabelaPrecoProduto := GetQuery(sql).AsObjectList<TTabelaPrecoProduto>;

end;

class procedure TTabelaPrecoService.AnexarObjetosVinculados(AListaTabelaPreco: TObjectList<TTabelaPreco>);
var
  TabelaPreco: TTabelaPreco;
begin
  for TabelaPreco in AListaTabelaPreco do
  begin
    AnexarObjetosVinculados(TabelaPreco);
  end;
end;

class function TTabelaPrecoService.ConsultarLista: TObjectList<TTabelaPreco>;
begin
  sql := 'SELECT * FROM TABELA_PRECO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TTabelaPreco>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTabelaPrecoService.ConsultarListaFiltro(AWhere: string): TObjectList<TTabelaPreco>;
begin
  sql := 'SELECT * FROM TABELA_PRECO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TTabelaPreco>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTabelaPrecoService.ConsultarObjeto(AId: Integer): TTabelaPreco;
begin
  sql := 'SELECT * FROM TABELA_PRECO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TTabelaPreco>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TTabelaPrecoService.Inserir(ATabelaPreco: TTabelaPreco);
begin
  ATabelaPreco.ValidarInsercao;
  ATabelaPreco.Id := InserirBase(ATabelaPreco, 'TABELA_PRECO');
  InserirObjetosFilhos(ATabelaPreco);
end;

class function TTabelaPrecoService.Alterar(ATabelaPreco: TTabelaPreco): Integer;
begin
  ATabelaPreco.ValidarAlteracao;
  Result := AlterarBase(ATabelaPreco, 'TABELA_PRECO');
  ExcluirObjetosFilhos(ATabelaPreco);
  InserirObjetosFilhos(ATabelaPreco);
end;

class procedure TTabelaPrecoService.InserirObjetosFilhos(ATabelaPreco: TTabelaPreco);
var
  TabelaPrecoProduto: TTabelaPrecoProduto;
begin
  // TabelaPrecoProduto
  for TabelaPrecoProduto in ATabelaPreco.ListaTabelaPrecoProduto do
  begin
    TabelaPrecoProduto.IdTabelaPreco := ATabelaPreco.Id;
    InserirBase(TabelaPrecoProduto, 'TABELA_PRECO_PRODUTO');
  end;

end;

class function TTabelaPrecoService.Excluir(ATabelaPreco: TTabelaPreco): Integer;
begin
  ATabelaPreco.ValidarExclusao;
  ExcluirObjetosFilhos(ATabelaPreco);
  Result := ExcluirBase(ATabelaPreco.Id, 'TABELA_PRECO');
end;

class procedure TTabelaPrecoService.ExcluirObjetosFilhos(ATabelaPreco: TTabelaPreco);
begin
  ExcluirFilho(ATabelaPreco.Id, 'TABELA_PRECO_PRODUTO', 'ID_TABELA_PRECO');
end;

end.
