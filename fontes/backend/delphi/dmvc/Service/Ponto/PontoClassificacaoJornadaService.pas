{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_CLASSIFICACAO_JORNADA] 
                                                                                
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
unit PontoClassificacaoJornadaService;

interface

uses
  PontoClassificacaoJornada, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPontoClassificacaoJornadaService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPontoClassificacaoJornada>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPontoClassificacaoJornada>;
    class function ConsultarObjeto(AId: Integer): TPontoClassificacaoJornada;
    class procedure Inserir(APontoClassificacaoJornada: TPontoClassificacaoJornada);
    class function Alterar(APontoClassificacaoJornada: TPontoClassificacaoJornada): Integer;
    class function Excluir(APontoClassificacaoJornada: TPontoClassificacaoJornada): Integer;
  end;

var
  sql: string;


implementation

{ TPontoClassificacaoJornadaService }



class function TPontoClassificacaoJornadaService.ConsultarLista: TObjectList<TPontoClassificacaoJornada>;
begin
  sql := 'SELECT * FROM PONTO_CLASSIFICACAO_JORNADA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPontoClassificacaoJornada>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoClassificacaoJornadaService.ConsultarListaFiltro(AWhere: string): TObjectList<TPontoClassificacaoJornada>;
begin
  sql := 'SELECT * FROM PONTO_CLASSIFICACAO_JORNADA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPontoClassificacaoJornada>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoClassificacaoJornadaService.ConsultarObjeto(AId: Integer): TPontoClassificacaoJornada;
begin
  sql := 'SELECT * FROM PONTO_CLASSIFICACAO_JORNADA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPontoClassificacaoJornada>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPontoClassificacaoJornadaService.Inserir(APontoClassificacaoJornada: TPontoClassificacaoJornada);
begin
  APontoClassificacaoJornada.ValidarInsercao;
  APontoClassificacaoJornada.Id := InserirBase(APontoClassificacaoJornada, 'PONTO_CLASSIFICACAO_JORNADA');
  
end;

class function TPontoClassificacaoJornadaService.Alterar(APontoClassificacaoJornada: TPontoClassificacaoJornada): Integer;
begin
  APontoClassificacaoJornada.ValidarAlteracao;
  Result := AlterarBase(APontoClassificacaoJornada, 'PONTO_CLASSIFICACAO_JORNADA');
  
  
end;


class function TPontoClassificacaoJornadaService.Excluir(APontoClassificacaoJornada: TPontoClassificacaoJornada): Integer;
begin
  APontoClassificacaoJornada.ValidarExclusao;
  
  Result := ExcluirBase(APontoClassificacaoJornada.Id, 'PONTO_CLASSIFICACAO_JORNADA');
end;


end.
