{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PLANO_CONTA] 
                                                                                
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
unit PlanoContaService;

interface

uses
  PlanoConta, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPlanoContaService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPlanoConta>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPlanoConta>;
    class function ConsultarObjeto(AId: Integer): TPlanoConta;
    class procedure Inserir(APlanoConta: TPlanoConta);
    class function Alterar(APlanoConta: TPlanoConta): Integer;
    class function Excluir(APlanoConta: TPlanoConta): Integer;
  end;

var
  sql: string;


implementation

{ TPlanoContaService }



class function TPlanoContaService.ConsultarLista: TObjectList<TPlanoConta>;
begin
  sql := 'SELECT * FROM PLANO_CONTA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPlanoConta>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPlanoContaService.ConsultarListaFiltro(AWhere: string): TObjectList<TPlanoConta>;
begin
  sql := 'SELECT * FROM PLANO_CONTA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPlanoConta>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPlanoContaService.ConsultarObjeto(AId: Integer): TPlanoConta;
begin
  sql := 'SELECT * FROM PLANO_CONTA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPlanoConta>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPlanoContaService.Inserir(APlanoConta: TPlanoConta);
begin
  APlanoConta.ValidarInsercao;
  APlanoConta.Id := InserirBase(APlanoConta, 'PLANO_CONTA');
  
end;

class function TPlanoContaService.Alterar(APlanoConta: TPlanoConta): Integer;
begin
  APlanoConta.ValidarAlteracao;
  Result := AlterarBase(APlanoConta, 'PLANO_CONTA');
  
  
end;


class function TPlanoContaService.Excluir(APlanoConta: TPlanoConta): Integer;
begin
  APlanoConta.ValidarExclusao;
  
  Result := ExcluirBase(APlanoConta.Id, 'PLANO_CONTA');
end;


end.
