{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VIEW_FIN_MOVIMENTO_CAIXA_BANCO] 
                                                                                
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
unit ViewFinMovimentoCaixaBancoService;

interface

uses
  ViewFinMovimentoCaixaBanco, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TViewFinMovimentoCaixaBancoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaViewFinMovimentoCaixaBanco: TObjectList<TViewFinMovimentoCaixaBanco>); overload;
    class procedure AnexarObjetosVinculados(AViewFinMovimentoCaixaBanco: TViewFinMovimentoCaixaBanco); overload;
  public
    class function ConsultarLista: TObjectList<TViewFinMovimentoCaixaBanco>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TViewFinMovimentoCaixaBanco>;
    class function ConsultarObjeto(AId: Integer): TViewFinMovimentoCaixaBanco;
    class procedure Inserir(AViewFinMovimentoCaixaBanco: TViewFinMovimentoCaixaBanco);
    class function Alterar(AViewFinMovimentoCaixaBanco: TViewFinMovimentoCaixaBanco): Integer;
    class function Excluir(AViewFinMovimentoCaixaBanco: TViewFinMovimentoCaixaBanco): Integer;
  end;

var
  sql: string;


implementation

{ TViewFinMovimentoCaixaBancoService }

class procedure TViewFinMovimentoCaixaBancoService.AnexarObjetosVinculados(AViewFinMovimentoCaixaBanco: TViewFinMovimentoCaixaBanco);
begin
end;

class procedure TViewFinMovimentoCaixaBancoService.AnexarObjetosVinculados(AListaViewFinMovimentoCaixaBanco: TObjectList<TViewFinMovimentoCaixaBanco>);
var
  ViewFinMovimentoCaixaBanco: TViewFinMovimentoCaixaBanco;
begin
  for ViewFinMovimentoCaixaBanco in AListaViewFinMovimentoCaixaBanco do
  begin
    AnexarObjetosVinculados(ViewFinMovimentoCaixaBanco);
  end;
end;

class function TViewFinMovimentoCaixaBancoService.ConsultarLista: TObjectList<TViewFinMovimentoCaixaBanco>;
begin
  sql := 'SELECT * FROM VIEW_FIN_MOVIMENTO_CAIXA_BANCO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TViewFinMovimentoCaixaBanco>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewFinMovimentoCaixaBancoService.ConsultarListaFiltro(AWhere: string): TObjectList<TViewFinMovimentoCaixaBanco>;
begin
  sql := 'SELECT * FROM VIEW_FIN_MOVIMENTO_CAIXA_BANCO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TViewFinMovimentoCaixaBanco>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewFinMovimentoCaixaBancoService.ConsultarObjeto(AId: Integer): TViewFinMovimentoCaixaBanco;
begin
  sql := 'SELECT * FROM VIEW_FIN_MOVIMENTO_CAIXA_BANCO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TViewFinMovimentoCaixaBanco>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TViewFinMovimentoCaixaBancoService.Inserir(AViewFinMovimentoCaixaBanco: TViewFinMovimentoCaixaBanco);
begin
  AViewFinMovimentoCaixaBanco.ValidarInsercao;
  AViewFinMovimentoCaixaBanco.Id := InserirBase(AViewFinMovimentoCaixaBanco, 'VIEW_FIN_MOVIMENTO_CAIXA_BANCO');
  
end;

class function TViewFinMovimentoCaixaBancoService.Alterar(AViewFinMovimentoCaixaBanco: TViewFinMovimentoCaixaBanco): Integer;
begin
  AViewFinMovimentoCaixaBanco.ValidarAlteracao;
  Result := AlterarBase(AViewFinMovimentoCaixaBanco, 'VIEW_FIN_MOVIMENTO_CAIXA_BANCO');
  
  
end;


class function TViewFinMovimentoCaixaBancoService.Excluir(AViewFinMovimentoCaixaBanco: TViewFinMovimentoCaixaBanco): Integer;
begin
  AViewFinMovimentoCaixaBanco.ValidarExclusao;
  
  Result := ExcluirBase(AViewFinMovimentoCaixaBanco.Id, 'VIEW_FIN_MOVIMENTO_CAIXA_BANCO');
end;


end.
