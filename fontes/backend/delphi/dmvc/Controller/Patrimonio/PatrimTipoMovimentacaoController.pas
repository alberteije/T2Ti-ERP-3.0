{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [PATRIM_TIPO_MOVIMENTACAO] 
                                                                                
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
unit PatrimTipoMovimentacaoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD PatrimTipoMovimentacao')]
  [MVCPath('/patrim-tipo-movimentacao')]
  TPatrimTipoMovimentacaoController = class(TMVCController)
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

{ TPatrimTipoMovimentacaoController }

uses PatrimTipoMovimentacaoService, PatrimTipoMovimentacao, Commons, Filtro;

procedure TPatrimTipoMovimentacaoController.ConsultarLista(Context: TWebContext);
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
      Render<TPatrimTipoMovimentacao>(TPatrimTipoMovimentacaoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TPatrimTipoMovimentacao>(TPatrimTipoMovimentacaoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista PatrimTipoMovimentacao] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPatrimTipoMovimentacaoController.ConsultarObjeto(id: Integer);
var
  PatrimTipoMovimentacao: TPatrimTipoMovimentacao;
begin
  try
    PatrimTipoMovimentacao := TPatrimTipoMovimentacaoService.ConsultarObjeto(id);

    if Assigned(PatrimTipoMovimentacao) then
      Render(PatrimTipoMovimentacao)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto PatrimTipoMovimentacao]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto PatrimTipoMovimentacao] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPatrimTipoMovimentacaoController.Inserir(Context: TWebContext);
var
  PatrimTipoMovimentacao: TPatrimTipoMovimentacao;
begin
  try
    PatrimTipoMovimentacao := Context.Request.BodyAs<TPatrimTipoMovimentacao>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir PatrimTipoMovimentacao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TPatrimTipoMovimentacaoService.Inserir(PatrimTipoMovimentacao);
    Render(TPatrimTipoMovimentacaoService.ConsultarObjeto(PatrimTipoMovimentacao.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir PatrimTipoMovimentacao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TPatrimTipoMovimentacaoController.Alterar(id: Integer);
var
  PatrimTipoMovimentacao, PatrimTipoMovimentacaoDB: TPatrimTipoMovimentacao;
begin
  try
    PatrimTipoMovimentacao := Context.Request.BodyAs<TPatrimTipoMovimentacao>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar PatrimTipoMovimentacao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if PatrimTipoMovimentacao.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar PatrimTipoMovimentacao] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  PatrimTipoMovimentacaoDB := TPatrimTipoMovimentacaoService.ConsultarObjeto(PatrimTipoMovimentacao.id);

  if not Assigned(PatrimTipoMovimentacaoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar PatrimTipoMovimentacao]',
      '', 0, 400);

  try
    if TPatrimTipoMovimentacaoService.Alterar(PatrimTipoMovimentacao) > 0 then
      Render(TPatrimTipoMovimentacaoService.ConsultarObjeto(PatrimTipoMovimentacao.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar PatrimTipoMovimentacao]',
        '', 0, 500);
  finally
    FreeAndNil(PatrimTipoMovimentacaoDB);
  end;
end;

procedure TPatrimTipoMovimentacaoController.Excluir(id: Integer);
var
  PatrimTipoMovimentacao: TPatrimTipoMovimentacao;
begin
  PatrimTipoMovimentacao := TPatrimTipoMovimentacaoService.ConsultarObjeto(id);

  if not Assigned(PatrimTipoMovimentacao) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir PatrimTipoMovimentacao]',
      '', 0, 400);

  try
    if TPatrimTipoMovimentacaoService.Excluir(PatrimTipoMovimentacao) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir PatrimTipoMovimentacao]',
        '', 0, 500);
  finally
    FreeAndNil(PatrimTipoMovimentacao);
  end;
end;

end.
