{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [VENDA_CONDICOES_PAGAMENTO] 
                                                                                
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
unit VendaCondicoesPagamentoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD VendaCondicoesPagamento')]
  [MVCPath('/venda-condicoes-pagamento')]
  TVendaCondicoesPagamentoController = class(TMVCController)
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

{ TVendaCondicoesPagamentoController }

uses VendaCondicoesPagamentoService, VendaCondicoesPagamento, Commons, Filtro;

procedure TVendaCondicoesPagamentoController.ConsultarLista(Context: TWebContext);
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
      Render<TVendaCondicoesPagamento>(TVendaCondicoesPagamentoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TVendaCondicoesPagamento>(TVendaCondicoesPagamentoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista VendaCondicoesPagamento] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TVendaCondicoesPagamentoController.ConsultarObjeto(id: Integer);
var
  VendaCondicoesPagamento: TVendaCondicoesPagamento;
begin
  try
    VendaCondicoesPagamento := TVendaCondicoesPagamentoService.ConsultarObjeto(id);

    if Assigned(VendaCondicoesPagamento) then
      Render(VendaCondicoesPagamento)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto VendaCondicoesPagamento]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto VendaCondicoesPagamento] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TVendaCondicoesPagamentoController.Inserir(Context: TWebContext);
var
  VendaCondicoesPagamento: TVendaCondicoesPagamento;
begin
  try
    VendaCondicoesPagamento := Context.Request.BodyAs<TVendaCondicoesPagamento>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir VendaCondicoesPagamento] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TVendaCondicoesPagamentoService.Inserir(VendaCondicoesPagamento);
    Render(TVendaCondicoesPagamentoService.ConsultarObjeto(VendaCondicoesPagamento.Id));
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

procedure TVendaCondicoesPagamentoController.Alterar(id: Integer);
var
  VendaCondicoesPagamento, VendaCondicoesPagamentoDB: TVendaCondicoesPagamento;
begin
  try
    VendaCondicoesPagamento := Context.Request.BodyAs<TVendaCondicoesPagamento>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar VendaCondicoesPagamento] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if VendaCondicoesPagamento.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar VendaCondicoesPagamento] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  VendaCondicoesPagamentoDB := TVendaCondicoesPagamentoService.ConsultarObjeto(VendaCondicoesPagamento.id);

  if not Assigned(VendaCondicoesPagamentoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar VendaCondicoesPagamento]',
      '', 0, 400);

  try
    if TVendaCondicoesPagamentoService.Alterar(VendaCondicoesPagamento) > 0 then
      Render(TVendaCondicoesPagamentoService.ConsultarObjeto(VendaCondicoesPagamento.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar VendaCondicoesPagamento]',
        '', 0, 500);
  finally
    FreeAndNil(VendaCondicoesPagamentoDB);
  end;
end;

procedure TVendaCondicoesPagamentoController.Excluir(id: Integer);
var
  VendaCondicoesPagamento: TVendaCondicoesPagamento;
begin
  VendaCondicoesPagamento := TVendaCondicoesPagamentoService.ConsultarObjeto(id);

  if not Assigned(VendaCondicoesPagamento) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir VendaCondicoesPagamento]',
      '', 0, 400);

  try
    if TVendaCondicoesPagamentoService.Excluir(VendaCondicoesPagamento) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir VendaCondicoesPagamento]',
        '', 0, 500);
  finally
    FreeAndNil(VendaCondicoesPagamento);
  end;
end;

end.
