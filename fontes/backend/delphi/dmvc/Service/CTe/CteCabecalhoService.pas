{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CTE_CABECALHO] 
                                                                                
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
unit CteCabecalhoService;

interface

uses
  CteCabecalho, CteCarga, CteDestinatario, CteLocalEntrega, CteRemetente, CteRodoviario, CteTomador, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TCteCabecalhoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaCteCabecalho: TObjectList<TCteCabecalho>); overload;
    class procedure AnexarObjetosVinculados(ACteCabecalho: TCteCabecalho); overload;
    class procedure AtualizarObjetosFilhos(ACteCabecalho: TCteCabecalho);
    class procedure ExcluirObjetosFilhos(ACteCabecalho: TCteCabecalho);
  public
    class function ConsultarLista: TObjectList<TCteCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TCteCabecalho>;
    class function ConsultarObjeto(AId: Integer): TCteCabecalho;
    class procedure Inserir(ACteCabecalho: TCteCabecalho);
    class function Alterar(ACteCabecalho: TCteCabecalho): Integer;
    class function Excluir(ACteCabecalho: TCteCabecalho): Integer;
  end;

var
  sql: string;


implementation

{ TCteCabecalhoService }

class procedure TCteCabecalhoService.AnexarObjetosVinculados(ACteCabecalho: TCteCabecalho);
begin
  // CteCarga
  sql := 'SELECT * FROM CTE_CARGA WHERE ID_CTE_CABECALHO = ' + ACteCabecalho.Id.ToString;
  ACteCabecalho.ListaCteCarga := GetQuery(sql).AsObjectList<TCteCarga>;

  // CteDestinatario
  sql := 'SELECT * FROM CTE_DESTINATARIO WHERE ID_CTE_CABECALHO = ' + ACteCabecalho.Id.ToString;
  ACteCabecalho.CteDestinatario := GetQuery(sql).AsObject<TCteDestinatario>;

  // CteLocalEntrega
  sql := 'SELECT * FROM CTE_LOCAL_ENTREGA WHERE ID_CTE_CABECALHO = ' + ACteCabecalho.Id.ToString;
  ACteCabecalho.CteLocalEntrega := GetQuery(sql).AsObject<TCteLocalEntrega>;

  // CteRemetente
  sql := 'SELECT * FROM CTE_REMETENTE WHERE ID_CTE_CABECALHO = ' + ACteCabecalho.Id.ToString;
  ACteCabecalho.CteRemetente := GetQuery(sql).AsObject<TCteRemetente>;

  // CteRodoviario
  sql := 'SELECT * FROM CTE_RODOVIARIO WHERE ID_CTE_CABECALHO = ' + ACteCabecalho.Id.ToString;
  ACteCabecalho.CteRodoviario := GetQuery(sql).AsObject<TCteRodoviario>;

  // CteTomador
  sql := 'SELECT * FROM CTE_TOMADOR WHERE ID_CTE_CABECALHO = ' + ACteCabecalho.Id.ToString;
  ACteCabecalho.CteTomador := GetQuery(sql).AsObject<TCteTomador>;

end;

class procedure TCteCabecalhoService.AtualizarObjetosFilhos(
  ACteCabecalho: TCteCabecalho);
begin
//
end;

class procedure TCteCabecalhoService.AnexarObjetosVinculados(AListaCteCabecalho: TObjectList<TCteCabecalho>);
var
  CteCabecalho: TCteCabecalho;
begin
  for CteCabecalho in AListaCteCabecalho do
  begin
    AnexarObjetosVinculados(CteCabecalho);
  end;
end;

class function TCteCabecalhoService.ConsultarLista: TObjectList<TCteCabecalho>;
begin
  sql := 'SELECT * FROM CTE_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TCteCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TCteCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TCteCabecalho>;
begin
  sql := 'SELECT * FROM CTE_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TCteCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TCteCabecalhoService.ConsultarObjeto(AId: Integer): TCteCabecalho;
begin
  sql := 'SELECT * FROM CTE_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TCteCabecalho>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TCteCabecalhoService.Inserir(ACteCabecalho: TCteCabecalho);
begin
  ACteCabecalho.ValidarInsercao;
  ACteCabecalho.Id := InserirBase(ACteCabecalho, 'CTE_CABECALHO');
  
end;

class function TCteCabecalhoService.Alterar(ACteCabecalho: TCteCabecalho): Integer;
begin
  ACteCabecalho.ValidarAlteracao;
  Result := AlterarBase(ACteCabecalho, 'CTE_CABECALHO');
  ExcluirObjetosFilhos(ACteCabecalho);
  
end;


class function TCteCabecalhoService.Excluir(ACteCabecalho: TCteCabecalho): Integer;
begin
  ACteCabecalho.ValidarExclusao;
  ExcluirObjetosFilhos(ACteCabecalho);
  Result := ExcluirBase(ACteCabecalho.Id, 'CTE_CABECALHO');
end;

class procedure TCteCabecalhoService.ExcluirObjetosFilhos(ACteCabecalho: TCteCabecalho);
begin
  ExcluirFilho(ACteCabecalho.Id, 'CTE_CARGA', 'ID_CTE_CABECALHO');
  ExcluirFilho(ACteCabecalho.Id, 'CTE_DESTINATARIO', 'ID_CTE_CABECALHO');
  ExcluirFilho(ACteCabecalho.Id, 'CTE_LOCAL_ENTREGA', 'ID_CTE_CABECALHO');
  ExcluirFilho(ACteCabecalho.Id, 'CTE_REMETENTE', 'ID_CTE_CABECALHO');
  ExcluirFilho(ACteCabecalho.Id, 'CTE_RODOVIARIO', 'ID_CTE_CABECALHO');
  ExcluirFilho(ACteCabecalho.Id, 'CTE_TOMADOR', 'ID_CTE_CABECALHO');
end;

end.
