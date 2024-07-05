{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [COMPRA_TIPO_REQUISICAO] 
                                                                                
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
unit CompraTipoRequisicaoService;

interface

uses
  CompraTipoRequisicao, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TCompraTipoRequisicaoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaCompraTipoRequisicao: TObjectList<TCompraTipoRequisicao>); overload;
    class procedure AnexarObjetosVinculados(ACompraTipoRequisicao: TCompraTipoRequisicao); overload;
  public
    class function ConsultarLista: TObjectList<TCompraTipoRequisicao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TCompraTipoRequisicao>;
    class function ConsultarObjeto(AId: Integer): TCompraTipoRequisicao;
    class procedure Inserir(ACompraTipoRequisicao: TCompraTipoRequisicao);
    class function Alterar(ACompraTipoRequisicao: TCompraTipoRequisicao): Integer;
    class function Excluir(ACompraTipoRequisicao: TCompraTipoRequisicao): Integer;
  end;

var
  sql: string;


implementation

{ TCompraTipoRequisicaoService }

class procedure TCompraTipoRequisicaoService.AnexarObjetosVinculados(ACompraTipoRequisicao: TCompraTipoRequisicao);
begin
end;

class procedure TCompraTipoRequisicaoService.AnexarObjetosVinculados(AListaCompraTipoRequisicao: TObjectList<TCompraTipoRequisicao>);
var
  CompraTipoRequisicao: TCompraTipoRequisicao;
begin
  for CompraTipoRequisicao in AListaCompraTipoRequisicao do
  begin
    AnexarObjetosVinculados(CompraTipoRequisicao);
  end;
end;

class function TCompraTipoRequisicaoService.ConsultarLista: TObjectList<TCompraTipoRequisicao>;
begin
  sql := 'SELECT * FROM COMPRA_TIPO_REQUISICAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TCompraTipoRequisicao>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TCompraTipoRequisicaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TCompraTipoRequisicao>;
begin
  sql := 'SELECT * FROM COMPRA_TIPO_REQUISICAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TCompraTipoRequisicao>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TCompraTipoRequisicaoService.ConsultarObjeto(AId: Integer): TCompraTipoRequisicao;
begin
  sql := 'SELECT * FROM COMPRA_TIPO_REQUISICAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TCompraTipoRequisicao>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TCompraTipoRequisicaoService.Inserir(ACompraTipoRequisicao: TCompraTipoRequisicao);
begin
  ACompraTipoRequisicao.ValidarInsercao;
  ACompraTipoRequisicao.Id := InserirBase(ACompraTipoRequisicao, 'COMPRA_TIPO_REQUISICAO');
  
end;

class function TCompraTipoRequisicaoService.Alterar(ACompraTipoRequisicao: TCompraTipoRequisicao): Integer;
begin
  ACompraTipoRequisicao.ValidarAlteracao;
  Result := AlterarBase(ACompraTipoRequisicao, 'COMPRA_TIPO_REQUISICAO');
  
  
end;


class function TCompraTipoRequisicaoService.Excluir(ACompraTipoRequisicao: TCompraTipoRequisicao): Integer;
begin
  ACompraTipoRequisicao.ValidarExclusao;
  
  Result := ExcluirBase(ACompraTipoRequisicao.Id, 'COMPRA_TIPO_REQUISICAO');
end;


end.
