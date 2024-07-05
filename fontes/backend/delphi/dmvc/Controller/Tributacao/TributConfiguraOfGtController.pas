{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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
unit TributConfiguraOfGtController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD TributConfiguraOfGt')]
  [MVCPath('/tribut-configura-of-gt')]
  TTributConfiguraOfGtController = class(TMVCController)
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

    [MVCDoc('Retorna um objeto')]
    [MVCPath('/consulta-tributacao/')]
    [MVCHTTPMethod([httpGET])]
    procedure ConsultarTributacao(Context: TWebContext);
  end;

implementation

{ TTributConfiguraOfGtController }

uses TributConfiguraOfGtService, TributConfiguraOfGt, Commons, Filtro;

procedure TTributConfiguraOfGtController.ConsultarLista(Context: TWebContext);
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
      Render<TTributConfiguraOfGt>(TTributConfiguraOfGtService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TTributConfiguraOfGt>(TTributConfiguraOfGtService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista TributConfiguraOfGt] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TTributConfiguraOfGtController.ConsultarObjeto(id: Integer);
var
  TributConfiguraOfGt: TTributConfiguraOfGt;
begin
  try
    TributConfiguraOfGt := TTributConfiguraOfGtService.ConsultarObjeto(id);

    if Assigned(TributConfiguraOfGt) then
      Render(TributConfiguraOfGt)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto TributConfiguraOfGt]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto TributConfiguraOfGt] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TTributConfiguraOfGtController.Inserir(Context: TWebContext);
var
  TributConfiguraOfGt: TTributConfiguraOfGt;
begin
  try
    TributConfiguraOfGt := Context.Request.BodyAs<TTributConfiguraOfGt>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir TributConfiguraOfGt] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TTributConfiguraOfGtService.Inserir(TributConfiguraOfGt);
    Render(TTributConfiguraOfGtService.ConsultarObjeto(TributConfiguraOfGt.Id));
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

procedure TTributConfiguraOfGtController.Alterar(id: Integer);
var
  TributConfiguraOfGt, TributConfiguraOfGtDB: TTributConfiguraOfGt;
begin
  try
    TributConfiguraOfGt := Context.Request.BodyAs<TTributConfiguraOfGt>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar TributConfiguraOfGt] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if TributConfiguraOfGt.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar TributConfiguraOfGt] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  TributConfiguraOfGtDB := TTributConfiguraOfGtService.ConsultarObjeto(TributConfiguraOfGt.id);

  if not Assigned(TributConfiguraOfGtDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar TributConfiguraOfGt]',
      '', 0, 400);

  try
    if TTributConfiguraOfGtService.Alterar(TributConfiguraOfGt) > 0 then
      Render(TTributConfiguraOfGtService.ConsultarObjeto(TributConfiguraOfGt.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar TributConfiguraOfGt]',
        '', 0, 500);
  finally
    FreeAndNil(TributConfiguraOfGtDB);
  end;
end;

procedure TTributConfiguraOfGtController.Excluir(id: Integer);
var
  TributConfiguraOfGt: TTributConfiguraOfGt;
begin
  TributConfiguraOfGt := TTributConfiguraOfGtService.ConsultarObjeto(id);

  if not Assigned(TributConfiguraOfGt) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir TributConfiguraOfGt]',
      '', 0, 400);

  try
    if TTributConfiguraOfGtService.Excluir(TributConfiguraOfGt) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir TributConfiguraOfGt]',
        '', 0, 500);
  finally
    FreeAndNil(TributConfiguraOfGt);
  end;
end;

procedure TTributConfiguraOfGtController.ConsultarTributacao(Context: TWebContext);
var
  TributConfiguraOfGt: TTributConfiguraOfGt;
  IdTributGrupoTributario, IdTributOperacaoFiscal: string;
begin
  try
    IdTributGrupoTributario := Context.Request.Headers['idTributGrupoTributario'];
    IdTributOperacaoFiscal := Context.Request.Headers['idTributOperacaoFiscal'];

    TributConfiguraOfGt := TTributConfiguraOfGtService.ConsultarTributacao(IdTributGrupoTributario, IdTributOperacaoFiscal);

    if Assigned(TributConfiguraOfGt) then
    begin
      Render(TributConfiguraOfGt);
    end
    else
        raise EMVCException.Create
        ('Registro não localizado [Consultar Tributação]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Tributação] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

end.
