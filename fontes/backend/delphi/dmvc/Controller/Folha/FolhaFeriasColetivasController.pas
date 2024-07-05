{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FOLHA_FERIAS_COLETIVAS] 
                                                                                
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
unit FolhaFeriasColetivasController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FolhaFeriasColetivas')]
  [MVCPath('/folha-ferias-coletivas')]
  TFolhaFeriasColetivasController = class(TMVCController)
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

{ TFolhaFeriasColetivasController }

uses FolhaFeriasColetivasService, FolhaFeriasColetivas, Commons, Filtro;

procedure TFolhaFeriasColetivasController.ConsultarLista(Context: TWebContext);
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
      Render<TFolhaFeriasColetivas>(TFolhaFeriasColetivasService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFolhaFeriasColetivas>(TFolhaFeriasColetivasService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FolhaFeriasColetivas] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaFeriasColetivasController.ConsultarObjeto(id: Integer);
var
  FolhaFeriasColetivas: TFolhaFeriasColetivas;
begin
  try
    FolhaFeriasColetivas := TFolhaFeriasColetivasService.ConsultarObjeto(id);

    if Assigned(FolhaFeriasColetivas) then
      Render(FolhaFeriasColetivas)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FolhaFeriasColetivas]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FolhaFeriasColetivas] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaFeriasColetivasController.Inserir(Context: TWebContext);
var
  FolhaFeriasColetivas: TFolhaFeriasColetivas;
begin
  try
    FolhaFeriasColetivas := Context.Request.BodyAs<TFolhaFeriasColetivas>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FolhaFeriasColetivas] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFolhaFeriasColetivasService.Inserir(FolhaFeriasColetivas);
    Render(TFolhaFeriasColetivasService.ConsultarObjeto(FolhaFeriasColetivas.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FolhaFeriasColetivas] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFolhaFeriasColetivasController.Alterar(id: Integer);
var
  FolhaFeriasColetivas, FolhaFeriasColetivasDB: TFolhaFeriasColetivas;
begin
  try
    FolhaFeriasColetivas := Context.Request.BodyAs<TFolhaFeriasColetivas>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FolhaFeriasColetivas] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FolhaFeriasColetivas.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FolhaFeriasColetivas] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FolhaFeriasColetivasDB := TFolhaFeriasColetivasService.ConsultarObjeto(FolhaFeriasColetivas.id);

  if not Assigned(FolhaFeriasColetivasDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FolhaFeriasColetivas]',
      '', 0, 400);

  try
    if TFolhaFeriasColetivasService.Alterar(FolhaFeriasColetivas) > 0 then
      Render(TFolhaFeriasColetivasService.ConsultarObjeto(FolhaFeriasColetivas.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FolhaFeriasColetivas]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaFeriasColetivasDB);
  end;
end;

procedure TFolhaFeriasColetivasController.Excluir(id: Integer);
var
  FolhaFeriasColetivas: TFolhaFeriasColetivas;
begin
  FolhaFeriasColetivas := TFolhaFeriasColetivasService.ConsultarObjeto(id);

  if not Assigned(FolhaFeriasColetivas) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FolhaFeriasColetivas]',
      '', 0, 400);

  try
    if TFolhaFeriasColetivasService.Excluir(FolhaFeriasColetivas) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FolhaFeriasColetivas]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaFeriasColetivas);
  end;
end;

end.
