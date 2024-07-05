{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [PATRIM_TAXA_DEPRECIACAO] 
                                                                                
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
unit PatrimTaxaDepreciacaoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD PatrimTaxaDepreciacao')]
  [MVCPath('/patrim-taxa-depreciacao')]
  TPatrimTaxaDepreciacaoController = class(TMVCController)
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

{ TPatrimTaxaDepreciacaoController }

uses PatrimTaxaDepreciacaoService, PatrimTaxaDepreciacao, Commons, Filtro;

procedure TPatrimTaxaDepreciacaoController.ConsultarLista(Context: TWebContext);
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
      Render<TPatrimTaxaDepreciacao>(TPatrimTaxaDepreciacaoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TPatrimTaxaDepreciacao>(TPatrimTaxaDepreciacaoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista PatrimTaxaDepreciacao] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPatrimTaxaDepreciacaoController.ConsultarObjeto(id: Integer);
var
  PatrimTaxaDepreciacao: TPatrimTaxaDepreciacao;
begin
  try
    PatrimTaxaDepreciacao := TPatrimTaxaDepreciacaoService.ConsultarObjeto(id);

    if Assigned(PatrimTaxaDepreciacao) then
      Render(PatrimTaxaDepreciacao)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto PatrimTaxaDepreciacao]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto PatrimTaxaDepreciacao] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPatrimTaxaDepreciacaoController.Inserir(Context: TWebContext);
var
  PatrimTaxaDepreciacao: TPatrimTaxaDepreciacao;
begin
  try
    PatrimTaxaDepreciacao := Context.Request.BodyAs<TPatrimTaxaDepreciacao>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir PatrimTaxaDepreciacao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TPatrimTaxaDepreciacaoService.Inserir(PatrimTaxaDepreciacao);
    Render(TPatrimTaxaDepreciacaoService.ConsultarObjeto(PatrimTaxaDepreciacao.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir PatrimTaxaDepreciacao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TPatrimTaxaDepreciacaoController.Alterar(id: Integer);
var
  PatrimTaxaDepreciacao, PatrimTaxaDepreciacaoDB: TPatrimTaxaDepreciacao;
begin
  try
    PatrimTaxaDepreciacao := Context.Request.BodyAs<TPatrimTaxaDepreciacao>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar PatrimTaxaDepreciacao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if PatrimTaxaDepreciacao.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar PatrimTaxaDepreciacao] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  PatrimTaxaDepreciacaoDB := TPatrimTaxaDepreciacaoService.ConsultarObjeto(PatrimTaxaDepreciacao.id);

  if not Assigned(PatrimTaxaDepreciacaoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar PatrimTaxaDepreciacao]',
      '', 0, 400);

  try
    if TPatrimTaxaDepreciacaoService.Alterar(PatrimTaxaDepreciacao) > 0 then
      Render(TPatrimTaxaDepreciacaoService.ConsultarObjeto(PatrimTaxaDepreciacao.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar PatrimTaxaDepreciacao]',
        '', 0, 500);
  finally
    FreeAndNil(PatrimTaxaDepreciacaoDB);
  end;
end;

procedure TPatrimTaxaDepreciacaoController.Excluir(id: Integer);
var
  PatrimTaxaDepreciacao: TPatrimTaxaDepreciacao;
begin
  PatrimTaxaDepreciacao := TPatrimTaxaDepreciacaoService.ConsultarObjeto(id);

  if not Assigned(PatrimTaxaDepreciacao) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir PatrimTaxaDepreciacao]',
      '', 0, 400);

  try
    if TPatrimTaxaDepreciacaoService.Excluir(PatrimTaxaDepreciacao) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir PatrimTaxaDepreciacao]',
        '', 0, 500);
  finally
    FreeAndNil(PatrimTaxaDepreciacao);
  end;
end;

end.
