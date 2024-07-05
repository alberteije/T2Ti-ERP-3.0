{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FISCAL_ESTADUAL_PORTE] 
                                                                                
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
unit FiscalEstadualPorteController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FiscalEstadualPorte')]
  [MVCPath('/fiscal-estadual-porte')]
  TFiscalEstadualPorteController = class(TMVCController)
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

{ TFiscalEstadualPorteController }

uses FiscalEstadualPorteService, FiscalEstadualPorte, Commons, Filtro;

procedure TFiscalEstadualPorteController.ConsultarLista(Context: TWebContext);
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
      Render<TFiscalEstadualPorte>(TFiscalEstadualPorteService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFiscalEstadualPorte>(TFiscalEstadualPorteService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FiscalEstadualPorte] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFiscalEstadualPorteController.ConsultarObjeto(id: Integer);
var
  FiscalEstadualPorte: TFiscalEstadualPorte;
begin
  try
    FiscalEstadualPorte := TFiscalEstadualPorteService.ConsultarObjeto(id);

    if Assigned(FiscalEstadualPorte) then
      Render(FiscalEstadualPorte)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FiscalEstadualPorte]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FiscalEstadualPorte] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFiscalEstadualPorteController.Inserir(Context: TWebContext);
var
  FiscalEstadualPorte: TFiscalEstadualPorte;
begin
  try
    FiscalEstadualPorte := Context.Request.BodyAs<TFiscalEstadualPorte>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FiscalEstadualPorte] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFiscalEstadualPorteService.Inserir(FiscalEstadualPorte);
    Render(TFiscalEstadualPorteService.ConsultarObjeto(FiscalEstadualPorte.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FiscalEstadualPorte] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFiscalEstadualPorteController.Alterar(id: Integer);
var
  FiscalEstadualPorte, FiscalEstadualPorteDB: TFiscalEstadualPorte;
begin
  try
    FiscalEstadualPorte := Context.Request.BodyAs<TFiscalEstadualPorte>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FiscalEstadualPorte] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FiscalEstadualPorte.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FiscalEstadualPorte] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FiscalEstadualPorteDB := TFiscalEstadualPorteService.ConsultarObjeto(FiscalEstadualPorte.id);

  if not Assigned(FiscalEstadualPorteDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FiscalEstadualPorte]',
      '', 0, 400);

  try
    if TFiscalEstadualPorteService.Alterar(FiscalEstadualPorte) > 0 then
      Render(TFiscalEstadualPorteService.ConsultarObjeto(FiscalEstadualPorte.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FiscalEstadualPorte]',
        '', 0, 500);
  finally
    FreeAndNil(FiscalEstadualPorteDB);
  end;
end;

procedure TFiscalEstadualPorteController.Excluir(id: Integer);
var
  FiscalEstadualPorte: TFiscalEstadualPorte;
begin
  FiscalEstadualPorte := TFiscalEstadualPorteService.ConsultarObjeto(id);

  if not Assigned(FiscalEstadualPorte) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FiscalEstadualPorte]',
      '', 0, 400);

  try
    if TFiscalEstadualPorteService.Excluir(FiscalEstadualPorte) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FiscalEstadualPorte]',
        '', 0, 500);
  finally
    FreeAndNil(FiscalEstadualPorte);
  end;
end;

end.
