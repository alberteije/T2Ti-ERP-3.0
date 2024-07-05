{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CONTRATO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
unit ContratoService;

interface

uses
  Contrato, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TContratoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TContrato>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TContrato>;
    class function ConsultarObjeto(AId: Integer): TContrato;
    class procedure Inserir(AContrato: TContrato);
    class function Alterar(AContrato: TContrato): Integer;
    class function Excluir(AContrato: TContrato): Integer;
  end;

var
  sql: string;


implementation

{ TContratoService }



class function TContratoService.ConsultarLista: TObjectList<TContrato>;
begin
  sql := 'SELECT * FROM CONTRATO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TContrato>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContratoService.ConsultarListaFiltro(AWhere: string): TObjectList<TContrato>;
begin
  sql := 'SELECT * FROM CONTRATO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TContrato>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContratoService.ConsultarObjeto(AId: Integer): TContrato;
begin
  sql := 'SELECT * FROM CONTRATO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TContrato>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TContratoService.Inserir(AContrato: TContrato);
begin
  AContrato.ValidarInsercao;
  AContrato.Id := InserirBase(AContrato, 'CONTRATO');
  
end;

class function TContratoService.Alterar(AContrato: TContrato): Integer;
begin
  AContrato.ValidarAlteracao;
  Result := AlterarBase(AContrato, 'CONTRATO');
  
  
end;


class function TContratoService.Excluir(AContrato: TContrato): Integer;
begin
  AContrato.ValidarExclusao;
  
  Result := ExcluirBase(AContrato.Id, 'CONTRATO');
end;


end.
