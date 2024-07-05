{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [TRIBUT_OPERACAO_FISCAL] 
                                                                                
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
unit TributOperacaoFiscalService;

interface

uses
  TributOperacaoFiscal, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TTributOperacaoFiscalService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaTributOperacaoFiscal: TObjectList<TTributOperacaoFiscal>); overload;
    class procedure AnexarObjetosVinculados(ATributOperacaoFiscal: TTributOperacaoFiscal); overload;
  public
    class function ConsultarLista: TObjectList<TTributOperacaoFiscal>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TTributOperacaoFiscal>;
    class function ConsultarObjeto(AId: Integer): TTributOperacaoFiscal;
    class procedure Inserir(ATributOperacaoFiscal: TTributOperacaoFiscal);
    class function Alterar(ATributOperacaoFiscal: TTributOperacaoFiscal): Integer;
    class function Excluir(ATributOperacaoFiscal: TTributOperacaoFiscal): Integer;
  end;

var
  sql: string;


implementation

{ TTributOperacaoFiscalService }

class procedure TTributOperacaoFiscalService.AnexarObjetosVinculados(ATributOperacaoFiscal: TTributOperacaoFiscal);
begin
end;

class procedure TTributOperacaoFiscalService.AnexarObjetosVinculados(AListaTributOperacaoFiscal: TObjectList<TTributOperacaoFiscal>);
var
  TributOperacaoFiscal: TTributOperacaoFiscal;
begin
  for TributOperacaoFiscal in AListaTributOperacaoFiscal do
  begin
    AnexarObjetosVinculados(TributOperacaoFiscal);
  end;
end;

class function TTributOperacaoFiscalService.ConsultarLista: TObjectList<TTributOperacaoFiscal>;
begin
  sql := 'SELECT * FROM TRIBUT_OPERACAO_FISCAL ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TTributOperacaoFiscal>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTributOperacaoFiscalService.ConsultarListaFiltro(AWhere: string): TObjectList<TTributOperacaoFiscal>;
begin
  sql := 'SELECT * FROM TRIBUT_OPERACAO_FISCAL where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TTributOperacaoFiscal>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTributOperacaoFiscalService.ConsultarObjeto(AId: Integer): TTributOperacaoFiscal;
begin
  sql := 'SELECT * FROM TRIBUT_OPERACAO_FISCAL WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TTributOperacaoFiscal>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TTributOperacaoFiscalService.Inserir(ATributOperacaoFiscal: TTributOperacaoFiscal);
begin
  ATributOperacaoFiscal.ValidarInsercao;
  ATributOperacaoFiscal.Id := InserirBase(ATributOperacaoFiscal, 'TRIBUT_OPERACAO_FISCAL');
  
end;

class function TTributOperacaoFiscalService.Alterar(ATributOperacaoFiscal: TTributOperacaoFiscal): Integer;
begin
  ATributOperacaoFiscal.ValidarAlteracao;
  Result := AlterarBase(ATributOperacaoFiscal, 'TRIBUT_OPERACAO_FISCAL');
  
  
end;


class function TTributOperacaoFiscalService.Excluir(ATributOperacaoFiscal: TTributOperacaoFiscal): Integer;
begin
  ATributOperacaoFiscal.ValidarExclusao;
  
  Result := ExcluirBase(ATributOperacaoFiscal.Id, 'TRIBUT_OPERACAO_FISCAL');
end;


end.
