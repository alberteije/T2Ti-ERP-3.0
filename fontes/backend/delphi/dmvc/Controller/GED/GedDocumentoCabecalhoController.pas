{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [GED_DOCUMENTO_CABECALHO] 
                                                                                
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
unit GedDocumentoCabecalhoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD GedDocumentoCabecalho')]
  [MVCPath('/ged-documento-cabecalho')]
  TGedDocumentoCabecalhoController = class(TMVCController)
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

    [MVCDoc('Atualiza o Detalhe do Documento')]
    [MVCPath('/atualiza-detalhe/($id)')]
    [MVCHTTPMethod([httpPOST])]
    procedure AtualizarDetalhe(id: Integer);

  end;

implementation

{ TGedDocumentoCabecalhoController }

uses GedDocumentoCabecalhoService, GedDocumentoCabecalho, Commons, Filtro;

procedure TGedDocumentoCabecalhoController.ConsultarLista(Context: TWebContext);
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
      Render<TGedDocumentoCabecalho>(TGedDocumentoCabecalhoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TGedDocumentoCabecalho>(TGedDocumentoCabecalhoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista GedDocumentoCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TGedDocumentoCabecalhoController.ConsultarObjeto(id: Integer);
var
  GedDocumentoCabecalho: TGedDocumentoCabecalho;
begin
  try
    GedDocumentoCabecalho := TGedDocumentoCabecalhoService.ConsultarObjeto(id);

    if Assigned(GedDocumentoCabecalho) then
      Render(GedDocumentoCabecalho)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto GedDocumentoCabecalho]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto GedDocumentoCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TGedDocumentoCabecalhoController.Inserir(Context: TWebContext);
var
  GedDocumentoCabecalho: TGedDocumentoCabecalho;
begin
  try
    GedDocumentoCabecalho := Context.Request.BodyAs<TGedDocumentoCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir GedDocumentoCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TGedDocumentoCabecalhoService.Inserir(GedDocumentoCabecalho);
    Render(TGedDocumentoCabecalhoService.ConsultarObjeto(GedDocumentoCabecalho.Id));
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

procedure TGedDocumentoCabecalhoController.Alterar(id: Integer);
var
  GedDocumentoCabecalho, GedDocumentoCabecalhoDB: TGedDocumentoCabecalho;
begin
  try
    GedDocumentoCabecalho := Context.Request.BodyAs<TGedDocumentoCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar GedDocumentoCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if GedDocumentoCabecalho.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar GedDocumentoCabecalho] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  GedDocumentoCabecalhoDB := TGedDocumentoCabecalhoService.ConsultarObjeto(GedDocumentoCabecalho.id);

  if not Assigned(GedDocumentoCabecalhoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar GedDocumentoCabecalho]',
      '', 0, 400);

  try
    if TGedDocumentoCabecalhoService.Alterar(GedDocumentoCabecalho) > 0 then
      Render(TGedDocumentoCabecalhoService.ConsultarObjeto(GedDocumentoCabecalho.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar GedDocumentoCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(GedDocumentoCabecalhoDB);
  end;
end;

procedure TGedDocumentoCabecalhoController.Excluir(id: Integer);
var
  GedDocumentoCabecalho: TGedDocumentoCabecalho;
begin
  GedDocumentoCabecalho := TGedDocumentoCabecalhoService.ConsultarObjeto(id);

  if not Assigned(GedDocumentoCabecalho) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir GedDocumentoCabecalho]',
      '', 0, 400);

  try
    if TGedDocumentoCabecalhoService.Excluir(GedDocumentoCabecalho) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir GedDocumentoCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(GedDocumentoCabecalho);
  end;
end;

procedure TGedDocumentoCabecalhoController.AtualizarDetalhe(id: Integer);
var
  GedDocumentoCabecalho: TGedDocumentoCabecalho;
  NomeArquivo: string;
begin
  try
//    GedDocumentoCabecalho := Context.Request.BodyAs<TGedDocumentoCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [AtualizarDetalhe GedDocumentoCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    NomeArquivo := string(Context.Request.Files[0].FileName);
    TGedDocumentoCabecalhoService.AtualizarDetalhe(GedDocumentoCabecalho, NomeArquivo, Context.Request.Files[0].Stream);
    Render('OK');
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Erro ao tentar atualizar o detalhe [AtualizarDetalhe GedDocumentoCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

end.
