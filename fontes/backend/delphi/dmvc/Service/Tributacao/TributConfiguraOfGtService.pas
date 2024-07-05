{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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
unit TributConfiguraOfGtService;

interface

uses
  TributConfiguraOfGt, TributCofins, TributIcmsUf, TributIpi, TributPis, TributGrupoTributario, TributOperacaoFiscal, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TTributConfiguraOfGtService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaTributConfiguraOfGt: TObjectList<TTributConfiguraOfGt>); overload;
    class procedure AnexarObjetosVinculados(ATributConfiguraOfGt: TTributConfiguraOfGt); overload;
    class procedure InserirObjetosFilhos(ATributConfiguraOfGt: TTributConfiguraOfGt);
    class procedure ExcluirObjetosFilhos(ATributConfiguraOfGt: TTributConfiguraOfGt);
  public
    class function ConsultarLista: TObjectList<TTributConfiguraOfGt>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TTributConfiguraOfGt>;
    class function ConsultarObjeto(AId: Integer): TTributConfiguraOfGt;
    class function ConsultarTributacao(AIdTributGrupoTributario: string; AIdTributOperacaoFiscal: string): TTributConfiguraOfGt;
    class procedure Inserir(ATributConfiguraOfGt: TTributConfiguraOfGt);
    class function Alterar(ATributConfiguraOfGt: TTributConfiguraOfGt): Integer;
    class function Excluir(ATributConfiguraOfGt: TTributConfiguraOfGt): Integer;
  end;

var
  sql: string;


implementation

{ TTributConfiguraOfGtService }

class procedure TTributConfiguraOfGtService.AnexarObjetosVinculados(ATributConfiguraOfGt: TTributConfiguraOfGt);
begin
  // TributCofins
  sql := 'SELECT * FROM TRIBUT_COFINS WHERE ID_TRIBUT_CONFIGURA_OF_GT = ' + ATributConfiguraOfGt.Id.ToString;
  ATributConfiguraOfGt.TributCofins := GetQuery(sql).AsObject<TTributCofins>;

  // TributIcmsUf
  sql := 'SELECT * FROM TRIBUT_ICMS_UF WHERE ID_TRIBUT_CONFIGURA_OF_GT = ' + ATributConfiguraOfGt.Id.ToString;
  ATributConfiguraOfGt.ListaTributIcmsUf := GetQuery(sql).AsObjectList<TTributIcmsUf>;

  // TributIpi
  sql := 'SELECT * FROM TRIBUT_IPI WHERE ID_TRIBUT_CONFIGURA_OF_GT = ' + ATributConfiguraOfGt.Id.ToString;
  ATributConfiguraOfGt.TributIpi := GetQuery(sql).AsObject<TTributIpi>;

  // TributPis
  sql := 'SELECT * FROM TRIBUT_PIS WHERE ID_TRIBUT_CONFIGURA_OF_GT = ' + ATributConfiguraOfGt.Id.ToString;
  ATributConfiguraOfGt.TributPis := GetQuery(sql).AsObject<TTributPis>;

  // TributGrupoTributario
  sql := 'SELECT * FROM TRIBUT_GRUPO_TRIBUTARIO WHERE ID = ' + ATributConfiguraOfGt.IdTributGrupoTributario.ToString;
  ATributConfiguraOfGt.TributGrupoTributario := GetQuery(sql).AsObject<TTributGrupoTributario>;

  // TributOperacaoFiscal
  sql := 'SELECT * FROM TRIBUT_OPERACAO_FISCAL WHERE ID = ' + ATributConfiguraOfGt.IdTributOperacaoFiscal.ToString;
  ATributConfiguraOfGt.TributOperacaoFiscal := GetQuery(sql).AsObject<TTributOperacaoFiscal>;

end;

class procedure TTributConfiguraOfGtService.AnexarObjetosVinculados(AListaTributConfiguraOfGt: TObjectList<TTributConfiguraOfGt>);
var
  TributConfiguraOfGt: TTributConfiguraOfGt;
begin
  for TributConfiguraOfGt in AListaTributConfiguraOfGt do
  begin
    AnexarObjetosVinculados(TributConfiguraOfGt);
  end;
end;

class function TTributConfiguraOfGtService.ConsultarLista: TObjectList<TTributConfiguraOfGt>;
begin
  sql := 'SELECT * FROM TRIBUT_CONFIGURA_OF_GT ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TTributConfiguraOfGt>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTributConfiguraOfGtService.ConsultarListaFiltro(AWhere: string): TObjectList<TTributConfiguraOfGt>;
begin
  sql := 'SELECT * FROM TRIBUT_CONFIGURA_OF_GT where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TTributConfiguraOfGt>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTributConfiguraOfGtService.ConsultarObjeto(AId: Integer): TTributConfiguraOfGt;
begin
  sql := 'SELECT * FROM TRIBUT_CONFIGURA_OF_GT WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TTributConfiguraOfGt>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTributConfiguraOfGtService.ConsultarTributacao(AIdTributGrupoTributario, AIdTributOperacaoFiscal: string): TTributConfiguraOfGt;
begin
  sql := 'SELECT * FROM TRIBUT_CONFIGURA_OF_GT WHERE ID_TRIBUT_GRUPO_TRIBUTARIO = ' + AIdTributGrupoTributario + ' AND ID_TRIBUT_OPERACAO_FISCAL = ' + AIdTributOperacaoFiscal;
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TTributConfiguraOfGt>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TTributConfiguraOfGtService.Inserir(ATributConfiguraOfGt: TTributConfiguraOfGt);
begin
  ATributConfiguraOfGt.ValidarInsercao;
  ATributConfiguraOfGt.Id := InserirBase(ATributConfiguraOfGt, 'TRIBUT_CONFIGURA_OF_GT');
  InserirObjetosFilhos(ATributConfiguraOfGt);
end;

class function TTributConfiguraOfGtService.Alterar(ATributConfiguraOfGt: TTributConfiguraOfGt): Integer;
begin
  ATributConfiguraOfGt.ValidarAlteracao;
  Result := AlterarBase(ATributConfiguraOfGt, 'TRIBUT_CONFIGURA_OF_GT');
  ExcluirObjetosFilhos(ATributConfiguraOfGt);
  InserirObjetosFilhos(ATributConfiguraOfGt);
end;

class procedure TTributConfiguraOfGtService.InserirObjetosFilhos(ATributConfiguraOfGt: TTributConfiguraOfGt);
var
  TributIcmsUf: TTributIcmsUf;
begin
  // TributCofins
  ATributConfiguraOfGt.TributCofins.IdTributConfiguraOfGt := ATributConfiguraOfGt.Id;
  InserirBase(ATributConfiguraOfGt.TributCofins, 'TRIBUT_COFINS');

  // TributIcmsUf
  for TributIcmsUf in ATributConfiguraOfGt.ListaTributIcmsUf do
  begin
    TributIcmsUf.IdTributConfiguraOfGt := ATributConfiguraOfGt.Id;
    InserirBase(TributIcmsUf, 'TRIBUT_ICMS_UF');
  end;

  // TributIpi
  ATributConfiguraOfGt.TributIpi.IdTributConfiguraOfGt := ATributConfiguraOfGt.Id;
  InserirBase(ATributConfiguraOfGt.TributIpi, 'TRIBUT_IPI');

  // TributPis
  ATributConfiguraOfGt.TributPis.IdTributConfiguraOfGt := ATributConfiguraOfGt.Id;
  InserirBase(ATributConfiguraOfGt.TributPis, 'TRIBUT_PIS');

end;

class function TTributConfiguraOfGtService.Excluir(ATributConfiguraOfGt: TTributConfiguraOfGt): Integer;
begin
  ATributConfiguraOfGt.ValidarExclusao;
  ExcluirObjetosFilhos(ATributConfiguraOfGt);
  Result := ExcluirBase(ATributConfiguraOfGt.Id, 'TRIBUT_CONFIGURA_OF_GT');
end;

class procedure TTributConfiguraOfGtService.ExcluirObjetosFilhos(ATributConfiguraOfGt: TTributConfiguraOfGt);
begin
  ExcluirFilho(ATributConfiguraOfGt.Id, 'TRIBUT_COFINS', 'ID_TRIBUT_CONFIGURA_OF_GT');
  ExcluirFilho(ATributConfiguraOfGt.Id, 'TRIBUT_ICMS_UF', 'ID_TRIBUT_CONFIGURA_OF_GT');
  ExcluirFilho(ATributConfiguraOfGt.Id, 'TRIBUT_IPI', 'ID_TRIBUT_CONFIGURA_OF_GT');
  ExcluirFilho(ATributConfiguraOfGt.Id, 'TRIBUT_PIS', 'ID_TRIBUT_CONFIGURA_OF_GT');
end;

end.
