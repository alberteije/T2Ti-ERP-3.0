{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [COMISSAO_OBJETIVO] 
                                                                                
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
unit ComissaoObjetivoService;

interface

uses
  ComissaoObjetivo, Produto, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TComissaoObjetivoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaComissaoObjetivo: TObjectList<TComissaoObjetivo>); overload;
    class procedure AnexarObjetosVinculados(AComissaoObjetivo: TComissaoObjetivo); overload;
    class procedure InserirObjetosFilhos(AComissaoObjetivo: TComissaoObjetivo);
    class procedure ExcluirObjetosFilhos(AComissaoObjetivo: TComissaoObjetivo);
  public
    class function ConsultarLista: TObjectList<TComissaoObjetivo>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TComissaoObjetivo>;
    class function ConsultarObjeto(AId: Integer): TComissaoObjetivo;
    class procedure Inserir(AComissaoObjetivo: TComissaoObjetivo);
    class function Alterar(AComissaoObjetivo: TComissaoObjetivo): Integer;
    class function Excluir(AComissaoObjetivo: TComissaoObjetivo): Integer;
  end;

var
  sql: string;


implementation

{ TComissaoObjetivoService }

class procedure TComissaoObjetivoService.AnexarObjetosVinculados(AComissaoObjetivo: TComissaoObjetivo);
begin
  // Produto
  sql := 'SELECT * FROM PRODUTO WHERE ID = ' + AComissaoObjetivo.IdProduto.ToString;
  AComissaoObjetivo.Produto := GetQuery(sql).AsObject<TProduto>;

end;

class procedure TComissaoObjetivoService.AnexarObjetosVinculados(AListaComissaoObjetivo: TObjectList<TComissaoObjetivo>);
var
  ComissaoObjetivo: TComissaoObjetivo;
begin
  for ComissaoObjetivo in AListaComissaoObjetivo do
  begin
    AnexarObjetosVinculados(ComissaoObjetivo);
  end;
end;

class function TComissaoObjetivoService.ConsultarLista: TObjectList<TComissaoObjetivo>;
begin
  sql := 'SELECT * FROM COMISSAO_OBJETIVO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TComissaoObjetivo>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TComissaoObjetivoService.ConsultarListaFiltro(AWhere: string): TObjectList<TComissaoObjetivo>;
begin
  sql := 'SELECT * FROM COMISSAO_OBJETIVO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TComissaoObjetivo>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TComissaoObjetivoService.ConsultarObjeto(AId: Integer): TComissaoObjetivo;
begin
  sql := 'SELECT * FROM COMISSAO_OBJETIVO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TComissaoObjetivo>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TComissaoObjetivoService.Inserir(AComissaoObjetivo: TComissaoObjetivo);
begin
  AComissaoObjetivo.ValidarInsercao;
  AComissaoObjetivo.Id := InserirBase(AComissaoObjetivo, 'COMISSAO_OBJETIVO');
  InserirObjetosFilhos(AComissaoObjetivo);
end;

class function TComissaoObjetivoService.Alterar(AComissaoObjetivo: TComissaoObjetivo): Integer;
begin
  AComissaoObjetivo.ValidarAlteracao;
  Result := AlterarBase(AComissaoObjetivo, 'COMISSAO_OBJETIVO');
  ExcluirObjetosFilhos(AComissaoObjetivo);
  InserirObjetosFilhos(AComissaoObjetivo);
end;

class procedure TComissaoObjetivoService.InserirObjetosFilhos(AComissaoObjetivo: TComissaoObjetivo);
begin
end;

class function TComissaoObjetivoService.Excluir(AComissaoObjetivo: TComissaoObjetivo): Integer;
begin
  AComissaoObjetivo.ValidarExclusao;
  ExcluirObjetosFilhos(AComissaoObjetivo);
  Result := ExcluirBase(AComissaoObjetivo.Id, 'COMISSAO_OBJETIVO');
end;

class procedure TComissaoObjetivoService.ExcluirObjetosFilhos(AComissaoObjetivo: TComissaoObjetivo);
begin
end;

end.
