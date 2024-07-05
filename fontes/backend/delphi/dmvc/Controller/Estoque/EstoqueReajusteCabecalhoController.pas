{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
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
unit EstoqueReajusteCabecalhoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD EstoqueReajusteCabecalho')]
  [MVCPath('/estoque-reajuste-cabecalho')]
  TEstoqueReajusteCabecalhoController = class(TMVCController)
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

    [MVCDoc('Formação de Preço')]
    [MVCPath('/forma-preco')]
    [MVCHTTPMethod([httpPOST])]
    procedure FormarPreco(Context: TWebContext);
  end;

implementation

{ TEstoqueReajusteCabecalhoController }

uses EstoqueReajusteCabecalhoService, EstoqueReajusteCabecalho, Commons, Filtro;

procedure TEstoqueReajusteCabecalhoController.ConsultarLista(Context: TWebContext);
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
      Render<TEstoqueReajusteCabecalho>(TEstoqueReajusteCabecalhoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TEstoqueReajusteCabecalho>(TEstoqueReajusteCabecalhoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista EstoqueReajusteCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TEstoqueReajusteCabecalhoController.ConsultarObjeto(id: Integer);
var
  EstoqueReajusteCabecalho: TEstoqueReajusteCabecalho;
begin
  try
    EstoqueReajusteCabecalho := TEstoqueReajusteCabecalhoService.ConsultarObjeto(id);

    if Assigned(EstoqueReajusteCabecalho) then
      Render(EstoqueReajusteCabecalho)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto EstoqueReajusteCabecalho]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto EstoqueReajusteCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TEstoqueReajusteCabecalhoController.Inserir(Context: TWebContext);
var
  EstoqueReajusteCabecalho: TEstoqueReajusteCabecalho;
begin
  try
    EstoqueReajusteCabecalho := Context.Request.BodyAs<TEstoqueReajusteCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir EstoqueReajusteCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TEstoqueReajusteCabecalhoService.Inserir(EstoqueReajusteCabecalho);
    Render(TEstoqueReajusteCabecalhoService.ConsultarObjeto(EstoqueReajusteCabecalho.Id));
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

procedure TEstoqueReajusteCabecalhoController.Alterar(id: Integer);
var
  EstoqueReajusteCabecalho, EstoqueReajusteCabecalhoDB: TEstoqueReajusteCabecalho;
begin
  try
    EstoqueReajusteCabecalho := Context.Request.BodyAs<TEstoqueReajusteCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar EstoqueReajusteCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if EstoqueReajusteCabecalho.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar EstoqueReajusteCabecalho] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  EstoqueReajusteCabecalhoDB := TEstoqueReajusteCabecalhoService.ConsultarObjeto(EstoqueReajusteCabecalho.id);

  if not Assigned(EstoqueReajusteCabecalhoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar EstoqueReajusteCabecalho]',
      '', 0, 400);

  try
    if TEstoqueReajusteCabecalhoService.Alterar(EstoqueReajusteCabecalho) > 0 then
      Render(TEstoqueReajusteCabecalhoService.ConsultarObjeto(EstoqueReajusteCabecalho.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar EstoqueReajusteCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(EstoqueReajusteCabecalhoDB);
  end;
end;

procedure TEstoqueReajusteCabecalhoController.Excluir(id: Integer);
var
  EstoqueReajusteCabecalho: TEstoqueReajusteCabecalho;
begin
  EstoqueReajusteCabecalho := TEstoqueReajusteCabecalhoService.ConsultarObjeto(id);

  if not Assigned(EstoqueReajusteCabecalho) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir EstoqueReajusteCabecalho]',
      '', 0, 400);

  try
    if TEstoqueReajusteCabecalhoService.Excluir(EstoqueReajusteCabecalho) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir EstoqueReajusteCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(EstoqueReajusteCabecalho);
  end;
end;


procedure TEstoqueReajusteCabecalhoController.FormarPreco(Context: TWebContext);
var
  EstoqueReajusteCabecalho: TEstoqueReajusteCabecalho;
begin
  try
    EstoqueReajusteCabecalho := Context.Request.BodyAs<TEstoqueReajusteCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Formação de Preço] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TEstoqueReajusteCabecalhoService.FormarPreco(EstoqueReajusteCabecalho);
    Render(200, 'Formação de Preços Realizada com Sucesso.')
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na Formação de Preço - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

end;

end.
