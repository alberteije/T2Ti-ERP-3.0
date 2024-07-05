{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [ORCAMENTO_FLUXO_CAIXA_PERIODO] 
                                                                                
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
unit OrcamentoFluxoCaixaPeriodoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD OrcamentoFluxoCaixaPeriodo')]
  [MVCPath('/orcamento-fluxo-caixa-periodo')]
  TOrcamentoFluxoCaixaPeriodoController = class(TMVCController)
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

{ TOrcamentoFluxoCaixaPeriodoController }

uses OrcamentoFluxoCaixaPeriodoService, OrcamentoFluxoCaixaPeriodo, Commons, Filtro;

procedure TOrcamentoFluxoCaixaPeriodoController.ConsultarLista(Context: TWebContext);
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
      Render<TOrcamentoFluxoCaixaPeriodo>(TOrcamentoFluxoCaixaPeriodoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TOrcamentoFluxoCaixaPeriodo>(TOrcamentoFluxoCaixaPeriodoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista OrcamentoFluxoCaixaPeriodo] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TOrcamentoFluxoCaixaPeriodoController.ConsultarObjeto(id: Integer);
var
  OrcamentoFluxoCaixaPeriodo: TOrcamentoFluxoCaixaPeriodo;
begin
  try
    OrcamentoFluxoCaixaPeriodo := TOrcamentoFluxoCaixaPeriodoService.ConsultarObjeto(id);

    if Assigned(OrcamentoFluxoCaixaPeriodo) then
      Render(OrcamentoFluxoCaixaPeriodo)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto OrcamentoFluxoCaixaPeriodo]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto OrcamentoFluxoCaixaPeriodo] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TOrcamentoFluxoCaixaPeriodoController.Inserir(Context: TWebContext);
var
  OrcamentoFluxoCaixaPeriodo: TOrcamentoFluxoCaixaPeriodo;
begin
  try
    OrcamentoFluxoCaixaPeriodo := Context.Request.BodyAs<TOrcamentoFluxoCaixaPeriodo>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir OrcamentoFluxoCaixaPeriodo] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TOrcamentoFluxoCaixaPeriodoService.Inserir(OrcamentoFluxoCaixaPeriodo);
    Render(TOrcamentoFluxoCaixaPeriodoService.ConsultarObjeto(OrcamentoFluxoCaixaPeriodo.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir OrcamentoFluxoCaixaPeriodo] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TOrcamentoFluxoCaixaPeriodoController.Alterar(id: Integer);
var
  OrcamentoFluxoCaixaPeriodo, OrcamentoFluxoCaixaPeriodoDB: TOrcamentoFluxoCaixaPeriodo;
begin
  try
    OrcamentoFluxoCaixaPeriodo := Context.Request.BodyAs<TOrcamentoFluxoCaixaPeriodo>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar OrcamentoFluxoCaixaPeriodo] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if OrcamentoFluxoCaixaPeriodo.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar OrcamentoFluxoCaixaPeriodo] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  OrcamentoFluxoCaixaPeriodoDB := TOrcamentoFluxoCaixaPeriodoService.ConsultarObjeto(OrcamentoFluxoCaixaPeriodo.id);

  if not Assigned(OrcamentoFluxoCaixaPeriodoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar OrcamentoFluxoCaixaPeriodo]',
      '', 0, 400);

  try
    if TOrcamentoFluxoCaixaPeriodoService.Alterar(OrcamentoFluxoCaixaPeriodo) > 0 then
      Render(TOrcamentoFluxoCaixaPeriodoService.ConsultarObjeto(OrcamentoFluxoCaixaPeriodo.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar OrcamentoFluxoCaixaPeriodo]',
        '', 0, 500);
  finally
    FreeAndNil(OrcamentoFluxoCaixaPeriodoDB);
  end;
end;

procedure TOrcamentoFluxoCaixaPeriodoController.Excluir(id: Integer);
var
  OrcamentoFluxoCaixaPeriodo: TOrcamentoFluxoCaixaPeriodo;
begin
  OrcamentoFluxoCaixaPeriodo := TOrcamentoFluxoCaixaPeriodoService.ConsultarObjeto(id);

  if not Assigned(OrcamentoFluxoCaixaPeriodo) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir OrcamentoFluxoCaixaPeriodo]',
      '', 0, 400);

  try
    if TOrcamentoFluxoCaixaPeriodoService.Excluir(OrcamentoFluxoCaixaPeriodo) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir OrcamentoFluxoCaixaPeriodo]',
        '', 0, 500);
  finally
    FreeAndNil(OrcamentoFluxoCaixaPeriodo);
  end;
end;

end.
