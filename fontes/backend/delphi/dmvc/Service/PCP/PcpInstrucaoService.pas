{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PCP_INSTRUCAO] 
                                                                                
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
unit PcpInstrucaoService;

interface

uses
  PcpInstrucao, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPcpInstrucaoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPcpInstrucao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPcpInstrucao>;
    class function ConsultarObjeto(AId: Integer): TPcpInstrucao;
    class procedure Inserir(APcpInstrucao: TPcpInstrucao);
    class function Alterar(APcpInstrucao: TPcpInstrucao): Integer;
    class function Excluir(APcpInstrucao: TPcpInstrucao): Integer;
  end;

var
  sql: string;


implementation

{ TPcpInstrucaoService }



class function TPcpInstrucaoService.ConsultarLista: TObjectList<TPcpInstrucao>;
begin
  sql := 'SELECT * FROM PCP_INSTRUCAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPcpInstrucao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPcpInstrucaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TPcpInstrucao>;
begin
  sql := 'SELECT * FROM PCP_INSTRUCAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPcpInstrucao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPcpInstrucaoService.ConsultarObjeto(AId: Integer): TPcpInstrucao;
begin
  sql := 'SELECT * FROM PCP_INSTRUCAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPcpInstrucao>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPcpInstrucaoService.Inserir(APcpInstrucao: TPcpInstrucao);
begin
  APcpInstrucao.ValidarInsercao;
  APcpInstrucao.Id := InserirBase(APcpInstrucao, 'PCP_INSTRUCAO');
  
end;

class function TPcpInstrucaoService.Alterar(APcpInstrucao: TPcpInstrucao): Integer;
begin
  APcpInstrucao.ValidarAlteracao;
  Result := AlterarBase(APcpInstrucao, 'PCP_INSTRUCAO');
  
  
end;


class function TPcpInstrucaoService.Excluir(APcpInstrucao: TPcpInstrucao): Integer;
begin
  APcpInstrucao.ValidarExclusao;
  
  Result := ExcluirBase(APcpInstrucao.Id, 'PCP_INSTRUCAO');
end;


end.
