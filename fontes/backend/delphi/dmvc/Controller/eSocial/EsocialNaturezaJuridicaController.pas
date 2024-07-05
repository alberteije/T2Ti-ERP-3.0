{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [ESOCIAL_NATUREZA_JURIDICA] 
                                                                                
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
unit EsocialNaturezaJuridicaController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD EsocialNaturezaJuridica')]
  [MVCPath('/esocial-natureza-juridica')]
  TEsocialNaturezaJuridicaController = class(TMVCController)
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

{ TEsocialNaturezaJuridicaController }

uses EsocialNaturezaJuridicaService, EsocialNaturezaJuridica, Commons, Filtro;

procedure TEsocialNaturezaJuridicaController.ConsultarLista(Context: TWebContext);
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
      Render<TEsocialNaturezaJuridica>(TEsocialNaturezaJuridicaService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TEsocialNaturezaJuridica>(TEsocialNaturezaJuridicaService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista EsocialNaturezaJuridica] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TEsocialNaturezaJuridicaController.ConsultarObjeto(id: Integer);
var
  EsocialNaturezaJuridica: TEsocialNaturezaJuridica;
begin
  try
    EsocialNaturezaJuridica := TEsocialNaturezaJuridicaService.ConsultarObjeto(id);

    if Assigned(EsocialNaturezaJuridica) then
      Render(EsocialNaturezaJuridica)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto EsocialNaturezaJuridica]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto EsocialNaturezaJuridica] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TEsocialNaturezaJuridicaController.Inserir(Context: TWebContext);
var
  EsocialNaturezaJuridica: TEsocialNaturezaJuridica;
begin
  try
    EsocialNaturezaJuridica := Context.Request.BodyAs<TEsocialNaturezaJuridica>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir EsocialNaturezaJuridica] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TEsocialNaturezaJuridicaService.Inserir(EsocialNaturezaJuridica);
    Render(TEsocialNaturezaJuridicaService.ConsultarObjeto(EsocialNaturezaJuridica.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir EsocialNaturezaJuridica] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TEsocialNaturezaJuridicaController.Alterar(id: Integer);
var
  EsocialNaturezaJuridica, EsocialNaturezaJuridicaDB: TEsocialNaturezaJuridica;
begin
  try
    EsocialNaturezaJuridica := Context.Request.BodyAs<TEsocialNaturezaJuridica>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar EsocialNaturezaJuridica] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if EsocialNaturezaJuridica.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar EsocialNaturezaJuridica] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  EsocialNaturezaJuridicaDB := TEsocialNaturezaJuridicaService.ConsultarObjeto(EsocialNaturezaJuridica.id);

  if not Assigned(EsocialNaturezaJuridicaDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar EsocialNaturezaJuridica]',
      '', 0, 400);

  try
    if TEsocialNaturezaJuridicaService.Alterar(EsocialNaturezaJuridica) > 0 then
      Render(TEsocialNaturezaJuridicaService.ConsultarObjeto(EsocialNaturezaJuridica.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar EsocialNaturezaJuridica]',
        '', 0, 500);
  finally
    FreeAndNil(EsocialNaturezaJuridicaDB);
  end;
end;

procedure TEsocialNaturezaJuridicaController.Excluir(id: Integer);
var
  EsocialNaturezaJuridica: TEsocialNaturezaJuridica;
begin
  EsocialNaturezaJuridica := TEsocialNaturezaJuridicaService.ConsultarObjeto(id);

  if not Assigned(EsocialNaturezaJuridica) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir EsocialNaturezaJuridica]',
      '', 0, 400);

  try
    if TEsocialNaturezaJuridicaService.Excluir(EsocialNaturezaJuridica) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir EsocialNaturezaJuridica]',
        '', 0, 500);
  finally
    FreeAndNil(EsocialNaturezaJuridica);
  end;
end;

end.
