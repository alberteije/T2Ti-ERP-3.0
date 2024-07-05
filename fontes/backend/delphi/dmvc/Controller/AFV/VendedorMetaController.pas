{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [VENDEDOR_META] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
unit VendedorMetaController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD VendedorMeta')]
  [MVCPath('/vendedor-meta')]
  TVendedorMetaController = class(TMVCController)
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

{ TVendedorMetaController }

uses VendedorMetaService, VendedorMeta, Commons, Filtro;

procedure TVendedorMetaController.ConsultarLista(Context: TWebContext);
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
      Render<TVendedorMeta>(TVendedorMetaService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TVendedorMeta>(TVendedorMetaService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista VendedorMeta] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TVendedorMetaController.ConsultarObjeto(id: Integer);
var
  VendedorMeta: TVendedorMeta;
begin
  try
    VendedorMeta := TVendedorMetaService.ConsultarObjeto(id);

    if Assigned(VendedorMeta) then
      Render(VendedorMeta)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto VendedorMeta]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto VendedorMeta] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TVendedorMetaController.Inserir(Context: TWebContext);
var
  VendedorMeta: TVendedorMeta;
begin
  try
    VendedorMeta := Context.Request.BodyAs<TVendedorMeta>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir VendedorMeta] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TVendedorMetaService.Inserir(VendedorMeta);
    Render(TVendedorMetaService.ConsultarObjeto(VendedorMeta.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

end;

procedure TVendedorMetaController.Alterar(id: Integer);
var
  VendedorMeta, VendedorMetaDB: TVendedorMeta;
begin
  try
    VendedorMeta := Context.Request.BodyAs<TVendedorMeta>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar VendedorMeta] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if VendedorMeta.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar VendedorMeta] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  VendedorMetaDB := TVendedorMetaService.ConsultarObjeto(VendedorMeta.id);

  if not Assigned(VendedorMetaDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar VendedorMeta]',
      '', 0, 400);

  try
    if TVendedorMetaService.Alterar(VendedorMeta) > 0 then
      Render(TVendedorMetaService.ConsultarObjeto(VendedorMeta.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar VendedorMeta]',
        '', 0, 500);
  finally
    FreeAndNil(VendedorMetaDB);
  end;
end;

procedure TVendedorMetaController.Excluir(id: Integer);
var
  VendedorMeta: TVendedorMeta;
begin
  VendedorMeta := TVendedorMetaService.ConsultarObjeto(id);

  if not Assigned(VendedorMeta) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir VendedorMeta]',
      '', 0, 400);

  try
    if TVendedorMetaService.Excluir(VendedorMeta) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir VendedorMeta]',
        '', 0, 500);
  finally
    FreeAndNil(VendedorMeta);
  end;
end;

end.
