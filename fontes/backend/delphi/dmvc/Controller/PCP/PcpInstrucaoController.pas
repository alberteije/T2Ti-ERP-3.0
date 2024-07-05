{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [PCP_INSTRUCAO] 
                                                                                
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
unit PcpInstrucaoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD PcpInstrucao')]
  [MVCPath('/pcp-instrucao')]
  TPcpInstrucaoController = class(TMVCController)
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

{ TPcpInstrucaoController }

uses PcpInstrucaoService, PcpInstrucao, Commons, Filtro;

procedure TPcpInstrucaoController.ConsultarLista(Context: TWebContext);
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
      Render<TPcpInstrucao>(TPcpInstrucaoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TPcpInstrucao>(TPcpInstrucaoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista PcpInstrucao] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPcpInstrucaoController.ConsultarObjeto(id: Integer);
var
  PcpInstrucao: TPcpInstrucao;
begin
  try
    PcpInstrucao := TPcpInstrucaoService.ConsultarObjeto(id);

    if Assigned(PcpInstrucao) then
      Render(PcpInstrucao)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto PcpInstrucao]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto PcpInstrucao] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TPcpInstrucaoController.Inserir(Context: TWebContext);
var
  PcpInstrucao: TPcpInstrucao;
begin
  try
    PcpInstrucao := Context.Request.BodyAs<TPcpInstrucao>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir PcpInstrucao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TPcpInstrucaoService.Inserir(PcpInstrucao);
    Render(TPcpInstrucaoService.ConsultarObjeto(PcpInstrucao.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir PcpInstrucao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TPcpInstrucaoController.Alterar(id: Integer);
var
  PcpInstrucao, PcpInstrucaoDB: TPcpInstrucao;
begin
  try
    PcpInstrucao := Context.Request.BodyAs<TPcpInstrucao>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar PcpInstrucao] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if PcpInstrucao.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar PcpInstrucao] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  PcpInstrucaoDB := TPcpInstrucaoService.ConsultarObjeto(PcpInstrucao.id);

  if not Assigned(PcpInstrucaoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar PcpInstrucao]',
      '', 0, 400);

  try
    if TPcpInstrucaoService.Alterar(PcpInstrucao) > 0 then
      Render(TPcpInstrucaoService.ConsultarObjeto(PcpInstrucao.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar PcpInstrucao]',
        '', 0, 500);
  finally
    FreeAndNil(PcpInstrucaoDB);
  end;
end;

procedure TPcpInstrucaoController.Excluir(id: Integer);
var
  PcpInstrucao: TPcpInstrucao;
begin
  PcpInstrucao := TPcpInstrucaoService.ConsultarObjeto(id);

  if not Assigned(PcpInstrucao) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir PcpInstrucao]',
      '', 0, 400);

  try
    if TPcpInstrucaoService.Excluir(PcpInstrucao) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir PcpInstrucao]',
        '', 0, 500);
  finally
    FreeAndNil(PcpInstrucao);
  end;
end;

end.
