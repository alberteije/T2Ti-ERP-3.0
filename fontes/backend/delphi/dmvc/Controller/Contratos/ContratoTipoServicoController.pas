{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [CONTRATO_TIPO_SERVICO] 
                                                                                
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
unit ContratoTipoServicoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ContratoTipoServico')]
  [MVCPath('/contrato-tipo-servico')]
  TContratoTipoServicoController = class(TMVCController)
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

{ TContratoTipoServicoController }

uses ContratoTipoServicoService, ContratoTipoServico, Commons, Filtro;

procedure TContratoTipoServicoController.ConsultarLista(Context: TWebContext);
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
      Render<TContratoTipoServico>(TContratoTipoServicoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TContratoTipoServico>(TContratoTipoServicoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ContratoTipoServico] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContratoTipoServicoController.ConsultarObjeto(id: Integer);
var
  ContratoTipoServico: TContratoTipoServico;
begin
  try
    ContratoTipoServico := TContratoTipoServicoService.ConsultarObjeto(id);

    if Assigned(ContratoTipoServico) then
      Render(ContratoTipoServico)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ContratoTipoServico]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ContratoTipoServico] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContratoTipoServicoController.Inserir(Context: TWebContext);
var
  ContratoTipoServico: TContratoTipoServico;
begin
  try
    ContratoTipoServico := Context.Request.BodyAs<TContratoTipoServico>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ContratoTipoServico] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TContratoTipoServicoService.Inserir(ContratoTipoServico);
    Render(TContratoTipoServicoService.ConsultarObjeto(ContratoTipoServico.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir ContratoTipoServico] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TContratoTipoServicoController.Alterar(id: Integer);
var
  ContratoTipoServico, ContratoTipoServicoDB: TContratoTipoServico;
begin
  try
    ContratoTipoServico := Context.Request.BodyAs<TContratoTipoServico>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ContratoTipoServico] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ContratoTipoServico.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ContratoTipoServico] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ContratoTipoServicoDB := TContratoTipoServicoService.ConsultarObjeto(ContratoTipoServico.id);

  if not Assigned(ContratoTipoServicoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ContratoTipoServico]',
      '', 0, 400);

  try
    if TContratoTipoServicoService.Alterar(ContratoTipoServico) > 0 then
      Render(TContratoTipoServicoService.ConsultarObjeto(ContratoTipoServico.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ContratoTipoServico]',
        '', 0, 500);
  finally
    FreeAndNil(ContratoTipoServicoDB);
  end;
end;

procedure TContratoTipoServicoController.Excluir(id: Integer);
var
  ContratoTipoServico: TContratoTipoServico;
begin
  ContratoTipoServico := TContratoTipoServicoService.ConsultarObjeto(id);

  if not Assigned(ContratoTipoServico) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ContratoTipoServico]',
      '', 0, 400);

  try
    if TContratoTipoServicoService.Excluir(ContratoTipoServico) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ContratoTipoServico]',
        '', 0, 500);
  finally
    FreeAndNil(ContratoTipoServico);
  end;
end;

end.
