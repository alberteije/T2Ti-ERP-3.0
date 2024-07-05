{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FISCAL_NOTA_FISCAL_SAIDA] 
                                                                                
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
unit FiscalNotaFiscalSaidaController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FiscalNotaFiscalSaida')]
  [MVCPath('/fiscal-nota-fiscal-saida')]
  TFiscalNotaFiscalSaidaController = class(TMVCController)
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

{ TFiscalNotaFiscalSaidaController }

uses FiscalNotaFiscalSaidaService, FiscalNotaFiscalSaida, Commons, Filtro;

procedure TFiscalNotaFiscalSaidaController.ConsultarLista(Context: TWebContext);
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
      Render<TFiscalNotaFiscalSaida>(TFiscalNotaFiscalSaidaService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFiscalNotaFiscalSaida>(TFiscalNotaFiscalSaidaService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FiscalNotaFiscalSaida] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFiscalNotaFiscalSaidaController.ConsultarObjeto(id: Integer);
var
  FiscalNotaFiscalSaida: TFiscalNotaFiscalSaida;
begin
  try
    FiscalNotaFiscalSaida := TFiscalNotaFiscalSaidaService.ConsultarObjeto(id);

    if Assigned(FiscalNotaFiscalSaida) then
      Render(FiscalNotaFiscalSaida)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FiscalNotaFiscalSaida]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FiscalNotaFiscalSaida] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFiscalNotaFiscalSaidaController.Inserir(Context: TWebContext);
var
  FiscalNotaFiscalSaida: TFiscalNotaFiscalSaida;
begin
  try
    FiscalNotaFiscalSaida := Context.Request.BodyAs<TFiscalNotaFiscalSaida>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FiscalNotaFiscalSaida] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFiscalNotaFiscalSaidaService.Inserir(FiscalNotaFiscalSaida);
    Render(TFiscalNotaFiscalSaidaService.ConsultarObjeto(FiscalNotaFiscalSaida.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FiscalNotaFiscalSaida] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFiscalNotaFiscalSaidaController.Alterar(id: Integer);
var
  FiscalNotaFiscalSaida, FiscalNotaFiscalSaidaDB: TFiscalNotaFiscalSaida;
begin
  try
    FiscalNotaFiscalSaida := Context.Request.BodyAs<TFiscalNotaFiscalSaida>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FiscalNotaFiscalSaida] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FiscalNotaFiscalSaida.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FiscalNotaFiscalSaida] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FiscalNotaFiscalSaidaDB := TFiscalNotaFiscalSaidaService.ConsultarObjeto(FiscalNotaFiscalSaida.id);

  if not Assigned(FiscalNotaFiscalSaidaDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FiscalNotaFiscalSaida]',
      '', 0, 400);

  try
    if TFiscalNotaFiscalSaidaService.Alterar(FiscalNotaFiscalSaida) > 0 then
      Render(TFiscalNotaFiscalSaidaService.ConsultarObjeto(FiscalNotaFiscalSaida.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FiscalNotaFiscalSaida]',
        '', 0, 500);
  finally
    FreeAndNil(FiscalNotaFiscalSaidaDB);
  end;
end;

procedure TFiscalNotaFiscalSaidaController.Excluir(id: Integer);
var
  FiscalNotaFiscalSaida: TFiscalNotaFiscalSaida;
begin
  FiscalNotaFiscalSaida := TFiscalNotaFiscalSaidaService.ConsultarObjeto(id);

  if not Assigned(FiscalNotaFiscalSaida) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FiscalNotaFiscalSaida]',
      '', 0, 400);

  try
    if TFiscalNotaFiscalSaidaService.Excluir(FiscalNotaFiscalSaida) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FiscalNotaFiscalSaida]',
        '', 0, 500);
  finally
    FreeAndNil(FiscalNotaFiscalSaida);
  end;
end;

end.
