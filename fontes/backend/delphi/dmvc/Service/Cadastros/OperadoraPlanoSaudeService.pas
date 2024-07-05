{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [OPERADORA_PLANO_SAUDE] 
                                                                                
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
unit OperadoraPlanoSaudeService;

interface

uses
  OperadoraPlanoSaude, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TOperadoraPlanoSaudeService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TOperadoraPlanoSaude>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TOperadoraPlanoSaude>;
    class function ConsultarObjeto(AId: Integer): TOperadoraPlanoSaude;
    class procedure Inserir(AOperadoraPlanoSaude: TOperadoraPlanoSaude);
    class function Alterar(AOperadoraPlanoSaude: TOperadoraPlanoSaude): Integer;
    class function Excluir(AOperadoraPlanoSaude: TOperadoraPlanoSaude): Integer;
  end;

var
  sql: string;


implementation

{ TOperadoraPlanoSaudeService }



class function TOperadoraPlanoSaudeService.ConsultarLista: TObjectList<TOperadoraPlanoSaude>;
begin
  sql := 'SELECT * FROM OPERADORA_PLANO_SAUDE ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TOperadoraPlanoSaude>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TOperadoraPlanoSaudeService.ConsultarListaFiltro(AWhere: string): TObjectList<TOperadoraPlanoSaude>;
begin
  sql := 'SELECT * FROM OPERADORA_PLANO_SAUDE where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TOperadoraPlanoSaude>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TOperadoraPlanoSaudeService.ConsultarObjeto(AId: Integer): TOperadoraPlanoSaude;
begin
  sql := 'SELECT * FROM OPERADORA_PLANO_SAUDE WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TOperadoraPlanoSaude>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TOperadoraPlanoSaudeService.Inserir(AOperadoraPlanoSaude: TOperadoraPlanoSaude);
begin
  AOperadoraPlanoSaude.ValidarInsercao;
  AOperadoraPlanoSaude.Id := InserirBase(AOperadoraPlanoSaude, 'OPERADORA_PLANO_SAUDE');
  
end;

class function TOperadoraPlanoSaudeService.Alterar(AOperadoraPlanoSaude: TOperadoraPlanoSaude): Integer;
begin
  AOperadoraPlanoSaude.ValidarAlteracao;
  Result := AlterarBase(AOperadoraPlanoSaude, 'OPERADORA_PLANO_SAUDE');
  
  
end;


class function TOperadoraPlanoSaudeService.Excluir(AOperadoraPlanoSaude: TOperadoraPlanoSaude): Integer;
begin
  AOperadoraPlanoSaude.ValidarExclusao;
  
  Result := ExcluirBase(AOperadoraPlanoSaude.Id, 'OPERADORA_PLANO_SAUDE');
end;


end.
