{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FOLHA_HISTORICO_SALARIAL] 
                                                                                
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
unit FolhaHistoricoSalarialController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FolhaHistoricoSalarial')]
  [MVCPath('/folha-historico-salarial')]
  TFolhaHistoricoSalarialController = class(TMVCController)
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

{ TFolhaHistoricoSalarialController }

uses FolhaHistoricoSalarialService, FolhaHistoricoSalarial, Commons, Filtro;

procedure TFolhaHistoricoSalarialController.ConsultarLista(Context: TWebContext);
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
      Render<TFolhaHistoricoSalarial>(TFolhaHistoricoSalarialService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFolhaHistoricoSalarial>(TFolhaHistoricoSalarialService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FolhaHistoricoSalarial] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaHistoricoSalarialController.ConsultarObjeto(id: Integer);
var
  FolhaHistoricoSalarial: TFolhaHistoricoSalarial;
begin
  try
    FolhaHistoricoSalarial := TFolhaHistoricoSalarialService.ConsultarObjeto(id);

    if Assigned(FolhaHistoricoSalarial) then
      Render(FolhaHistoricoSalarial)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FolhaHistoricoSalarial]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FolhaHistoricoSalarial] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaHistoricoSalarialController.Inserir(Context: TWebContext);
var
  FolhaHistoricoSalarial: TFolhaHistoricoSalarial;
begin
  try
    FolhaHistoricoSalarial := Context.Request.BodyAs<TFolhaHistoricoSalarial>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FolhaHistoricoSalarial] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFolhaHistoricoSalarialService.Inserir(FolhaHistoricoSalarial);
    Render(TFolhaHistoricoSalarialService.ConsultarObjeto(FolhaHistoricoSalarial.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FolhaHistoricoSalarial] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFolhaHistoricoSalarialController.Alterar(id: Integer);
var
  FolhaHistoricoSalarial, FolhaHistoricoSalarialDB: TFolhaHistoricoSalarial;
begin
  try
    FolhaHistoricoSalarial := Context.Request.BodyAs<TFolhaHistoricoSalarial>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FolhaHistoricoSalarial] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FolhaHistoricoSalarial.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FolhaHistoricoSalarial] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FolhaHistoricoSalarialDB := TFolhaHistoricoSalarialService.ConsultarObjeto(FolhaHistoricoSalarial.id);

  if not Assigned(FolhaHistoricoSalarialDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FolhaHistoricoSalarial]',
      '', 0, 400);

  try
    if TFolhaHistoricoSalarialService.Alterar(FolhaHistoricoSalarial) > 0 then
      Render(TFolhaHistoricoSalarialService.ConsultarObjeto(FolhaHistoricoSalarial.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FolhaHistoricoSalarial]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaHistoricoSalarialDB);
  end;
end;

procedure TFolhaHistoricoSalarialController.Excluir(id: Integer);
var
  FolhaHistoricoSalarial: TFolhaHistoricoSalarial;
begin
  FolhaHistoricoSalarial := TFolhaHistoricoSalarialService.ConsultarObjeto(id);

  if not Assigned(FolhaHistoricoSalarial) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FolhaHistoricoSalarial]',
      '', 0, 400);

  try
    if TFolhaHistoricoSalarialService.Excluir(FolhaHistoricoSalarial) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FolhaHistoricoSalarial]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaHistoricoSalarial);
  end;
end;

end.
