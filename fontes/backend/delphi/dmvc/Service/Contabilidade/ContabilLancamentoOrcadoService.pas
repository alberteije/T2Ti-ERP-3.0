{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CONTABIL_LANCAMENTO_ORCADO] 
                                                                                
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
unit ContabilLancamentoOrcadoService;

interface

uses
  ContabilLancamentoOrcado, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TContabilLancamentoOrcadoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TContabilLancamentoOrcado>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TContabilLancamentoOrcado>;
    class function ConsultarObjeto(AId: Integer): TContabilLancamentoOrcado;
    class procedure Inserir(AContabilLancamentoOrcado: TContabilLancamentoOrcado);
    class function Alterar(AContabilLancamentoOrcado: TContabilLancamentoOrcado): Integer;
    class function Excluir(AContabilLancamentoOrcado: TContabilLancamentoOrcado): Integer;
  end;

var
  sql: string;


implementation

{ TContabilLancamentoOrcadoService }



class function TContabilLancamentoOrcadoService.ConsultarLista: TObjectList<TContabilLancamentoOrcado>;
begin
  sql := 'SELECT * FROM CONTABIL_LANCAMENTO_ORCADO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TContabilLancamentoOrcado>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilLancamentoOrcadoService.ConsultarListaFiltro(AWhere: string): TObjectList<TContabilLancamentoOrcado>;
begin
  sql := 'SELECT * FROM CONTABIL_LANCAMENTO_ORCADO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TContabilLancamentoOrcado>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilLancamentoOrcadoService.ConsultarObjeto(AId: Integer): TContabilLancamentoOrcado;
begin
  sql := 'SELECT * FROM CONTABIL_LANCAMENTO_ORCADO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TContabilLancamentoOrcado>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TContabilLancamentoOrcadoService.Inserir(AContabilLancamentoOrcado: TContabilLancamentoOrcado);
begin
  AContabilLancamentoOrcado.ValidarInsercao;
  AContabilLancamentoOrcado.Id := InserirBase(AContabilLancamentoOrcado, 'CONTABIL_LANCAMENTO_ORCADO');
  
end;

class function TContabilLancamentoOrcadoService.Alterar(AContabilLancamentoOrcado: TContabilLancamentoOrcado): Integer;
begin
  AContabilLancamentoOrcado.ValidarAlteracao;
  Result := AlterarBase(AContabilLancamentoOrcado, 'CONTABIL_LANCAMENTO_ORCADO');
  
  
end;


class function TContabilLancamentoOrcadoService.Excluir(AContabilLancamentoOrcado: TContabilLancamentoOrcado): Integer;
begin
  AContabilLancamentoOrcado.ValidarExclusao;
  
  Result := ExcluirBase(AContabilLancamentoOrcado.Id, 'CONTABIL_LANCAMENTO_ORCADO');
end;


end.
