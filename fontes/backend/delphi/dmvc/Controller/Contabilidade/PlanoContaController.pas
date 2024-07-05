{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [PLANO_CONTA] 
                                                                                
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
unit PlanoContaController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD PlanoConta')]
  [MVCPath('/plano-conta')]
  TPlanoContaController = class(TMVCController)
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

{ TPlanoContaController }

uses PlanoContaService, PlanoConta, Commons, Filtro;

procedure TPlanoContaController.ConsultarLista(Context: TWebContext);
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
      Render<TPlanoConta>(TPlanoContaService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TPlanoConta>(TPlanoContaService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista PlanoConta] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPlanoContaController.ConsultarObjeto(id: Integer);
var
  PlanoConta: TPlanoConta;
begin
  try
    PlanoConta := TPlanoContaService.ConsultarObjeto(id);

    if Assigned(PlanoConta) then
      Render(PlanoConta)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto PlanoConta]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto PlanoConta] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPlanoContaController.Inserir(Context: TWebContext);
var
  PlanoConta: TPlanoConta;
begin
  try
    PlanoConta := Context.Request.BodyAs<TPlanoConta>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir PlanoConta] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TPlanoContaService.Inserir(PlanoConta);
    Render(TPlanoContaService.ConsultarObjeto(PlanoConta.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir PlanoConta] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TPlanoContaController.Alterar(id: Integer);
var
  PlanoConta, PlanoContaDB: TPlanoConta;
begin
  try
    PlanoConta := Context.Request.BodyAs<TPlanoConta>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar PlanoConta] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if PlanoConta.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar PlanoConta] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  PlanoContaDB := TPlanoContaService.ConsultarObjeto(PlanoConta.id);

  if not Assigned(PlanoContaDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar PlanoConta]',
      '', 0, 400);

  try
    if TPlanoContaService.Alterar(PlanoConta) > 0 then
      Render(TPlanoContaService.ConsultarObjeto(PlanoConta.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar PlanoConta]',
        '', 0, 500);
  finally
    FreeAndNil(PlanoContaDB);
  end;
end;

procedure TPlanoContaController.Excluir(id: Integer);
var
  PlanoConta: TPlanoConta;
begin
  PlanoConta := TPlanoContaService.ConsultarObjeto(id);

  if not Assigned(PlanoConta) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir PlanoConta]',
      '', 0, 400);

  try
    if TPlanoContaService.Excluir(PlanoConta) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir PlanoConta]',
        '', 0, 500);
  finally
    FreeAndNil(PlanoConta);
  end;
end;

end.
