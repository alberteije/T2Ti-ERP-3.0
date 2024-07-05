{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CONTABIL_DRE_DETALHE] 
                                                                                
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
unit ContabilDreDetalheService;

interface

uses
  ContabilDreDetalhe, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TContabilDreDetalheService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TContabilDreDetalhe>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TContabilDreDetalhe>;
    class function ConsultarObjeto(AId: Integer): TContabilDreDetalhe;
    class procedure Inserir(AContabilDreDetalhe: TContabilDreDetalhe);
    class function Alterar(AContabilDreDetalhe: TContabilDreDetalhe): Integer;
    class function Excluir(AContabilDreDetalhe: TContabilDreDetalhe): Integer;
  end;

var
  sql: string;


implementation

{ TContabilDreDetalheService }



class function TContabilDreDetalheService.ConsultarLista: TObjectList<TContabilDreDetalhe>;
begin
  sql := 'SELECT * FROM CONTABIL_DRE_DETALHE ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TContabilDreDetalhe>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilDreDetalheService.ConsultarListaFiltro(AWhere: string): TObjectList<TContabilDreDetalhe>;
begin
  sql := 'SELECT * FROM CONTABIL_DRE_DETALHE where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TContabilDreDetalhe>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilDreDetalheService.ConsultarObjeto(AId: Integer): TContabilDreDetalhe;
begin
  sql := 'SELECT * FROM CONTABIL_DRE_DETALHE WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TContabilDreDetalhe>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TContabilDreDetalheService.Inserir(AContabilDreDetalhe: TContabilDreDetalhe);
begin
  AContabilDreDetalhe.ValidarInsercao;
  AContabilDreDetalhe.Id := InserirBase(AContabilDreDetalhe, 'CONTABIL_DRE_DETALHE');
  
end;

class function TContabilDreDetalheService.Alterar(AContabilDreDetalhe: TContabilDreDetalhe): Integer;
begin
  AContabilDreDetalhe.ValidarAlteracao;
  Result := AlterarBase(AContabilDreDetalhe, 'CONTABIL_DRE_DETALHE');
  
  
end;


class function TContabilDreDetalheService.Excluir(AContabilDreDetalhe: TContabilDreDetalhe): Integer;
begin
  AContabilDreDetalhe.ValidarExclusao;
  
  Result := ExcluirBase(AContabilDreDetalhe.Id, 'CONTABIL_DRE_DETALHE');
end;


end.
