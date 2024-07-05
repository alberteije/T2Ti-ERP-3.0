{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FISCAL_MUNICIPAL_REGIME] 
                                                                                
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
unit FiscalMunicipalRegimeController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FiscalMunicipalRegime')]
  [MVCPath('/fiscal-municipal-regime')]
  TFiscalMunicipalRegimeController = class(TMVCController)
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

{ TFiscalMunicipalRegimeController }

uses FiscalMunicipalRegimeService, FiscalMunicipalRegime, Commons, Filtro;

procedure TFiscalMunicipalRegimeController.ConsultarLista(Context: TWebContext);
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
      Render<TFiscalMunicipalRegime>(TFiscalMunicipalRegimeService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFiscalMunicipalRegime>(TFiscalMunicipalRegimeService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FiscalMunicipalRegime] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFiscalMunicipalRegimeController.ConsultarObjeto(id: Integer);
var
  FiscalMunicipalRegime: TFiscalMunicipalRegime;
begin
  try
    FiscalMunicipalRegime := TFiscalMunicipalRegimeService.ConsultarObjeto(id);

    if Assigned(FiscalMunicipalRegime) then
      Render(FiscalMunicipalRegime)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FiscalMunicipalRegime]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FiscalMunicipalRegime] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFiscalMunicipalRegimeController.Inserir(Context: TWebContext);
var
  FiscalMunicipalRegime: TFiscalMunicipalRegime;
begin
  try
    FiscalMunicipalRegime := Context.Request.BodyAs<TFiscalMunicipalRegime>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FiscalMunicipalRegime] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFiscalMunicipalRegimeService.Inserir(FiscalMunicipalRegime);
    Render(TFiscalMunicipalRegimeService.ConsultarObjeto(FiscalMunicipalRegime.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FiscalMunicipalRegime] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFiscalMunicipalRegimeController.Alterar(id: Integer);
var
  FiscalMunicipalRegime, FiscalMunicipalRegimeDB: TFiscalMunicipalRegime;
begin
  try
    FiscalMunicipalRegime := Context.Request.BodyAs<TFiscalMunicipalRegime>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FiscalMunicipalRegime] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FiscalMunicipalRegime.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FiscalMunicipalRegime] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FiscalMunicipalRegimeDB := TFiscalMunicipalRegimeService.ConsultarObjeto(FiscalMunicipalRegime.id);

  if not Assigned(FiscalMunicipalRegimeDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FiscalMunicipalRegime]',
      '', 0, 400);

  try
    if TFiscalMunicipalRegimeService.Alterar(FiscalMunicipalRegime) > 0 then
      Render(TFiscalMunicipalRegimeService.ConsultarObjeto(FiscalMunicipalRegime.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FiscalMunicipalRegime]',
        '', 0, 500);
  finally
    FreeAndNil(FiscalMunicipalRegimeDB);
  end;
end;

procedure TFiscalMunicipalRegimeController.Excluir(id: Integer);
var
  FiscalMunicipalRegime: TFiscalMunicipalRegime;
begin
  FiscalMunicipalRegime := TFiscalMunicipalRegimeService.ConsultarObjeto(id);

  if not Assigned(FiscalMunicipalRegime) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FiscalMunicipalRegime]',
      '', 0, 400);

  try
    if TFiscalMunicipalRegimeService.Excluir(FiscalMunicipalRegime) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FiscalMunicipalRegime]',
        '', 0, 500);
  finally
    FreeAndNil(FiscalMunicipalRegime);
  end;
end;

end.
