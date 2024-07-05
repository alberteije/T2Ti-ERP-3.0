{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [TRIBUT_ISS] 
                                                                                
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
unit TributIssService;

interface

uses
  TributIss, TributOperacaoFiscal, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TTributIssService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaTributIss: TObjectList<TTributIss>); overload;
    class procedure AnexarObjetosVinculados(ATributIss: TTributIss); overload;
  public
    class function ConsultarLista: TObjectList<TTributIss>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TTributIss>;
    class function ConsultarObjeto(AId: Integer): TTributIss;
    class procedure Inserir(ATributIss: TTributIss);
    class function Alterar(ATributIss: TTributIss): Integer;
    class function Excluir(ATributIss: TTributIss): Integer;
  end;

var
  sql: string;


implementation

{ TTributIssService }

class procedure TTributIssService.AnexarObjetosVinculados(ATributIss: TTributIss);
begin
  // TributOperacaoFiscal
  sql := 'SELECT * FROM TRIBUT_OPERACAO_FISCAL WHERE ID = ' + ATributIss.IdTributOperacaoFiscal.ToString;
  ATributIss.TributOperacaoFiscal := GetQuery(sql).AsObject<TTributOperacaoFiscal>;

end;

class procedure TTributIssService.AnexarObjetosVinculados(AListaTributIss: TObjectList<TTributIss>);
var
  TributIss: TTributIss;
begin
  for TributIss in AListaTributIss do
  begin
    AnexarObjetosVinculados(TributIss);
  end;
end;

class function TTributIssService.ConsultarLista: TObjectList<TTributIss>;
begin
  sql := 'SELECT * FROM TRIBUT_ISS ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TTributIss>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTributIssService.ConsultarListaFiltro(AWhere: string): TObjectList<TTributIss>;
begin
  sql := 'SELECT * FROM TRIBUT_ISS where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TTributIss>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTributIssService.ConsultarObjeto(AId: Integer): TTributIss;
begin
  sql := 'SELECT * FROM TRIBUT_ISS WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TTributIss>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TTributIssService.Inserir(ATributIss: TTributIss);
begin
  ATributIss.ValidarInsercao;
  ATributIss.Id := InserirBase(ATributIss, 'TRIBUT_ISS');
  
end;

class function TTributIssService.Alterar(ATributIss: TTributIss): Integer;
begin
  ATributIss.ValidarAlteracao;
  Result := AlterarBase(ATributIss, 'TRIBUT_ISS');
  
  
end;


class function TTributIssService.Excluir(ATributIss: TTributIss): Integer;
begin
  ATributIss.ValidarExclusao;
  
  Result := ExcluirBase(ATributIss.Id, 'TRIBUT_ISS');
end;


end.
