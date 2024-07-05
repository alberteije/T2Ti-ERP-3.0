{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [ORCAMENTO_FLUXO_CAIXA] 
                                                                                
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
unit OrcamentoFluxoCaixaController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD OrcamentoFluxoCaixa')]
  [MVCPath('/orcamento-fluxo-caixa')]
  TOrcamentoFluxoCaixaController = class(TMVCController)
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

{ TOrcamentoFluxoCaixaController }

uses OrcamentoFluxoCaixaService, OrcamentoFluxoCaixa, Commons, Filtro;

procedure TOrcamentoFluxoCaixaController.ConsultarLista(Context: TWebContext);
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
      Render<TOrcamentoFluxoCaixa>(TOrcamentoFluxoCaixaService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TOrcamentoFluxoCaixa>(TOrcamentoFluxoCaixaService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista OrcamentoFluxoCaixa] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TOrcamentoFluxoCaixaController.ConsultarObjeto(id: Integer);
var
  OrcamentoFluxoCaixa: TOrcamentoFluxoCaixa;
begin
  try
    OrcamentoFluxoCaixa := TOrcamentoFluxoCaixaService.ConsultarObjeto(id);

    if Assigned(OrcamentoFluxoCaixa) then
      Render(OrcamentoFluxoCaixa)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto OrcamentoFluxoCaixa]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto OrcamentoFluxoCaixa] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TOrcamentoFluxoCaixaController.Inserir(Context: TWebContext);
var
  OrcamentoFluxoCaixa: TOrcamentoFluxoCaixa;
begin
  try
    OrcamentoFluxoCaixa := Context.Request.BodyAs<TOrcamentoFluxoCaixa>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir OrcamentoFluxoCaixa] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TOrcamentoFluxoCaixaService.Inserir(OrcamentoFluxoCaixa);
    Render(TOrcamentoFluxoCaixaService.ConsultarObjeto(OrcamentoFluxoCaixa.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir OrcamentoFluxoCaixa] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TOrcamentoFluxoCaixaController.Alterar(id: Integer);
var
  OrcamentoFluxoCaixa, OrcamentoFluxoCaixaDB: TOrcamentoFluxoCaixa;
begin
  try
    OrcamentoFluxoCaixa := Context.Request.BodyAs<TOrcamentoFluxoCaixa>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar OrcamentoFluxoCaixa] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if OrcamentoFluxoCaixa.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar OrcamentoFluxoCaixa] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  OrcamentoFluxoCaixaDB := TOrcamentoFluxoCaixaService.ConsultarObjeto(OrcamentoFluxoCaixa.id);

  if not Assigned(OrcamentoFluxoCaixaDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar OrcamentoFluxoCaixa]',
      '', 0, 400);

  try
    if TOrcamentoFluxoCaixaService.Alterar(OrcamentoFluxoCaixa) > 0 then
      Render(TOrcamentoFluxoCaixaService.ConsultarObjeto(OrcamentoFluxoCaixa.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar OrcamentoFluxoCaixa]',
        '', 0, 500);
  finally
    FreeAndNil(OrcamentoFluxoCaixaDB);
  end;
end;

procedure TOrcamentoFluxoCaixaController.Excluir(id: Integer);
var
  OrcamentoFluxoCaixa: TOrcamentoFluxoCaixa;
begin
  OrcamentoFluxoCaixa := TOrcamentoFluxoCaixaService.ConsultarObjeto(id);

  if not Assigned(OrcamentoFluxoCaixa) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir OrcamentoFluxoCaixa]',
      '', 0, 400);

  try
    if TOrcamentoFluxoCaixaService.Excluir(OrcamentoFluxoCaixa) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir OrcamentoFluxoCaixa]',
        '', 0, 500);
  finally
    FreeAndNil(OrcamentoFluxoCaixa);
  end;
end;

end.
