{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CONTABIL_DRE_CABECALHO] 
                                                                                
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
unit ContabilDreCabecalhoService;

interface

uses
  ContabilDreCabecalho, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TContabilDreCabecalhoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TContabilDreCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TContabilDreCabecalho>;
    class function ConsultarObjeto(AId: Integer): TContabilDreCabecalho;
    class procedure Inserir(AContabilDreCabecalho: TContabilDreCabecalho);
    class function Alterar(AContabilDreCabecalho: TContabilDreCabecalho): Integer;
    class function Excluir(AContabilDreCabecalho: TContabilDreCabecalho): Integer;
  end;

var
  sql: string;


implementation

{ TContabilDreCabecalhoService }



class function TContabilDreCabecalhoService.ConsultarLista: TObjectList<TContabilDreCabecalho>;
begin
  sql := 'SELECT * FROM CONTABIL_DRE_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TContabilDreCabecalho>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilDreCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TContabilDreCabecalho>;
begin
  sql := 'SELECT * FROM CONTABIL_DRE_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TContabilDreCabecalho>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilDreCabecalhoService.ConsultarObjeto(AId: Integer): TContabilDreCabecalho;
begin
  sql := 'SELECT * FROM CONTABIL_DRE_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TContabilDreCabecalho>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TContabilDreCabecalhoService.Inserir(AContabilDreCabecalho: TContabilDreCabecalho);
begin
  AContabilDreCabecalho.ValidarInsercao;
  AContabilDreCabecalho.Id := InserirBase(AContabilDreCabecalho, 'CONTABIL_DRE_CABECALHO');
  
end;

class function TContabilDreCabecalhoService.Alterar(AContabilDreCabecalho: TContabilDreCabecalho): Integer;
begin
  AContabilDreCabecalho.ValidarAlteracao;
  Result := AlterarBase(AContabilDreCabecalho, 'CONTABIL_DRE_CABECALHO');
  
  
end;


class function TContabilDreCabecalhoService.Excluir(AContabilDreCabecalho: TContabilDreCabecalho): Integer;
begin
  AContabilDreCabecalho.ValidarExclusao;
  
  Result := ExcluirBase(AContabilDreCabecalho.Id, 'CONTABIL_DRE_CABECALHO');
end;


end.
