{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [CONTABIL_LANCAMENTO_DETALHE] 
                                                                                
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
unit ContabilLancamentoDetalheController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ContabilLancamentoDetalhe')]
  [MVCPath('/contabil-lancamento-detalhe')]
  TContabilLancamentoDetalheController = class(TMVCController)
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

{ TContabilLancamentoDetalheController }

uses ContabilLancamentoDetalheService, ContabilLancamentoDetalhe, Commons, Filtro;

procedure TContabilLancamentoDetalheController.ConsultarLista(Context: TWebContext);
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
      Render<TContabilLancamentoDetalhe>(TContabilLancamentoDetalheService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TContabilLancamentoDetalhe>(TContabilLancamentoDetalheService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ContabilLancamentoDetalhe] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilLancamentoDetalheController.ConsultarObjeto(id: Integer);
var
  ContabilLancamentoDetalhe: TContabilLancamentoDetalhe;
begin
  try
    ContabilLancamentoDetalhe := TContabilLancamentoDetalheService.ConsultarObjeto(id);

    if Assigned(ContabilLancamentoDetalhe) then
      Render(ContabilLancamentoDetalhe)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ContabilLancamentoDetalhe]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ContabilLancamentoDetalhe] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilLancamentoDetalheController.Inserir(Context: TWebContext);
var
  ContabilLancamentoDetalhe: TContabilLancamentoDetalhe;
begin
  try
    ContabilLancamentoDetalhe := Context.Request.BodyAs<TContabilLancamentoDetalhe>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ContabilLancamentoDetalhe] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TContabilLancamentoDetalheService.Inserir(ContabilLancamentoDetalhe);
    Render(TContabilLancamentoDetalheService.ConsultarObjeto(ContabilLancamentoDetalhe.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir ContabilLancamentoDetalhe] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TContabilLancamentoDetalheController.Alterar(id: Integer);
var
  ContabilLancamentoDetalhe, ContabilLancamentoDetalheDB: TContabilLancamentoDetalhe;
begin
  try
    ContabilLancamentoDetalhe := Context.Request.BodyAs<TContabilLancamentoDetalhe>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ContabilLancamentoDetalhe] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ContabilLancamentoDetalhe.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ContabilLancamentoDetalhe] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ContabilLancamentoDetalheDB := TContabilLancamentoDetalheService.ConsultarObjeto(ContabilLancamentoDetalhe.id);

  if not Assigned(ContabilLancamentoDetalheDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ContabilLancamentoDetalhe]',
      '', 0, 400);

  try
    if TContabilLancamentoDetalheService.Alterar(ContabilLancamentoDetalhe) > 0 then
      Render(TContabilLancamentoDetalheService.ConsultarObjeto(ContabilLancamentoDetalhe.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ContabilLancamentoDetalhe]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilLancamentoDetalheDB);
  end;
end;

procedure TContabilLancamentoDetalheController.Excluir(id: Integer);
var
  ContabilLancamentoDetalhe: TContabilLancamentoDetalhe;
begin
  ContabilLancamentoDetalhe := TContabilLancamentoDetalheService.ConsultarObjeto(id);

  if not Assigned(ContabilLancamentoDetalhe) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ContabilLancamentoDetalhe]',
      '', 0, 400);

  try
    if TContabilLancamentoDetalheService.Excluir(ContabilLancamentoDetalhe) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ContabilLancamentoDetalhe]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilLancamentoDetalhe);
  end;
end;

end.
