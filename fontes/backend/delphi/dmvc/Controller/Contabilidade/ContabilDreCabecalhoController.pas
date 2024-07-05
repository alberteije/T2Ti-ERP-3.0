{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [CONTABIL_DRE_CABECALHO] 
                                                                                
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
unit ContabilDreCabecalhoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD ContabilDreCabecalho')]
  [MVCPath('/contabil-dre-cabecalho')]
  TContabilDreCabecalhoController = class(TMVCController)
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

{ TContabilDreCabecalhoController }

uses ContabilDreCabecalhoService, ContabilDreCabecalho, Commons, Filtro;

procedure TContabilDreCabecalhoController.ConsultarLista(Context: TWebContext);
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
      Render<TContabilDreCabecalho>(TContabilDreCabecalhoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TContabilDreCabecalho>(TContabilDreCabecalhoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista ContabilDreCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilDreCabecalhoController.ConsultarObjeto(id: Integer);
var
  ContabilDreCabecalho: TContabilDreCabecalho;
begin
  try
    ContabilDreCabecalho := TContabilDreCabecalhoService.ConsultarObjeto(id);

    if Assigned(ContabilDreCabecalho) then
      Render(ContabilDreCabecalho)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto ContabilDreCabecalho]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto ContabilDreCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TContabilDreCabecalhoController.Inserir(Context: TWebContext);
var
  ContabilDreCabecalho: TContabilDreCabecalho;
begin
  try
    ContabilDreCabecalho := Context.Request.BodyAs<TContabilDreCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir ContabilDreCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TContabilDreCabecalhoService.Inserir(ContabilDreCabecalho);
    Render(TContabilDreCabecalhoService.ConsultarObjeto(ContabilDreCabecalho.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir ContabilDreCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TContabilDreCabecalhoController.Alterar(id: Integer);
var
  ContabilDreCabecalho, ContabilDreCabecalhoDB: TContabilDreCabecalho;
begin
  try
    ContabilDreCabecalho := Context.Request.BodyAs<TContabilDreCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar ContabilDreCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if ContabilDreCabecalho.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar ContabilDreCabecalho] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  ContabilDreCabecalhoDB := TContabilDreCabecalhoService.ConsultarObjeto(ContabilDreCabecalho.id);

  if not Assigned(ContabilDreCabecalhoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar ContabilDreCabecalho]',
      '', 0, 400);

  try
    if TContabilDreCabecalhoService.Alterar(ContabilDreCabecalho) > 0 then
      Render(TContabilDreCabecalhoService.ConsultarObjeto(ContabilDreCabecalho.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar ContabilDreCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilDreCabecalhoDB);
  end;
end;

procedure TContabilDreCabecalhoController.Excluir(id: Integer);
var
  ContabilDreCabecalho: TContabilDreCabecalho;
begin
  ContabilDreCabecalho := TContabilDreCabecalhoService.ConsultarObjeto(id);

  if not Assigned(ContabilDreCabecalho) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir ContabilDreCabecalho]',
      '', 0, 400);

  try
    if TContabilDreCabecalhoService.Excluir(ContabilDreCabecalho) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir ContabilDreCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(ContabilDreCabecalho);
  end;
end;

end.
