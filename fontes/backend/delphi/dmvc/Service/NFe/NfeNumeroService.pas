{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [NFE_NUMERO] 
                                                                                
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
unit NfeNumeroService;

interface

uses
  NfeNumero, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TNfeNumeroService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TNfeNumero>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TNfeNumero>;
    class function ConsultarObjeto(AId: Integer): TNfeNumero;
    class procedure Inserir(ANfeNumero: TNfeNumero);
    class function Alterar(ANfeNumero: TNfeNumero): Integer;
    class function Excluir(ANfeNumero: TNfeNumero): Integer;
  end;

var
  sql: string;


implementation

{ TNfeNumeroService }



class function TNfeNumeroService.ConsultarLista: TObjectList<TNfeNumero>;
begin
  sql := 'SELECT * FROM NFE_NUMERO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TNfeNumero>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TNfeNumeroService.ConsultarListaFiltro(AWhere: string): TObjectList<TNfeNumero>;
begin
  sql := 'SELECT * FROM NFE_NUMERO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TNfeNumero>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TNfeNumeroService.ConsultarObjeto(AId: Integer): TNfeNumero;
begin
  sql := 'SELECT * FROM NFE_NUMERO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TNfeNumero>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TNfeNumeroService.Inserir(ANfeNumero: TNfeNumero);
begin
  ANfeNumero.ValidarInsercao;
  ANfeNumero.Id := InserirBase(ANfeNumero, 'NFE_NUMERO');
  
end;

class function TNfeNumeroService.Alterar(ANfeNumero: TNfeNumero): Integer;
begin
  ANfeNumero.ValidarAlteracao;
  Result := AlterarBase(ANfeNumero, 'NFE_NUMERO');
  
  
end;


class function TNfeNumeroService.Excluir(ANfeNumero: TNfeNumero): Integer;
begin
  ANfeNumero.ValidarExclusao;
  
  Result := ExcluirBase(ANfeNumero.Id, 'NFE_NUMERO');
end;


end.
