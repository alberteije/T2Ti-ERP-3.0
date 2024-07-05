{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [VENDA_COMISSAO] 
                                                                                
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
unit VendaComissaoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD VendaComissao')]
  [MVCPath('/venda-comissao')]
  TVendaComissaoController = class(TMVCController)
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

{ TVendaComissaoController }

uses VendaComissaoService, VendaComissao, Commons, Filtro;

procedure TVendaComissaoController.ConsultarLista(Context: TWebContext);
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
      Render<TVendaComissao>(TVendaComissaoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TVendaComissao>(TVendaComissaoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista VendaComissao] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TVendaComissaoController.ConsultarObjeto(id: Integer);
var
  VendaComissao: TVendaComissao;
begin
  try
    VendaComissao := TVendaComissaoService.ConsultarObjeto(id);

    if Assigned(VendaComissao) then
      Render(VendaComissao)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto VendaComissao]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto VendaComissao] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TVendaComissaoController.Inserir(Context: TWebContext);
var
  VendaComissao: TVendaComissao;
begin
  try
    VendaComissao := Context.Request.BodyAs<TVendaComissao>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir VendaComissao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TVendaComissaoService.Inserir(VendaComissao);
    Render(TVendaComissaoService.ConsultarObjeto(VendaComissao.Id));
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

procedure TVendaComissaoController.Alterar(id: Integer);
var
  VendaComissao, VendaComissaoDB: TVendaComissao;
begin
  try
    VendaComissao := Context.Request.BodyAs<TVendaComissao>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar VendaComissao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if VendaComissao.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar VendaComissao] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  VendaComissaoDB := TVendaComissaoService.ConsultarObjeto(VendaComissao.id);

  if not Assigned(VendaComissaoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar VendaComissao]',
      '', 0, 400);

  try
    if TVendaComissaoService.Alterar(VendaComissao) > 0 then
      Render(TVendaComissaoService.ConsultarObjeto(VendaComissao.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar VendaComissao]',
        '', 0, 500);
  finally
    FreeAndNil(VendaComissaoDB);
  end;
end;

procedure TVendaComissaoController.Excluir(id: Integer);
var
  VendaComissao: TVendaComissao;
begin
  VendaComissao := TVendaComissaoService.ConsultarObjeto(id);

  if not Assigned(VendaComissao) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir VendaComissao]',
      '', 0, 400);

  try
    if TVendaComissaoService.Excluir(VendaComissao) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir VendaComissao]',
        '', 0, 500);
  finally
    FreeAndNil(VendaComissao);
  end;
end;

end.
