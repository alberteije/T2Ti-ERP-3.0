{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [COMPRA_PEDIDO] 
                                                                                
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
unit CompraPedidoService;

interface

uses
  CompraPedido, CompraPedidoDetalhe, CompraTipoPedido, Fornecedor, Colaborador, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TCompraPedidoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaCompraPedido: TObjectList<TCompraPedido>); overload;
    class procedure AnexarObjetosVinculados(ACompraPedido: TCompraPedido); overload;
    class procedure InserirObjetosFilhos(ACompraPedido: TCompraPedido);
    class procedure ExcluirObjetosFilhos(ACompraPedido: TCompraPedido);
  public
    class function ConsultarLista: TObjectList<TCompraPedido>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TCompraPedido>;
    class function ConsultarObjeto(AId: Integer): TCompraPedido;
    class procedure Inserir(ACompraPedido: TCompraPedido);
    class function Alterar(ACompraPedido: TCompraPedido): Integer;
    class function Excluir(ACompraPedido: TCompraPedido): Integer;
  end;

var
  sql: string;


implementation

{ TCompraPedidoService }

class procedure TCompraPedidoService.AnexarObjetosVinculados(ACompraPedido: TCompraPedido);
begin
  // CompraPedidoDetalhe
  sql := 'SELECT * FROM COMPRA_PEDIDO_DETALHE WHERE ID_COMPRA_PEDIDO = ' + ACompraPedido.Id.ToString;
  ACompraPedido.ListaCompraPedidoDetalhe := GetQuery(sql).AsObjectList<TCompraPedidoDetalhe>;

  // CompraTipoPedido
  sql := 'SELECT * FROM COMPRA_TIPO_PEDIDO WHERE ID = ' + ACompraPedido.IdCompraTipoPedido.ToString;
  ACompraPedido.CompraTipoPedido := GetQuery(sql).AsObject<TCompraTipoPedido>;

  // Fornecedor
  sql := 'SELECT * FROM FORNECEDOR WHERE ID = ' + ACompraPedido.IdFornecedor.ToString;
  ACompraPedido.Fornecedor := GetQuery(sql).AsObject<TFornecedor>;

  // Colaborador
  sql := 'SELECT * FROM COLABORADOR WHERE ID = ' + ACompraPedido.IdColaborador.ToString;
  ACompraPedido.Colaborador := GetQuery(sql).AsObject<TColaborador>;

end;

class procedure TCompraPedidoService.AnexarObjetosVinculados(AListaCompraPedido: TObjectList<TCompraPedido>);
var
  CompraPedido: TCompraPedido;
begin
  for CompraPedido in AListaCompraPedido do
  begin
    AnexarObjetosVinculados(CompraPedido);
  end;
end;

class function TCompraPedidoService.ConsultarLista: TObjectList<TCompraPedido>;
begin
  sql := 'SELECT * FROM COMPRA_PEDIDO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TCompraPedido>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TCompraPedidoService.ConsultarListaFiltro(AWhere: string): TObjectList<TCompraPedido>;
begin
  sql := 'SELECT * FROM COMPRA_PEDIDO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TCompraPedido>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TCompraPedidoService.ConsultarObjeto(AId: Integer): TCompraPedido;
begin
  sql := 'SELECT * FROM COMPRA_PEDIDO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TCompraPedido>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TCompraPedidoService.Inserir(ACompraPedido: TCompraPedido);
begin
  ACompraPedido.ValidarInsercao;
  ACompraPedido.Id := InserirBase(ACompraPedido, 'COMPRA_PEDIDO');
  InserirObjetosFilhos(ACompraPedido);
end;

class function TCompraPedidoService.Alterar(ACompraPedido: TCompraPedido): Integer;
begin
  ACompraPedido.ValidarAlteracao;
  Result := AlterarBase(ACompraPedido, 'COMPRA_PEDIDO');
  ExcluirObjetosFilhos(ACompraPedido);
  InserirObjetosFilhos(ACompraPedido);
end;

class procedure TCompraPedidoService.InserirObjetosFilhos(ACompraPedido: TCompraPedido);
var
  CompraPedidoDetalhe: TCompraPedidoDetalhe;
begin
  // CompraPedidoDetalhe
  for CompraPedidoDetalhe in ACompraPedido.ListaCompraPedidoDetalhe do
  begin
    CompraPedidoDetalhe.IdCompraPedido := ACompraPedido.Id;
    InserirBase(CompraPedidoDetalhe, 'COMPRA_PEDIDO_DETALHE');
  end;

end;

class function TCompraPedidoService.Excluir(ACompraPedido: TCompraPedido): Integer;
begin
  ACompraPedido.ValidarExclusao;
  ExcluirObjetosFilhos(ACompraPedido);
  Result := ExcluirBase(ACompraPedido.Id, 'COMPRA_PEDIDO');
end;

class procedure TCompraPedidoService.ExcluirObjetosFilhos(ACompraPedido: TCompraPedido);
begin
  ExcluirFilho(ACompraPedido.Id, 'COMPRA_PEDIDO_DETALHE', 'ID_COMPRA_PEDIDO');
end;

end.
