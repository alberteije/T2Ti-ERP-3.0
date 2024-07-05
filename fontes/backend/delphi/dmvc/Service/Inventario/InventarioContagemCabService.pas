{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [INVENTARIO_CONTAGEM_CAB] 
                                                                                
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
unit InventarioContagemCabService;

interface

uses
  InventarioContagemCab, InventarioContagemDet, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TInventarioContagemCabService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaInventarioContagemCab: TObjectList<TInventarioContagemCab>); overload;
    class procedure AnexarObjetosVinculados(AInventarioContagemCab: TInventarioContagemCab); overload;
//    class procedure AtualizarObjetosFilhos(AInventarioContagemCab: TInventarioContagemCab);
    class procedure ExcluirObjetosFilhos(AInventarioContagemCab: TInventarioContagemCab);
  public
    class function ConsultarLista: TObjectList<TInventarioContagemCab>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TInventarioContagemCab>;
    class function ConsultarObjeto(AId: Integer): TInventarioContagemCab;
    class procedure Inserir(AInventarioContagemCab: TInventarioContagemCab);
    class function Alterar(AInventarioContagemCab: TInventarioContagemCab): Integer;
    class function Excluir(AInventarioContagemCab: TInventarioContagemCab): Integer;
  end;

var
  sql: string;


implementation

{ TInventarioContagemCabService }

class procedure TInventarioContagemCabService.AnexarObjetosVinculados(AInventarioContagemCab: TInventarioContagemCab);
begin
  // InventarioContagemDet
  sql := 'SELECT * FROM INVENTARIO_CONTAGEM_DET WHERE ID_INVENTARIO_CONTAGEM_CAB = ' + AInventarioContagemCab.Id.ToString;
  AInventarioContagemCab.ListaInventarioContagemDet := GetQuery(sql).AsObjectList<TInventarioContagemDet>;

end;

class procedure TInventarioContagemCabService.AnexarObjetosVinculados(AListaInventarioContagemCab: TObjectList<TInventarioContagemCab>);
var
  InventarioContagemCab: TInventarioContagemCab;
begin
  for InventarioContagemCab in AListaInventarioContagemCab do
  begin
    AnexarObjetosVinculados(InventarioContagemCab);
  end;
end;

class function TInventarioContagemCabService.ConsultarLista: TObjectList<TInventarioContagemCab>;
begin
  sql := 'SELECT * FROM INVENTARIO_CONTAGEM_CAB ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TInventarioContagemCab>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TInventarioContagemCabService.ConsultarListaFiltro(AWhere: string): TObjectList<TInventarioContagemCab>;
begin
  sql := 'SELECT * FROM INVENTARIO_CONTAGEM_CAB where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TInventarioContagemCab>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TInventarioContagemCabService.ConsultarObjeto(AId: Integer): TInventarioContagemCab;
begin
  sql := 'SELECT * FROM INVENTARIO_CONTAGEM_CAB WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TInventarioContagemCab>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TInventarioContagemCabService.Inserir(AInventarioContagemCab: TInventarioContagemCab);
begin
  AInventarioContagemCab.ValidarInsercao;
  AInventarioContagemCab.Id := InserirBase(AInventarioContagemCab, 'INVENTARIO_CONTAGEM_CAB');
  
end;

class function TInventarioContagemCabService.Alterar(AInventarioContagemCab: TInventarioContagemCab): Integer;
begin
  AInventarioContagemCab.ValidarAlteracao;
  Result := AlterarBase(AInventarioContagemCab, 'INVENTARIO_CONTAGEM_CAB');
  ExcluirObjetosFilhos(AInventarioContagemCab);
  
end;


class function TInventarioContagemCabService.Excluir(AInventarioContagemCab: TInventarioContagemCab): Integer;
begin
  AInventarioContagemCab.ValidarExclusao;
  ExcluirObjetosFilhos(AInventarioContagemCab);
  Result := ExcluirBase(AInventarioContagemCab.Id, 'INVENTARIO_CONTAGEM_CAB');
end;

class procedure TInventarioContagemCabService.ExcluirObjetosFilhos(AInventarioContagemCab: TInventarioContagemCab);
begin
  ExcluirFilho(AInventarioContagemCab.Id, 'INVENTARIO_CONTAGEM_DET', 'ID_INVENTARIO_CONTAGEM_CAB');
end;

end.
