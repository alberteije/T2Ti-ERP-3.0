{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [ESOCIAL_RUBRICA] 
                                                                                
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
unit EsocialRubricaController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD EsocialRubrica')]
  [MVCPath('/esocial-rubrica')]
  TEsocialRubricaController = class(TMVCController)
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

{ TEsocialRubricaController }

uses EsocialRubricaService, EsocialRubrica, Commons, Filtro;

procedure TEsocialRubricaController.ConsultarLista(Context: TWebContext);
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
      Render<TEsocialRubrica>(TEsocialRubricaService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TEsocialRubrica>(TEsocialRubricaService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista EsocialRubrica] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TEsocialRubricaController.ConsultarObjeto(id: Integer);
var
  EsocialRubrica: TEsocialRubrica;
begin
  try
    EsocialRubrica := TEsocialRubricaService.ConsultarObjeto(id);

    if Assigned(EsocialRubrica) then
      Render(EsocialRubrica)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto EsocialRubrica]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto EsocialRubrica] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TEsocialRubricaController.Inserir(Context: TWebContext);
var
  EsocialRubrica: TEsocialRubrica;
begin
  try
    EsocialRubrica := Context.Request.BodyAs<TEsocialRubrica>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir EsocialRubrica] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TEsocialRubricaService.Inserir(EsocialRubrica);
    Render(TEsocialRubricaService.ConsultarObjeto(EsocialRubrica.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir EsocialRubrica] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TEsocialRubricaController.Alterar(id: Integer);
var
  EsocialRubrica, EsocialRubricaDB: TEsocialRubrica;
begin
  try
    EsocialRubrica := Context.Request.BodyAs<TEsocialRubrica>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar EsocialRubrica] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if EsocialRubrica.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar EsocialRubrica] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  EsocialRubricaDB := TEsocialRubricaService.ConsultarObjeto(EsocialRubrica.id);

  if not Assigned(EsocialRubricaDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar EsocialRubrica]',
      '', 0, 400);

  try
    if TEsocialRubricaService.Alterar(EsocialRubrica) > 0 then
      Render(TEsocialRubricaService.ConsultarObjeto(EsocialRubrica.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar EsocialRubrica]',
        '', 0, 500);
  finally
    FreeAndNil(EsocialRubricaDB);
  end;
end;

procedure TEsocialRubricaController.Excluir(id: Integer);
var
  EsocialRubrica: TEsocialRubrica;
begin
  EsocialRubrica := TEsocialRubricaService.ConsultarObjeto(id);

  if not Assigned(EsocialRubrica) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir EsocialRubrica]',
      '', 0, 400);

  try
    if TEsocialRubricaService.Excluir(EsocialRubrica) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir EsocialRubrica]',
        '', 0, 500);
  finally
    FreeAndNil(EsocialRubrica);
  end;
end;

end.
