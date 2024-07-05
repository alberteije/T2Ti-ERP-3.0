{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [ESOCIAL_MOTIVO_DESLIGAMENTO] 
                                                                                
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
unit EsocialMotivoDesligamentoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD EsocialMotivoDesligamento')]
  [MVCPath('/esocial-motivo-desligamento')]
  TEsocialMotivoDesligamentoController = class(TMVCController)
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

{ TEsocialMotivoDesligamentoController }

uses EsocialMotivoDesligamentoService, EsocialMotivoDesligamento, Commons, Filtro;

procedure TEsocialMotivoDesligamentoController.ConsultarLista(Context: TWebContext);
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
      Render<TEsocialMotivoDesligamento>(TEsocialMotivoDesligamentoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TEsocialMotivoDesligamento>(TEsocialMotivoDesligamentoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista EsocialMotivoDesligamento] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TEsocialMotivoDesligamentoController.ConsultarObjeto(id: Integer);
var
  EsocialMotivoDesligamento: TEsocialMotivoDesligamento;
begin
  try
    EsocialMotivoDesligamento := TEsocialMotivoDesligamentoService.ConsultarObjeto(id);

    if Assigned(EsocialMotivoDesligamento) then
      Render(EsocialMotivoDesligamento)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto EsocialMotivoDesligamento]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto EsocialMotivoDesligamento] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TEsocialMotivoDesligamentoController.Inserir(Context: TWebContext);
var
  EsocialMotivoDesligamento: TEsocialMotivoDesligamento;
begin
  try
    EsocialMotivoDesligamento := Context.Request.BodyAs<TEsocialMotivoDesligamento>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir EsocialMotivoDesligamento] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TEsocialMotivoDesligamentoService.Inserir(EsocialMotivoDesligamento);
    Render(TEsocialMotivoDesligamentoService.ConsultarObjeto(EsocialMotivoDesligamento.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir EsocialMotivoDesligamento] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TEsocialMotivoDesligamentoController.Alterar(id: Integer);
var
  EsocialMotivoDesligamento, EsocialMotivoDesligamentoDB: TEsocialMotivoDesligamento;
begin
  try
    EsocialMotivoDesligamento := Context.Request.BodyAs<TEsocialMotivoDesligamento>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar EsocialMotivoDesligamento] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if EsocialMotivoDesligamento.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar EsocialMotivoDesligamento] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  EsocialMotivoDesligamentoDB := TEsocialMotivoDesligamentoService.ConsultarObjeto(EsocialMotivoDesligamento.id);

  if not Assigned(EsocialMotivoDesligamentoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar EsocialMotivoDesligamento]',
      '', 0, 400);

  try
    if TEsocialMotivoDesligamentoService.Alterar(EsocialMotivoDesligamento) > 0 then
      Render(TEsocialMotivoDesligamentoService.ConsultarObjeto(EsocialMotivoDesligamento.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar EsocialMotivoDesligamento]',
        '', 0, 500);
  finally
    FreeAndNil(EsocialMotivoDesligamentoDB);
  end;
end;

procedure TEsocialMotivoDesligamentoController.Excluir(id: Integer);
var
  EsocialMotivoDesligamento: TEsocialMotivoDesligamento;
begin
  EsocialMotivoDesligamento := TEsocialMotivoDesligamentoService.ConsultarObjeto(id);

  if not Assigned(EsocialMotivoDesligamento) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir EsocialMotivoDesligamento]',
      '', 0, 400);

  try
    if TEsocialMotivoDesligamentoService.Excluir(EsocialMotivoDesligamento) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir EsocialMotivoDesligamento]',
        '', 0, 500);
  finally
    FreeAndNil(EsocialMotivoDesligamento);
  end;
end;

end.
