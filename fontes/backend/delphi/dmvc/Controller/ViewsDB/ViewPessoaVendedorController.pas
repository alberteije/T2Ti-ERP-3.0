{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [VIEW_PESSOA_VENDEDOR] 
                                                                                
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
unit ViewPessoaVendedorController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ViewPessoaVendedor')]
  [MVCPath('/view-pessoa-vendedor')]
  TViewPessoaVendedorController = class(TMVCController)
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

{ TViewPessoaVendedorController }

uses ViewPessoaVendedorService, ViewPessoaVendedor, Commons, Filtro;

procedure TViewPessoaVendedorController.ConsultarLista(Context: TWebContext);
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
      Render<TViewPessoaVendedor>(TViewPessoaVendedorService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TViewPessoaVendedor>(TViewPessoaVendedorService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ViewPessoaVendedor] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TViewPessoaVendedorController.ConsultarObjeto(id: Integer);
var
  ViewPessoaVendedor: TViewPessoaVendedor;
begin
  try
    ViewPessoaVendedor := TViewPessoaVendedorService.ConsultarObjeto(id);

    if Assigned(ViewPessoaVendedor) then
      Render(ViewPessoaVendedor)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ViewPessoaVendedor]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ViewPessoaVendedor] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TViewPessoaVendedorController.Inserir(Context: TWebContext);
var
  ViewPessoaVendedor: TViewPessoaVendedor;
begin
  try
    ViewPessoaVendedor := Context.Request.BodyAs<TViewPessoaVendedor>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ViewPessoaVendedor] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TViewPessoaVendedorService.Inserir(ViewPessoaVendedor);
    Render(TViewPessoaVendedorService.ConsultarObjeto(ViewPessoaVendedor.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir ViewPessoaVendedor] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TViewPessoaVendedorController.Alterar(id: Integer);
var
  ViewPessoaVendedor, ViewPessoaVendedorDB: TViewPessoaVendedor;
begin
  try
    ViewPessoaVendedor := Context.Request.BodyAs<TViewPessoaVendedor>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ViewPessoaVendedor] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ViewPessoaVendedor.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ViewPessoaVendedor] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ViewPessoaVendedorDB := TViewPessoaVendedorService.ConsultarObjeto(ViewPessoaVendedor.id);

  if not Assigned(ViewPessoaVendedorDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ViewPessoaVendedor]',
      '', 0, 400);

  try
    if TViewPessoaVendedorService.Alterar(ViewPessoaVendedor) > 0 then
      Render(TViewPessoaVendedorService.ConsultarObjeto(ViewPessoaVendedor.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ViewPessoaVendedor]',
        '', 0, 500);
  finally
    FreeAndNil(ViewPessoaVendedorDB);
  end;
end;

procedure TViewPessoaVendedorController.Excluir(id: Integer);
var
  ViewPessoaVendedor: TViewPessoaVendedor;
begin
  ViewPessoaVendedor := TViewPessoaVendedorService.ConsultarObjeto(id);

  if not Assigned(ViewPessoaVendedor) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ViewPessoaVendedor]',
      '', 0, 400);

  try
    if TViewPessoaVendedorService.Excluir(ViewPessoaVendedor) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ViewPessoaVendedor]',
        '', 0, 500);
  finally
    FreeAndNil(ViewPessoaVendedor);
  end;
end;

end.
