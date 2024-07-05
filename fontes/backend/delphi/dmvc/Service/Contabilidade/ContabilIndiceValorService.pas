{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CONTABIL_INDICE_VALOR] 
                                                                                
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
unit ContabilIndiceValorService;

interface

uses
  ContabilIndiceValor, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TContabilIndiceValorService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TContabilIndiceValor>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TContabilIndiceValor>;
    class function ConsultarObjeto(AId: Integer): TContabilIndiceValor;
    class procedure Inserir(AContabilIndiceValor: TContabilIndiceValor);
    class function Alterar(AContabilIndiceValor: TContabilIndiceValor): Integer;
    class function Excluir(AContabilIndiceValor: TContabilIndiceValor): Integer;
  end;

var
  sql: string;


implementation

{ TContabilIndiceValorService }



class function TContabilIndiceValorService.ConsultarLista: TObjectList<TContabilIndiceValor>;
begin
  sql := 'SELECT * FROM CONTABIL_INDICE_VALOR ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TContabilIndiceValor>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilIndiceValorService.ConsultarListaFiltro(AWhere: string): TObjectList<TContabilIndiceValor>;
begin
  sql := 'SELECT * FROM CONTABIL_INDICE_VALOR where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TContabilIndiceValor>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilIndiceValorService.ConsultarObjeto(AId: Integer): TContabilIndiceValor;
begin
  sql := 'SELECT * FROM CONTABIL_INDICE_VALOR WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TContabilIndiceValor>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TContabilIndiceValorService.Inserir(AContabilIndiceValor: TContabilIndiceValor);
begin
  AContabilIndiceValor.ValidarInsercao;
  AContabilIndiceValor.Id := InserirBase(AContabilIndiceValor, 'CONTABIL_INDICE_VALOR');
  
end;

class function TContabilIndiceValorService.Alterar(AContabilIndiceValor: TContabilIndiceValor): Integer;
begin
  AContabilIndiceValor.ValidarAlteracao;
  Result := AlterarBase(AContabilIndiceValor, 'CONTABIL_INDICE_VALOR');
  
  
end;


class function TContabilIndiceValorService.Excluir(AContabilIndiceValor: TContabilIndiceValor): Integer;
begin
  AContabilIndiceValor.ValidarExclusao;
  
  Result := ExcluirBase(AContabilIndiceValor.Id, 'CONTABIL_INDICE_VALOR');
end;


end.
