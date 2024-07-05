{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PCP_INSTRUCAO_OP] 
                                                                                
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
unit PcpInstrucaoOpService;

interface

uses
  PcpInstrucaoOp, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPcpInstrucaoOpService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPcpInstrucaoOp>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPcpInstrucaoOp>;
    class function ConsultarObjeto(AId: Integer): TPcpInstrucaoOp;
    class procedure Inserir(APcpInstrucaoOp: TPcpInstrucaoOp);
    class function Alterar(APcpInstrucaoOp: TPcpInstrucaoOp): Integer;
    class function Excluir(APcpInstrucaoOp: TPcpInstrucaoOp): Integer;
  end;

var
  sql: string;


implementation

{ TPcpInstrucaoOpService }



class function TPcpInstrucaoOpService.ConsultarLista: TObjectList<TPcpInstrucaoOp>;
begin
  sql := 'SELECT * FROM PCP_INSTRUCAO_OP ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPcpInstrucaoOp>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPcpInstrucaoOpService.ConsultarListaFiltro(AWhere: string): TObjectList<TPcpInstrucaoOp>;
begin
  sql := 'SELECT * FROM PCP_INSTRUCAO_OP where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPcpInstrucaoOp>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPcpInstrucaoOpService.ConsultarObjeto(AId: Integer): TPcpInstrucaoOp;
begin
  sql := 'SELECT * FROM PCP_INSTRUCAO_OP WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPcpInstrucaoOp>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPcpInstrucaoOpService.Inserir(APcpInstrucaoOp: TPcpInstrucaoOp);
begin
  APcpInstrucaoOp.ValidarInsercao;
  APcpInstrucaoOp.Id := InserirBase(APcpInstrucaoOp, 'PCP_INSTRUCAO_OP');
  
end;

class function TPcpInstrucaoOpService.Alterar(APcpInstrucaoOp: TPcpInstrucaoOp): Integer;
begin
  APcpInstrucaoOp.ValidarAlteracao;
  Result := AlterarBase(APcpInstrucaoOp, 'PCP_INSTRUCAO_OP');
  
  
end;


class function TPcpInstrucaoOpService.Excluir(APcpInstrucaoOp: TPcpInstrucaoOp): Integer;
begin
  APcpInstrucaoOp.ValidarExclusao;
  
  Result := ExcluirBase(APcpInstrucaoOp.Id, 'PCP_INSTRUCAO_OP');
end;


end.
