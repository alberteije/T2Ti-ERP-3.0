{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FISCAL_APURACAO_ICMS] 
                                                                                
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
unit FiscalApuracaoIcmsController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FiscalApuracaoIcms')]
  [MVCPath('/fiscal-apuracao-icms')]
  TFiscalApuracaoIcmsController = class(TMVCController)
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

{ TFiscalApuracaoIcmsController }

uses FiscalApuracaoIcmsService, FiscalApuracaoIcms, Commons, Filtro;

procedure TFiscalApuracaoIcmsController.ConsultarLista(Context: TWebContext);
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
      Render<TFiscalApuracaoIcms>(TFiscalApuracaoIcmsService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFiscalApuracaoIcms>(TFiscalApuracaoIcmsService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FiscalApuracaoIcms] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFiscalApuracaoIcmsController.ConsultarObjeto(id: Integer);
var
  FiscalApuracaoIcms: TFiscalApuracaoIcms;
begin
  try
    FiscalApuracaoIcms := TFiscalApuracaoIcmsService.ConsultarObjeto(id);

    if Assigned(FiscalApuracaoIcms) then
      Render(FiscalApuracaoIcms)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FiscalApuracaoIcms]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FiscalApuracaoIcms] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFiscalApuracaoIcmsController.Inserir(Context: TWebContext);
var
  FiscalApuracaoIcms: TFiscalApuracaoIcms;
begin
  try
    FiscalApuracaoIcms := Context.Request.BodyAs<TFiscalApuracaoIcms>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FiscalApuracaoIcms] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFiscalApuracaoIcmsService.Inserir(FiscalApuracaoIcms);
    Render(TFiscalApuracaoIcmsService.ConsultarObjeto(FiscalApuracaoIcms.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FiscalApuracaoIcms] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFiscalApuracaoIcmsController.Alterar(id: Integer);
var
  FiscalApuracaoIcms, FiscalApuracaoIcmsDB: TFiscalApuracaoIcms;
begin
  try
    FiscalApuracaoIcms := Context.Request.BodyAs<TFiscalApuracaoIcms>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FiscalApuracaoIcms] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FiscalApuracaoIcms.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FiscalApuracaoIcms] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FiscalApuracaoIcmsDB := TFiscalApuracaoIcmsService.ConsultarObjeto(FiscalApuracaoIcms.id);

  if not Assigned(FiscalApuracaoIcmsDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FiscalApuracaoIcms]',
      '', 0, 400);

  try
    if TFiscalApuracaoIcmsService.Alterar(FiscalApuracaoIcms) > 0 then
      Render(TFiscalApuracaoIcmsService.ConsultarObjeto(FiscalApuracaoIcms.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FiscalApuracaoIcms]',
        '', 0, 500);
  finally
    FreeAndNil(FiscalApuracaoIcmsDB);
  end;
end;

procedure TFiscalApuracaoIcmsController.Excluir(id: Integer);
var
  FiscalApuracaoIcms: TFiscalApuracaoIcms;
begin
  FiscalApuracaoIcms := TFiscalApuracaoIcmsService.ConsultarObjeto(id);

  if not Assigned(FiscalApuracaoIcms) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FiscalApuracaoIcms]',
      '', 0, 400);

  try
    if TFiscalApuracaoIcmsService.Excluir(FiscalApuracaoIcms) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FiscalApuracaoIcms]',
        '', 0, 500);
  finally
    FreeAndNil(FiscalApuracaoIcms);
  end;
end;

end.
