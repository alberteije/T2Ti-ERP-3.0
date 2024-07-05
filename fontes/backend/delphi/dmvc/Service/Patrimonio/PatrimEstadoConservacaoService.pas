{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PATRIM_ESTADO_CONSERVACAO] 
                                                                                
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
unit PatrimEstadoConservacaoService;

interface

uses
  PatrimEstadoConservacao, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPatrimEstadoConservacaoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPatrimEstadoConservacao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPatrimEstadoConservacao>;
    class function ConsultarObjeto(AId: Integer): TPatrimEstadoConservacao;
    class procedure Inserir(APatrimEstadoConservacao: TPatrimEstadoConservacao);
    class function Alterar(APatrimEstadoConservacao: TPatrimEstadoConservacao): Integer;
    class function Excluir(APatrimEstadoConservacao: TPatrimEstadoConservacao): Integer;
  end;

var
  sql: string;


implementation

{ TPatrimEstadoConservacaoService }



class function TPatrimEstadoConservacaoService.ConsultarLista: TObjectList<TPatrimEstadoConservacao>;
begin
  sql := 'SELECT * FROM PATRIM_ESTADO_CONSERVACAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPatrimEstadoConservacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPatrimEstadoConservacaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TPatrimEstadoConservacao>;
begin
  sql := 'SELECT * FROM PATRIM_ESTADO_CONSERVACAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPatrimEstadoConservacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPatrimEstadoConservacaoService.ConsultarObjeto(AId: Integer): TPatrimEstadoConservacao;
begin
  sql := 'SELECT * FROM PATRIM_ESTADO_CONSERVACAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPatrimEstadoConservacao>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPatrimEstadoConservacaoService.Inserir(APatrimEstadoConservacao: TPatrimEstadoConservacao);
begin
  APatrimEstadoConservacao.ValidarInsercao;
  APatrimEstadoConservacao.Id := InserirBase(APatrimEstadoConservacao, 'PATRIM_ESTADO_CONSERVACAO');
  
end;

class function TPatrimEstadoConservacaoService.Alterar(APatrimEstadoConservacao: TPatrimEstadoConservacao): Integer;
begin
  APatrimEstadoConservacao.ValidarAlteracao;
  Result := AlterarBase(APatrimEstadoConservacao, 'PATRIM_ESTADO_CONSERVACAO');
  
  
end;


class function TPatrimEstadoConservacaoService.Excluir(APatrimEstadoConservacao: TPatrimEstadoConservacao): Integer;
begin
  APatrimEstadoConservacao.ValidarExclusao;
  
  Result := ExcluirBase(APatrimEstadoConservacao.Id, 'PATRIM_ESTADO_CONSERVACAO');
end;


end.
