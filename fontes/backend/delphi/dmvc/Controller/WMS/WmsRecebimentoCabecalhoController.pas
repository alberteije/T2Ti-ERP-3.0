{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [WMS_RECEBIMENTO_CABECALHO] 
                                                                                
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
unit WmsRecebimentoCabecalhoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD WmsRecebimentoCabecalho')]
  [MVCPath('/wms-recebimento-cabecalho')]
  TWmsRecebimentoCabecalhoController = class(TMVCController)
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

{ TWmsRecebimentoCabecalhoController }

uses WmsRecebimentoCabecalhoService, WmsRecebimentoCabecalho, Commons, Filtro;

procedure TWmsRecebimentoCabecalhoController.ConsultarLista(Context: TWebContext);
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
      Render<TWmsRecebimentoCabecalho>(TWmsRecebimentoCabecalhoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TWmsRecebimentoCabecalho>(TWmsRecebimentoCabecalhoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista WmsRecebimentoCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TWmsRecebimentoCabecalhoController.ConsultarObjeto(id: Integer);
var
  WmsRecebimentoCabecalho: TWmsRecebimentoCabecalho;
begin
  try
    WmsRecebimentoCabecalho := TWmsRecebimentoCabecalhoService.ConsultarObjeto(id);

    if Assigned(WmsRecebimentoCabecalho) then
      Render(WmsRecebimentoCabecalho)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto WmsRecebimentoCabecalho]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto WmsRecebimentoCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TWmsRecebimentoCabecalhoController.Inserir(Context: TWebContext);
var
  WmsRecebimentoCabecalho: TWmsRecebimentoCabecalho;
begin
  try
    WmsRecebimentoCabecalho := Context.Request.BodyAs<TWmsRecebimentoCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir WmsRecebimentoCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TWmsRecebimentoCabecalhoService.Inserir(WmsRecebimentoCabecalho);
    Render(TWmsRecebimentoCabecalhoService.ConsultarObjeto(WmsRecebimentoCabecalho.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir WmsRecebimentoCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TWmsRecebimentoCabecalhoController.Alterar(id: Integer);
var
  WmsRecebimentoCabecalho, WmsRecebimentoCabecalhoDB: TWmsRecebimentoCabecalho;
begin
  try
    WmsRecebimentoCabecalho := Context.Request.BodyAs<TWmsRecebimentoCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar WmsRecebimentoCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if WmsRecebimentoCabecalho.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar WmsRecebimentoCabecalho] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  WmsRecebimentoCabecalhoDB := TWmsRecebimentoCabecalhoService.ConsultarObjeto(WmsRecebimentoCabecalho.id);

  if not Assigned(WmsRecebimentoCabecalhoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar WmsRecebimentoCabecalho]',
      '', 0, 400);

  try
    if TWmsRecebimentoCabecalhoService.Alterar(WmsRecebimentoCabecalho) > 0 then
      Render(TWmsRecebimentoCabecalhoService.ConsultarObjeto(WmsRecebimentoCabecalho.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar WmsRecebimentoCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(WmsRecebimentoCabecalhoDB);
  end;
end;

procedure TWmsRecebimentoCabecalhoController.Excluir(id: Integer);
var
  WmsRecebimentoCabecalho: TWmsRecebimentoCabecalho;
begin
  WmsRecebimentoCabecalho := TWmsRecebimentoCabecalhoService.ConsultarObjeto(id);

  if not Assigned(WmsRecebimentoCabecalho) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir WmsRecebimentoCabecalho]',
      '', 0, 400);

  try
    if TWmsRecebimentoCabecalhoService.Excluir(WmsRecebimentoCabecalho) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir WmsRecebimentoCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(WmsRecebimentoCabecalho);
  end;
end;

end.
