{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_MARCACAO] 
                                                                                
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
unit PontoMarcacaoService;

interface

uses
  PontoMarcacao, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPontoMarcacaoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPontoMarcacao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPontoMarcacao>;
    class function ConsultarObjeto(AId: Integer): TPontoMarcacao;
    class procedure Inserir(APontoMarcacao: TPontoMarcacao);
    class function Alterar(APontoMarcacao: TPontoMarcacao): Integer;
    class function Excluir(APontoMarcacao: TPontoMarcacao): Integer;
  end;

var
  sql: string;


implementation

{ TPontoMarcacaoService }



class function TPontoMarcacaoService.ConsultarLista: TObjectList<TPontoMarcacao>;
begin
  sql := 'SELECT * FROM PONTO_MARCACAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPontoMarcacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoMarcacaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TPontoMarcacao>;
begin
  sql := 'SELECT * FROM PONTO_MARCACAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPontoMarcacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoMarcacaoService.ConsultarObjeto(AId: Integer): TPontoMarcacao;
begin
  sql := 'SELECT * FROM PONTO_MARCACAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPontoMarcacao>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPontoMarcacaoService.Inserir(APontoMarcacao: TPontoMarcacao);
begin
  APontoMarcacao.ValidarInsercao;
  APontoMarcacao.Id := InserirBase(APontoMarcacao, 'PONTO_MARCACAO');
  
end;

class function TPontoMarcacaoService.Alterar(APontoMarcacao: TPontoMarcacao): Integer;
begin
  APontoMarcacao.ValidarAlteracao;
  Result := AlterarBase(APontoMarcacao, 'PONTO_MARCACAO');
  
  
end;


class function TPontoMarcacaoService.Excluir(APontoMarcacao: TPontoMarcacao): Integer;
begin
  APontoMarcacao.ValidarExclusao;
  
  Result := ExcluirBase(APontoMarcacao.Id, 'PONTO_MARCACAO');
end;


end.
