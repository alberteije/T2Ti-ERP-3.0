{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [VIEW_FIN_LANCAMENTO_RECEBER] 
                                                                                
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
unit ViewFinLancamentoReceberController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ViewFinLancamentoReceber')]
  [MVCPath('/view-fin-lancamento-receber')]
  TViewFinLancamentoReceberController = class(TMVCController)
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

{ TViewFinLancamentoReceberController }

uses ViewFinLancamentoReceberService, ViewFinLancamentoReceber, Commons, Filtro;

procedure TViewFinLancamentoReceberController.ConsultarLista(Context: TWebContext);
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
      Render<TViewFinLancamentoReceber>(TViewFinLancamentoReceberService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TViewFinLancamentoReceber>(TViewFinLancamentoReceberService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ViewFinLancamentoReceber] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TViewFinLancamentoReceberController.ConsultarObjeto(id: Integer);
var
  ViewFinLancamentoReceber: TViewFinLancamentoReceber;
begin
  try
    ViewFinLancamentoReceber := TViewFinLancamentoReceberService.ConsultarObjeto(id);

    if Assigned(ViewFinLancamentoReceber) then
      Render(ViewFinLancamentoReceber)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ViewFinLancamentoReceber]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ViewFinLancamentoReceber] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TViewFinLancamentoReceberController.Inserir(Context: TWebContext);
var
  ViewFinLancamentoReceber: TViewFinLancamentoReceber;
begin
  try
    ViewFinLancamentoReceber := Context.Request.BodyAs<TViewFinLancamentoReceber>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ViewFinLancamentoReceber] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TViewFinLancamentoReceberService.Inserir(ViewFinLancamentoReceber);
    Render(TViewFinLancamentoReceberService.ConsultarObjeto(ViewFinLancamentoReceber.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir ViewFinLancamentoReceber] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TViewFinLancamentoReceberController.Alterar(id: Integer);
var
  ViewFinLancamentoReceber, ViewFinLancamentoReceberDB: TViewFinLancamentoReceber;
begin
  try
    ViewFinLancamentoReceber := Context.Request.BodyAs<TViewFinLancamentoReceber>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ViewFinLancamentoReceber] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ViewFinLancamentoReceber.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ViewFinLancamentoReceber] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ViewFinLancamentoReceberDB := TViewFinLancamentoReceberService.ConsultarObjeto(ViewFinLancamentoReceber.id);

  if not Assigned(ViewFinLancamentoReceberDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ViewFinLancamentoReceber]',
      '', 0, 400);

  try
    if TViewFinLancamentoReceberService.Alterar(ViewFinLancamentoReceber) > 0 then
      Render(TViewFinLancamentoReceberService.ConsultarObjeto(ViewFinLancamentoReceber.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ViewFinLancamentoReceber]',
        '', 0, 500);
  finally
    FreeAndNil(ViewFinLancamentoReceberDB);
  end;
end;

procedure TViewFinLancamentoReceberController.Excluir(id: Integer);
var
  ViewFinLancamentoReceber: TViewFinLancamentoReceber;
begin
  ViewFinLancamentoReceber := TViewFinLancamentoReceberService.ConsultarObjeto(id);

  if not Assigned(ViewFinLancamentoReceber) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ViewFinLancamentoReceber]',
      '', 0, 400);

  try
    if TViewFinLancamentoReceberService.Excluir(ViewFinLancamentoReceber) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ViewFinLancamentoReceber]',
        '', 0, 500);
  finally
    FreeAndNil(ViewFinLancamentoReceber);
  end;
end;

end.
