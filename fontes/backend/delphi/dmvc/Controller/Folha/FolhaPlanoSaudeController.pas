{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FOLHA_PLANO_SAUDE] 
                                                                                
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
unit FolhaPlanoSaudeController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FolhaPlanoSaude')]
  [MVCPath('/folha-plano-saude')]
  TFolhaPlanoSaudeController = class(TMVCController)
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

{ TFolhaPlanoSaudeController }

uses FolhaPlanoSaudeService, FolhaPlanoSaude, Commons, Filtro;

procedure TFolhaPlanoSaudeController.ConsultarLista(Context: TWebContext);
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
      Render<TFolhaPlanoSaude>(TFolhaPlanoSaudeService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFolhaPlanoSaude>(TFolhaPlanoSaudeService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FolhaPlanoSaude] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaPlanoSaudeController.ConsultarObjeto(id: Integer);
var
  FolhaPlanoSaude: TFolhaPlanoSaude;
begin
  try
    FolhaPlanoSaude := TFolhaPlanoSaudeService.ConsultarObjeto(id);

    if Assigned(FolhaPlanoSaude) then
      Render(FolhaPlanoSaude)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FolhaPlanoSaude]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FolhaPlanoSaude] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaPlanoSaudeController.Inserir(Context: TWebContext);
var
  FolhaPlanoSaude: TFolhaPlanoSaude;
begin
  try
    FolhaPlanoSaude := Context.Request.BodyAs<TFolhaPlanoSaude>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FolhaPlanoSaude] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFolhaPlanoSaudeService.Inserir(FolhaPlanoSaude);
    Render(TFolhaPlanoSaudeService.ConsultarObjeto(FolhaPlanoSaude.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FolhaPlanoSaude] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFolhaPlanoSaudeController.Alterar(id: Integer);
var
  FolhaPlanoSaude, FolhaPlanoSaudeDB: TFolhaPlanoSaude;
begin
  try
    FolhaPlanoSaude := Context.Request.BodyAs<TFolhaPlanoSaude>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FolhaPlanoSaude] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FolhaPlanoSaude.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FolhaPlanoSaude] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FolhaPlanoSaudeDB := TFolhaPlanoSaudeService.ConsultarObjeto(FolhaPlanoSaude.id);

  if not Assigned(FolhaPlanoSaudeDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FolhaPlanoSaude]',
      '', 0, 400);

  try
    if TFolhaPlanoSaudeService.Alterar(FolhaPlanoSaude) > 0 then
      Render(TFolhaPlanoSaudeService.ConsultarObjeto(FolhaPlanoSaude.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FolhaPlanoSaude]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaPlanoSaudeDB);
  end;
end;

procedure TFolhaPlanoSaudeController.Excluir(id: Integer);
var
  FolhaPlanoSaude: TFolhaPlanoSaude;
begin
  FolhaPlanoSaude := TFolhaPlanoSaudeService.ConsultarObjeto(id);

  if not Assigned(FolhaPlanoSaude) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FolhaPlanoSaude]',
      '', 0, 400);

  try
    if TFolhaPlanoSaudeService.Excluir(FolhaPlanoSaude) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FolhaPlanoSaude]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaPlanoSaude);
  end;
end;

end.
