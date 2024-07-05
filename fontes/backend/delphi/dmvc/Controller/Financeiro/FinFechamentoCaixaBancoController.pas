{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [FIN_FECHAMENTO_CAIXA_BANCO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
unit FinFechamentoCaixaBancoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FinFechamentoCaixaBanco')]
  [MVCPath('/fin-fechamento-caixa-banco')]
  TFinFechamentoCaixaBancoController = class(TMVCController)
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

{ TFinFechamentoCaixaBancoController }

uses FinFechamentoCaixaBancoService, FinFechamentoCaixaBanco, Commons, Filtro;

procedure TFinFechamentoCaixaBancoController.ConsultarLista(Context: TWebContext);
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
      Render<TFinFechamentoCaixaBanco>(TFinFechamentoCaixaBancoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFinFechamentoCaixaBanco>(TFinFechamentoCaixaBancoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FinFechamentoCaixaBanco] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFinFechamentoCaixaBancoController.ConsultarObjeto(id: Integer);
var
  FinFechamentoCaixaBanco: TFinFechamentoCaixaBanco;
begin
  try
    FinFechamentoCaixaBanco := TFinFechamentoCaixaBancoService.ConsultarObjeto(id);

    if Assigned(FinFechamentoCaixaBanco) then
      Render(FinFechamentoCaixaBanco)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FinFechamentoCaixaBanco]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FinFechamentoCaixaBanco] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFinFechamentoCaixaBancoController.Inserir(Context: TWebContext);
var
  FinFechamentoCaixaBanco: TFinFechamentoCaixaBanco;
begin
  try
    FinFechamentoCaixaBanco := Context.Request.BodyAs<TFinFechamentoCaixaBanco>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FinFechamentoCaixaBanco] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFinFechamentoCaixaBancoService.Inserir(FinFechamentoCaixaBanco);
    Render(TFinFechamentoCaixaBancoService.ConsultarObjeto(FinFechamentoCaixaBanco.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

end;

procedure TFinFechamentoCaixaBancoController.Alterar(id: Integer);
var
  FinFechamentoCaixaBanco, FinFechamentoCaixaBancoDB: TFinFechamentoCaixaBanco;
begin
  try
    FinFechamentoCaixaBanco := Context.Request.BodyAs<TFinFechamentoCaixaBanco>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FinFechamentoCaixaBanco] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FinFechamentoCaixaBanco.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FinFechamentoCaixaBanco] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FinFechamentoCaixaBancoDB := TFinFechamentoCaixaBancoService.ConsultarObjeto(FinFechamentoCaixaBanco.id);

  if not Assigned(FinFechamentoCaixaBancoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FinFechamentoCaixaBanco]',
      '', 0, 400);

  try
    if TFinFechamentoCaixaBancoService.Alterar(FinFechamentoCaixaBanco) > 0 then
      Render(TFinFechamentoCaixaBancoService.ConsultarObjeto(FinFechamentoCaixaBanco.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FinFechamentoCaixaBanco]',
        '', 0, 500);
  finally
    FreeAndNil(FinFechamentoCaixaBancoDB);
  end;
end;

procedure TFinFechamentoCaixaBancoController.Excluir(id: Integer);
var
  FinFechamentoCaixaBanco: TFinFechamentoCaixaBanco;
begin
  FinFechamentoCaixaBanco := TFinFechamentoCaixaBancoService.ConsultarObjeto(id);

  if not Assigned(FinFechamentoCaixaBanco) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FinFechamentoCaixaBanco]',
      '', 0, 400);

  try
    if TFinFechamentoCaixaBancoService.Excluir(FinFechamentoCaixaBanco) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FinFechamentoCaixaBanco]',
        '', 0, 500);
  finally
    FreeAndNil(FinFechamentoCaixaBanco);
  end;
end;

end.
