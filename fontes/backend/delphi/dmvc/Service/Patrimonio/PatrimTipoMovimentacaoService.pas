{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PATRIM_TIPO_MOVIMENTACAO] 
                                                                                
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
unit PatrimTipoMovimentacaoService;

interface

uses
  PatrimTipoMovimentacao, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPatrimTipoMovimentacaoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPatrimTipoMovimentacao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPatrimTipoMovimentacao>;
    class function ConsultarObjeto(AId: Integer): TPatrimTipoMovimentacao;
    class procedure Inserir(APatrimTipoMovimentacao: TPatrimTipoMovimentacao);
    class function Alterar(APatrimTipoMovimentacao: TPatrimTipoMovimentacao): Integer;
    class function Excluir(APatrimTipoMovimentacao: TPatrimTipoMovimentacao): Integer;
  end;

var
  sql: string;


implementation

{ TPatrimTipoMovimentacaoService }



class function TPatrimTipoMovimentacaoService.ConsultarLista: TObjectList<TPatrimTipoMovimentacao>;
begin
  sql := 'SELECT * FROM PATRIM_TIPO_MOVIMENTACAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPatrimTipoMovimentacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPatrimTipoMovimentacaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TPatrimTipoMovimentacao>;
begin
  sql := 'SELECT * FROM PATRIM_TIPO_MOVIMENTACAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPatrimTipoMovimentacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPatrimTipoMovimentacaoService.ConsultarObjeto(AId: Integer): TPatrimTipoMovimentacao;
begin
  sql := 'SELECT * FROM PATRIM_TIPO_MOVIMENTACAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPatrimTipoMovimentacao>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPatrimTipoMovimentacaoService.Inserir(APatrimTipoMovimentacao: TPatrimTipoMovimentacao);
begin
  APatrimTipoMovimentacao.ValidarInsercao;
  APatrimTipoMovimentacao.Id := InserirBase(APatrimTipoMovimentacao, 'PATRIM_TIPO_MOVIMENTACAO');
  
end;

class function TPatrimTipoMovimentacaoService.Alterar(APatrimTipoMovimentacao: TPatrimTipoMovimentacao): Integer;
begin
  APatrimTipoMovimentacao.ValidarAlteracao;
  Result := AlterarBase(APatrimTipoMovimentacao, 'PATRIM_TIPO_MOVIMENTACAO');
  
  
end;


class function TPatrimTipoMovimentacaoService.Excluir(APatrimTipoMovimentacao: TPatrimTipoMovimentacao): Integer;
begin
  APatrimTipoMovimentacao.ValidarExclusao;
  
  Result := ExcluirBase(APatrimTipoMovimentacao.Id, 'PATRIM_TIPO_MOVIMENTACAO');
end;


end.
