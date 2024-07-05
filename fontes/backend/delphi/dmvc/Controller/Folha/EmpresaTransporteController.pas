{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [EMPRESA_TRANSPORTE] 
                                                                                
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
unit EmpresaTransporteController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD EmpresaTransporte')]
  [MVCPath('/empresa-transporte')]
  TEmpresaTransporteController = class(TMVCController)
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

{ TEmpresaTransporteController }

uses EmpresaTransporteService, EmpresaTransporte, Commons, Filtro;

procedure TEmpresaTransporteController.ConsultarLista(Context: TWebContext);
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
      Render<TEmpresaTransporte>(TEmpresaTransporteService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TEmpresaTransporte>(TEmpresaTransporteService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista EmpresaTransporte] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TEmpresaTransporteController.ConsultarObjeto(id: Integer);
var
  EmpresaTransporte: TEmpresaTransporte;
begin
  try
    EmpresaTransporte := TEmpresaTransporteService.ConsultarObjeto(id);

    if Assigned(EmpresaTransporte) then
      Render(EmpresaTransporte)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto EmpresaTransporte]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto EmpresaTransporte] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TEmpresaTransporteController.Inserir(Context: TWebContext);
var
  EmpresaTransporte: TEmpresaTransporte;
begin
  try
    EmpresaTransporte := Context.Request.BodyAs<TEmpresaTransporte>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir EmpresaTransporte] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TEmpresaTransporteService.Inserir(EmpresaTransporte);
    Render(TEmpresaTransporteService.ConsultarObjeto(EmpresaTransporte.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir EmpresaTransporte] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TEmpresaTransporteController.Alterar(id: Integer);
var
  EmpresaTransporte, EmpresaTransporteDB: TEmpresaTransporte;
begin
  try
    EmpresaTransporte := Context.Request.BodyAs<TEmpresaTransporte>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar EmpresaTransporte] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if EmpresaTransporte.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar EmpresaTransporte] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  EmpresaTransporteDB := TEmpresaTransporteService.ConsultarObjeto(EmpresaTransporte.id);

  if not Assigned(EmpresaTransporteDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar EmpresaTransporte]',
      '', 0, 400);

  try
    if TEmpresaTransporteService.Alterar(EmpresaTransporte) > 0 then
      Render(TEmpresaTransporteService.ConsultarObjeto(EmpresaTransporte.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar EmpresaTransporte]',
        '', 0, 500);
  finally
    FreeAndNil(EmpresaTransporteDB);
  end;
end;

procedure TEmpresaTransporteController.Excluir(id: Integer);
var
  EmpresaTransporte: TEmpresaTransporte;
begin
  EmpresaTransporte := TEmpresaTransporteService.ConsultarObjeto(id);

  if not Assigned(EmpresaTransporte) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir EmpresaTransporte]',
      '', 0, 400);

  try
    if TEmpresaTransporteService.Excluir(EmpresaTransporte) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir EmpresaTransporte]',
        '', 0, 500);
  finally
    FreeAndNil(EmpresaTransporte);
  end;
end;

end.
