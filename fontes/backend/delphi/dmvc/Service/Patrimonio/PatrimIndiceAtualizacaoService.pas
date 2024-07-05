{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PATRIM_INDICE_ATUALIZACAO] 
                                                                                
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
unit PatrimIndiceAtualizacaoService;

interface

uses
  PatrimIndiceAtualizacao, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPatrimIndiceAtualizacaoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPatrimIndiceAtualizacao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPatrimIndiceAtualizacao>;
    class function ConsultarObjeto(AId: Integer): TPatrimIndiceAtualizacao;
    class procedure Inserir(APatrimIndiceAtualizacao: TPatrimIndiceAtualizacao);
    class function Alterar(APatrimIndiceAtualizacao: TPatrimIndiceAtualizacao): Integer;
    class function Excluir(APatrimIndiceAtualizacao: TPatrimIndiceAtualizacao): Integer;
  end;

var
  sql: string;


implementation

{ TPatrimIndiceAtualizacaoService }



class function TPatrimIndiceAtualizacaoService.ConsultarLista: TObjectList<TPatrimIndiceAtualizacao>;
begin
  sql := 'SELECT * FROM PATRIM_INDICE_ATUALIZACAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPatrimIndiceAtualizacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPatrimIndiceAtualizacaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TPatrimIndiceAtualizacao>;
begin
  sql := 'SELECT * FROM PATRIM_INDICE_ATUALIZACAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPatrimIndiceAtualizacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPatrimIndiceAtualizacaoService.ConsultarObjeto(AId: Integer): TPatrimIndiceAtualizacao;
begin
  sql := 'SELECT * FROM PATRIM_INDICE_ATUALIZACAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPatrimIndiceAtualizacao>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPatrimIndiceAtualizacaoService.Inserir(APatrimIndiceAtualizacao: TPatrimIndiceAtualizacao);
begin
  APatrimIndiceAtualizacao.ValidarInsercao;
  APatrimIndiceAtualizacao.Id := InserirBase(APatrimIndiceAtualizacao, 'PATRIM_INDICE_ATUALIZACAO');
  
end;

class function TPatrimIndiceAtualizacaoService.Alterar(APatrimIndiceAtualizacao: TPatrimIndiceAtualizacao): Integer;
begin
  APatrimIndiceAtualizacao.ValidarAlteracao;
  Result := AlterarBase(APatrimIndiceAtualizacao, 'PATRIM_INDICE_ATUALIZACAO');
  
  
end;


class function TPatrimIndiceAtualizacaoService.Excluir(APatrimIndiceAtualizacao: TPatrimIndiceAtualizacao): Integer;
begin
  APatrimIndiceAtualizacao.ValidarExclusao;
  
  Result := ExcluirBase(APatrimIndiceAtualizacao.Id, 'PATRIM_INDICE_ATUALIZACAO');
end;


end.
