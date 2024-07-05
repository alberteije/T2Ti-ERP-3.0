{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [NOTA_FISCAL_TIPO] 
                                                                                
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
unit NotaFiscalTipoService;

interface

uses
  NotaFiscalTipo, NotaFiscalModelo, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TNotaFiscalTipoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaNotaFiscalTipo: TObjectList<TNotaFiscalTipo>); overload;
    class procedure AnexarObjetosVinculados(ANotaFiscalTipo: TNotaFiscalTipo); overload;
  public
    class function ConsultarLista: TObjectList<TNotaFiscalTipo>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TNotaFiscalTipo>;
    class function ConsultarObjeto(AId: Integer): TNotaFiscalTipo;
    class procedure Inserir(ANotaFiscalTipo: TNotaFiscalTipo);
    class function Alterar(ANotaFiscalTipo: TNotaFiscalTipo): Integer;
    class function Excluir(ANotaFiscalTipo: TNotaFiscalTipo): Integer;
  end;

var
  sql: string;


implementation

{ TNotaFiscalTipoService }

class procedure TNotaFiscalTipoService.AnexarObjetosVinculados(ANotaFiscalTipo: TNotaFiscalTipo);
begin
  // NotaFiscalModelo
  sql := 'SELECT * FROM NOTA_FISCAL_MODELO WHERE ID = ' + ANotaFiscalTipo.IdNotaFiscalModelo.ToString;
  ANotaFiscalTipo.NotaFiscalModelo := GetQuery(sql).AsObject<TNotaFiscalModelo>;

end;

class procedure TNotaFiscalTipoService.AnexarObjetosVinculados(AListaNotaFiscalTipo: TObjectList<TNotaFiscalTipo>);
var
  NotaFiscalTipo: TNotaFiscalTipo;
begin
  for NotaFiscalTipo in AListaNotaFiscalTipo do
  begin
    AnexarObjetosVinculados(NotaFiscalTipo);
  end;
end;

class function TNotaFiscalTipoService.ConsultarLista: TObjectList<TNotaFiscalTipo>;
begin
  sql := 'SELECT * FROM NOTA_FISCAL_TIPO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TNotaFiscalTipo>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TNotaFiscalTipoService.ConsultarListaFiltro(AWhere: string): TObjectList<TNotaFiscalTipo>;
begin
  sql := 'SELECT * FROM NOTA_FISCAL_TIPO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TNotaFiscalTipo>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TNotaFiscalTipoService.ConsultarObjeto(AId: Integer): TNotaFiscalTipo;
begin
  sql := 'SELECT * FROM NOTA_FISCAL_TIPO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TNotaFiscalTipo>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TNotaFiscalTipoService.Inserir(ANotaFiscalTipo: TNotaFiscalTipo);
begin
  ANotaFiscalTipo.ValidarInsercao;
  ANotaFiscalTipo.Id := InserirBase(ANotaFiscalTipo, 'NOTA_FISCAL_TIPO');
  
end;

class function TNotaFiscalTipoService.Alterar(ANotaFiscalTipo: TNotaFiscalTipo): Integer;
begin
  ANotaFiscalTipo.ValidarAlteracao;
  Result := AlterarBase(ANotaFiscalTipo, 'NOTA_FISCAL_TIPO');
  
  
end;


class function TNotaFiscalTipoService.Excluir(ANotaFiscalTipo: TNotaFiscalTipo): Integer;
begin
  ANotaFiscalTipo.ValidarExclusao;
  
  Result := ExcluirBase(ANotaFiscalTipo.Id, 'NOTA_FISCAL_TIPO');
end;


end.
