{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [REQUISICAO_INTERNA_CABECALHO] 
                                                                                
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
unit RequisicaoInternaCabecalhoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD RequisicaoInternaCabecalho')]
  [MVCPath('/requisicao-interna-cabecalho')]
  TRequisicaoInternaCabecalhoController = class(TMVCController)
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

{ TRequisicaoInternaCabecalhoController }

uses RequisicaoInternaCabecalhoService, RequisicaoInternaCabecalho, Commons, Filtro;

procedure TRequisicaoInternaCabecalhoController.ConsultarLista(Context: TWebContext);
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
      Render<TRequisicaoInternaCabecalho>(TRequisicaoInternaCabecalhoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TRequisicaoInternaCabecalho>(TRequisicaoInternaCabecalhoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista RequisicaoInternaCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TRequisicaoInternaCabecalhoController.ConsultarObjeto(id: Integer);
var
  RequisicaoInternaCabecalho: TRequisicaoInternaCabecalho;
begin
  try
    RequisicaoInternaCabecalho := TRequisicaoInternaCabecalhoService.ConsultarObjeto(id);

    if Assigned(RequisicaoInternaCabecalho) then
      Render(RequisicaoInternaCabecalho)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto RequisicaoInternaCabecalho]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto RequisicaoInternaCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TRequisicaoInternaCabecalhoController.Inserir(Context: TWebContext);
var
  RequisicaoInternaCabecalho: TRequisicaoInternaCabecalho;
begin
  try
    RequisicaoInternaCabecalho := Context.Request.BodyAs<TRequisicaoInternaCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir RequisicaoInternaCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TRequisicaoInternaCabecalhoService.Inserir(RequisicaoInternaCabecalho);
    Render(TRequisicaoInternaCabecalhoService.ConsultarObjeto(RequisicaoInternaCabecalho.Id));
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

procedure TRequisicaoInternaCabecalhoController.Alterar(id: Integer);
var
  RequisicaoInternaCabecalho, RequisicaoInternaCabecalhoDB: TRequisicaoInternaCabecalho;
begin
  try
    RequisicaoInternaCabecalho := Context.Request.BodyAs<TRequisicaoInternaCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar RequisicaoInternaCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if RequisicaoInternaCabecalho.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar RequisicaoInternaCabecalho] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  RequisicaoInternaCabecalhoDB := TRequisicaoInternaCabecalhoService.ConsultarObjeto(RequisicaoInternaCabecalho.id);

  if not Assigned(RequisicaoInternaCabecalhoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar RequisicaoInternaCabecalho]',
      '', 0, 400);

  try
    if TRequisicaoInternaCabecalhoService.Alterar(RequisicaoInternaCabecalho) > 0 then
      Render(TRequisicaoInternaCabecalhoService.ConsultarObjeto(RequisicaoInternaCabecalho.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar RequisicaoInternaCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(RequisicaoInternaCabecalhoDB);
  end;
end;

procedure TRequisicaoInternaCabecalhoController.Excluir(id: Integer);
var
  RequisicaoInternaCabecalho: TRequisicaoInternaCabecalho;
begin
  RequisicaoInternaCabecalho := TRequisicaoInternaCabecalhoService.ConsultarObjeto(id);

  if not Assigned(RequisicaoInternaCabecalho) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir RequisicaoInternaCabecalho]',
      '', 0, 400);

  try
    if TRequisicaoInternaCabecalhoService.Excluir(RequisicaoInternaCabecalho) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir RequisicaoInternaCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(RequisicaoInternaCabecalho);
  end;
end;

end.
