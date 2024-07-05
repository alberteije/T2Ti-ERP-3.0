{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FISCAL_NOTA_FISCAL_ENTRADA] 
                                                                                
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
unit FiscalNotaFiscalEntradaController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FiscalNotaFiscalEntrada')]
  [MVCPath('/fiscal-nota-fiscal-entrada')]
  TFiscalNotaFiscalEntradaController = class(TMVCController)
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

{ TFiscalNotaFiscalEntradaController }

uses FiscalNotaFiscalEntradaService, FiscalNotaFiscalEntrada, Commons, Filtro;

procedure TFiscalNotaFiscalEntradaController.ConsultarLista(Context: TWebContext);
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
      Render<TFiscalNotaFiscalEntrada>(TFiscalNotaFiscalEntradaService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFiscalNotaFiscalEntrada>(TFiscalNotaFiscalEntradaService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FiscalNotaFiscalEntrada] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFiscalNotaFiscalEntradaController.ConsultarObjeto(id: Integer);
var
  FiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada;
begin
  try
    FiscalNotaFiscalEntrada := TFiscalNotaFiscalEntradaService.ConsultarObjeto(id);

    if Assigned(FiscalNotaFiscalEntrada) then
      Render(FiscalNotaFiscalEntrada)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FiscalNotaFiscalEntrada]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FiscalNotaFiscalEntrada] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFiscalNotaFiscalEntradaController.Inserir(Context: TWebContext);
var
  FiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada;
begin
  try
    FiscalNotaFiscalEntrada := Context.Request.BodyAs<TFiscalNotaFiscalEntrada>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FiscalNotaFiscalEntrada] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFiscalNotaFiscalEntradaService.Inserir(FiscalNotaFiscalEntrada);
    Render(TFiscalNotaFiscalEntradaService.ConsultarObjeto(FiscalNotaFiscalEntrada.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FiscalNotaFiscalEntrada] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFiscalNotaFiscalEntradaController.Alterar(id: Integer);
var
  FiscalNotaFiscalEntrada, FiscalNotaFiscalEntradaDB: TFiscalNotaFiscalEntrada;
begin
  try
    FiscalNotaFiscalEntrada := Context.Request.BodyAs<TFiscalNotaFiscalEntrada>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FiscalNotaFiscalEntrada] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FiscalNotaFiscalEntrada.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FiscalNotaFiscalEntrada] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FiscalNotaFiscalEntradaDB := TFiscalNotaFiscalEntradaService.ConsultarObjeto(FiscalNotaFiscalEntrada.id);

  if not Assigned(FiscalNotaFiscalEntradaDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FiscalNotaFiscalEntrada]',
      '', 0, 400);

  try
    if TFiscalNotaFiscalEntradaService.Alterar(FiscalNotaFiscalEntrada) > 0 then
      Render(TFiscalNotaFiscalEntradaService.ConsultarObjeto(FiscalNotaFiscalEntrada.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FiscalNotaFiscalEntrada]',
        '', 0, 500);
  finally
    FreeAndNil(FiscalNotaFiscalEntradaDB);
  end;
end;

procedure TFiscalNotaFiscalEntradaController.Excluir(id: Integer);
var
  FiscalNotaFiscalEntrada: TFiscalNotaFiscalEntrada;
begin
  FiscalNotaFiscalEntrada := TFiscalNotaFiscalEntradaService.ConsultarObjeto(id);

  if not Assigned(FiscalNotaFiscalEntrada) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FiscalNotaFiscalEntrada]',
      '', 0, 400);

  try
    if TFiscalNotaFiscalEntradaService.Excluir(FiscalNotaFiscalEntrada) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FiscalNotaFiscalEntrada]',
        '', 0, 500);
  finally
    FreeAndNil(FiscalNotaFiscalEntrada);
  end;
end;

end.
