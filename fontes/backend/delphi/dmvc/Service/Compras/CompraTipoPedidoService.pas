{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [COMPRA_TIPO_PEDIDO] 
                                                                                
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
unit CompraTipoPedidoService;

interface

uses
  CompraTipoPedido, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TCompraTipoPedidoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaCompraTipoPedido: TObjectList<TCompraTipoPedido>); overload;
    class procedure AnexarObjetosVinculados(ACompraTipoPedido: TCompraTipoPedido); overload;
  public
    class function ConsultarLista: TObjectList<TCompraTipoPedido>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TCompraTipoPedido>;
    class function ConsultarObjeto(AId: Integer): TCompraTipoPedido;
    class procedure Inserir(ACompraTipoPedido: TCompraTipoPedido);
    class function Alterar(ACompraTipoPedido: TCompraTipoPedido): Integer;
    class function Excluir(ACompraTipoPedido: TCompraTipoPedido): Integer;
  end;

var
  sql: string;


implementation

{ TCompraTipoPedidoService }

class procedure TCompraTipoPedidoService.AnexarObjetosVinculados(ACompraTipoPedido: TCompraTipoPedido);
begin
end;

class procedure TCompraTipoPedidoService.AnexarObjetosVinculados(AListaCompraTipoPedido: TObjectList<TCompraTipoPedido>);
var
  CompraTipoPedido: TCompraTipoPedido;
begin
  for CompraTipoPedido in AListaCompraTipoPedido do
  begin
    AnexarObjetosVinculados(CompraTipoPedido);
  end;
end;

class function TCompraTipoPedidoService.ConsultarLista: TObjectList<TCompraTipoPedido>;
begin
  sql := 'SELECT * FROM COMPRA_TIPO_PEDIDO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TCompraTipoPedido>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TCompraTipoPedidoService.ConsultarListaFiltro(AWhere: string): TObjectList<TCompraTipoPedido>;
begin
  sql := 'SELECT * FROM COMPRA_TIPO_PEDIDO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TCompraTipoPedido>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TCompraTipoPedidoService.ConsultarObjeto(AId: Integer): TCompraTipoPedido;
begin
  sql := 'SELECT * FROM COMPRA_TIPO_PEDIDO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TCompraTipoPedido>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TCompraTipoPedidoService.Inserir(ACompraTipoPedido: TCompraTipoPedido);
begin
  ACompraTipoPedido.ValidarInsercao;
  ACompraTipoPedido.Id := InserirBase(ACompraTipoPedido, 'COMPRA_TIPO_PEDIDO');
  
end;

class function TCompraTipoPedidoService.Alterar(ACompraTipoPedido: TCompraTipoPedido): Integer;
begin
  ACompraTipoPedido.ValidarAlteracao;
  Result := AlterarBase(ACompraTipoPedido, 'COMPRA_TIPO_PEDIDO');
  
  
end;


class function TCompraTipoPedidoService.Excluir(ACompraTipoPedido: TCompraTipoPedido): Integer;
begin
  ACompraTipoPedido.ValidarExclusao;
  
  Result := ExcluirBase(ACompraTipoPedido.Id, 'COMPRA_TIPO_PEDIDO');
end;


end.
