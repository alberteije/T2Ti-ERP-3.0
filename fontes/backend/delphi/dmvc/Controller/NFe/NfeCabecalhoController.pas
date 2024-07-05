{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado à tabela [NFE_CABECALHO] 
                                                                                
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
unit NfeCabecalhoController;

interface

uses mvcframework, mvcframework.Commons,
  MVCFramework.Serializer.Intf,
  System.SysUtils, System.Classes,
  System.Rtti,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD NfeCabecalho')]
  [MVCPath('/nfe-cabecalho')]
  TNfeCabecalhoController = class(TMVCController)
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

    [MVCDoc('Calcula os totais da nf-e')]
    [MVCPath('/calcula-totais/')]
    [MVCHTTPMethod([httpPOST])]
    procedure CalcularTotais(Context: TWebContext);

    [MVCDoc('Transmite a nf-e')]
    [MVCPath('/transmite-nfe/')]
    [MVCHTTPMethod([httpPOST])]
    procedure TransmitirNfe(Context: TWebContext);

    [MVCDoc('Gera o PDF da nf-e')]
    [MVCHTTPMethod([httpGET])]
    [MVCPath('/gera-pdf-nfe/')]
    procedure GerarPDFNFe(Context: TWebContext);

  end;

implementation

{ TNfeCabecalhoController }

uses NfeCabecalhoService, NfeCabecalho, Commons, Filtro,

  MVCFramework.DataSet.Utils,
  MVCFramework.Serializer.Commons,
  MVCFramework.Serializer.Defaults,
  MVCFramework.Serializer.JsonDataObjects;

procedure TNfeCabecalhoController.ConsultarLista(Context: TWebContext);
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
      Render<TNfeCabecalho>(TNfeCabecalhoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TNfeCabecalho>(TNfeCabecalhoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista NfeCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TNfeCabecalhoController.ConsultarObjeto(id: Integer);
var
  NfeCabecalho: TNfeCabecalho;
begin
  try
    NfeCabecalho := TNfeCabecalhoService.ConsultarObjeto(id);

    if Assigned(NfeCabecalho) then
      Render(NfeCabecalho)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto NfeCabecalho]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto NfeCabecalho] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TNfeCabecalhoController.Inserir(Context: TWebContext);
var
  NfeCabecalho: TNfeCabecalho;
begin
  try
    NfeCabecalho := Context.Request.BodyAs<TNfeCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir NfeCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TNfeCabecalhoService.Inserir(NfeCabecalho);
    Render(TNfeCabecalhoService.ConsultarObjeto(NfeCabecalho.Id));
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

procedure TNfeCabecalhoController.Alterar(id: Integer);
var
  NfeCabecalho, NfeCabecalhoDB: TNfeCabecalho;
begin
  try
    NfeCabecalho := Context.Request.BodyAs<TNfeCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar NfeCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if NfeCabecalho.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar NfeCabecalho] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  NfeCabecalhoDB := TNfeCabecalhoService.ConsultarObjeto(NfeCabecalho.id);

  if not Assigned(NfeCabecalhoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar NfeCabecalho]',
      '', 0, 400);

  try
    if TNfeCabecalhoService.Alterar(NfeCabecalho) > 0 then
      Render(TNfeCabecalhoService.ConsultarObjeto(NfeCabecalho.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar NfeCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(NfeCabecalhoDB);
  end;
end;

procedure TNfeCabecalhoController.Excluir(id: Integer);
var
  NfeCabecalho: TNfeCabecalho;
begin
  NfeCabecalho := TNfeCabecalhoService.ConsultarObjeto(id);

  if not Assigned(NfeCabecalho) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir NfeCabecalho]',
      '', 0, 400);

  try
    if TNfeCabecalhoService.Excluir(NfeCabecalho) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir NfeCabecalho]',
        '', 0, 500);
  finally
    FreeAndNil(NfeCabecalho);
  end;
end;

procedure TNfeCabecalhoController.CalcularTotais(Context: TWebContext);
var
  NfeCabecalho: TNfeCabecalho;
begin
  try
    NfeCabecalho := Context.Request.BodyAs<TNfeCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Calcular Totais NfeCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TNfeCabecalhoService.CalcularTotais(NfeCabecalho);
    Render(NfeCabecalho);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Erro ao tentar calcular os totais [Calcular Totais NfeCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TNfeCabecalhoController.TransmitirNfe(Context: TWebContext);
var
  NfeCabecalho: TNfeCabecalho;
  ArquivoPDF: TFileStream;
  Retorno: string;
begin
  try
    NfeCabecalho := Context.Request.BodyAs<TNfeCabecalho>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Transmitir NF-e NfeCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    Retorno := TNfeCabecalhoService.TransmitirNFe(NfeCabecalho);
    if Copy(Retorno, 1, 6) <> '[ERRO]' then
    begin
      ArquivoPDF := TFileStream.Create(Retorno, fmOpenRead or fmShareDenyWrite);
      ContentType := 'application/pdf';
      Render(ArquivoPDF, True);
    end
    else
    begin
      Render(418, Retorno); // Erro capturado pelo ACBrMonitor
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Erro ao tentar transmitir a nota [Transmitir NF-e NfeCabecalho] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TNfeCabecalhoController.GerarPDFNFe(Context: TWebContext);
var
  Chave, Retorno: string;
  ArquivoPDF: TFileStream;
begin
  try
    Chave := Context.Request.Headers['chave'];
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Gerar PDF Danfe NF-e] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    Retorno := TNfeCabecalhoService.GerarPDFDanfe(Chave);
    if Copy(Retorno, 1, 6) <> '[ERRO]' then
    begin
      ArquivoPDF := TFileStream.Create(Retorno, fmOpenRead or fmShareDenyWrite);
      ContentType := 'application/pdf';
      Render(ArquivoPDF, True);
    end
    else
    begin
      Render(418, Retorno); // Erro capturado pelo ACBrMonitor
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Erro ao tentar realizar o procedimento [Gerar PDF Danfe NF-e] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

end.
