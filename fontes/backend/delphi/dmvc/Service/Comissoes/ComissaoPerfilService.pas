{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [COMISSAO_PERFIL] 
                                                                                
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
unit ComissaoPerfilService;

interface

uses
  ComissaoPerfil, ComissaoObjetivo, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TComissaoPerfilService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaComissaoPerfil: TObjectList<TComissaoPerfil>); overload;
    class procedure AnexarObjetosVinculados(AComissaoPerfil: TComissaoPerfil); overload;
    class procedure InserirObjetosFilhos(AComissaoPerfil: TComissaoPerfil);
    class procedure ExcluirObjetosFilhos(AComissaoPerfil: TComissaoPerfil);
  public
    class function ConsultarLista: TObjectList<TComissaoPerfil>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TComissaoPerfil>;
    class function ConsultarObjeto(AId: Integer): TComissaoPerfil;
    class procedure Inserir(AComissaoPerfil: TComissaoPerfil);
    class function Alterar(AComissaoPerfil: TComissaoPerfil): Integer;
    class function Excluir(AComissaoPerfil: TComissaoPerfil): Integer;
  end;

var
  sql: string;


implementation

{ TComissaoPerfilService }

class procedure TComissaoPerfilService.AnexarObjetosVinculados(AComissaoPerfil: TComissaoPerfil);
begin
  // ComissaoObjetivo
  sql := 'SELECT * FROM COMISSAO_OBJETIVO WHERE ID_COMISSAO_PERFIL = ' + AComissaoPerfil.Id.ToString;
  AComissaoPerfil.ListaComissaoObjetivo := GetQuery(sql).AsObjectList<TComissaoObjetivo>;

end;

class procedure TComissaoPerfilService.AnexarObjetosVinculados(AListaComissaoPerfil: TObjectList<TComissaoPerfil>);
var
  ComissaoPerfil: TComissaoPerfil;
begin
  for ComissaoPerfil in AListaComissaoPerfil do
  begin
    AnexarObjetosVinculados(ComissaoPerfil);
  end;
end;

class function TComissaoPerfilService.ConsultarLista: TObjectList<TComissaoPerfil>;
begin
  sql := 'SELECT * FROM COMISSAO_PERFIL ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TComissaoPerfil>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TComissaoPerfilService.ConsultarListaFiltro(AWhere: string): TObjectList<TComissaoPerfil>;
begin
  sql := 'SELECT * FROM COMISSAO_PERFIL where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TComissaoPerfil>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TComissaoPerfilService.ConsultarObjeto(AId: Integer): TComissaoPerfil;
begin
  sql := 'SELECT * FROM COMISSAO_PERFIL WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TComissaoPerfil>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TComissaoPerfilService.Inserir(AComissaoPerfil: TComissaoPerfil);
begin
  AComissaoPerfil.ValidarInsercao;
  AComissaoPerfil.Id := InserirBase(AComissaoPerfil, 'COMISSAO_PERFIL');
  InserirObjetosFilhos(AComissaoPerfil);
end;

class function TComissaoPerfilService.Alterar(AComissaoPerfil: TComissaoPerfil): Integer;
begin
  AComissaoPerfil.ValidarAlteracao;
  Result := AlterarBase(AComissaoPerfil, 'COMISSAO_PERFIL');
  ExcluirObjetosFilhos(AComissaoPerfil);
  InserirObjetosFilhos(AComissaoPerfil);
end;

class procedure TComissaoPerfilService.InserirObjetosFilhos(AComissaoPerfil: TComissaoPerfil);
var
  ComissaoObjetivo: TComissaoObjetivo;
begin
  // ComissaoObjetivo
  for ComissaoObjetivo in AComissaoPerfil.ListaComissaoObjetivo do
  begin
    ComissaoObjetivo.IdComissaoPerfil := AComissaoPerfil.Id;
    InserirBase(ComissaoObjetivo, 'COMISSAO_OBJETIVO');
  end;

end;

class function TComissaoPerfilService.Excluir(AComissaoPerfil: TComissaoPerfil): Integer;
begin
  AComissaoPerfil.ValidarExclusao;
  ExcluirObjetosFilhos(AComissaoPerfil);
  Result := ExcluirBase(AComissaoPerfil.Id, 'COMISSAO_PERFIL');
end;

class procedure TComissaoPerfilService.ExcluirObjetosFilhos(AComissaoPerfil: TComissaoPerfil);
begin
  ExcluirFilho(AComissaoPerfil.Id, 'COMISSAO_OBJETIVO', 'ID_COMISSAO_PERFIL');
end;

end.
