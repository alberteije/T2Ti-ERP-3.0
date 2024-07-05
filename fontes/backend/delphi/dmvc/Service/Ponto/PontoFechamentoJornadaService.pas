{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_FECHAMENTO_JORNADA] 
                                                                                
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
unit PontoFechamentoJornadaService;

interface

uses
  PontoFechamentoJornada, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPontoFechamentoJornadaService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPontoFechamentoJornada>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPontoFechamentoJornada>;
    class function ConsultarObjeto(AId: Integer): TPontoFechamentoJornada;
    class procedure Inserir(APontoFechamentoJornada: TPontoFechamentoJornada);
    class function Alterar(APontoFechamentoJornada: TPontoFechamentoJornada): Integer;
    class function Excluir(APontoFechamentoJornada: TPontoFechamentoJornada): Integer;
  end;

var
  sql: string;


implementation

{ TPontoFechamentoJornadaService }



class function TPontoFechamentoJornadaService.ConsultarLista: TObjectList<TPontoFechamentoJornada>;
begin
  sql := 'SELECT * FROM PONTO_FECHAMENTO_JORNADA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPontoFechamentoJornada>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoFechamentoJornadaService.ConsultarListaFiltro(AWhere: string): TObjectList<TPontoFechamentoJornada>;
begin
  sql := 'SELECT * FROM PONTO_FECHAMENTO_JORNADA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPontoFechamentoJornada>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoFechamentoJornadaService.ConsultarObjeto(AId: Integer): TPontoFechamentoJornada;
begin
  sql := 'SELECT * FROM PONTO_FECHAMENTO_JORNADA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPontoFechamentoJornada>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPontoFechamentoJornadaService.Inserir(APontoFechamentoJornada: TPontoFechamentoJornada);
begin
  APontoFechamentoJornada.ValidarInsercao;
  APontoFechamentoJornada.Id := InserirBase(APontoFechamentoJornada, 'PONTO_FECHAMENTO_JORNADA');
  
end;

class function TPontoFechamentoJornadaService.Alterar(APontoFechamentoJornada: TPontoFechamentoJornada): Integer;
begin
  APontoFechamentoJornada.ValidarAlteracao;
  Result := AlterarBase(APontoFechamentoJornada, 'PONTO_FECHAMENTO_JORNADA');
  
  
end;


class function TPontoFechamentoJornadaService.Excluir(APontoFechamentoJornada: TPontoFechamentoJornada): Integer;
begin
  APontoFechamentoJornada.ValidarExclusao;
  
  Result := ExcluirBase(APontoFechamentoJornada.Id, 'PONTO_FECHAMENTO_JORNADA');
end;


end.
