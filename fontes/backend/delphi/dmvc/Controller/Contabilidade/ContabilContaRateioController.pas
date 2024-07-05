{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [CONTABIL_CONTA_RATEIO] 
                                                                                
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
unit ContabilContaRateioController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ContabilContaRateio')]
  [MVCPath('/contabil-conta-rateio')]
  TContabilContaRateioController = class(TMVCController)
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

{ TContabilContaRateioController }

uses ContabilContaRateioService, ContabilContaRateio, Commons, Filtro;

procedure TContabilContaRateioController.ConsultarLista(Context: TWebContext);
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
      Render<TContabilContaRateio>(TContabilContaRateioService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TContabilContaRateio>(TContabilContaRateioService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ContabilContaRateio] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilContaRateioController.ConsultarObjeto(id: Integer);
var
  ContabilContaRateio: TContabilContaRateio;
begin
  try
    ContabilContaRateio := TContabilContaRateioService.ConsultarObjeto(id);

    if Assigned(ContabilContaRateio) then
      Render(ContabilContaRateio)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ContabilContaRateio]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ContabilContaRateio] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilContaRateioController.Inserir(Context: TWebContext);
var
  ContabilContaRateio: TContabilContaRateio;
begin
  try
    ContabilContaRateio := Context.Request.BodyAs<TContabilContaRateio>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ContabilContaRateio] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TContabilContaRateioService.Inserir(ContabilContaRateio);
    Render(TContabilContaRateioService.ConsultarObjeto(ContabilContaRateio.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir ContabilContaRateio] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TContabilContaRateioController.Alterar(id: Integer);
var
  ContabilContaRateio, ContabilContaRateioDB: TContabilContaRateio;
begin
  try
    ContabilContaRateio := Context.Request.BodyAs<TContabilContaRateio>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ContabilContaRateio] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ContabilContaRateio.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ContabilContaRateio] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ContabilContaRateioDB := TContabilContaRateioService.ConsultarObjeto(ContabilContaRateio.id);

  if not Assigned(ContabilContaRateioDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ContabilContaRateio]',
      '', 0, 400);

  try
    if TContabilContaRateioService.Alterar(ContabilContaRateio) > 0 then
      Render(TContabilContaRateioService.ConsultarObjeto(ContabilContaRateio.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ContabilContaRateio]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilContaRateioDB);
  end;
end;

procedure TContabilContaRateioController.Excluir(id: Integer);
var
  ContabilContaRateio: TContabilContaRateio;
begin
  ContabilContaRateio := TContabilContaRateioService.ConsultarObjeto(id);

  if not Assigned(ContabilContaRateio) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ContabilContaRateio]',
      '', 0, 400);

  try
    if TContabilContaRateioService.Excluir(ContabilContaRateio) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ContabilContaRateio]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilContaRateio);
  end;
end;

end.
