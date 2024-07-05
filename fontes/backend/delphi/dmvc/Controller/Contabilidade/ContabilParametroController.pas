{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [CONTABIL_PARAMETRO] 
                                                                                
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
unit ContabilParametroController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ContabilParametro')]
  [MVCPath('/contabil-parametro')]
  TContabilParametroController = class(TMVCController)
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

{ TContabilParametroController }

uses ContabilParametroService, ContabilParametro, Commons, Filtro;

procedure TContabilParametroController.ConsultarLista(Context: TWebContext);
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
      Render<TContabilParametro>(TContabilParametroService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TContabilParametro>(TContabilParametroService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ContabilParametro] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilParametroController.ConsultarObjeto(id: Integer);
var
  ContabilParametro: TContabilParametro;
begin
  try
    ContabilParametro := TContabilParametroService.ConsultarObjeto(id);

    if Assigned(ContabilParametro) then
      Render(ContabilParametro)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ContabilParametro]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ContabilParametro] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilParametroController.Inserir(Context: TWebContext);
var
  ContabilParametro: TContabilParametro;
begin
  try
    ContabilParametro := Context.Request.BodyAs<TContabilParametro>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ContabilParametro] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TContabilParametroService.Inserir(ContabilParametro);
    Render(TContabilParametroService.ConsultarObjeto(ContabilParametro.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir ContabilParametro] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TContabilParametroController.Alterar(id: Integer);
var
  ContabilParametro, ContabilParametroDB: TContabilParametro;
begin
  try
    ContabilParametro := Context.Request.BodyAs<TContabilParametro>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ContabilParametro] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ContabilParametro.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ContabilParametro] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ContabilParametroDB := TContabilParametroService.ConsultarObjeto(ContabilParametro.id);

  if not Assigned(ContabilParametroDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ContabilParametro]',
      '', 0, 400);

  try
    if TContabilParametroService.Alterar(ContabilParametro) > 0 then
      Render(TContabilParametroService.ConsultarObjeto(ContabilParametro.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ContabilParametro]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilParametroDB);
  end;
end;

procedure TContabilParametroController.Excluir(id: Integer);
var
  ContabilParametro: TContabilParametro;
begin
  ContabilParametro := TContabilParametroService.ConsultarObjeto(id);

  if not Assigned(ContabilParametro) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ContabilParametro]',
      '', 0, 400);

  try
    if TContabilParametroService.Excluir(ContabilParametro) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ContabilParametro]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilParametro);
  end;
end;

end.
