{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [WMS_ORDEM_SEPARACAO_CAB] 
                                                                                
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
unit WmsOrdemSeparacaoCabController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD WmsOrdemSeparacaoCab')]
  [MVCPath('/wms-ordem-separacao-cab')]
  TWmsOrdemSeparacaoCabController = class(TMVCController)
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

{ TWmsOrdemSeparacaoCabController }

uses WmsOrdemSeparacaoCabService, WmsOrdemSeparacaoCab, Commons, Filtro;

procedure TWmsOrdemSeparacaoCabController.ConsultarLista(Context: TWebContext);
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
      Render<TWmsOrdemSeparacaoCab>(TWmsOrdemSeparacaoCabService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TWmsOrdemSeparacaoCab>(TWmsOrdemSeparacaoCabService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista WmsOrdemSeparacaoCab] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TWmsOrdemSeparacaoCabController.ConsultarObjeto(id: Integer);
var
  WmsOrdemSeparacaoCab: TWmsOrdemSeparacaoCab;
begin
  try
    WmsOrdemSeparacaoCab := TWmsOrdemSeparacaoCabService.ConsultarObjeto(id);

    if Assigned(WmsOrdemSeparacaoCab) then
      Render(WmsOrdemSeparacaoCab)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto WmsOrdemSeparacaoCab]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto WmsOrdemSeparacaoCab] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TWmsOrdemSeparacaoCabController.Inserir(Context: TWebContext);
var
  WmsOrdemSeparacaoCab: TWmsOrdemSeparacaoCab;
begin
  try
    WmsOrdemSeparacaoCab := Context.Request.BodyAs<TWmsOrdemSeparacaoCab>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir WmsOrdemSeparacaoCab] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TWmsOrdemSeparacaoCabService.Inserir(WmsOrdemSeparacaoCab);
    Render(TWmsOrdemSeparacaoCabService.ConsultarObjeto(WmsOrdemSeparacaoCab.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir WmsOrdemSeparacaoCab] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TWmsOrdemSeparacaoCabController.Alterar(id: Integer);
var
  WmsOrdemSeparacaoCab, WmsOrdemSeparacaoCabDB: TWmsOrdemSeparacaoCab;
begin
  try
    WmsOrdemSeparacaoCab := Context.Request.BodyAs<TWmsOrdemSeparacaoCab>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar WmsOrdemSeparacaoCab] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if WmsOrdemSeparacaoCab.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar WmsOrdemSeparacaoCab] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  WmsOrdemSeparacaoCabDB := TWmsOrdemSeparacaoCabService.ConsultarObjeto(WmsOrdemSeparacaoCab.id);

  if not Assigned(WmsOrdemSeparacaoCabDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar WmsOrdemSeparacaoCab]',
      '', 0, 400);

  try
    if TWmsOrdemSeparacaoCabService.Alterar(WmsOrdemSeparacaoCab) > 0 then
      Render(TWmsOrdemSeparacaoCabService.ConsultarObjeto(WmsOrdemSeparacaoCab.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar WmsOrdemSeparacaoCab]',
        '', 0, 500);
  finally
    FreeAndNil(WmsOrdemSeparacaoCabDB);
  end;
end;

procedure TWmsOrdemSeparacaoCabController.Excluir(id: Integer);
var
  WmsOrdemSeparacaoCab: TWmsOrdemSeparacaoCab;
begin
  WmsOrdemSeparacaoCab := TWmsOrdemSeparacaoCabService.ConsultarObjeto(id);

  if not Assigned(WmsOrdemSeparacaoCab) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir WmsOrdemSeparacaoCab]',
      '', 0, 400);

  try
    if TWmsOrdemSeparacaoCabService.Excluir(WmsOrdemSeparacaoCab) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir WmsOrdemSeparacaoCab]',
        '', 0, 500);
  finally
    FreeAndNil(WmsOrdemSeparacaoCab);
  end;
end;

end.
