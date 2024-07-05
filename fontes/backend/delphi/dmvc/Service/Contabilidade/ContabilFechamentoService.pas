{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CONTABIL_FECHAMENTO] 
                                                                                
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
unit ContabilFechamentoService;

interface

uses
  ContabilFechamento, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TContabilFechamentoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TContabilFechamento>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TContabilFechamento>;
    class function ConsultarObjeto(AId: Integer): TContabilFechamento;
    class procedure Inserir(AContabilFechamento: TContabilFechamento);
    class function Alterar(AContabilFechamento: TContabilFechamento): Integer;
    class function Excluir(AContabilFechamento: TContabilFechamento): Integer;
  end;

var
  sql: string;


implementation

{ TContabilFechamentoService }



class function TContabilFechamentoService.ConsultarLista: TObjectList<TContabilFechamento>;
begin
  sql := 'SELECT * FROM CONTABIL_FECHAMENTO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TContabilFechamento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilFechamentoService.ConsultarListaFiltro(AWhere: string): TObjectList<TContabilFechamento>;
begin
  sql := 'SELECT * FROM CONTABIL_FECHAMENTO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TContabilFechamento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilFechamentoService.ConsultarObjeto(AId: Integer): TContabilFechamento;
begin
  sql := 'SELECT * FROM CONTABIL_FECHAMENTO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TContabilFechamento>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TContabilFechamentoService.Inserir(AContabilFechamento: TContabilFechamento);
begin
  AContabilFechamento.ValidarInsercao;
  AContabilFechamento.Id := InserirBase(AContabilFechamento, 'CONTABIL_FECHAMENTO');
  
end;

class function TContabilFechamentoService.Alterar(AContabilFechamento: TContabilFechamento): Integer;
begin
  AContabilFechamento.ValidarAlteracao;
  Result := AlterarBase(AContabilFechamento, 'CONTABIL_FECHAMENTO');
  
  
end;


class function TContabilFechamentoService.Excluir(AContabilFechamento: TContabilFechamento): Integer;
begin
  AContabilFechamento.ValidarExclusao;
  
  Result := ExcluirBase(AContabilFechamento.Id, 'CONTABIL_FECHAMENTO');
end;


end.
