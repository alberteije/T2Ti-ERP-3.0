{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [ETIQUETA_FORMATO_PAPEL] 
                                                                                
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
unit EtiquetaFormatoPapelController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD EtiquetaFormatoPapel')]
  [MVCPath('/etiqueta-formato-papel')]
  TEtiquetaFormatoPapelController = class(TMVCController)
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

{ TEtiquetaFormatoPapelController }

uses EtiquetaFormatoPapelService, EtiquetaFormatoPapel, Commons, Filtro;

procedure TEtiquetaFormatoPapelController.ConsultarLista(Context: TWebContext);
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
      Render<TEtiquetaFormatoPapel>(TEtiquetaFormatoPapelService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TEtiquetaFormatoPapel>(TEtiquetaFormatoPapelService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista EtiquetaFormatoPapel] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TEtiquetaFormatoPapelController.ConsultarObjeto(id: Integer);
var
  EtiquetaFormatoPapel: TEtiquetaFormatoPapel;
begin
  try
    EtiquetaFormatoPapel := TEtiquetaFormatoPapelService.ConsultarObjeto(id);

    if Assigned(EtiquetaFormatoPapel) then
      Render(EtiquetaFormatoPapel)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto EtiquetaFormatoPapel]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto EtiquetaFormatoPapel] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TEtiquetaFormatoPapelController.Inserir(Context: TWebContext);
var
  EtiquetaFormatoPapel: TEtiquetaFormatoPapel;
begin
  try
    EtiquetaFormatoPapel := Context.Request.BodyAs<TEtiquetaFormatoPapel>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir EtiquetaFormatoPapel] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TEtiquetaFormatoPapelService.Inserir(EtiquetaFormatoPapel);
    Render(TEtiquetaFormatoPapelService.ConsultarObjeto(EtiquetaFormatoPapel.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir EtiquetaFormatoPapel] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TEtiquetaFormatoPapelController.Alterar(id: Integer);
var
  EtiquetaFormatoPapel, EtiquetaFormatoPapelDB: TEtiquetaFormatoPapel;
begin
  try
    EtiquetaFormatoPapel := Context.Request.BodyAs<TEtiquetaFormatoPapel>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar EtiquetaFormatoPapel] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if EtiquetaFormatoPapel.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar EtiquetaFormatoPapel] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  EtiquetaFormatoPapelDB := TEtiquetaFormatoPapelService.ConsultarObjeto(EtiquetaFormatoPapel.id);

  if not Assigned(EtiquetaFormatoPapelDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar EtiquetaFormatoPapel]',
      '', 0, 400);

  try
    if TEtiquetaFormatoPapelService.Alterar(EtiquetaFormatoPapel) > 0 then
      Render(TEtiquetaFormatoPapelService.ConsultarObjeto(EtiquetaFormatoPapel.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar EtiquetaFormatoPapel]',
        '', 0, 500);
  finally
    FreeAndNil(EtiquetaFormatoPapelDB);
  end;
end;

procedure TEtiquetaFormatoPapelController.Excluir(id: Integer);
var
  EtiquetaFormatoPapel: TEtiquetaFormatoPapel;
begin
  EtiquetaFormatoPapel := TEtiquetaFormatoPapelService.ConsultarObjeto(id);

  if not Assigned(EtiquetaFormatoPapel) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir EtiquetaFormatoPapel]',
      '', 0, 400);

  try
    if TEtiquetaFormatoPapelService.Excluir(EtiquetaFormatoPapel) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir EtiquetaFormatoPapel]',
        '', 0, 500);
  finally
    FreeAndNil(EtiquetaFormatoPapel);
  end;
end;

end.
