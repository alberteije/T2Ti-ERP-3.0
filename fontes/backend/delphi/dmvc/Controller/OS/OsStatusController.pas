{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [OS_STATUS] 
                                                                                
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
unit OsStatusController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD OsStatus')]
  [MVCPath('/os-status')]
  TOsStatusController = class(TMVCController)
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

{ TOsStatusController }

uses OsStatusService, OsStatus, Commons, Filtro;

procedure TOsStatusController.ConsultarLista(Context: TWebContext);
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
      Render<TOsStatus>(TOsStatusService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TOsStatus>(TOsStatusService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista OsStatus] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TOsStatusController.ConsultarObjeto(id: Integer);
var
  OsStatus: TOsStatus;
begin
  try
    OsStatus := TOsStatusService.ConsultarObjeto(id);

    if Assigned(OsStatus) then
      Render(OsStatus)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto OsStatus]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto OsStatus] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TOsStatusController.Inserir(Context: TWebContext);
var
  OsStatus: TOsStatus;
begin
  try
    OsStatus := Context.Request.BodyAs<TOsStatus>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir OsStatus] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TOsStatusService.Inserir(OsStatus);
    Render(TOsStatusService.ConsultarObjeto(OsStatus.Id));
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

procedure TOsStatusController.Alterar(id: Integer);
var
  OsStatus, OsStatusDB: TOsStatus;
begin
  try
    OsStatus := Context.Request.BodyAs<TOsStatus>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar OsStatus] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if OsStatus.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar OsStatus] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  OsStatusDB := TOsStatusService.ConsultarObjeto(OsStatus.id);

  if not Assigned(OsStatusDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar OsStatus]',
      '', 0, 400);

  try
    if TOsStatusService.Alterar(OsStatus) > 0 then
      Render(TOsStatusService.ConsultarObjeto(OsStatus.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar OsStatus]',
        '', 0, 500);
  finally
    FreeAndNil(OsStatusDB);
  end;
end;

procedure TOsStatusController.Excluir(id: Integer);
var
  OsStatus: TOsStatus;
begin
  OsStatus := TOsStatusService.ConsultarObjeto(id);

  if not Assigned(OsStatus) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir OsStatus]',
      '', 0, 400);

  try
    if TOsStatusService.Excluir(OsStatus) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir OsStatus]',
        '', 0, 500);
  finally
    FreeAndNil(OsStatus);
  end;
end;

end.
