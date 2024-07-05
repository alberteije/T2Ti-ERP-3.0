{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [PATRIM_BEM] 
                                                                                
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
unit PatrimBemController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD PatrimBem')]
  [MVCPath('/patrim-bem')]
  TPatrimBemController = class(TMVCController)
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

{ TPatrimBemController }

uses PatrimBemService, PatrimBem, Commons, Filtro;

procedure TPatrimBemController.ConsultarLista(Context: TWebContext);
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
      Render<TPatrimBem>(TPatrimBemService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TPatrimBem>(TPatrimBemService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista PatrimBem] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPatrimBemController.ConsultarObjeto(id: Integer);
var
  PatrimBem: TPatrimBem;
begin
  try
    PatrimBem := TPatrimBemService.ConsultarObjeto(id);

    if Assigned(PatrimBem) then
      Render(PatrimBem)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto PatrimBem]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto PatrimBem] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPatrimBemController.Inserir(Context: TWebContext);
var
  PatrimBem: TPatrimBem;
begin
  try
    PatrimBem := Context.Request.BodyAs<TPatrimBem>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir PatrimBem] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TPatrimBemService.Inserir(PatrimBem);
    Render(TPatrimBemService.ConsultarObjeto(PatrimBem.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir PatrimBem] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TPatrimBemController.Alterar(id: Integer);
var
  PatrimBem, PatrimBemDB: TPatrimBem;
begin
  try
    PatrimBem := Context.Request.BodyAs<TPatrimBem>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar PatrimBem] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if PatrimBem.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar PatrimBem] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  PatrimBemDB := TPatrimBemService.ConsultarObjeto(PatrimBem.id);

  if not Assigned(PatrimBemDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar PatrimBem]',
      '', 0, 400);

  try
    if TPatrimBemService.Alterar(PatrimBem) > 0 then
      Render(TPatrimBemService.ConsultarObjeto(PatrimBem.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar PatrimBem]',
        '', 0, 500);
  finally
    FreeAndNil(PatrimBemDB);
  end;
end;

procedure TPatrimBemController.Excluir(id: Integer);
var
  PatrimBem: TPatrimBem;
begin
  PatrimBem := TPatrimBemService.ConsultarObjeto(id);

  if not Assigned(PatrimBem) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir PatrimBem]',
      '', 0, 400);

  try
    if TPatrimBemService.Excluir(PatrimBem) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir PatrimBem]',
        '', 0, 500);
  finally
    FreeAndNil(PatrimBem);
  end;
end;

end.