{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [SIMPLES_NACIONAL_CABECALHO] 
                                                                                
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
unit SimplesNacionalCabecalhoService;

interface

uses
  SimplesNacionalCabecalho, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TSimplesNacionalCabecalhoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TSimplesNacionalCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TSimplesNacionalCabecalho>;
    class function ConsultarObjeto(AId: Integer): TSimplesNacionalCabecalho;
    class procedure Inserir(ASimplesNacionalCabecalho: TSimplesNacionalCabecalho);
    class function Alterar(ASimplesNacionalCabecalho: TSimplesNacionalCabecalho): Integer;
    class function Excluir(ASimplesNacionalCabecalho: TSimplesNacionalCabecalho): Integer;
  end;

var
  sql: string;


implementation

{ TSimplesNacionalCabecalhoService }



class function TSimplesNacionalCabecalhoService.ConsultarLista: TObjectList<TSimplesNacionalCabecalho>;
begin
  sql := 'SELECT * FROM SIMPLES_NACIONAL_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TSimplesNacionalCabecalho>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TSimplesNacionalCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TSimplesNacionalCabecalho>;
begin
  sql := 'SELECT * FROM SIMPLES_NACIONAL_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TSimplesNacionalCabecalho>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TSimplesNacionalCabecalhoService.ConsultarObjeto(AId: Integer): TSimplesNacionalCabecalho;
begin
  sql := 'SELECT * FROM SIMPLES_NACIONAL_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TSimplesNacionalCabecalho>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TSimplesNacionalCabecalhoService.Inserir(ASimplesNacionalCabecalho: TSimplesNacionalCabecalho);
begin
  ASimplesNacionalCabecalho.ValidarInsercao;
  ASimplesNacionalCabecalho.Id := InserirBase(ASimplesNacionalCabecalho, 'SIMPLES_NACIONAL_CABECALHO');
  
end;

class function TSimplesNacionalCabecalhoService.Alterar(ASimplesNacionalCabecalho: TSimplesNacionalCabecalho): Integer;
begin
  ASimplesNacionalCabecalho.ValidarAlteracao;
  Result := AlterarBase(ASimplesNacionalCabecalho, 'SIMPLES_NACIONAL_CABECALHO');
  
  
end;


class function TSimplesNacionalCabecalhoService.Excluir(ASimplesNacionalCabecalho: TSimplesNacionalCabecalho): Integer;
begin
  ASimplesNacionalCabecalho.ValidarExclusao;
  
  Result := ExcluirBase(ASimplesNacionalCabecalho.Id, 'SIMPLES_NACIONAL_CABECALHO');
end;


end.
