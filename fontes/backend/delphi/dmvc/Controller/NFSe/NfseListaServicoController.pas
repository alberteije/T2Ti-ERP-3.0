{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [NFSE_LISTA_SERVICO] 
                                                                                
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
unit NfseListaServicoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD NfseListaServico')]
  [MVCPath('/nfse-lista-servico')]
  TNfseListaServicoController = class(TMVCController)
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

{ TNfseListaServicoController }

uses NfseListaServicoService, NfseListaServico, Commons, Filtro;

procedure TNfseListaServicoController.ConsultarLista(Context: TWebContext);
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
      Render<TNfseListaServico>(TNfseListaServicoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TNfseListaServico>(TNfseListaServicoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista NfseListaServico] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TNfseListaServicoController.ConsultarObjeto(id: Integer);
var
  NfseListaServico: TNfseListaServico;
begin
  try
    NfseListaServico := TNfseListaServicoService.ConsultarObjeto(id);

    if Assigned(NfseListaServico) then
      Render(NfseListaServico)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto NfseListaServico]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto NfseListaServico] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TNfseListaServicoController.Inserir(Context: TWebContext);
var
  NfseListaServico: TNfseListaServico;
begin
  try
    NfseListaServico := Context.Request.BodyAs<TNfseListaServico>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir NfseListaServico] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TNfseListaServicoService.Inserir(NfseListaServico);
    Render(TNfseListaServicoService.ConsultarObjeto(NfseListaServico.Id));
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

procedure TNfseListaServicoController.Alterar(id: Integer);
var
  NfseListaServico, NfseListaServicoDB: TNfseListaServico;
begin
  try
    NfseListaServico := Context.Request.BodyAs<TNfseListaServico>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar NfseListaServico] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if NfseListaServico.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar NfseListaServico] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  NfseListaServicoDB := TNfseListaServicoService.ConsultarObjeto(NfseListaServico.id);

  if not Assigned(NfseListaServicoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar NfseListaServico]',
      '', 0, 400);

  try
    if TNfseListaServicoService.Alterar(NfseListaServico) > 0 then
      Render(TNfseListaServicoService.ConsultarObjeto(NfseListaServico.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar NfseListaServico]',
        '', 0, 500);
  finally
    FreeAndNil(NfseListaServicoDB);
  end;
end;

procedure TNfseListaServicoController.Excluir(id: Integer);
var
  NfseListaServico: TNfseListaServico;
begin
  NfseListaServico := TNfseListaServicoService.ConsultarObjeto(id);

  if not Assigned(NfseListaServico) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir NfseListaServico]',
      '', 0, 400);

  try
    if TNfseListaServicoService.Excluir(NfseListaServico) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir NfseListaServico]',
        '', 0, 500);
  finally
    FreeAndNil(NfseListaServico);
  end;
end;

end.
