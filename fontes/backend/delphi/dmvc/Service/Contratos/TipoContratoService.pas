{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [TIPO_CONTRATO] 
                                                                                
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
unit TipoContratoService;

interface

uses
  TipoContrato, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TTipoContratoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TTipoContrato>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TTipoContrato>;
    class function ConsultarObjeto(AId: Integer): TTipoContrato;
    class procedure Inserir(ATipoContrato: TTipoContrato);
    class function Alterar(ATipoContrato: TTipoContrato): Integer;
    class function Excluir(ATipoContrato: TTipoContrato): Integer;
  end;

var
  sql: string;


implementation

{ TTipoContratoService }



class function TTipoContratoService.ConsultarLista: TObjectList<TTipoContrato>;
begin
  sql := 'SELECT * FROM TIPO_CONTRATO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TTipoContrato>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTipoContratoService.ConsultarListaFiltro(AWhere: string): TObjectList<TTipoContrato>;
begin
  sql := 'SELECT * FROM TIPO_CONTRATO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TTipoContrato>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TTipoContratoService.ConsultarObjeto(AId: Integer): TTipoContrato;
begin
  sql := 'SELECT * FROM TIPO_CONTRATO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TTipoContrato>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TTipoContratoService.Inserir(ATipoContrato: TTipoContrato);
begin
  ATipoContrato.ValidarInsercao;
  ATipoContrato.Id := InserirBase(ATipoContrato, 'TIPO_CONTRATO');
  
end;

class function TTipoContratoService.Alterar(ATipoContrato: TTipoContrato): Integer;
begin
  ATipoContrato.ValidarAlteracao;
  Result := AlterarBase(ATipoContrato, 'TIPO_CONTRATO');
  
  
end;


class function TTipoContratoService.Excluir(ATipoContrato: TTipoContrato): Integer;
begin
  ATipoContrato.ValidarExclusao;
  
  Result := ExcluirBase(ATipoContrato.Id, 'TIPO_CONTRATO');
end;


end.
