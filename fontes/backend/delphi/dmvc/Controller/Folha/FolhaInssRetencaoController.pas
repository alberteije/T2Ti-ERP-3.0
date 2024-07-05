{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FOLHA_INSS_RETENCAO] 
                                                                                
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
unit FolhaInssRetencaoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FolhaInssRetencao')]
  [MVCPath('/folha-inss-retencao')]
  TFolhaInssRetencaoController = class(TMVCController)
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

{ TFolhaInssRetencaoController }

uses FolhaInssRetencaoService, FolhaInssRetencao, Commons, Filtro;

procedure TFolhaInssRetencaoController.ConsultarLista(Context: TWebContext);
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
      Render<TFolhaInssRetencao>(TFolhaInssRetencaoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFolhaInssRetencao>(TFolhaInssRetencaoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FolhaInssRetencao] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaInssRetencaoController.ConsultarObjeto(id: Integer);
var
  FolhaInssRetencao: TFolhaInssRetencao;
begin
  try
    FolhaInssRetencao := TFolhaInssRetencaoService.ConsultarObjeto(id);

    if Assigned(FolhaInssRetencao) then
      Render(FolhaInssRetencao)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FolhaInssRetencao]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FolhaInssRetencao] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaInssRetencaoController.Inserir(Context: TWebContext);
var
  FolhaInssRetencao: TFolhaInssRetencao;
begin
  try
    FolhaInssRetencao := Context.Request.BodyAs<TFolhaInssRetencao>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FolhaInssRetencao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFolhaInssRetencaoService.Inserir(FolhaInssRetencao);
    Render(TFolhaInssRetencaoService.ConsultarObjeto(FolhaInssRetencao.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FolhaInssRetencao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFolhaInssRetencaoController.Alterar(id: Integer);
var
  FolhaInssRetencao, FolhaInssRetencaoDB: TFolhaInssRetencao;
begin
  try
    FolhaInssRetencao := Context.Request.BodyAs<TFolhaInssRetencao>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FolhaInssRetencao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FolhaInssRetencao.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FolhaInssRetencao] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FolhaInssRetencaoDB := TFolhaInssRetencaoService.ConsultarObjeto(FolhaInssRetencao.id);

  if not Assigned(FolhaInssRetencaoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FolhaInssRetencao]',
      '', 0, 400);

  try
    if TFolhaInssRetencaoService.Alterar(FolhaInssRetencao) > 0 then
      Render(TFolhaInssRetencaoService.ConsultarObjeto(FolhaInssRetencao.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FolhaInssRetencao]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaInssRetencaoDB);
  end;
end;

procedure TFolhaInssRetencaoController.Excluir(id: Integer);
var
  FolhaInssRetencao: TFolhaInssRetencao;
begin
  FolhaInssRetencao := TFolhaInssRetencaoService.ConsultarObjeto(id);

  if not Assigned(FolhaInssRetencao) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FolhaInssRetencao]',
      '', 0, 400);

  try
    if TFolhaInssRetencaoService.Excluir(FolhaInssRetencao) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FolhaInssRetencao]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaInssRetencao);
  end;
end;

end.
