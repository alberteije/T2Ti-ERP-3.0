{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [TRIBUT_ICMS_CUSTOM_CAB] 
                                                                                
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
unit TributIcmsCustomCabService;

interface

uses
  TributIcmsCustomCab, TributIcmsCustomDet, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TTributIcmsCustomCabService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaTributIcmsCustomCab: TObjectList<TTributIcmsCustomCab>); overload;
    class procedure AnexarObjetosVinculados(ATributIcmsCustomCab: TTributIcmsCustomCab); overload;
    class procedure InserirObjetosFilhos(ATributIcmsCustomCab: TTributIcmsCustomCab);
    class procedure ExcluirObjetosFilhos(ATributIcmsCustomCab: TTributIcmsCustomCab);
  public
    class function ConsultarLista: TObjectList<TTributIcmsCustomCab>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TTributIcmsCustomCab>;
    class function ConsultarObjeto(AId: Integer): TTributIcmsCustomCab;
    class procedure Inserir(ATributIcmsCustomCab: TTributIcmsCustomCab);
    class function Alterar(ATributIcmsCustomCab: TTributIcmsCustomCab): Integer;
    class function Excluir(ATributIcmsCustomCab: TTributIcmsCustomCab): Integer;
  end;

var
  sql: string;


implementation

{ TTributIcmsCustomCabService }

class procedure TTributIcmsCustomCabService.AnexarObjetosVinculados(ATributIcmsCustomCab: TTributIcmsCustomCab);
begin
  // TributIcmsCustomDet
  sql := 'SELECT * FROM TRIBUT_ICMS_CUSTOM_DET WHERE ID_TRIBUT_ICMS_CUSTOM_CAB = ' + ATributIcmsCustomCab.Id.ToString;
  ATributIcmsCustomCab.ListaTributIcmsCustomDet := GetQuery(sql).AsObjectList<TTributIcmsCustomDet>;

end;

class procedure TTributIcmsCustomCabService.AnexarObjetosVinculados(AListaTributIcmsCustomCab: TObjectList<TTributIcmsCustomCab>);
var
  TributIcmsCustomCab: TTributIcmsCustomCab;
begin
  for TributIcmsCustomCab in AListaTributIcmsCustomCab do
  begin
    AnexarObjetosVinculados(TributIcmsCustomCab);
  end;
end;

class function TTributIcmsCustomCabService.ConsultarLista: TObjectList<TTributIcmsCustomCab>;
begin
  sql := 'SELECT * FROM TRIBUT_ICMS_CUSTOM_CAB ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TTributIcmsCustomCab>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTributIcmsCustomCabService.ConsultarListaFiltro(AWhere: string): TObjectList<TTributIcmsCustomCab>;
begin
  sql := 'SELECT * FROM TRIBUT_ICMS_CUSTOM_CAB where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TTributIcmsCustomCab>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTributIcmsCustomCabService.ConsultarObjeto(AId: Integer): TTributIcmsCustomCab;
begin
  sql := 'SELECT * FROM TRIBUT_ICMS_CUSTOM_CAB WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TTributIcmsCustomCab>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TTributIcmsCustomCabService.Inserir(ATributIcmsCustomCab: TTributIcmsCustomCab);
begin
  ATributIcmsCustomCab.ValidarInsercao;
  ATributIcmsCustomCab.Id := InserirBase(ATributIcmsCustomCab, 'TRIBUT_ICMS_CUSTOM_CAB');
  InserirObjetosFilhos(ATributIcmsCustomCab);
end;

class function TTributIcmsCustomCabService.Alterar(ATributIcmsCustomCab: TTributIcmsCustomCab): Integer;
begin
  ATributIcmsCustomCab.ValidarAlteracao;
  Result := AlterarBase(ATributIcmsCustomCab, 'TRIBUT_ICMS_CUSTOM_CAB');
  ExcluirObjetosFilhos(ATributIcmsCustomCab);
  InserirObjetosFilhos(ATributIcmsCustomCab);
end;

class procedure TTributIcmsCustomCabService.InserirObjetosFilhos(ATributIcmsCustomCab: TTributIcmsCustomCab);
var
  TributIcmsCustomDet: TTributIcmsCustomDet;
begin
  // TributIcmsCustomDet
  for TributIcmsCustomDet in ATributIcmsCustomCab.ListaTributIcmsCustomDet do
  begin
    TributIcmsCustomDet.IdTributIcmsCustomCab := ATributIcmsCustomCab.Id;
    InserirBase(TributIcmsCustomDet, 'TRIBUT_ICMS_CUSTOM_DET');
  end;

end;

class function TTributIcmsCustomCabService.Excluir(ATributIcmsCustomCab: TTributIcmsCustomCab): Integer;
begin
  ATributIcmsCustomCab.ValidarExclusao;
  ExcluirObjetosFilhos(ATributIcmsCustomCab);
  Result := ExcluirBase(ATributIcmsCustomCab.Id, 'TRIBUT_ICMS_CUSTOM_CAB');
end;

class procedure TTributIcmsCustomCabService.ExcluirObjetosFilhos(ATributIcmsCustomCab: TTributIcmsCustomCab);
begin
  ExcluirFilho(ATributIcmsCustomCab.Id, 'TRIBUT_ICMS_CUSTOM_DET', 'ID_TRIBUT_ICMS_CUSTOM_CAB');
end;

end.
