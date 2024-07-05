{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [WMS_CAIXA] 
                                                                                
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
unit WmsCaixaController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD WmsCaixa')]
  [MVCPath('/wms-caixa')]
  TWmsCaixaController = class(TMVCController)
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

{ TWmsCaixaController }

uses WmsCaixaService, WmsCaixa, Commons, Filtro;

procedure TWmsCaixaController.ConsultarLista(Context: TWebContext);
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
      Render<TWmsCaixa>(TWmsCaixaService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TWmsCaixa>(TWmsCaixaService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista WmsCaixa] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TWmsCaixaController.ConsultarObjeto(id: Integer);
var
  WmsCaixa: TWmsCaixa;
begin
  try
    WmsCaixa := TWmsCaixaService.ConsultarObjeto(id);

    if Assigned(WmsCaixa) then
      Render(WmsCaixa)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto WmsCaixa]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto WmsCaixa] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TWmsCaixaController.Inserir(Context: TWebContext);
var
  WmsCaixa: TWmsCaixa;
begin
  try
    WmsCaixa := Context.Request.BodyAs<TWmsCaixa>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir WmsCaixa] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TWmsCaixaService.Inserir(WmsCaixa);
    Render(TWmsCaixaService.ConsultarObjeto(WmsCaixa.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir WmsCaixa] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TWmsCaixaController.Alterar(id: Integer);
var
  WmsCaixa, WmsCaixaDB: TWmsCaixa;
begin
  try
    WmsCaixa := Context.Request.BodyAs<TWmsCaixa>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar WmsCaixa] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if WmsCaixa.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar WmsCaixa] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  WmsCaixaDB := TWmsCaixaService.ConsultarObjeto(WmsCaixa.id);

  if not Assigned(WmsCaixaDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar WmsCaixa]',
      '', 0, 400);

  try
    if TWmsCaixaService.Alterar(WmsCaixa) > 0 then
      Render(TWmsCaixaService.ConsultarObjeto(WmsCaixa.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar WmsCaixa]',
        '', 0, 500);
  finally
    FreeAndNil(WmsCaixaDB);
  end;
end;

procedure TWmsCaixaController.Excluir(id: Integer);
var
  WmsCaixa: TWmsCaixa;
begin
  WmsCaixa := TWmsCaixaService.ConsultarObjeto(id);

  if not Assigned(WmsCaixa) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir WmsCaixa]',
      '', 0, 400);

  try
    if TWmsCaixaService.Excluir(WmsCaixa) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir WmsCaixa]',
        '', 0, 500);
  finally
    FreeAndNil(WmsCaixa);
  end;
end;

end.
