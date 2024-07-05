{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [VIEW_FIN_LANCAMENTO_PAGAR] 
                                                                                
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
unit ViewFinLancamentoPagarController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ViewFinLancamentoPagar')]
  [MVCPath('/view-fin-lancamento-pagar')]
  TViewFinLancamentoPagarController = class(TMVCController)
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

{ TViewFinLancamentoPagarController }

uses ViewFinLancamentoPagarService, ViewFinLancamentoPagar, Commons, Filtro;

procedure TViewFinLancamentoPagarController.ConsultarLista(Context: TWebContext);
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
      Render<TViewFinLancamentoPagar>(TViewFinLancamentoPagarService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TViewFinLancamentoPagar>(TViewFinLancamentoPagarService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ViewFinLancamentoPagar] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TViewFinLancamentoPagarController.ConsultarObjeto(id: Integer);
var
  ViewFinLancamentoPagar: TViewFinLancamentoPagar;
begin
  try
    ViewFinLancamentoPagar := TViewFinLancamentoPagarService.ConsultarObjeto(id);

    if Assigned(ViewFinLancamentoPagar) then
      Render(ViewFinLancamentoPagar)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ViewFinLancamentoPagar]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ViewFinLancamentoPagar] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TViewFinLancamentoPagarController.Inserir(Context: TWebContext);
var
  ViewFinLancamentoPagar: TViewFinLancamentoPagar;
begin
  try
    ViewFinLancamentoPagar := Context.Request.BodyAs<TViewFinLancamentoPagar>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ViewFinLancamentoPagar] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TViewFinLancamentoPagarService.Inserir(ViewFinLancamentoPagar);
    Render(TViewFinLancamentoPagarService.ConsultarObjeto(ViewFinLancamentoPagar.Id));
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

procedure TViewFinLancamentoPagarController.Alterar(id: Integer);
var
  ViewFinLancamentoPagar, ViewFinLancamentoPagarDB: TViewFinLancamentoPagar;
begin
  try
    ViewFinLancamentoPagar := Context.Request.BodyAs<TViewFinLancamentoPagar>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ViewFinLancamentoPagar] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ViewFinLancamentoPagar.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ViewFinLancamentoPagar] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ViewFinLancamentoPagarDB := TViewFinLancamentoPagarService.ConsultarObjeto(ViewFinLancamentoPagar.id);

  if not Assigned(ViewFinLancamentoPagarDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ViewFinLancamentoPagar]',
      '', 0, 400);

  try
    if TViewFinLancamentoPagarService.Alterar(ViewFinLancamentoPagar) > 0 then
      Render(TViewFinLancamentoPagarService.ConsultarObjeto(ViewFinLancamentoPagar.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ViewFinLancamentoPagar]',
        '', 0, 500);
  finally
    FreeAndNil(ViewFinLancamentoPagarDB);
  end;
end;

procedure TViewFinLancamentoPagarController.Excluir(id: Integer);
var
  ViewFinLancamentoPagar: TViewFinLancamentoPagar;
begin
  ViewFinLancamentoPagar := TViewFinLancamentoPagarService.ConsultarObjeto(id);

  if not Assigned(ViewFinLancamentoPagar) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ViewFinLancamentoPagar]',
      '', 0, 400);

  try
    if TViewFinLancamentoPagarService.Excluir(ViewFinLancamentoPagar) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ViewFinLancamentoPagar]',
        '', 0, 500);
  finally
    FreeAndNil(ViewFinLancamentoPagar);
  end;
end;

end.
