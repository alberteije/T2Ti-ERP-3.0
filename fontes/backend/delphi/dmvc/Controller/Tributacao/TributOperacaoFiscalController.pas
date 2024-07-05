{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [TRIBUT_OPERACAO_FISCAL] 
                                                                                
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
unit TributOperacaoFiscalController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD TributOperacaoFiscal')]
  [MVCPath('/tribut-operacao-fiscal')]
  TTributOperacaoFiscalController = class(TMVCController)
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

{ TTributOperacaoFiscalController }

uses TributOperacaoFiscalService, TributOperacaoFiscal, Commons, Filtro;

procedure TTributOperacaoFiscalController.ConsultarLista(Context: TWebContext);
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
      Render<TTributOperacaoFiscal>(TTributOperacaoFiscalService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TTributOperacaoFiscal>(TTributOperacaoFiscalService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista TributOperacaoFiscal] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TTributOperacaoFiscalController.ConsultarObjeto(id: Integer);
var
  TributOperacaoFiscal: TTributOperacaoFiscal;
begin
  try
    TributOperacaoFiscal := TTributOperacaoFiscalService.ConsultarObjeto(id);

    if Assigned(TributOperacaoFiscal) then
      Render(TributOperacaoFiscal)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto TributOperacaoFiscal]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto TributOperacaoFiscal] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TTributOperacaoFiscalController.Inserir(Context: TWebContext);
var
  TributOperacaoFiscal: TTributOperacaoFiscal;
begin
  try
    TributOperacaoFiscal := Context.Request.BodyAs<TTributOperacaoFiscal>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir TributOperacaoFiscal] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TTributOperacaoFiscalService.Inserir(TributOperacaoFiscal);
    Render(TTributOperacaoFiscalService.ConsultarObjeto(TributOperacaoFiscal.Id));
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

procedure TTributOperacaoFiscalController.Alterar(id: Integer);
var
  TributOperacaoFiscal, TributOperacaoFiscalDB: TTributOperacaoFiscal;
begin
  try
    TributOperacaoFiscal := Context.Request.BodyAs<TTributOperacaoFiscal>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar TributOperacaoFiscal] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if TributOperacaoFiscal.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar TributOperacaoFiscal] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  TributOperacaoFiscalDB := TTributOperacaoFiscalService.ConsultarObjeto(TributOperacaoFiscal.id);

  if not Assigned(TributOperacaoFiscalDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar TributOperacaoFiscal]',
      '', 0, 400);

  try
    if TTributOperacaoFiscalService.Alterar(TributOperacaoFiscal) > 0 then
      Render(TTributOperacaoFiscalService.ConsultarObjeto(TributOperacaoFiscal.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar TributOperacaoFiscal]',
        '', 0, 500);
  finally
    FreeAndNil(TributOperacaoFiscalDB);
  end;
end;

procedure TTributOperacaoFiscalController.Excluir(id: Integer);
var
  TributOperacaoFiscal: TTributOperacaoFiscal;
begin
  TributOperacaoFiscal := TTributOperacaoFiscalService.ConsultarObjeto(id);

  if not Assigned(TributOperacaoFiscal) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir TributOperacaoFiscal]',
      '', 0, 400);

  try
    if TTributOperacaoFiscalService.Excluir(TributOperacaoFiscal) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir TributOperacaoFiscal]',
        '', 0, 500);
  finally
    FreeAndNil(TributOperacaoFiscal);
  end;
end;

end.
