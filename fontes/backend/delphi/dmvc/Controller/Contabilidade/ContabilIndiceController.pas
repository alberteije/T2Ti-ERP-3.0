{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [CONTABIL_INDICE] 
                                                                                
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
unit ContabilIndiceController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ContabilIndice')]
  [MVCPath('/contabil-indice')]
  TContabilIndiceController = class(TMVCController)
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

{ TContabilIndiceController }

uses ContabilIndiceService, ContabilIndice, Commons, Filtro;

procedure TContabilIndiceController.ConsultarLista(Context: TWebContext);
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
      Render<TContabilIndice>(TContabilIndiceService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TContabilIndice>(TContabilIndiceService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ContabilIndice] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilIndiceController.ConsultarObjeto(id: Integer);
var
  ContabilIndice: TContabilIndice;
begin
  try
    ContabilIndice := TContabilIndiceService.ConsultarObjeto(id);

    if Assigned(ContabilIndice) then
      Render(ContabilIndice)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ContabilIndice]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ContabilIndice] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilIndiceController.Inserir(Context: TWebContext);
var
  ContabilIndice: TContabilIndice;
begin
  try
    ContabilIndice := Context.Request.BodyAs<TContabilIndice>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ContabilIndice] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TContabilIndiceService.Inserir(ContabilIndice);
    Render(TContabilIndiceService.ConsultarObjeto(ContabilIndice.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir ContabilIndice] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TContabilIndiceController.Alterar(id: Integer);
var
  ContabilIndice, ContabilIndiceDB: TContabilIndice;
begin
  try
    ContabilIndice := Context.Request.BodyAs<TContabilIndice>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ContabilIndice] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ContabilIndice.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ContabilIndice] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ContabilIndiceDB := TContabilIndiceService.ConsultarObjeto(ContabilIndice.id);

  if not Assigned(ContabilIndiceDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ContabilIndice]',
      '', 0, 400);

  try
    if TContabilIndiceService.Alterar(ContabilIndice) > 0 then
      Render(TContabilIndiceService.ConsultarObjeto(ContabilIndice.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ContabilIndice]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilIndiceDB);
  end;
end;

procedure TContabilIndiceController.Excluir(id: Integer);
var
  ContabilIndice: TContabilIndice;
begin
  ContabilIndice := TContabilIndiceService.ConsultarObjeto(id);

  if not Assigned(ContabilIndice) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ContabilIndice]',
      '', 0, 400);

  try
    if TContabilIndiceService.Excluir(ContabilIndice) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ContabilIndice]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilIndice);
  end;
end;

end.
