{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [FIN_PARCELA_RECEBER] 
                                                                                
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
unit FinParcelaReceberController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FinParcelaReceber')]
  [MVCPath('/fin-parcela-receber')]
  TFinParcelaReceberController = class(TMVCController)
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

{ TFinParcelaReceberController }

uses FinParcelaReceberService, FinParcelaReceber, Commons, Filtro;

procedure TFinParcelaReceberController.ConsultarLista(Context: TWebContext);
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
      Render<TFinParcelaReceber>(TFinParcelaReceberService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFinParcelaReceber>(TFinParcelaReceberService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FinParcelaReceber] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFinParcelaReceberController.ConsultarObjeto(id: Integer);
var
  FinParcelaReceber: TFinParcelaReceber;
begin
  try
    FinParcelaReceber := TFinParcelaReceberService.ConsultarObjeto(id);

    if Assigned(FinParcelaReceber) then
      Render(FinParcelaReceber)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FinParcelaReceber]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FinParcelaReceber] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFinParcelaReceberController.Inserir(Context: TWebContext);
var
  FinParcelaReceber: TFinParcelaReceber;
begin
  try
    FinParcelaReceber := Context.Request.BodyAs<TFinParcelaReceber>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FinParcelaReceber] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFinParcelaReceberService.Inserir(FinParcelaReceber);
    Render(TFinParcelaReceberService.ConsultarObjeto(FinParcelaReceber.Id));
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

procedure TFinParcelaReceberController.Alterar(id: Integer);
var
  FinParcelaReceber, FinParcelaReceberDB: TFinParcelaReceber;
begin
  try
    FinParcelaReceber := Context.Request.BodyAs<TFinParcelaReceber>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FinParcelaReceber] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FinParcelaReceber.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FinParcelaReceber] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FinParcelaReceberDB := TFinParcelaReceberService.ConsultarObjeto(FinParcelaReceber.id);

  if not Assigned(FinParcelaReceberDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FinParcelaReceber]',
      '', 0, 400);

  try
    if TFinParcelaReceberService.Alterar(FinParcelaReceber) > 0 then
      Render(TFinParcelaReceberService.ConsultarObjeto(FinParcelaReceber.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FinParcelaReceber]',
        '', 0, 500);
  finally
    FreeAndNil(FinParcelaReceberDB);
  end;
end;

procedure TFinParcelaReceberController.Excluir(id: Integer);
var
  FinParcelaReceber: TFinParcelaReceber;
begin
  FinParcelaReceber := TFinParcelaReceberService.ConsultarObjeto(id);

  if not Assigned(FinParcelaReceber) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FinParcelaReceber]',
      '', 0, 400);

  try
    if TFinParcelaReceberService.Excluir(FinParcelaReceber) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FinParcelaReceber]',
        '', 0, 500);
  finally
    FreeAndNil(FinParcelaReceber);
  end;
end;

end.
