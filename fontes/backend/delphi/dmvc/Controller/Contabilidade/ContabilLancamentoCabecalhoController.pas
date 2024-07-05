{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [CONTABIL_LANCAMENTO_CABECALHO] 
                                                                                
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
unit ContabilLancamentoCabecalhoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ContabilLancamentoCabecalho')]
  [MVCPath('/contabil-lancamento-cabecalho')]
  TContabilLancamentoCabecalhoController = class(TMVCController)
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

{ TContabilLancamentoCabecalhoController }

uses ContabilLancamentoCabecalhoService, ContabilLancamentoCabecalho, Commons, Filtro;

procedure TContabilLancamentoCabecalhoController.ConsultarLista(Context: TWebContext);
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
      Render<TContabilLancamentoCabecalho>(TContabilLancamentoCabecalhoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TContabilLancamentoCabecalho>(TContabilLancamentoCabecalhoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ContabilLancamentoCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilLancamentoCabecalhoController.ConsultarObjeto(id: Integer);
var
  ContabilLancamentoCabecalho: TContabilLancamentoCabecalho;
begin
  try
    ContabilLancamentoCabecalho := TContabilLancamentoCabecalhoService.ConsultarObjeto(id);

    if Assigned(ContabilLancamentoCabecalho) then
      Render(ContabilLancamentoCabecalho)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ContabilLancamentoCabecalho]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ContabilLancamentoCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilLancamentoCabecalhoController.Inserir(Context: TWebContext);
var
  ContabilLancamentoCabecalho: TContabilLancamentoCabecalho;
begin
  try
    ContabilLancamentoCabecalho := Context.Request.BodyAs<TContabilLancamentoCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ContabilLancamentoCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TContabilLancamentoCabecalhoService.Inserir(ContabilLancamentoCabecalho);
    Render(TContabilLancamentoCabecalhoService.ConsultarObjeto(ContabilLancamentoCabecalho.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir ContabilLancamentoCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TContabilLancamentoCabecalhoController.Alterar(id: Integer);
var
  ContabilLancamentoCabecalho, ContabilLancamentoCabecalhoDB: TContabilLancamentoCabecalho;
begin
  try
    ContabilLancamentoCabecalho := Context.Request.BodyAs<TContabilLancamentoCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ContabilLancamentoCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ContabilLancamentoCabecalho.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ContabilLancamentoCabecalho] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ContabilLancamentoCabecalhoDB := TContabilLancamentoCabecalhoService.ConsultarObjeto(ContabilLancamentoCabecalho.id);

  if not Assigned(ContabilLancamentoCabecalhoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ContabilLancamentoCabecalho]',
      '', 0, 400);

  try
    if TContabilLancamentoCabecalhoService.Alterar(ContabilLancamentoCabecalho) > 0 then
      Render(TContabilLancamentoCabecalhoService.ConsultarObjeto(ContabilLancamentoCabecalho.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ContabilLancamentoCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilLancamentoCabecalhoDB);
  end;
end;

procedure TContabilLancamentoCabecalhoController.Excluir(id: Integer);
var
  ContabilLancamentoCabecalho: TContabilLancamentoCabecalho;
begin
  ContabilLancamentoCabecalho := TContabilLancamentoCabecalhoService.ConsultarObjeto(id);

  if not Assigned(ContabilLancamentoCabecalho) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ContabilLancamentoCabecalho]',
      '', 0, 400);

  try
    if TContabilLancamentoCabecalhoService.Excluir(ContabilLancamentoCabecalho) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ContabilLancamentoCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilLancamentoCabecalho);
  end;
end;

end.
