{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [TABELA_PRECO] 
                                                                                
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
unit TabelaPrecoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD TabelaPreco')]
  [MVCPath('/tabela-preco')]
  TTabelaPrecoController = class(TMVCController)
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

{ TTabelaPrecoController }

uses TabelaPrecoService, TabelaPreco, Commons, Filtro;

procedure TTabelaPrecoController.ConsultarLista(Context: TWebContext);
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
      Render<TTabelaPreco>(TTabelaPrecoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TTabelaPreco>(TTabelaPrecoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista TabelaPreco] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TTabelaPrecoController.ConsultarObjeto(id: Integer);
var
  TabelaPreco: TTabelaPreco;
begin
  try
    TabelaPreco := TTabelaPrecoService.ConsultarObjeto(id);

    if Assigned(TabelaPreco) then
      Render(TabelaPreco)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto TabelaPreco]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto TabelaPreco] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TTabelaPrecoController.Inserir(Context: TWebContext);
var
  TabelaPreco: TTabelaPreco;
begin
  try
    TabelaPreco := Context.Request.BodyAs<TTabelaPreco>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir TabelaPreco] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TTabelaPrecoService.Inserir(TabelaPreco);
    Render(TTabelaPrecoService.ConsultarObjeto(TabelaPreco.Id));
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

procedure TTabelaPrecoController.Alterar(id: Integer);
var
  TabelaPreco, TabelaPrecoDB: TTabelaPreco;
begin
  try
    TabelaPreco := Context.Request.BodyAs<TTabelaPreco>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar TabelaPreco] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if TabelaPreco.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar TabelaPreco] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  TabelaPrecoDB := TTabelaPrecoService.ConsultarObjeto(TabelaPreco.id);

  if not Assigned(TabelaPrecoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar TabelaPreco]',
      '', 0, 400);

  try
    if TTabelaPrecoService.Alterar(TabelaPreco) > 0 then
      Render(TTabelaPrecoService.ConsultarObjeto(TabelaPreco.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar TabelaPreco]',
        '', 0, 500);
  finally
    FreeAndNil(TabelaPrecoDB);
  end;
end;

procedure TTabelaPrecoController.Excluir(id: Integer);
var
  TabelaPreco: TTabelaPreco;
begin
  TabelaPreco := TTabelaPrecoService.ConsultarObjeto(id);

  if not Assigned(TabelaPreco) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir TabelaPreco]',
      '', 0, 400);

  try
    if TTabelaPrecoService.Excluir(TabelaPreco) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir TabelaPreco]',
        '', 0, 500);
  finally
    FreeAndNil(TabelaPreco);
  end;
end;

end.
