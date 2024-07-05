{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VIEW_FIN_LANCAMENTO_RECEBER] 
                                                                                
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
unit ViewFinLancamentoReceberService;

interface

uses
  ViewFinLancamentoReceber, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TViewFinLancamentoReceberService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TViewFinLancamentoReceber>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TViewFinLancamentoReceber>;
    class function ConsultarObjeto(AId: Integer): TViewFinLancamentoReceber;
    class procedure Inserir(AViewFinLancamentoReceber: TViewFinLancamentoReceber);
    class function Alterar(AViewFinLancamentoReceber: TViewFinLancamentoReceber): Integer;
    class function Excluir(AViewFinLancamentoReceber: TViewFinLancamentoReceber): Integer;
  end;

var
  sql: string;


implementation

{ TViewFinLancamentoReceberService }



class function TViewFinLancamentoReceberService.ConsultarLista: TObjectList<TViewFinLancamentoReceber>;
begin
  sql := 'SELECT * FROM VIEW_FIN_LANCAMENTO_RECEBER ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TViewFinLancamentoReceber>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewFinLancamentoReceberService.ConsultarListaFiltro(AWhere: string): TObjectList<TViewFinLancamentoReceber>;
begin
  sql := 'SELECT * FROM VIEW_FIN_LANCAMENTO_RECEBER where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TViewFinLancamentoReceber>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewFinLancamentoReceberService.ConsultarObjeto(AId: Integer): TViewFinLancamentoReceber;
begin
  sql := 'SELECT * FROM VIEW_FIN_LANCAMENTO_RECEBER WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TViewFinLancamentoReceber>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TViewFinLancamentoReceberService.Inserir(AViewFinLancamentoReceber: TViewFinLancamentoReceber);
begin
  AViewFinLancamentoReceber.ValidarInsercao;
  AViewFinLancamentoReceber.Id := InserirBase(AViewFinLancamentoReceber, 'VIEW_FIN_LANCAMENTO_RECEBER');
  
end;

class function TViewFinLancamentoReceberService.Alterar(AViewFinLancamentoReceber: TViewFinLancamentoReceber): Integer;
begin
  AViewFinLancamentoReceber.ValidarAlteracao;
  Result := AlterarBase(AViewFinLancamentoReceber, 'VIEW_FIN_LANCAMENTO_RECEBER');
  
  
end;


class function TViewFinLancamentoReceberService.Excluir(AViewFinLancamentoReceber: TViewFinLancamentoReceber): Integer;
begin
  AViewFinLancamentoReceber.ValidarExclusao;
  
  Result := ExcluirBase(AViewFinLancamentoReceber.Id, 'VIEW_FIN_LANCAMENTO_RECEBER');
end;


end.
