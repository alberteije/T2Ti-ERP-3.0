{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [PONTO_BANCO_HORAS] 
                                                                                
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
unit PontoBancoHorasController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD PontoBancoHoras')]
  [MVCPath('/ponto-banco-horas')]
  TPontoBancoHorasController = class(TMVCController)
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

{ TPontoBancoHorasController }

uses PontoBancoHorasService, PontoBancoHoras, Commons, Filtro;

procedure TPontoBancoHorasController.ConsultarLista(Context: TWebContext);
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
      Render<TPontoBancoHoras>(TPontoBancoHorasService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TPontoBancoHoras>(TPontoBancoHorasService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista PontoBancoHoras] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPontoBancoHorasController.ConsultarObjeto(id: Integer);
var
  PontoBancoHoras: TPontoBancoHoras;
begin
  try
    PontoBancoHoras := TPontoBancoHorasService.ConsultarObjeto(id);

    if Assigned(PontoBancoHoras) then
      Render(PontoBancoHoras)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto PontoBancoHoras]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto PontoBancoHoras] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPontoBancoHorasController.Inserir(Context: TWebContext);
var
  PontoBancoHoras: TPontoBancoHoras;
begin
  try
    PontoBancoHoras := Context.Request.BodyAs<TPontoBancoHoras>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir PontoBancoHoras] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TPontoBancoHorasService.Inserir(PontoBancoHoras);
    Render(TPontoBancoHorasService.ConsultarObjeto(PontoBancoHoras.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir PontoBancoHoras] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TPontoBancoHorasController.Alterar(id: Integer);
var
  PontoBancoHoras, PontoBancoHorasDB: TPontoBancoHoras;
begin
  try
    PontoBancoHoras := Context.Request.BodyAs<TPontoBancoHoras>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar PontoBancoHoras] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if PontoBancoHoras.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar PontoBancoHoras] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  PontoBancoHorasDB := TPontoBancoHorasService.ConsultarObjeto(PontoBancoHoras.id);

  if not Assigned(PontoBancoHorasDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar PontoBancoHoras]',
      '', 0, 400);

  try
    if TPontoBancoHorasService.Alterar(PontoBancoHoras) > 0 then
      Render(TPontoBancoHorasService.ConsultarObjeto(PontoBancoHoras.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar PontoBancoHoras]',
        '', 0, 500);
  finally
    FreeAndNil(PontoBancoHorasDB);
  end;
end;

procedure TPontoBancoHorasController.Excluir(id: Integer);
var
  PontoBancoHoras: TPontoBancoHoras;
begin
  PontoBancoHoras := TPontoBancoHorasService.ConsultarObjeto(id);

  if not Assigned(PontoBancoHoras) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir PontoBancoHoras]',
      '', 0, 400);

  try
    if TPontoBancoHorasService.Excluir(PontoBancoHoras) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir PontoBancoHoras]',
        '', 0, 500);
  finally
    FreeAndNil(PontoBancoHoras);
  end;
end;

end.
