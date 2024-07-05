{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PCP_OP_CABECALHO] 
                                                                                
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
unit PcpOpCabecalhoService;

interface

uses
  PcpOpCabecalho, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPcpOpCabecalhoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPcpOpCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPcpOpCabecalho>;
    class function ConsultarObjeto(AId: Integer): TPcpOpCabecalho;
    class procedure Inserir(APcpOpCabecalho: TPcpOpCabecalho);
    class function Alterar(APcpOpCabecalho: TPcpOpCabecalho): Integer;
    class function Excluir(APcpOpCabecalho: TPcpOpCabecalho): Integer;
  end;

var
  sql: string;


implementation

{ TPcpOpCabecalhoService }



class function TPcpOpCabecalhoService.ConsultarLista: TObjectList<TPcpOpCabecalho>;
begin
  sql := 'SELECT * FROM PCP_OP_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPcpOpCabecalho>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPcpOpCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TPcpOpCabecalho>;
begin
  sql := 'SELECT * FROM PCP_OP_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPcpOpCabecalho>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPcpOpCabecalhoService.ConsultarObjeto(AId: Integer): TPcpOpCabecalho;
begin
  sql := 'SELECT * FROM PCP_OP_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPcpOpCabecalho>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPcpOpCabecalhoService.Inserir(APcpOpCabecalho: TPcpOpCabecalho);
begin
  APcpOpCabecalho.ValidarInsercao;
  APcpOpCabecalho.Id := InserirBase(APcpOpCabecalho, 'PCP_OP_CABECALHO');
  
end;

class function TPcpOpCabecalhoService.Alterar(APcpOpCabecalho: TPcpOpCabecalho): Integer;
begin
  APcpOpCabecalho.ValidarAlteracao;
  Result := AlterarBase(APcpOpCabecalho, 'PCP_OP_CABECALHO');
  
  
end;


class function TPcpOpCabecalhoService.Excluir(APcpOpCabecalho: TPcpOpCabecalho): Integer;
begin
  APcpOpCabecalho.ValidarExclusao;
  
  Result := ExcluirBase(APcpOpCabecalho.Id, 'PCP_OP_CABECALHO');
end;


end.
