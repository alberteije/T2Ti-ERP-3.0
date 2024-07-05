{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [WMS_RECEBIMENTO_CABECALHO] 
                                                                                
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
unit WmsRecebimentoCabecalhoService;

interface

uses
  WmsRecebimentoCabecalho, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TWmsRecebimentoCabecalhoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TWmsRecebimentoCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TWmsRecebimentoCabecalho>;
    class function ConsultarObjeto(AId: Integer): TWmsRecebimentoCabecalho;
    class procedure Inserir(AWmsRecebimentoCabecalho: TWmsRecebimentoCabecalho);
    class function Alterar(AWmsRecebimentoCabecalho: TWmsRecebimentoCabecalho): Integer;
    class function Excluir(AWmsRecebimentoCabecalho: TWmsRecebimentoCabecalho): Integer;
  end;

var
  sql: string;


implementation

{ TWmsRecebimentoCabecalhoService }



class function TWmsRecebimentoCabecalhoService.ConsultarLista: TObjectList<TWmsRecebimentoCabecalho>;
begin
  sql := 'SELECT * FROM WMS_RECEBIMENTO_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TWmsRecebimentoCabecalho>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsRecebimentoCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TWmsRecebimentoCabecalho>;
begin
  sql := 'SELECT * FROM WMS_RECEBIMENTO_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TWmsRecebimentoCabecalho>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TWmsRecebimentoCabecalhoService.ConsultarObjeto(AId: Integer): TWmsRecebimentoCabecalho;
begin
  sql := 'SELECT * FROM WMS_RECEBIMENTO_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TWmsRecebimentoCabecalho>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TWmsRecebimentoCabecalhoService.Inserir(AWmsRecebimentoCabecalho: TWmsRecebimentoCabecalho);
begin
  AWmsRecebimentoCabecalho.ValidarInsercao;
  AWmsRecebimentoCabecalho.Id := InserirBase(AWmsRecebimentoCabecalho, 'WMS_RECEBIMENTO_CABECALHO');
  
end;

class function TWmsRecebimentoCabecalhoService.Alterar(AWmsRecebimentoCabecalho: TWmsRecebimentoCabecalho): Integer;
begin
  AWmsRecebimentoCabecalho.ValidarAlteracao;
  Result := AlterarBase(AWmsRecebimentoCabecalho, 'WMS_RECEBIMENTO_CABECALHO');
  
  
end;


class function TWmsRecebimentoCabecalhoService.Excluir(AWmsRecebimentoCabecalho: TWmsRecebimentoCabecalho): Integer;
begin
  AWmsRecebimentoCabecalho.ValidarExclusao;
  
  Result := ExcluirBase(AWmsRecebimentoCabecalho.Id, 'WMS_RECEBIMENTO_CABECALHO');
end;


end.
