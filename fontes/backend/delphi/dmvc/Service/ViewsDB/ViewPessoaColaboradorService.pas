{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VIEW_PESSOA_COLABORADOR] 
                                                                                
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
unit ViewPessoaColaboradorService;

interface

uses
  ViewPessoaColaborador, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TViewPessoaColaboradorService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaViewPessoaColaborador: TObjectList<TViewPessoaColaborador>); overload;
    class procedure AnexarObjetosVinculados(AViewPessoaColaborador: TViewPessoaColaborador); overload;
  public
    class function ConsultarLista: TObjectList<TViewPessoaColaborador>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TViewPessoaColaborador>;
    class function ConsultarObjeto(AId: Integer): TViewPessoaColaborador;
    class procedure Inserir(AViewPessoaColaborador: TViewPessoaColaborador);
    class function Alterar(AViewPessoaColaborador: TViewPessoaColaborador): Integer;
    class function Excluir(AViewPessoaColaborador: TViewPessoaColaborador): Integer;
  end;

var
  sql: string;


implementation

{ TViewPessoaColaboradorService }

class procedure TViewPessoaColaboradorService.AnexarObjetosVinculados(AViewPessoaColaborador: TViewPessoaColaborador);
begin
end;

class procedure TViewPessoaColaboradorService.AnexarObjetosVinculados(AListaViewPessoaColaborador: TObjectList<TViewPessoaColaborador>);
var
  ViewPessoaColaborador: TViewPessoaColaborador;
begin
  for ViewPessoaColaborador in AListaViewPessoaColaborador do
  begin
    AnexarObjetosVinculados(ViewPessoaColaborador);
  end;
end;

class function TViewPessoaColaboradorService.ConsultarLista: TObjectList<TViewPessoaColaborador>;
begin
  sql := 'SELECT * FROM VIEW_PESSOA_COLABORADOR ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TViewPessoaColaborador>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewPessoaColaboradorService.ConsultarListaFiltro(AWhere: string): TObjectList<TViewPessoaColaborador>;
begin
  sql := 'SELECT * FROM VIEW_PESSOA_COLABORADOR where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TViewPessoaColaborador>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewPessoaColaboradorService.ConsultarObjeto(AId: Integer): TViewPessoaColaborador;
begin
  sql := 'SELECT * FROM VIEW_PESSOA_COLABORADOR WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TViewPessoaColaborador>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TViewPessoaColaboradorService.Inserir(AViewPessoaColaborador: TViewPessoaColaborador);
begin
  AViewPessoaColaborador.ValidarInsercao;
  AViewPessoaColaborador.Id := InserirBase(AViewPessoaColaborador, 'VIEW_PESSOA_COLABORADOR');
  
end;

class function TViewPessoaColaboradorService.Alterar(AViewPessoaColaborador: TViewPessoaColaborador): Integer;
begin
  AViewPessoaColaborador.ValidarAlteracao;
  Result := AlterarBase(AViewPessoaColaborador, 'VIEW_PESSOA_COLABORADOR');
  
  
end;


class function TViewPessoaColaboradorService.Excluir(AViewPessoaColaborador: TViewPessoaColaborador): Integer;
begin
  AViewPessoaColaborador.ValidarExclusao;
  
  Result := ExcluirBase(AViewPessoaColaborador.Id, 'VIEW_PESSOA_COLABORADOR');
end;


end.
