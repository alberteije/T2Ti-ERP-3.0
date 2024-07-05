{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CONTABIL_PARAMETRO] 
                                                                                
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
unit ContabilParametroService;

interface

uses
  ContabilParametro, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TContabilParametroService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TContabilParametro>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TContabilParametro>;
    class function ConsultarObjeto(AId: Integer): TContabilParametro;
    class procedure Inserir(AContabilParametro: TContabilParametro);
    class function Alterar(AContabilParametro: TContabilParametro): Integer;
    class function Excluir(AContabilParametro: TContabilParametro): Integer;
  end;

var
  sql: string;


implementation

{ TContabilParametroService }



class function TContabilParametroService.ConsultarLista: TObjectList<TContabilParametro>;
begin
  sql := 'SELECT * FROM CONTABIL_PARAMETRO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TContabilParametro>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilParametroService.ConsultarListaFiltro(AWhere: string): TObjectList<TContabilParametro>;
begin
  sql := 'SELECT * FROM CONTABIL_PARAMETRO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TContabilParametro>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilParametroService.ConsultarObjeto(AId: Integer): TContabilParametro;
begin
  sql := 'SELECT * FROM CONTABIL_PARAMETRO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TContabilParametro>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TContabilParametroService.Inserir(AContabilParametro: TContabilParametro);
begin
  AContabilParametro.ValidarInsercao;
  AContabilParametro.Id := InserirBase(AContabilParametro, 'CONTABIL_PARAMETRO');
  
end;

class function TContabilParametroService.Alterar(AContabilParametro: TContabilParametro): Integer;
begin
  AContabilParametro.ValidarAlteracao;
  Result := AlterarBase(AContabilParametro, 'CONTABIL_PARAMETRO');
  
  
end;


class function TContabilParametroService.Excluir(AContabilParametro: TContabilParametro): Integer;
begin
  AContabilParametro.ValidarExclusao;
  
  Result := ExcluirBase(AContabilParametro.Id, 'CONTABIL_PARAMETRO');
end;


end.
