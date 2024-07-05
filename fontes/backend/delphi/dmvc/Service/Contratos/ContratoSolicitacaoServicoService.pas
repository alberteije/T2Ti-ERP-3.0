{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CONTRATO_SOLICITACAO_SERVICO] 
                                                                                
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
unit ContratoSolicitacaoServicoService;

interface

uses
  ContratoSolicitacaoServico, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TContratoSolicitacaoServicoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TContratoSolicitacaoServico>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TContratoSolicitacaoServico>;
    class function ConsultarObjeto(AId: Integer): TContratoSolicitacaoServico;
    class procedure Inserir(AContratoSolicitacaoServico: TContratoSolicitacaoServico);
    class function Alterar(AContratoSolicitacaoServico: TContratoSolicitacaoServico): Integer;
    class function Excluir(AContratoSolicitacaoServico: TContratoSolicitacaoServico): Integer;
  end;

var
  sql: string;


implementation

{ TContratoSolicitacaoServicoService }



class function TContratoSolicitacaoServicoService.ConsultarLista: TObjectList<TContratoSolicitacaoServico>;
begin
  sql := 'SELECT * FROM CONTRATO_SOLICITACAO_SERVICO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TContratoSolicitacaoServico>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContratoSolicitacaoServicoService.ConsultarListaFiltro(AWhere: string): TObjectList<TContratoSolicitacaoServico>;
begin
  sql := 'SELECT * FROM CONTRATO_SOLICITACAO_SERVICO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TContratoSolicitacaoServico>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContratoSolicitacaoServicoService.ConsultarObjeto(AId: Integer): TContratoSolicitacaoServico;
begin
  sql := 'SELECT * FROM CONTRATO_SOLICITACAO_SERVICO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TContratoSolicitacaoServico>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TContratoSolicitacaoServicoService.Inserir(AContratoSolicitacaoServico: TContratoSolicitacaoServico);
begin
  AContratoSolicitacaoServico.ValidarInsercao;
  AContratoSolicitacaoServico.Id := InserirBase(AContratoSolicitacaoServico, 'CONTRATO_SOLICITACAO_SERVICO');
  
end;

class function TContratoSolicitacaoServicoService.Alterar(AContratoSolicitacaoServico: TContratoSolicitacaoServico): Integer;
begin
  AContratoSolicitacaoServico.ValidarAlteracao;
  Result := AlterarBase(AContratoSolicitacaoServico, 'CONTRATO_SOLICITACAO_SERVICO');
  
  
end;


class function TContratoSolicitacaoServicoService.Excluir(AContratoSolicitacaoServico: TContratoSolicitacaoServico): Integer;
begin
  AContratoSolicitacaoServico.ValidarExclusao;
  
  Result := ExcluirBase(AContratoSolicitacaoServico.Id, 'CONTRATO_SOLICITACAO_SERVICO');
end;


end.
