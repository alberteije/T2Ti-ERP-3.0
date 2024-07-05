{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CONTABIL_LANCAMENTO_DETALHE] 
                                                                                
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
unit ContabilLancamentoDetalheService;

interface

uses
  ContabilLancamentoDetalhe, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TContabilLancamentoDetalheService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TContabilLancamentoDetalhe>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TContabilLancamentoDetalhe>;
    class function ConsultarObjeto(AId: Integer): TContabilLancamentoDetalhe;
    class procedure Inserir(AContabilLancamentoDetalhe: TContabilLancamentoDetalhe);
    class function Alterar(AContabilLancamentoDetalhe: TContabilLancamentoDetalhe): Integer;
    class function Excluir(AContabilLancamentoDetalhe: TContabilLancamentoDetalhe): Integer;
  end;

var
  sql: string;


implementation

{ TContabilLancamentoDetalheService }



class function TContabilLancamentoDetalheService.ConsultarLista: TObjectList<TContabilLancamentoDetalhe>;
begin
  sql := 'SELECT * FROM CONTABIL_LANCAMENTO_DETALHE ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TContabilLancamentoDetalhe>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilLancamentoDetalheService.ConsultarListaFiltro(AWhere: string): TObjectList<TContabilLancamentoDetalhe>;
begin
  sql := 'SELECT * FROM CONTABIL_LANCAMENTO_DETALHE where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TContabilLancamentoDetalhe>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilLancamentoDetalheService.ConsultarObjeto(AId: Integer): TContabilLancamentoDetalhe;
begin
  sql := 'SELECT * FROM CONTABIL_LANCAMENTO_DETALHE WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TContabilLancamentoDetalhe>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TContabilLancamentoDetalheService.Inserir(AContabilLancamentoDetalhe: TContabilLancamentoDetalhe);
begin
  AContabilLancamentoDetalhe.ValidarInsercao;
  AContabilLancamentoDetalhe.Id := InserirBase(AContabilLancamentoDetalhe, 'CONTABIL_LANCAMENTO_DETALHE');
  
end;

class function TContabilLancamentoDetalheService.Alterar(AContabilLancamentoDetalhe: TContabilLancamentoDetalhe): Integer;
begin
  AContabilLancamentoDetalhe.ValidarAlteracao;
  Result := AlterarBase(AContabilLancamentoDetalhe, 'CONTABIL_LANCAMENTO_DETALHE');
  
  
end;


class function TContabilLancamentoDetalheService.Excluir(AContabilLancamentoDetalhe: TContabilLancamentoDetalhe): Integer;
begin
  AContabilLancamentoDetalhe.ValidarExclusao;
  
  Result := ExcluirBase(AContabilLancamentoDetalhe.Id, 'CONTABIL_LANCAMENTO_DETALHE');
end;


end.
