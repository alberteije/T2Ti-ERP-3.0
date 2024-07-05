{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FOLHA_EVENTO] 
                                                                                
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
unit FolhaEventoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FolhaEvento')]
  [MVCPath('/folha-evento')]
  TFolhaEventoController = class(TMVCController)
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

{ TFolhaEventoController }

uses FolhaEventoService, FolhaEvento, Commons, Filtro;

procedure TFolhaEventoController.ConsultarLista(Context: TWebContext);
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
      Render<TFolhaEvento>(TFolhaEventoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFolhaEvento>(TFolhaEventoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FolhaEvento] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaEventoController.ConsultarObjeto(id: Integer);
var
  FolhaEvento: TFolhaEvento;
begin
  try
    FolhaEvento := TFolhaEventoService.ConsultarObjeto(id);

    if Assigned(FolhaEvento) then
      Render(FolhaEvento)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FolhaEvento]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FolhaEvento] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaEventoController.Inserir(Context: TWebContext);
var
  FolhaEvento: TFolhaEvento;
begin
  try
    FolhaEvento := Context.Request.BodyAs<TFolhaEvento>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FolhaEvento] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFolhaEventoService.Inserir(FolhaEvento);
    Render(TFolhaEventoService.ConsultarObjeto(FolhaEvento.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FolhaEvento] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFolhaEventoController.Alterar(id: Integer);
var
  FolhaEvento, FolhaEventoDB: TFolhaEvento;
begin
  try
    FolhaEvento := Context.Request.BodyAs<TFolhaEvento>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FolhaEvento] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FolhaEvento.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FolhaEvento] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FolhaEventoDB := TFolhaEventoService.ConsultarObjeto(FolhaEvento.id);

  if not Assigned(FolhaEventoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FolhaEvento]',
      '', 0, 400);

  try
    if TFolhaEventoService.Alterar(FolhaEvento) > 0 then
      Render(TFolhaEventoService.ConsultarObjeto(FolhaEvento.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FolhaEvento]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaEventoDB);
  end;
end;

procedure TFolhaEventoController.Excluir(id: Integer);
var
  FolhaEvento: TFolhaEvento;
begin
  FolhaEvento := TFolhaEventoService.ConsultarObjeto(id);

  if not Assigned(FolhaEvento) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FolhaEvento]',
      '', 0, 400);

  try
    if TFolhaEventoService.Excluir(FolhaEvento) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FolhaEvento]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaEvento);
  end;
end;

end.
