{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VENDA_COMISSAO] 
                                                                                
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
unit VendaComissaoService;

interface

uses
  VendaComissao, Vendedor, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TVendaComissaoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaVendaComissao: TObjectList<TVendaComissao>); overload;
    class procedure AnexarObjetosVinculados(AVendaComissao: TVendaComissao); overload;
  public
    class function ConsultarLista: TObjectList<TVendaComissao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TVendaComissao>;
    class function ConsultarObjeto(AId: Integer): TVendaComissao;
    class procedure Inserir(AVendaComissao: TVendaComissao);
    class function Alterar(AVendaComissao: TVendaComissao): Integer;
    class function Excluir(AVendaComissao: TVendaComissao): Integer;
  end;

var
  sql: string;


implementation

{ TVendaComissaoService }

class procedure TVendaComissaoService.AnexarObjetosVinculados(AVendaComissao: TVendaComissao);
begin
  // Vendedor
  sql := 'SELECT * FROM VENDEDOR WHERE ID = ' + AVendaComissao.IdVendedor.ToString;
  AVendaComissao.Vendedor := GetQuery(sql).AsObject<TVendedor>;

end;

class procedure TVendaComissaoService.AnexarObjetosVinculados(AListaVendaComissao: TObjectList<TVendaComissao>);
var
  VendaComissao: TVendaComissao;
begin
  for VendaComissao in AListaVendaComissao do
  begin
    AnexarObjetosVinculados(VendaComissao);
  end;
end;

class function TVendaComissaoService.ConsultarLista: TObjectList<TVendaComissao>;
begin
  sql := 'SELECT * FROM VENDA_COMISSAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TVendaComissao>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TVendaComissaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TVendaComissao>;
begin
  sql := 'SELECT * FROM VENDA_COMISSAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TVendaComissao>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TVendaComissaoService.ConsultarObjeto(AId: Integer): TVendaComissao;
begin
  sql := 'SELECT * FROM VENDA_COMISSAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TVendaComissao>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TVendaComissaoService.Inserir(AVendaComissao: TVendaComissao);
begin
  AVendaComissao.ValidarInsercao;
  AVendaComissao.Id := InserirBase(AVendaComissao, 'VENDA_COMISSAO');
  
end;

class function TVendaComissaoService.Alterar(AVendaComissao: TVendaComissao): Integer;
begin
  AVendaComissao.ValidarAlteracao;
  Result := AlterarBase(AVendaComissao, 'VENDA_COMISSAO');
  
  
end;


class function TVendaComissaoService.Excluir(AVendaComissao: TVendaComissao): Integer;
begin
  AVendaComissao.ValidarExclusao;
  
  Result := ExcluirBase(AVendaComissao.Id, 'VENDA_COMISSAO');
end;


end.
