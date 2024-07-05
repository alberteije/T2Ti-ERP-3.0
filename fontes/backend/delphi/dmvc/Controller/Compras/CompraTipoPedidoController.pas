{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [COMPRA_TIPO_PEDIDO] 
                                                                                
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
unit CompraTipoPedidoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD CompraTipoPedido')]
  [MVCPath('/compra-tipo-pedido')]
  TCompraTipoPedidoController = class(TMVCController)
  public
    [MVCDoc('Retorna uma lista de objetos')]
    [MVCPath('/($filtro)')]
    [MVCHTTPMethod([httpGET])]
    procedure ConsultarLista(Context: TWebContext);

    [MVCDoc('Retorna um objeto com base no ID')]
    [MVCPath('/($id)')]
    [MVCHTTPMethod([httpGET])]
    procedure ConsultarObjeto(id: Integer);

    [MVCDoc('Insere um novo objeto')]
    [MVCPath]
    [MVCHTTPMethod([httpPOST])]
    procedure Inserir(Context: TWebContext);

    [MVCDoc('Altera um objeto com base no ID')]
    [MVCPath('/($id)')]
    [MVCHTTPMethod([httpPUT])]
    procedure Alterar(id: Integer);

    [MVCDoc('Exclui um objeto com base no ID')]
    [MVCPath('/($id)')]
    [MVCHTTPMethod([httpDelete])]
    procedure Excluir(id: Integer);
  end;

implementation

{ TCompraTipoPedidoController }

uses CompraTipoPedidoService, CompraTipoPedido, Commons, Filtro;

procedure TCompraTipoPedidoController.ConsultarLista(Context: TWebContext);
var
  FiltroUrl, FilterWhere: string;
  FiltroObj: TFiltro;
begin
  FiltroUrl := Context.Request.Params['filtro'];
  if FiltroUrl <> '' then
  begin
    ConsultarObjeto(StrToInt(FiltroUrl));
    exit;
  end;

  FilterWhere := Context.Request.Params['filter'];
  try
    if FilterWhere = '' then
    begin
      Render<TCompraTipoPedido>(TCompraTipoPedidoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TCompraTipoPedido>(TCompraTipoPedidoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista CompraTipoPedido] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TCompraTipoPedidoController.ConsultarObjeto(id: Integer);
var
  CompraTipoPedido: TCompraTipoPedido;
begin
  try
    CompraTipoPedido := TCompraTipoPedidoService.ConsultarObjeto(id);

    if Assigned(CompraTipoPedido) then
      Render(CompraTipoPedido)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto CompraTipoPedido]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto CompraTipoPedido] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TCompraTipoPedidoController.Inserir(Context: TWebContext);
var
  CompraTipoPedido: TCompraTipoPedido;
begin
  try
    CompraTipoPedido := Context.Request.BodyAs<TCompraTipoPedido>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir CompraTipoPedido] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TCompraTipoPedidoService.Inserir(CompraTipoPedido);
    Render(TCompraTipoPedidoService.ConsultarObjeto(CompraTipoPedido.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

end;

procedure TCompraTipoPedidoController.Alterar(id: Integer);
var
  CompraTipoPedido, CompraTipoPedidoDB: TCompraTipoPedido;
begin
  try
    CompraTipoPedido := Context.Request.BodyAs<TCompraTipoPedido>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar CompraTipoPedido] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if CompraTipoPedido.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar CompraTipoPedido] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  CompraTipoPedidoDB := TCompraTipoPedidoService.ConsultarObjeto(CompraTipoPedido.id);

  if not Assigned(CompraTipoPedidoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar CompraTipoPedido]',
      '', 0, 400);

  try
    if TCompraTipoPedidoService.Alterar(CompraTipoPedido) > 0 then
      Render(TCompraTipoPedidoService.ConsultarObjeto(CompraTipoPedido.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar CompraTipoPedido]',
        '', 0, 500);
  finally
    FreeAndNil(CompraTipoPedidoDB);
  end;
end;

procedure TCompraTipoPedidoController.Excluir(id: Integer);
var
  CompraTipoPedido: TCompraTipoPedido;
begin
  CompraTipoPedido := TCompraTipoPedidoService.ConsultarObjeto(id);

  if not Assigned(CompraTipoPedido) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir CompraTipoPedido]',
      '', 0, 400);

  try
    if TCompraTipoPedidoService.Excluir(CompraTipoPedido) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir CompraTipoPedido]',
        '', 0, 500);
  finally
    FreeAndNil(CompraTipoPedido);
  end;
end;

end.
