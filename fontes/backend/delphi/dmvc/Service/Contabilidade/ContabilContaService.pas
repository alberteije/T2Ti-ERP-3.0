{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CONTABIL_CONTA] 
                                                                                
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
unit ContabilContaService;

interface

uses
  ContabilConta, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TContabilContaService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TContabilConta>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TContabilConta>;
    class function ConsultarObjeto(AId: Integer): TContabilConta;
    class procedure Inserir(AContabilConta: TContabilConta);
    class function Alterar(AContabilConta: TContabilConta): Integer;
    class function Excluir(AContabilConta: TContabilConta): Integer;
  end;

var
  sql: string;


implementation

{ TContabilContaService }



class function TContabilContaService.ConsultarLista: TObjectList<TContabilConta>;
begin
  sql := 'SELECT * FROM CONTABIL_CONTA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TContabilConta>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilContaService.ConsultarListaFiltro(AWhere: string): TObjectList<TContabilConta>;
begin
  sql := 'SELECT * FROM CONTABIL_CONTA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TContabilConta>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilContaService.ConsultarObjeto(AId: Integer): TContabilConta;
begin
  sql := 'SELECT * FROM CONTABIL_CONTA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TContabilConta>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TContabilContaService.Inserir(AContabilConta: TContabilConta);
begin
  AContabilConta.ValidarInsercao;
  AContabilConta.Id := InserirBase(AContabilConta, 'CONTABIL_CONTA');
  
end;

class function TContabilContaService.Alterar(AContabilConta: TContabilConta): Integer;
begin
  AContabilConta.ValidarAlteracao;
  Result := AlterarBase(AContabilConta, 'CONTABIL_CONTA');
  
  
end;


class function TContabilContaService.Excluir(AContabilConta: TContabilConta): Integer;
begin
  AContabilConta.ValidarExclusao;
  
  Result := ExcluirBase(AContabilConta.Id, 'CONTABIL_CONTA');
end;


end.
