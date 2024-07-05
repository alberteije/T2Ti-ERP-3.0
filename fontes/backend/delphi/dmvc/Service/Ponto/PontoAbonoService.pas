{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PONTO_ABONO] 
                                                                                
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
unit PontoAbonoService;

interface

uses
  PontoAbono, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPontoAbonoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPontoAbono>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPontoAbono>;
    class function ConsultarObjeto(AId: Integer): TPontoAbono;
    class procedure Inserir(APontoAbono: TPontoAbono);
    class function Alterar(APontoAbono: TPontoAbono): Integer;
    class function Excluir(APontoAbono: TPontoAbono): Integer;
  end;

var
  sql: string;


implementation

{ TPontoAbonoService }



class function TPontoAbonoService.ConsultarLista: TObjectList<TPontoAbono>;
begin
  sql := 'SELECT * FROM PONTO_ABONO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPontoAbono>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoAbonoService.ConsultarListaFiltro(AWhere: string): TObjectList<TPontoAbono>;
begin
  sql := 'SELECT * FROM PONTO_ABONO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPontoAbono>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPontoAbonoService.ConsultarObjeto(AId: Integer): TPontoAbono;
begin
  sql := 'SELECT * FROM PONTO_ABONO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPontoAbono>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPontoAbonoService.Inserir(APontoAbono: TPontoAbono);
begin
  APontoAbono.ValidarInsercao;
  APontoAbono.Id := InserirBase(APontoAbono, 'PONTO_ABONO');
  
end;

class function TPontoAbonoService.Alterar(APontoAbono: TPontoAbono): Integer;
begin
  APontoAbono.ValidarAlteracao;
  Result := AlterarBase(APontoAbono, 'PONTO_ABONO');
  
  
end;


class function TPontoAbonoService.Excluir(APontoAbono: TPontoAbono): Integer;
begin
  APontoAbono.ValidarExclusao;
  
  Result := ExcluirBase(APontoAbono.Id, 'PONTO_ABONO');
end;


end.
