{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FOLHA_VALE_TRANSPORTE] 
                                                                                
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
unit FolhaValeTransporteController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FolhaValeTransporte')]
  [MVCPath('/folha-vale-transporte')]
  TFolhaValeTransporteController = class(TMVCController)
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

{ TFolhaValeTransporteController }

uses FolhaValeTransporteService, FolhaValeTransporte, Commons, Filtro;

procedure TFolhaValeTransporteController.ConsultarLista(Context: TWebContext);
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
      Render<TFolhaValeTransporte>(TFolhaValeTransporteService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFolhaValeTransporte>(TFolhaValeTransporteService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FolhaValeTransporte] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaValeTransporteController.ConsultarObjeto(id: Integer);
var
  FolhaValeTransporte: TFolhaValeTransporte;
begin
  try
    FolhaValeTransporte := TFolhaValeTransporteService.ConsultarObjeto(id);

    if Assigned(FolhaValeTransporte) then
      Render(FolhaValeTransporte)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FolhaValeTransporte]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FolhaValeTransporte] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaValeTransporteController.Inserir(Context: TWebContext);
var
  FolhaValeTransporte: TFolhaValeTransporte;
begin
  try
    FolhaValeTransporte := Context.Request.BodyAs<TFolhaValeTransporte>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FolhaValeTransporte] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFolhaValeTransporteService.Inserir(FolhaValeTransporte);
    Render(TFolhaValeTransporteService.ConsultarObjeto(FolhaValeTransporte.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FolhaValeTransporte] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFolhaValeTransporteController.Alterar(id: Integer);
var
  FolhaValeTransporte, FolhaValeTransporteDB: TFolhaValeTransporte;
begin
  try
    FolhaValeTransporte := Context.Request.BodyAs<TFolhaValeTransporte>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FolhaValeTransporte] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FolhaValeTransporte.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FolhaValeTransporte] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FolhaValeTransporteDB := TFolhaValeTransporteService.ConsultarObjeto(FolhaValeTransporte.id);

  if not Assigned(FolhaValeTransporteDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FolhaValeTransporte]',
      '', 0, 400);

  try
    if TFolhaValeTransporteService.Alterar(FolhaValeTransporte) > 0 then
      Render(TFolhaValeTransporteService.ConsultarObjeto(FolhaValeTransporte.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FolhaValeTransporte]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaValeTransporteDB);
  end;
end;

procedure TFolhaValeTransporteController.Excluir(id: Integer);
var
  FolhaValeTransporte: TFolhaValeTransporte;
begin
  FolhaValeTransporte := TFolhaValeTransporteService.ConsultarObjeto(id);

  if not Assigned(FolhaValeTransporte) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FolhaValeTransporte]',
      '', 0, 400);

  try
    if TFolhaValeTransporteService.Excluir(FolhaValeTransporte) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FolhaValeTransporte]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaValeTransporte);
  end;
end;

end.
