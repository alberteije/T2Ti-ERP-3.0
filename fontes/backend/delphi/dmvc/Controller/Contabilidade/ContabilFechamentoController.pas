{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [CONTABIL_FECHAMENTO] 
                                                                                
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
unit ContabilFechamentoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ContabilFechamento')]
  [MVCPath('/contabil-fechamento')]
  TContabilFechamentoController = class(TMVCController)
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

{ TContabilFechamentoController }

uses ContabilFechamentoService, ContabilFechamento, Commons, Filtro;

procedure TContabilFechamentoController.ConsultarLista(Context: TWebContext);
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
      Render<TContabilFechamento>(TContabilFechamentoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TContabilFechamento>(TContabilFechamentoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ContabilFechamento] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilFechamentoController.ConsultarObjeto(id: Integer);
var
  ContabilFechamento: TContabilFechamento;
begin
  try
    ContabilFechamento := TContabilFechamentoService.ConsultarObjeto(id);

    if Assigned(ContabilFechamento) then
      Render(ContabilFechamento)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ContabilFechamento]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ContabilFechamento] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilFechamentoController.Inserir(Context: TWebContext);
var
  ContabilFechamento: TContabilFechamento;
begin
  try
    ContabilFechamento := Context.Request.BodyAs<TContabilFechamento>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ContabilFechamento] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TContabilFechamentoService.Inserir(ContabilFechamento);
    Render(TContabilFechamentoService.ConsultarObjeto(ContabilFechamento.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir ContabilFechamento] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TContabilFechamentoController.Alterar(id: Integer);
var
  ContabilFechamento, ContabilFechamentoDB: TContabilFechamento;
begin
  try
    ContabilFechamento := Context.Request.BodyAs<TContabilFechamento>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ContabilFechamento] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ContabilFechamento.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ContabilFechamento] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ContabilFechamentoDB := TContabilFechamentoService.ConsultarObjeto(ContabilFechamento.id);

  if not Assigned(ContabilFechamentoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ContabilFechamento]',
      '', 0, 400);

  try
    if TContabilFechamentoService.Alterar(ContabilFechamento) > 0 then
      Render(TContabilFechamentoService.ConsultarObjeto(ContabilFechamento.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ContabilFechamento]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilFechamentoDB);
  end;
end;

procedure TContabilFechamentoController.Excluir(id: Integer);
var
  ContabilFechamento: TContabilFechamento;
begin
  ContabilFechamento := TContabilFechamentoService.ConsultarObjeto(id);

  if not Assigned(ContabilFechamento) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ContabilFechamento]',
      '', 0, 400);

  try
    if TContabilFechamentoService.Excluir(ContabilFechamento) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ContabilFechamento]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilFechamento);
  end;
end;

end.
