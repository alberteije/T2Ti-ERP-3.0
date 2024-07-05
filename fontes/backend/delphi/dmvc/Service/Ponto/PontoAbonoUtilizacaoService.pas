{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_ABONO_UTILIZACAO] 
                                                                                
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
unit PontoAbonoUtilizacaoService;

interface

uses
  PontoAbonoUtilizacao, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPontoAbonoUtilizacaoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPontoAbonoUtilizacao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPontoAbonoUtilizacao>;
    class function ConsultarObjeto(AId: Integer): TPontoAbonoUtilizacao;
    class procedure Inserir(APontoAbonoUtilizacao: TPontoAbonoUtilizacao);
    class function Alterar(APontoAbonoUtilizacao: TPontoAbonoUtilizacao): Integer;
    class function Excluir(APontoAbonoUtilizacao: TPontoAbonoUtilizacao): Integer;
  end;

var
  sql: string;


implementation

{ TPontoAbonoUtilizacaoService }



class function TPontoAbonoUtilizacaoService.ConsultarLista: TObjectList<TPontoAbonoUtilizacao>;
begin
  sql := 'SELECT * FROM PONTO_ABONO_UTILIZACAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPontoAbonoUtilizacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoAbonoUtilizacaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TPontoAbonoUtilizacao>;
begin
  sql := 'SELECT * FROM PONTO_ABONO_UTILIZACAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPontoAbonoUtilizacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoAbonoUtilizacaoService.ConsultarObjeto(AId: Integer): TPontoAbonoUtilizacao;
begin
  sql := 'SELECT * FROM PONTO_ABONO_UTILIZACAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPontoAbonoUtilizacao>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPontoAbonoUtilizacaoService.Inserir(APontoAbonoUtilizacao: TPontoAbonoUtilizacao);
begin
  APontoAbonoUtilizacao.ValidarInsercao;
  APontoAbonoUtilizacao.Id := InserirBase(APontoAbonoUtilizacao, 'PONTO_ABONO_UTILIZACAO');
  
end;

class function TPontoAbonoUtilizacaoService.Alterar(APontoAbonoUtilizacao: TPontoAbonoUtilizacao): Integer;
begin
  APontoAbonoUtilizacao.ValidarAlteracao;
  Result := AlterarBase(APontoAbonoUtilizacao, 'PONTO_ABONO_UTILIZACAO');
  
  
end;


class function TPontoAbonoUtilizacaoService.Excluir(APontoAbonoUtilizacao: TPontoAbonoUtilizacao): Integer;
begin
  APontoAbonoUtilizacao.ValidarExclusao;
  
  Result := ExcluirBase(APontoAbonoUtilizacao.Id, 'PONTO_ABONO_UTILIZACAO');
end;


end.
