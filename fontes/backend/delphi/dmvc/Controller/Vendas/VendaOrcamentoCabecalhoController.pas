{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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
unit VendaOrcamentoCabecalhoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD VendaOrcamentoCabecalho')]
  [MVCPath('/venda-orcamento-cabecalho')]
  TVendaOrcamentoCabecalhoController = class(TMVCController)
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

{ TVendaOrcamentoCabecalhoController }

uses VendaOrcamentoCabecalhoService, VendaOrcamentoCabecalho, Commons, Filtro;

procedure TVendaOrcamentoCabecalhoController.ConsultarLista(Context: TWebContext);
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
      Render<TVendaOrcamentoCabecalho>(TVendaOrcamentoCabecalhoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TVendaOrcamentoCabecalho>(TVendaOrcamentoCabecalhoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista VendaOrcamentoCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TVendaOrcamentoCabecalhoController.ConsultarObjeto(id: Integer);
var
  VendaOrcamentoCabecalho: TVendaOrcamentoCabecalho;
begin
  try
    VendaOrcamentoCabecalho := TVendaOrcamentoCabecalhoService.ConsultarObjeto(id);

    if Assigned(VendaOrcamentoCabecalho) then
      Render(VendaOrcamentoCabecalho)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto VendaOrcamentoCabecalho]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto VendaOrcamentoCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TVendaOrcamentoCabecalhoController.Inserir(Context: TWebContext);
var
  VendaOrcamentoCabecalho: TVendaOrcamentoCabecalho;
begin
  try
    VendaOrcamentoCabecalho := Context.Request.BodyAs<TVendaOrcamentoCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir VendaOrcamentoCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TVendaOrcamentoCabecalhoService.Inserir(VendaOrcamentoCabecalho);
    Render(TVendaOrcamentoCabecalhoService.ConsultarObjeto(VendaOrcamentoCabecalho.Id));
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

procedure TVendaOrcamentoCabecalhoController.Alterar(id: Integer);
var
  VendaOrcamentoCabecalho, VendaOrcamentoCabecalhoDB: TVendaOrcamentoCabecalho;
begin
  try
    VendaOrcamentoCabecalho := Context.Request.BodyAs<TVendaOrcamentoCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar VendaOrcamentoCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if VendaOrcamentoCabecalho.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar VendaOrcamentoCabecalho] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  VendaOrcamentoCabecalhoDB := TVendaOrcamentoCabecalhoService.ConsultarObjeto(VendaOrcamentoCabecalho.id);

  if not Assigned(VendaOrcamentoCabecalhoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar VendaOrcamentoCabecalho]',
      '', 0, 400);

  try
    if TVendaOrcamentoCabecalhoService.Alterar(VendaOrcamentoCabecalho) > 0 then
      Render(TVendaOrcamentoCabecalhoService.ConsultarObjeto(VendaOrcamentoCabecalho.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar VendaOrcamentoCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(VendaOrcamentoCabecalhoDB);
  end;
end;

procedure TVendaOrcamentoCabecalhoController.Excluir(id: Integer);
var
  VendaOrcamentoCabecalho: TVendaOrcamentoCabecalho;
begin
  VendaOrcamentoCabecalho := TVendaOrcamentoCabecalhoService.ConsultarObjeto(id);

  if not Assigned(VendaOrcamentoCabecalho) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir VendaOrcamentoCabecalho]',
      '', 0, 400);

  try
    if TVendaOrcamentoCabecalhoService.Excluir(VendaOrcamentoCabecalho) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir VendaOrcamentoCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(VendaOrcamentoCabecalho);
  end;
end;

end.
