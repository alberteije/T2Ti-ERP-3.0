{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [ORCAMENTO_EMPRESARIAL] 
                                                                                
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
unit OrcamentoEmpresarialService;

interface

uses
  OrcamentoEmpresarial, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TOrcamentoEmpresarialService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TOrcamentoEmpresarial>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TOrcamentoEmpresarial>;
    class function ConsultarObjeto(AId: Integer): TOrcamentoEmpresarial;
    class procedure Inserir(AOrcamentoEmpresarial: TOrcamentoEmpresarial);
    class function Alterar(AOrcamentoEmpresarial: TOrcamentoEmpresarial): Integer;
    class function Excluir(AOrcamentoEmpresarial: TOrcamentoEmpresarial): Integer;
  end;

var
  sql: string;


implementation

{ TOrcamentoEmpresarialService }



class function TOrcamentoEmpresarialService.ConsultarLista: TObjectList<TOrcamentoEmpresarial>;
begin
  sql := 'SELECT * FROM ORCAMENTO_EMPRESARIAL ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TOrcamentoEmpresarial>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TOrcamentoEmpresarialService.ConsultarListaFiltro(AWhere: string): TObjectList<TOrcamentoEmpresarial>;
begin
  sql := 'SELECT * FROM ORCAMENTO_EMPRESARIAL where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TOrcamentoEmpresarial>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TOrcamentoEmpresarialService.ConsultarObjeto(AId: Integer): TOrcamentoEmpresarial;
begin
  sql := 'SELECT * FROM ORCAMENTO_EMPRESARIAL WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TOrcamentoEmpresarial>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TOrcamentoEmpresarialService.Inserir(AOrcamentoEmpresarial: TOrcamentoEmpresarial);
begin
  AOrcamentoEmpresarial.ValidarInsercao;
  AOrcamentoEmpresarial.Id := InserirBase(AOrcamentoEmpresarial, 'ORCAMENTO_EMPRESARIAL');
  
end;

class function TOrcamentoEmpresarialService.Alterar(AOrcamentoEmpresarial: TOrcamentoEmpresarial): Integer;
begin
  AOrcamentoEmpresarial.ValidarAlteracao;
  Result := AlterarBase(AOrcamentoEmpresarial, 'ORCAMENTO_EMPRESARIAL');
  
  
end;


class function TOrcamentoEmpresarialService.Excluir(AOrcamentoEmpresarial: TOrcamentoEmpresarial): Integer;
begin
  AOrcamentoEmpresarial.ValidarExclusao;
  
  Result := ExcluirBase(AOrcamentoEmpresarial.Id, 'ORCAMENTO_EMPRESARIAL');
end;


end.
