{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [PONTO_BANCO_HORAS_UTILIZACAO] 
                                                                                
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
unit PontoBancoHorasUtilizacaoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD PontoBancoHorasUtilizacao')]
  [MVCPath('/ponto-banco-horas-utilizacao')]
  TPontoBancoHorasUtilizacaoController = class(TMVCController)
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

{ TPontoBancoHorasUtilizacaoController }

uses PontoBancoHorasUtilizacaoService, PontoBancoHorasUtilizacao, Commons, Filtro;

procedure TPontoBancoHorasUtilizacaoController.ConsultarLista(Context: TWebContext);
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
      Render<TPontoBancoHorasUtilizacao>(TPontoBancoHorasUtilizacaoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TPontoBancoHorasUtilizacao>(TPontoBancoHorasUtilizacaoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista PontoBancoHorasUtilizacao] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPontoBancoHorasUtilizacaoController.ConsultarObjeto(id: Integer);
var
  PontoBancoHorasUtilizacao: TPontoBancoHorasUtilizacao;
begin
  try
    PontoBancoHorasUtilizacao := TPontoBancoHorasUtilizacaoService.ConsultarObjeto(id);

    if Assigned(PontoBancoHorasUtilizacao) then
      Render(PontoBancoHorasUtilizacao)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto PontoBancoHorasUtilizacao]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto PontoBancoHorasUtilizacao] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPontoBancoHorasUtilizacaoController.Inserir(Context: TWebContext);
var
  PontoBancoHorasUtilizacao: TPontoBancoHorasUtilizacao;
begin
  try
    PontoBancoHorasUtilizacao := Context.Request.BodyAs<TPontoBancoHorasUtilizacao>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir PontoBancoHorasUtilizacao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TPontoBancoHorasUtilizacaoService.Inserir(PontoBancoHorasUtilizacao);
    Render(TPontoBancoHorasUtilizacaoService.ConsultarObjeto(PontoBancoHorasUtilizacao.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir PontoBancoHorasUtilizacao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TPontoBancoHorasUtilizacaoController.Alterar(id: Integer);
var
  PontoBancoHorasUtilizacao, PontoBancoHorasUtilizacaoDB: TPontoBancoHorasUtilizacao;
begin
  try
    PontoBancoHorasUtilizacao := Context.Request.BodyAs<TPontoBancoHorasUtilizacao>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar PontoBancoHorasUtilizacao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if PontoBancoHorasUtilizacao.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar PontoBancoHorasUtilizacao] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  PontoBancoHorasUtilizacaoDB := TPontoBancoHorasUtilizacaoService.ConsultarObjeto(PontoBancoHorasUtilizacao.id);

  if not Assigned(PontoBancoHorasUtilizacaoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar PontoBancoHorasUtilizacao]',
      '', 0, 400);

  try
    if TPontoBancoHorasUtilizacaoService.Alterar(PontoBancoHorasUtilizacao) > 0 then
      Render(TPontoBancoHorasUtilizacaoService.ConsultarObjeto(PontoBancoHorasUtilizacao.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar PontoBancoHorasUtilizacao]',
        '', 0, 500);
  finally
    FreeAndNil(PontoBancoHorasUtilizacaoDB);
  end;
end;

procedure TPontoBancoHorasUtilizacaoController.Excluir(id: Integer);
var
  PontoBancoHorasUtilizacao: TPontoBancoHorasUtilizacao;
begin
  PontoBancoHorasUtilizacao := TPontoBancoHorasUtilizacaoService.ConsultarObjeto(id);

  if not Assigned(PontoBancoHorasUtilizacao) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir PontoBancoHorasUtilizacao]',
      '', 0, 400);

  try
    if TPontoBancoHorasUtilizacaoService.Excluir(PontoBancoHorasUtilizacao) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir PontoBancoHorasUtilizacao]',
        '', 0, 500);
  finally
    FreeAndNil(PontoBancoHorasUtilizacao);
  end;
end;

end.
