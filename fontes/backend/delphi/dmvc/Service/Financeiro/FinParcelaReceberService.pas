{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [FIN_PARCELA_RECEBER] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
unit FinParcelaReceberService;

interface

uses
  FinParcelaReceber, FinStatusParcela, FinTipoRecebimento, FinChequeRecebido, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFinParcelaReceberService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaFinParcelaReceber: TObjectList<TFinParcelaReceber>); overload;
    class procedure AnexarObjetosVinculados(AFinParcelaReceber: TFinParcelaReceber); overload;
  public
    class function ConsultarLista: TObjectList<TFinParcelaReceber>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFinParcelaReceber>;
    class function ConsultarObjeto(AId: Integer): TFinParcelaReceber;
    class procedure Inserir(AFinParcelaReceber: TFinParcelaReceber);
    class function Alterar(AFinParcelaReceber: TFinParcelaReceber): Integer;
    class function Excluir(AFinParcelaReceber: TFinParcelaReceber): Integer;
  end;

var
  sql: string;


implementation

{ TFinParcelaReceberService }

class procedure TFinParcelaReceberService.AnexarObjetosVinculados(AFinParcelaReceber: TFinParcelaReceber);
begin
  // FinStatusParcela
  sql := 'SELECT * FROM FIN_STATUS_PARCELA WHERE ID = ' + AFinParcelaReceber.IdFinStatusParcela.ToString;
  AFinParcelaReceber.FinStatusParcela := GetQuery(sql).AsObject<TFinStatusParcela>;

  // FinTipoRecebimento
  sql := 'SELECT * FROM FIN_TIPO_RECEBIMENTO WHERE ID = ' + AFinParcelaReceber.IdFinTipoRecebimento.ToString;
  AFinParcelaReceber.FinTipoRecebimento := GetQuery(sql).AsObject<TFinTipoRecebimento>;

  // FinChequeRecebido
  sql := 'SELECT * FROM FIN_CHEQUE_RECEBIDO WHERE ID = ' + AFinParcelaReceber.IdFinChequeRecebido.ToString;
  AFinParcelaReceber.FinChequeRecebido := GetQuery(sql).AsObject<TFinChequeRecebido>;

end;

class procedure TFinParcelaReceberService.AnexarObjetosVinculados(AListaFinParcelaReceber: TObjectList<TFinParcelaReceber>);
var
  FinParcelaReceber: TFinParcelaReceber;
begin
  for FinParcelaReceber in AListaFinParcelaReceber do
  begin
    AnexarObjetosVinculados(FinParcelaReceber);
  end;
end;

class function TFinParcelaReceberService.ConsultarLista: TObjectList<TFinParcelaReceber>;
begin
  sql := 'SELECT * FROM FIN_PARCELA_RECEBER ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFinParcelaReceber>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFinParcelaReceberService.ConsultarListaFiltro(AWhere: string): TObjectList<TFinParcelaReceber>;
begin
  sql := 'SELECT * FROM FIN_PARCELA_RECEBER where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFinParcelaReceber>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFinParcelaReceberService.ConsultarObjeto(AId: Integer): TFinParcelaReceber;
begin
  sql := 'SELECT * FROM FIN_PARCELA_RECEBER WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFinParcelaReceber>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFinParcelaReceberService.Inserir(AFinParcelaReceber: TFinParcelaReceber);
begin
  AFinParcelaReceber.ValidarInsercao;
  AFinParcelaReceber.Id := InserirBase(AFinParcelaReceber, 'FIN_PARCELA_RECEBER');
  
end;

class function TFinParcelaReceberService.Alterar(AFinParcelaReceber: TFinParcelaReceber): Integer;
begin
  AFinParcelaReceber.ValidarAlteracao;
  Result := AlterarBase(AFinParcelaReceber, 'FIN_PARCELA_RECEBER');
  
  
end;


class function TFinParcelaReceberService.Excluir(AFinParcelaReceber: TFinParcelaReceber): Integer;
begin
  AFinParcelaReceber.ValidarExclusao;
  
  Result := ExcluirBase(AFinParcelaReceber.Id, 'FIN_PARCELA_RECEBER');
end;


end.
