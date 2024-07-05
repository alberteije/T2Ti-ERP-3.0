{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [VIEW_PESSOA_VENDEDOR] 
                                                                                
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
unit ViewPessoaVendedorService;

interface

uses
  ViewPessoaVendedor, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TViewPessoaVendedorService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TViewPessoaVendedor>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TViewPessoaVendedor>;
    class function ConsultarObjeto(AId: Integer): TViewPessoaVendedor;
    class procedure Inserir(AViewPessoaVendedor: TViewPessoaVendedor);
    class function Alterar(AViewPessoaVendedor: TViewPessoaVendedor): Integer;
    class function Excluir(AViewPessoaVendedor: TViewPessoaVendedor): Integer;
  end;

var
  sql: string;


implementation

{ TViewPessoaVendedorService }



class function TViewPessoaVendedorService.ConsultarLista: TObjectList<TViewPessoaVendedor>;
begin
  sql := 'SELECT * FROM VIEW_PESSOA_VENDEDOR ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TViewPessoaVendedor>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewPessoaVendedorService.ConsultarListaFiltro(AWhere: string): TObjectList<TViewPessoaVendedor>;
begin
  sql := 'SELECT * FROM VIEW_PESSOA_VENDEDOR where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TViewPessoaVendedor>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewPessoaVendedorService.ConsultarObjeto(AId: Integer): TViewPessoaVendedor;
begin
  sql := 'SELECT * FROM VIEW_PESSOA_VENDEDOR WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TViewPessoaVendedor>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TViewPessoaVendedorService.Inserir(AViewPessoaVendedor: TViewPessoaVendedor);
begin
  AViewPessoaVendedor.ValidarInsercao;
  AViewPessoaVendedor.Id := InserirBase(AViewPessoaVendedor, 'VIEW_PESSOA_VENDEDOR');
  
end;

class function TViewPessoaVendedorService.Alterar(AViewPessoaVendedor: TViewPessoaVendedor): Integer;
begin
  AViewPessoaVendedor.ValidarAlteracao;
  Result := AlterarBase(AViewPessoaVendedor, 'VIEW_PESSOA_VENDEDOR');
  
  
end;


class function TViewPessoaVendedorService.Excluir(AViewPessoaVendedor: TViewPessoaVendedor): Integer;
begin
  AViewPessoaVendedor.ValidarExclusao;
  
  Result := ExcluirBase(AViewPessoaVendedor.Id, 'VIEW_PESSOA_VENDEDOR');
end;


end.
