{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [TRIBUT_GRUPO_TRIBUTARIO] 
                                                                                
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
unit TributGrupoTributarioController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD TributGrupoTributario')]
  [MVCPath('/tribut-grupo-tributario')]
  TTributGrupoTributarioController = class(TMVCController)
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

{ TTributGrupoTributarioController }

uses TributGrupoTributarioService, TributGrupoTributario, Commons, Filtro;

procedure TTributGrupoTributarioController.ConsultarLista(Context: TWebContext);
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
      Render<TTributGrupoTributario>(TTributGrupoTributarioService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TTributGrupoTributario>(TTributGrupoTributarioService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista TributGrupoTributario] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TTributGrupoTributarioController.ConsultarObjeto(id: Integer);
var
  TributGrupoTributario: TTributGrupoTributario;
begin
  try
    TributGrupoTributario := TTributGrupoTributarioService.ConsultarObjeto(id);

    if Assigned(TributGrupoTributario) then
      Render(TributGrupoTributario)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto TributGrupoTributario]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto TributGrupoTributario] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TTributGrupoTributarioController.Inserir(Context: TWebContext);
var
  TributGrupoTributario: TTributGrupoTributario;
begin
  try
    TributGrupoTributario := Context.Request.BodyAs<TTributGrupoTributario>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir TributGrupoTributario] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TTributGrupoTributarioService.Inserir(TributGrupoTributario);
    Render(TTributGrupoTributarioService.ConsultarObjeto(TributGrupoTributario.Id));
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

procedure TTributGrupoTributarioController.Alterar(id: Integer);
var
  TributGrupoTributario, TributGrupoTributarioDB: TTributGrupoTributario;
begin
  try
    TributGrupoTributario := Context.Request.BodyAs<TTributGrupoTributario>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar TributGrupoTributario] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if TributGrupoTributario.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar TributGrupoTributario] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  TributGrupoTributarioDB := TTributGrupoTributarioService.ConsultarObjeto(TributGrupoTributario.id);

  if not Assigned(TributGrupoTributarioDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar TributGrupoTributario]',
      '', 0, 400);

  try
    if TTributGrupoTributarioService.Alterar(TributGrupoTributario) > 0 then
      Render(TTributGrupoTributarioService.ConsultarObjeto(TributGrupoTributario.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar TributGrupoTributario]',
        '', 0, 500);
  finally
    FreeAndNil(TributGrupoTributarioDB);
  end;
end;

procedure TTributGrupoTributarioController.Excluir(id: Integer);
var
  TributGrupoTributario: TTributGrupoTributario;
begin
  TributGrupoTributario := TTributGrupoTributarioService.ConsultarObjeto(id);

  if not Assigned(TributGrupoTributario) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir TributGrupoTributario]',
      '', 0, 400);

  try
    if TTributGrupoTributarioService.Excluir(TributGrupoTributario) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir TributGrupoTributario]',
        '', 0, 500);
  finally
    FreeAndNil(TributGrupoTributario);
  end;
end;

end.
