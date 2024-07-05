{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_BANCO_HORAS_UTILIZACAO] 
                                                                                
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
unit PontoBancoHorasUtilizacaoService;

interface

uses
  PontoBancoHorasUtilizacao, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPontoBancoHorasUtilizacaoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPontoBancoHorasUtilizacao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPontoBancoHorasUtilizacao>;
    class function ConsultarObjeto(AId: Integer): TPontoBancoHorasUtilizacao;
    class procedure Inserir(APontoBancoHorasUtilizacao: TPontoBancoHorasUtilizacao);
    class function Alterar(APontoBancoHorasUtilizacao: TPontoBancoHorasUtilizacao): Integer;
    class function Excluir(APontoBancoHorasUtilizacao: TPontoBancoHorasUtilizacao): Integer;
  end;

var
  sql: string;


implementation

{ TPontoBancoHorasUtilizacaoService }



class function TPontoBancoHorasUtilizacaoService.ConsultarLista: TObjectList<TPontoBancoHorasUtilizacao>;
begin
  sql := 'SELECT * FROM PONTO_BANCO_HORAS_UTILIZACAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPontoBancoHorasUtilizacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoBancoHorasUtilizacaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TPontoBancoHorasUtilizacao>;
begin
  sql := 'SELECT * FROM PONTO_BANCO_HORAS_UTILIZACAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPontoBancoHorasUtilizacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoBancoHorasUtilizacaoService.ConsultarObjeto(AId: Integer): TPontoBancoHorasUtilizacao;
begin
  sql := 'SELECT * FROM PONTO_BANCO_HORAS_UTILIZACAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPontoBancoHorasUtilizacao>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPontoBancoHorasUtilizacaoService.Inserir(APontoBancoHorasUtilizacao: TPontoBancoHorasUtilizacao);
begin
  APontoBancoHorasUtilizacao.ValidarInsercao;
  APontoBancoHorasUtilizacao.Id := InserirBase(APontoBancoHorasUtilizacao, 'PONTO_BANCO_HORAS_UTILIZACAO');
  
end;

class function TPontoBancoHorasUtilizacaoService.Alterar(APontoBancoHorasUtilizacao: TPontoBancoHorasUtilizacao): Integer;
begin
  APontoBancoHorasUtilizacao.ValidarAlteracao;
  Result := AlterarBase(APontoBancoHorasUtilizacao, 'PONTO_BANCO_HORAS_UTILIZACAO');
  
  
end;


class function TPontoBancoHorasUtilizacaoService.Excluir(APontoBancoHorasUtilizacao: TPontoBancoHorasUtilizacao): Integer;
begin
  APontoBancoHorasUtilizacao.ValidarExclusao;
  
  Result := ExcluirBase(APontoBancoHorasUtilizacao.Id, 'PONTO_BANCO_HORAS_UTILIZACAO');
end;


end.
