{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [VENDA_FRETE] 
                                                                                
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
unit VendaFreteController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD VendaFrete')]
  [MVCPath('/venda-frete')]
  TVendaFreteController = class(TMVCController)
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

{ TVendaFreteController }

uses VendaFreteService, VendaFrete, Commons, Filtro;

procedure TVendaFreteController.ConsultarLista(Context: TWebContext);
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
      Render<TVendaFrete>(TVendaFreteService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TVendaFrete>(TVendaFreteService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista VendaFrete] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TVendaFreteController.ConsultarObjeto(id: Integer);
var
  VendaFrete: TVendaFrete;
begin
  try
    VendaFrete := TVendaFreteService.ConsultarObjeto(id);

    if Assigned(VendaFrete) then
      Render(VendaFrete)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto VendaFrete]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto VendaFrete] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TVendaFreteController.Inserir(Context: TWebContext);
var
  VendaFrete: TVendaFrete;
begin
  try
    VendaFrete := Context.Request.BodyAs<TVendaFrete>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir VendaFrete] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TVendaFreteService.Inserir(VendaFrete);
    Render(TVendaFreteService.ConsultarObjeto(VendaFrete.Id));
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

procedure TVendaFreteController.Alterar(id: Integer);
var
  VendaFrete, VendaFreteDB: TVendaFrete;
begin
  try
    VendaFrete := Context.Request.BodyAs<TVendaFrete>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar VendaFrete] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if VendaFrete.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar VendaFrete] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  VendaFreteDB := TVendaFreteService.ConsultarObjeto(VendaFrete.id);

  if not Assigned(VendaFreteDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar VendaFrete]',
      '', 0, 400);

  try
    if TVendaFreteService.Alterar(VendaFrete) > 0 then
      Render(TVendaFreteService.ConsultarObjeto(VendaFrete.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar VendaFrete]',
        '', 0, 500);
  finally
    FreeAndNil(VendaFreteDB);
  end;
end;

procedure TVendaFreteController.Excluir(id: Integer);
var
  VendaFrete: TVendaFrete;
begin
  VendaFrete := TVendaFreteService.ConsultarObjeto(id);

  if not Assigned(VendaFrete) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir VendaFrete]',
      '', 0, 400);

  try
    if TVendaFreteService.Excluir(VendaFrete) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir VendaFrete]',
        '', 0, 500);
  finally
    FreeAndNil(VendaFrete);
  end;
end;

end.
