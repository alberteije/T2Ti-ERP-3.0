{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [PATRIM_MOVIMENTACAO_BEM] 
                                                                                
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
unit PatrimMovimentacaoBemController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD PatrimMovimentacaoBem')]
  [MVCPath('/patrim-movimentacao-bem')]
  TPatrimMovimentacaoBemController = class(TMVCController)
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

{ TPatrimMovimentacaoBemController }

uses PatrimMovimentacaoBemService, PatrimMovimentacaoBem, Commons, Filtro;

procedure TPatrimMovimentacaoBemController.ConsultarLista(Context: TWebContext);
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
      Render<TPatrimMovimentacaoBem>(TPatrimMovimentacaoBemService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TPatrimMovimentacaoBem>(TPatrimMovimentacaoBemService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista PatrimMovimentacaoBem] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPatrimMovimentacaoBemController.ConsultarObjeto(id: Integer);
var
  PatrimMovimentacaoBem: TPatrimMovimentacaoBem;
begin
  try
    PatrimMovimentacaoBem := TPatrimMovimentacaoBemService.ConsultarObjeto(id);

    if Assigned(PatrimMovimentacaoBem) then
      Render(PatrimMovimentacaoBem)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto PatrimMovimentacaoBem]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto PatrimMovimentacaoBem] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPatrimMovimentacaoBemController.Inserir(Context: TWebContext);
var
  PatrimMovimentacaoBem: TPatrimMovimentacaoBem;
begin
  try
    PatrimMovimentacaoBem := Context.Request.BodyAs<TPatrimMovimentacaoBem>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir PatrimMovimentacaoBem] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TPatrimMovimentacaoBemService.Inserir(PatrimMovimentacaoBem);
    Render(TPatrimMovimentacaoBemService.ConsultarObjeto(PatrimMovimentacaoBem.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir PatrimMovimentacaoBem] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TPatrimMovimentacaoBemController.Alterar(id: Integer);
var
  PatrimMovimentacaoBem, PatrimMovimentacaoBemDB: TPatrimMovimentacaoBem;
begin
  try
    PatrimMovimentacaoBem := Context.Request.BodyAs<TPatrimMovimentacaoBem>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar PatrimMovimentacaoBem] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if PatrimMovimentacaoBem.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar PatrimMovimentacaoBem] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  PatrimMovimentacaoBemDB := TPatrimMovimentacaoBemService.ConsultarObjeto(PatrimMovimentacaoBem.id);

  if not Assigned(PatrimMovimentacaoBemDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar PatrimMovimentacaoBem]',
      '', 0, 400);

  try
    if TPatrimMovimentacaoBemService.Alterar(PatrimMovimentacaoBem) > 0 then
      Render(TPatrimMovimentacaoBemService.ConsultarObjeto(PatrimMovimentacaoBem.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar PatrimMovimentacaoBem]',
        '', 0, 500);
  finally
    FreeAndNil(PatrimMovimentacaoBemDB);
  end;
end;

procedure TPatrimMovimentacaoBemController.Excluir(id: Integer);
var
  PatrimMovimentacaoBem: TPatrimMovimentacaoBem;
begin
  PatrimMovimentacaoBem := TPatrimMovimentacaoBemService.ConsultarObjeto(id);

  if not Assigned(PatrimMovimentacaoBem) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir PatrimMovimentacaoBem]',
      '', 0, 400);

  try
    if TPatrimMovimentacaoBemService.Excluir(PatrimMovimentacaoBem) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir PatrimMovimentacaoBem]',
        '', 0, 500);
  finally
    FreeAndNil(PatrimMovimentacaoBem);
  end;
end;

end.
