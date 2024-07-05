{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [PONTO_CLASSIFICACAO_JORNADA] 
                                                                                
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
unit PontoClassificacaoJornadaController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD PontoClassificacaoJornada')]
  [MVCPath('/ponto-classificacao-jornada')]
  TPontoClassificacaoJornadaController = class(TMVCController)
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

{ TPontoClassificacaoJornadaController }

uses PontoClassificacaoJornadaService, PontoClassificacaoJornada, Commons, Filtro;

procedure TPontoClassificacaoJornadaController.ConsultarLista(Context: TWebContext);
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
      Render<TPontoClassificacaoJornada>(TPontoClassificacaoJornadaService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TPontoClassificacaoJornada>(TPontoClassificacaoJornadaService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista PontoClassificacaoJornada] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPontoClassificacaoJornadaController.ConsultarObjeto(id: Integer);
var
  PontoClassificacaoJornada: TPontoClassificacaoJornada;
begin
  try
    PontoClassificacaoJornada := TPontoClassificacaoJornadaService.ConsultarObjeto(id);

    if Assigned(PontoClassificacaoJornada) then
      Render(PontoClassificacaoJornada)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto PontoClassificacaoJornada]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto PontoClassificacaoJornada] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPontoClassificacaoJornadaController.Inserir(Context: TWebContext);
var
  PontoClassificacaoJornada: TPontoClassificacaoJornada;
begin
  try
    PontoClassificacaoJornada := Context.Request.BodyAs<TPontoClassificacaoJornada>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir PontoClassificacaoJornada] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TPontoClassificacaoJornadaService.Inserir(PontoClassificacaoJornada);
    Render(TPontoClassificacaoJornadaService.ConsultarObjeto(PontoClassificacaoJornada.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir PontoClassificacaoJornada] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TPontoClassificacaoJornadaController.Alterar(id: Integer);
var
  PontoClassificacaoJornada, PontoClassificacaoJornadaDB: TPontoClassificacaoJornada;
begin
  try
    PontoClassificacaoJornada := Context.Request.BodyAs<TPontoClassificacaoJornada>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar PontoClassificacaoJornada] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if PontoClassificacaoJornada.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar PontoClassificacaoJornada] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  PontoClassificacaoJornadaDB := TPontoClassificacaoJornadaService.ConsultarObjeto(PontoClassificacaoJornada.id);

  if not Assigned(PontoClassificacaoJornadaDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar PontoClassificacaoJornada]',
      '', 0, 400);

  try
    if TPontoClassificacaoJornadaService.Alterar(PontoClassificacaoJornada) > 0 then
      Render(TPontoClassificacaoJornadaService.ConsultarObjeto(PontoClassificacaoJornada.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar PontoClassificacaoJornada]',
        '', 0, 500);
  finally
    FreeAndNil(PontoClassificacaoJornadaDB);
  end;
end;

procedure TPontoClassificacaoJornadaController.Excluir(id: Integer);
var
  PontoClassificacaoJornada: TPontoClassificacaoJornada;
begin
  PontoClassificacaoJornada := TPontoClassificacaoJornadaService.ConsultarObjeto(id);

  if not Assigned(PontoClassificacaoJornada) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir PontoClassificacaoJornada]',
      '', 0, 400);

  try
    if TPontoClassificacaoJornadaService.Excluir(PontoClassificacaoJornada) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir PontoClassificacaoJornada]',
        '', 0, 500);
  finally
    FreeAndNil(PontoClassificacaoJornada);
  end;
end;

end.
