{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FISCAL_INSCRICOES_SUBSTITUTAS] 
                                                                                
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
unit FiscalInscricoesSubstitutasController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FiscalInscricoesSubstitutas')]
  [MVCPath('/fiscal-inscricoes-substitutas')]
  TFiscalInscricoesSubstitutasController = class(TMVCController)
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

{ TFiscalInscricoesSubstitutasController }

uses FiscalInscricoesSubstitutasService, FiscalInscricoesSubstitutas, Commons, Filtro;

procedure TFiscalInscricoesSubstitutasController.ConsultarLista(Context: TWebContext);
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
      Render<TFiscalInscricoesSubstitutas>(TFiscalInscricoesSubstitutasService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFiscalInscricoesSubstitutas>(TFiscalInscricoesSubstitutasService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FiscalInscricoesSubstitutas] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFiscalInscricoesSubstitutasController.ConsultarObjeto(id: Integer);
var
  FiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas;
begin
  try
    FiscalInscricoesSubstitutas := TFiscalInscricoesSubstitutasService.ConsultarObjeto(id);

    if Assigned(FiscalInscricoesSubstitutas) then
      Render(FiscalInscricoesSubstitutas)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FiscalInscricoesSubstitutas]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FiscalInscricoesSubstitutas] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFiscalInscricoesSubstitutasController.Inserir(Context: TWebContext);
var
  FiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas;
begin
  try
    FiscalInscricoesSubstitutas := Context.Request.BodyAs<TFiscalInscricoesSubstitutas>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FiscalInscricoesSubstitutas] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFiscalInscricoesSubstitutasService.Inserir(FiscalInscricoesSubstitutas);
    Render(TFiscalInscricoesSubstitutasService.ConsultarObjeto(FiscalInscricoesSubstitutas.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FiscalInscricoesSubstitutas] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFiscalInscricoesSubstitutasController.Alterar(id: Integer);
var
  FiscalInscricoesSubstitutas, FiscalInscricoesSubstitutasDB: TFiscalInscricoesSubstitutas;
begin
  try
    FiscalInscricoesSubstitutas := Context.Request.BodyAs<TFiscalInscricoesSubstitutas>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FiscalInscricoesSubstitutas] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FiscalInscricoesSubstitutas.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FiscalInscricoesSubstitutas] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FiscalInscricoesSubstitutasDB := TFiscalInscricoesSubstitutasService.ConsultarObjeto(FiscalInscricoesSubstitutas.id);

  if not Assigned(FiscalInscricoesSubstitutasDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FiscalInscricoesSubstitutas]',
      '', 0, 400);

  try
    if TFiscalInscricoesSubstitutasService.Alterar(FiscalInscricoesSubstitutas) > 0 then
      Render(TFiscalInscricoesSubstitutasService.ConsultarObjeto(FiscalInscricoesSubstitutas.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FiscalInscricoesSubstitutas]',
        '', 0, 500);
  finally
    FreeAndNil(FiscalInscricoesSubstitutasDB);
  end;
end;

procedure TFiscalInscricoesSubstitutasController.Excluir(id: Integer);
var
  FiscalInscricoesSubstitutas: TFiscalInscricoesSubstitutas;
begin
  FiscalInscricoesSubstitutas := TFiscalInscricoesSubstitutasService.ConsultarObjeto(id);

  if not Assigned(FiscalInscricoesSubstitutas) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FiscalInscricoesSubstitutas]',
      '', 0, 400);

  try
    if TFiscalInscricoesSubstitutasService.Excluir(FiscalInscricoesSubstitutas) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FiscalInscricoesSubstitutas]',
        '', 0, 500);
  finally
    FreeAndNil(FiscalInscricoesSubstitutas);
  end;
end;

end.
