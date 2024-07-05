{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VENDEDOR_META] 
                                                                                
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
unit VendedorMetaService;

interface

uses
  VendedorMeta, Vendedor, Cliente, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TVendedorMetaService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaVendedorMeta: TObjectList<TVendedorMeta>); overload;
    class procedure AnexarObjetosVinculados(AVendedorMeta: TVendedorMeta); overload;
    class procedure InserirObjetosFilhos(AVendedorMeta: TVendedorMeta);
    class procedure ExcluirObjetosFilhos(AVendedorMeta: TVendedorMeta);
  public
    class function ConsultarLista: TObjectList<TVendedorMeta>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TVendedorMeta>;
    class function ConsultarObjeto(AId: Integer): TVendedorMeta;
    class procedure Inserir(AVendedorMeta: TVendedorMeta);
    class function Alterar(AVendedorMeta: TVendedorMeta): Integer;
    class function Excluir(AVendedorMeta: TVendedorMeta): Integer;
  end;

var
  sql: string;


implementation

{ TVendedorMetaService }

class procedure TVendedorMetaService.AnexarObjetosVinculados(AVendedorMeta: TVendedorMeta);
begin
  // Vendedor
  sql := 'SELECT * FROM VENDEDOR WHERE ID = ' + AVendedorMeta.IdVendedor.ToString;
  AVendedorMeta.Vendedor := GetQuery(sql).AsObject<TVendedor>;

  // Cliente
  sql := 'SELECT * FROM CLIENTE WHERE ID = ' + AVendedorMeta.IdCliente.ToString;
  AVendedorMeta.Cliente := GetQuery(sql).AsObject<TCliente>;

end;

class procedure TVendedorMetaService.AnexarObjetosVinculados(AListaVendedorMeta: TObjectList<TVendedorMeta>);
var
  VendedorMeta: TVendedorMeta;
begin
  for VendedorMeta in AListaVendedorMeta do
  begin
    AnexarObjetosVinculados(VendedorMeta);
  end;
end;

class function TVendedorMetaService.ConsultarLista: TObjectList<TVendedorMeta>;
begin
  sql := 'SELECT * FROM VENDEDOR_META ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TVendedorMeta>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TVendedorMetaService.ConsultarListaFiltro(AWhere: string): TObjectList<TVendedorMeta>;
begin
  sql := 'SELECT * FROM VENDEDOR_META where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TVendedorMeta>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TVendedorMetaService.ConsultarObjeto(AId: Integer): TVendedorMeta;
begin
  sql := 'SELECT * FROM VENDEDOR_META WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TVendedorMeta>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TVendedorMetaService.Inserir(AVendedorMeta: TVendedorMeta);
begin
  AVendedorMeta.ValidarInsercao;
  AVendedorMeta.Id := InserirBase(AVendedorMeta, 'VENDEDOR_META');
  InserirObjetosFilhos(AVendedorMeta);
end;

class function TVendedorMetaService.Alterar(AVendedorMeta: TVendedorMeta): Integer;
begin
  AVendedorMeta.ValidarAlteracao;
  Result := AlterarBase(AVendedorMeta, 'VENDEDOR_META');
  ExcluirObjetosFilhos(AVendedorMeta);
  InserirObjetosFilhos(AVendedorMeta);
end;

class procedure TVendedorMetaService.InserirObjetosFilhos(AVendedorMeta: TVendedorMeta);
begin
end;

class function TVendedorMetaService.Excluir(AVendedorMeta: TVendedorMeta): Integer;
begin
  AVendedorMeta.ValidarExclusao;
  ExcluirObjetosFilhos(AVendedorMeta);
  Result := ExcluirBase(AVendedorMeta.Id, 'VENDEDOR_META');
end;

class procedure TVendedorMetaService.ExcluirObjetosFilhos(AVendedorMeta: TVendedorMeta);
begin
end;

end.
