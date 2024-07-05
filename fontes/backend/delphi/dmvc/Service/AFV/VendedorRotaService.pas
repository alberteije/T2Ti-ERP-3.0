{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VENDEDOR_ROTA] 
                                                                                
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
unit VendedorRotaService;

interface

uses
  VendedorRota, Vendedor, Cliente, ViewPessoaCliente,
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TVendedorRotaService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaVendedorRota: TObjectList<TVendedorRota>); overload;
    class procedure AnexarObjetosVinculados(AVendedorRota: TVendedorRota); overload;
    class procedure InserirObjetosFilhos(AVendedorRota: TVendedorRota);
    class procedure ExcluirObjetosFilhos(AVendedorRota: TVendedorRota);
  public
    class function ConsultarLista: TObjectList<TVendedorRota>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TVendedorRota>;
    class function ConsultarObjeto(AId: Integer): TVendedorRota;
    class procedure Inserir(AVendedorRota: TVendedorRota);
    class function Alterar(AVendedorRota: TVendedorRota): Integer;
    class function Excluir(AVendedorRota: TVendedorRota): Integer;
  end;

var
  sql: string;


implementation

{ TVendedorRotaService }

class procedure TVendedorRotaService.AnexarObjetosVinculados(AVendedorRota: TVendedorRota);
begin
  // Vendedor
  sql := 'SELECT * FROM VENDEDOR WHERE ID = ' + AVendedorRota.IdVendedor.ToString;
  AVendedorRota.Vendedor := GetQuery(sql).AsObject<TVendedor>;

  // Cliente
  sql := 'SELECT * FROM CLIENTE WHERE ID = ' + AVendedorRota.IdCliente.ToString;
  AVendedorRota.Cliente := GetQuery(sql).AsObject<TCliente>;

  // ViewPessoaCliente
  sql := 'SELECT * FROM VIEW_PESSOA_CLIENTE WHERE ID = ' + AVendedorRota.Cliente.IdPessoa.ToString;
  AVendedorRota.Cliente.ViewPessoaCliente := GetQuery(sql).AsObject<TViewPessoaCliente>;

end;

class procedure TVendedorRotaService.AnexarObjetosVinculados(AListaVendedorRota: TObjectList<TVendedorRota>);
var
  VendedorRota: TVendedorRota;
begin
  for VendedorRota in AListaVendedorRota do
  begin
    AnexarObjetosVinculados(VendedorRota);
  end;
end;

class function TVendedorRotaService.ConsultarLista: TObjectList<TVendedorRota>;
begin
  sql := 'SELECT * FROM VENDEDOR_ROTA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TVendedorRota>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TVendedorRotaService.ConsultarListaFiltro(AWhere: string): TObjectList<TVendedorRota>;
begin
  sql := 'SELECT * FROM VENDEDOR_ROTA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TVendedorRota>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TVendedorRotaService.ConsultarObjeto(AId: Integer): TVendedorRota;
begin
  sql := 'SELECT * FROM VENDEDOR_ROTA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TVendedorRota>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TVendedorRotaService.Inserir(AVendedorRota: TVendedorRota);
begin
  AVendedorRota.ValidarInsercao;
  AVendedorRota.Id := InserirBase(AVendedorRota, 'VENDEDOR_ROTA');
  InserirObjetosFilhos(AVendedorRota);
end;

class function TVendedorRotaService.Alterar(AVendedorRota: TVendedorRota): Integer;
begin
  AVendedorRota.ValidarAlteracao;
  Result := AlterarBase(AVendedorRota, 'VENDEDOR_ROTA');
  ExcluirObjetosFilhos(AVendedorRota);
  InserirObjetosFilhos(AVendedorRota);
end;

class procedure TVendedorRotaService.InserirObjetosFilhos(AVendedorRota: TVendedorRota);
begin
end;

class function TVendedorRotaService.Excluir(AVendedorRota: TVendedorRota): Integer;
begin
  AVendedorRota.ValidarExclusao;
  ExcluirObjetosFilhos(AVendedorRota);
  Result := ExcluirBase(AVendedorRota.Id, 'VENDEDOR_ROTA');
end;

class procedure TVendedorRotaService.ExcluirObjetosFilhos(AVendedorRota: TVendedorRota);
begin
end;

end.
