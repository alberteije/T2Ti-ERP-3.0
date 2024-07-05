{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FOLHA_PPP_ATIVIDADE] 
                                                                                
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
unit FolhaPppAtividadeController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FolhaPppAtividade')]
  [MVCPath('/folha-ppp-atividade')]
  TFolhaPppAtividadeController = class(TMVCController)
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

{ TFolhaPppAtividadeController }

uses FolhaPppAtividadeService, FolhaPppAtividade, Commons, Filtro;

procedure TFolhaPppAtividadeController.ConsultarLista(Context: TWebContext);
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
      Render<TFolhaPppAtividade>(TFolhaPppAtividadeService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFolhaPppAtividade>(TFolhaPppAtividadeService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FolhaPppAtividade] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaPppAtividadeController.ConsultarObjeto(id: Integer);
var
  FolhaPppAtividade: TFolhaPppAtividade;
begin
  try
    FolhaPppAtividade := TFolhaPppAtividadeService.ConsultarObjeto(id);

    if Assigned(FolhaPppAtividade) then
      Render(FolhaPppAtividade)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FolhaPppAtividade]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FolhaPppAtividade] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaPppAtividadeController.Inserir(Context: TWebContext);
var
  FolhaPppAtividade: TFolhaPppAtividade;
begin
  try
    FolhaPppAtividade := Context.Request.BodyAs<TFolhaPppAtividade>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FolhaPppAtividade] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFolhaPppAtividadeService.Inserir(FolhaPppAtividade);
    Render(TFolhaPppAtividadeService.ConsultarObjeto(FolhaPppAtividade.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FolhaPppAtividade] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFolhaPppAtividadeController.Alterar(id: Integer);
var
  FolhaPppAtividade, FolhaPppAtividadeDB: TFolhaPppAtividade;
begin
  try
    FolhaPppAtividade := Context.Request.BodyAs<TFolhaPppAtividade>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FolhaPppAtividade] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FolhaPppAtividade.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FolhaPppAtividade] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FolhaPppAtividadeDB := TFolhaPppAtividadeService.ConsultarObjeto(FolhaPppAtividade.id);

  if not Assigned(FolhaPppAtividadeDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FolhaPppAtividade]',
      '', 0, 400);

  try
    if TFolhaPppAtividadeService.Alterar(FolhaPppAtividade) > 0 then
      Render(TFolhaPppAtividadeService.ConsultarObjeto(FolhaPppAtividade.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FolhaPppAtividade]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaPppAtividadeDB);
  end;
end;

procedure TFolhaPppAtividadeController.Excluir(id: Integer);
var
  FolhaPppAtividade: TFolhaPppAtividade;
begin
  FolhaPppAtividade := TFolhaPppAtividadeService.ConsultarObjeto(id);

  if not Assigned(FolhaPppAtividade) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FolhaPppAtividade]',
      '', 0, 400);

  try
    if TFolhaPppAtividadeService.Excluir(FolhaPppAtividade) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FolhaPppAtividade]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaPppAtividade);
  end;
end;

end.
