{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_PARAMETRO] 
                                                                                
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
unit PontoParametroService;

interface

uses
  PontoParametro, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPontoParametroService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPontoParametro>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPontoParametro>;
    class function ConsultarObjeto(AId: Integer): TPontoParametro;
    class procedure Inserir(APontoParametro: TPontoParametro);
    class function Alterar(APontoParametro: TPontoParametro): Integer;
    class function Excluir(APontoParametro: TPontoParametro): Integer;
  end;

var
  sql: string;


implementation

{ TPontoParametroService }



class function TPontoParametroService.ConsultarLista: TObjectList<TPontoParametro>;
begin
  sql := 'SELECT * FROM PONTO_PARAMETRO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPontoParametro>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoParametroService.ConsultarListaFiltro(AWhere: string): TObjectList<TPontoParametro>;
begin
  sql := 'SELECT * FROM PONTO_PARAMETRO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPontoParametro>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoParametroService.ConsultarObjeto(AId: Integer): TPontoParametro;
begin
  sql := 'SELECT * FROM PONTO_PARAMETRO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPontoParametro>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPontoParametroService.Inserir(APontoParametro: TPontoParametro);
begin
  APontoParametro.ValidarInsercao;
  APontoParametro.Id := InserirBase(APontoParametro, 'PONTO_PARAMETRO');
  
end;

class function TPontoParametroService.Alterar(APontoParametro: TPontoParametro): Integer;
begin
  APontoParametro.ValidarAlteracao;
  Result := AlterarBase(APontoParametro, 'PONTO_PARAMETRO');
  
  
end;


class function TPontoParametroService.Excluir(APontoParametro: TPontoParametro): Integer;
begin
  APontoParametro.ValidarExclusao;
  
  Result := ExcluirBase(APontoParametro.Id, 'PONTO_PARAMETRO');
end;


end.
