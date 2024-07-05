{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [VIEW_FIN_CHEQUE_NAO_COMPENSADO] 
                                                                                
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
unit ViewFinChequeNaoCompensadoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ViewFinChequeNaoCompensado')]
  [MVCPath('/view-fin-cheque-nao-compensado')]
  TViewFinChequeNaoCompensadoController = class(TMVCController)
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

{ TViewFinChequeNaoCompensadoController }

uses ViewFinChequeNaoCompensadoService, ViewFinChequeNaoCompensado, Commons, Filtro;

procedure TViewFinChequeNaoCompensadoController.ConsultarLista(Context: TWebContext);
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
      Render<TViewFinChequeNaoCompensado>(TViewFinChequeNaoCompensadoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TViewFinChequeNaoCompensado>(TViewFinChequeNaoCompensadoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ViewFinChequeNaoCompensado] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TViewFinChequeNaoCompensadoController.ConsultarObjeto(id: Integer);
var
  ViewFinChequeNaoCompensado: TViewFinChequeNaoCompensado;
begin
  try
    ViewFinChequeNaoCompensado := TViewFinChequeNaoCompensadoService.ConsultarObjeto(id);

    if Assigned(ViewFinChequeNaoCompensado) then
      Render(ViewFinChequeNaoCompensado)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ViewFinChequeNaoCompensado]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ViewFinChequeNaoCompensado] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TViewFinChequeNaoCompensadoController.Inserir(Context: TWebContext);
var
  ViewFinChequeNaoCompensado: TViewFinChequeNaoCompensado;
begin
  try
    ViewFinChequeNaoCompensado := Context.Request.BodyAs<TViewFinChequeNaoCompensado>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ViewFinChequeNaoCompensado] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TViewFinChequeNaoCompensadoService.Inserir(ViewFinChequeNaoCompensado);
    Render(TViewFinChequeNaoCompensadoService.ConsultarObjeto(ViewFinChequeNaoCompensado.Id));
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

procedure TViewFinChequeNaoCompensadoController.Alterar(id: Integer);
var
  ViewFinChequeNaoCompensado, ViewFinChequeNaoCompensadoDB: TViewFinChequeNaoCompensado;
begin
  try
    ViewFinChequeNaoCompensado := Context.Request.BodyAs<TViewFinChequeNaoCompensado>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ViewFinChequeNaoCompensado] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ViewFinChequeNaoCompensado.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ViewFinChequeNaoCompensado] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ViewFinChequeNaoCompensadoDB := TViewFinChequeNaoCompensadoService.ConsultarObjeto(ViewFinChequeNaoCompensado.id);

  if not Assigned(ViewFinChequeNaoCompensadoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ViewFinChequeNaoCompensado]',
      '', 0, 400);

  try
    if TViewFinChequeNaoCompensadoService.Alterar(ViewFinChequeNaoCompensado) > 0 then
      Render(TViewFinChequeNaoCompensadoService.ConsultarObjeto(ViewFinChequeNaoCompensado.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ViewFinChequeNaoCompensado]',
        '', 0, 500);
  finally
    FreeAndNil(ViewFinChequeNaoCompensadoDB);
  end;
end;

procedure TViewFinChequeNaoCompensadoController.Excluir(id: Integer);
var
  ViewFinChequeNaoCompensado: TViewFinChequeNaoCompensado;
begin
  ViewFinChequeNaoCompensado := TViewFinChequeNaoCompensadoService.ConsultarObjeto(id);

  if not Assigned(ViewFinChequeNaoCompensado) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ViewFinChequeNaoCompensado]',
      '', 0, 400);

  try
    if TViewFinChequeNaoCompensadoService.Excluir(ViewFinChequeNaoCompensado) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ViewFinChequeNaoCompensado]',
        '', 0, 500);
  finally
    FreeAndNil(ViewFinChequeNaoCompensado);
  end;
end;

end.
