{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [CONTABIL_ENCERRAMENTO_EXE_DET] 
                                                                                
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
unit ContabilEncerramentoExeDetController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ContabilEncerramentoExeDet')]
  [MVCPath('/contabil-encerramento-exe-det')]
  TContabilEncerramentoExeDetController = class(TMVCController)
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

{ TContabilEncerramentoExeDetController }

uses ContabilEncerramentoExeDetService, ContabilEncerramentoExeDet, Commons, Filtro;

procedure TContabilEncerramentoExeDetController.ConsultarLista(Context: TWebContext);
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
      Render<TContabilEncerramentoExeDet>(TContabilEncerramentoExeDetService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TContabilEncerramentoExeDet>(TContabilEncerramentoExeDetService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ContabilEncerramentoExeDet] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilEncerramentoExeDetController.ConsultarObjeto(id: Integer);
var
  ContabilEncerramentoExeDet: TContabilEncerramentoExeDet;
begin
  try
    ContabilEncerramentoExeDet := TContabilEncerramentoExeDetService.ConsultarObjeto(id);

    if Assigned(ContabilEncerramentoExeDet) then
      Render(ContabilEncerramentoExeDet)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ContabilEncerramentoExeDet]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ContabilEncerramentoExeDet] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilEncerramentoExeDetController.Inserir(Context: TWebContext);
var
  ContabilEncerramentoExeDet: TContabilEncerramentoExeDet;
begin
  try
    ContabilEncerramentoExeDet := Context.Request.BodyAs<TContabilEncerramentoExeDet>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ContabilEncerramentoExeDet] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TContabilEncerramentoExeDetService.Inserir(ContabilEncerramentoExeDet);
    Render(TContabilEncerramentoExeDetService.ConsultarObjeto(ContabilEncerramentoExeDet.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir ContabilEncerramentoExeDet] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TContabilEncerramentoExeDetController.Alterar(id: Integer);
var
  ContabilEncerramentoExeDet, ContabilEncerramentoExeDetDB: TContabilEncerramentoExeDet;
begin
  try
    ContabilEncerramentoExeDet := Context.Request.BodyAs<TContabilEncerramentoExeDet>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ContabilEncerramentoExeDet] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ContabilEncerramentoExeDet.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ContabilEncerramentoExeDet] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ContabilEncerramentoExeDetDB := TContabilEncerramentoExeDetService.ConsultarObjeto(ContabilEncerramentoExeDet.id);

  if not Assigned(ContabilEncerramentoExeDetDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ContabilEncerramentoExeDet]',
      '', 0, 400);

  try
    if TContabilEncerramentoExeDetService.Alterar(ContabilEncerramentoExeDet) > 0 then
      Render(TContabilEncerramentoExeDetService.ConsultarObjeto(ContabilEncerramentoExeDet.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ContabilEncerramentoExeDet]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilEncerramentoExeDetDB);
  end;
end;

procedure TContabilEncerramentoExeDetController.Excluir(id: Integer);
var
  ContabilEncerramentoExeDet: TContabilEncerramentoExeDet;
begin
  ContabilEncerramentoExeDet := TContabilEncerramentoExeDetService.ConsultarObjeto(id);

  if not Assigned(ContabilEncerramentoExeDet) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ContabilEncerramentoExeDet]',
      '', 0, 400);

  try
    if TContabilEncerramentoExeDetService.Excluir(ContabilEncerramentoExeDet) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ContabilEncerramentoExeDet]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilEncerramentoExeDet);
  end;
end;

end.
