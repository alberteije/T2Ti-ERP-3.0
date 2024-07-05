{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VIEW_PESSOA_CLIENTE] 
                                                                                
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
unit ViewPessoaClienteService;

interface

uses
  ViewPessoaCliente, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TViewPessoaClienteService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaViewPessoaCliente: TObjectList<TViewPessoaCliente>); overload;
    class procedure AnexarObjetosVinculados(AViewPessoaCliente: TViewPessoaCliente); overload;
  public
    class function ConsultarLista: TObjectList<TViewPessoaCliente>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TViewPessoaCliente>;
    class function ConsultarObjeto(AId: Integer): TViewPessoaCliente;
    class procedure Inserir(AViewPessoaCliente: TViewPessoaCliente);
    class function Alterar(AViewPessoaCliente: TViewPessoaCliente): Integer;
    class function Excluir(AViewPessoaCliente: TViewPessoaCliente): Integer;
  end;

var
  sql: string;


implementation

{ TViewPessoaClienteService }

class procedure TViewPessoaClienteService.AnexarObjetosVinculados(AViewPessoaCliente: TViewPessoaCliente);
begin
end;

class procedure TViewPessoaClienteService.AnexarObjetosVinculados(AListaViewPessoaCliente: TObjectList<TViewPessoaCliente>);
var
  ViewPessoaCliente: TViewPessoaCliente;
begin
  for ViewPessoaCliente in AListaViewPessoaCliente do
  begin
    AnexarObjetosVinculados(ViewPessoaCliente);
  end;
end;

class function TViewPessoaClienteService.ConsultarLista: TObjectList<TViewPessoaCliente>;
begin
  sql := 'SELECT * FROM VIEW_PESSOA_CLIENTE ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TViewPessoaCliente>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewPessoaClienteService.ConsultarListaFiltro(AWhere: string): TObjectList<TViewPessoaCliente>;
begin
  sql := 'SELECT * FROM VIEW_PESSOA_CLIENTE where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TViewPessoaCliente>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewPessoaClienteService.ConsultarObjeto(AId: Integer): TViewPessoaCliente;
begin
  sql := 'SELECT * FROM VIEW_PESSOA_CLIENTE WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TViewPessoaCliente>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TViewPessoaClienteService.Inserir(AViewPessoaCliente: TViewPessoaCliente);
begin
  AViewPessoaCliente.ValidarInsercao;
  AViewPessoaCliente.Id := InserirBase(AViewPessoaCliente, 'VIEW_PESSOA_CLIENTE');
  
end;

class function TViewPessoaClienteService.Alterar(AViewPessoaCliente: TViewPessoaCliente): Integer;
begin
  AViewPessoaCliente.ValidarAlteracao;
  Result := AlterarBase(AViewPessoaCliente, 'VIEW_PESSOA_CLIENTE');
  
  
end;


class function TViewPessoaClienteService.Excluir(AViewPessoaCliente: TViewPessoaCliente): Integer;
begin
  AViewPessoaCliente.ValidarExclusao;
  
  Result := ExcluirBase(AViewPessoaCliente.Id, 'VIEW_PESSOA_CLIENTE');
end;


end.
