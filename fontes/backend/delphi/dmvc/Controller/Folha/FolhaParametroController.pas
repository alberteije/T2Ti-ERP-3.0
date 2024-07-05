{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FOLHA_PARAMETRO] 
                                                                                
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
unit FolhaParametroController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FolhaParametro')]
  [MVCPath('/folha-parametro')]
  TFolhaParametroController = class(TMVCController)
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

{ TFolhaParametroController }

uses FolhaParametroService, FolhaParametro, Commons, Filtro;

procedure TFolhaParametroController.ConsultarLista(Context: TWebContext);
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
      Render<TFolhaParametro>(TFolhaParametroService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFolhaParametro>(TFolhaParametroService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FolhaParametro] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaParametroController.ConsultarObjeto(id: Integer);
var
  FolhaParametro: TFolhaParametro;
begin
  try
    FolhaParametro := TFolhaParametroService.ConsultarObjeto(id);

    if Assigned(FolhaParametro) then
      Render(FolhaParametro)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FolhaParametro]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FolhaParametro] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaParametroController.Inserir(Context: TWebContext);
var
  FolhaParametro: TFolhaParametro;
begin
  try
    FolhaParametro := Context.Request.BodyAs<TFolhaParametro>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FolhaParametro] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFolhaParametroService.Inserir(FolhaParametro);
    Render(TFolhaParametroService.ConsultarObjeto(FolhaParametro.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FolhaParametro] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFolhaParametroController.Alterar(id: Integer);
var
  FolhaParametro, FolhaParametroDB: TFolhaParametro;
begin
  try
    FolhaParametro := Context.Request.BodyAs<TFolhaParametro>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FolhaParametro] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FolhaParametro.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FolhaParametro] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FolhaParametroDB := TFolhaParametroService.ConsultarObjeto(FolhaParametro.id);

  if not Assigned(FolhaParametroDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FolhaParametro]',
      '', 0, 400);

  try
    if TFolhaParametroService.Alterar(FolhaParametro) > 0 then
      Render(TFolhaParametroService.ConsultarObjeto(FolhaParametro.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FolhaParametro]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaParametroDB);
  end;
end;

procedure TFolhaParametroController.Excluir(id: Integer);
var
  FolhaParametro: TFolhaParametro;
begin
  FolhaParametro := TFolhaParametroService.ConsultarObjeto(id);

  if not Assigned(FolhaParametro) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FolhaParametro]',
      '', 0, 400);

  try
    if TFolhaParametroService.Excluir(FolhaParametro) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FolhaParametro]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaParametro);
  end;
end;

end.
