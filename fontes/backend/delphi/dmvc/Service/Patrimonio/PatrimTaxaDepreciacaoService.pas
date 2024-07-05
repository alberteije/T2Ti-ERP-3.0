{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PATRIM_TAXA_DEPRECIACAO] 
                                                                                
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
unit PatrimTaxaDepreciacaoService;

interface

uses
  PatrimTaxaDepreciacao, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPatrimTaxaDepreciacaoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPatrimTaxaDepreciacao>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPatrimTaxaDepreciacao>;
    class function ConsultarObjeto(AId: Integer): TPatrimTaxaDepreciacao;
    class procedure Inserir(APatrimTaxaDepreciacao: TPatrimTaxaDepreciacao);
    class function Alterar(APatrimTaxaDepreciacao: TPatrimTaxaDepreciacao): Integer;
    class function Excluir(APatrimTaxaDepreciacao: TPatrimTaxaDepreciacao): Integer;
  end;

var
  sql: string;


implementation

{ TPatrimTaxaDepreciacaoService }



class function TPatrimTaxaDepreciacaoService.ConsultarLista: TObjectList<TPatrimTaxaDepreciacao>;
begin
  sql := 'SELECT * FROM PATRIM_TAXA_DEPRECIACAO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPatrimTaxaDepreciacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPatrimTaxaDepreciacaoService.ConsultarListaFiltro(AWhere: string): TObjectList<TPatrimTaxaDepreciacao>;
begin
  sql := 'SELECT * FROM PATRIM_TAXA_DEPRECIACAO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPatrimTaxaDepreciacao>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPatrimTaxaDepreciacaoService.ConsultarObjeto(AId: Integer): TPatrimTaxaDepreciacao;
begin
  sql := 'SELECT * FROM PATRIM_TAXA_DEPRECIACAO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPatrimTaxaDepreciacao>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPatrimTaxaDepreciacaoService.Inserir(APatrimTaxaDepreciacao: TPatrimTaxaDepreciacao);
begin
  APatrimTaxaDepreciacao.ValidarInsercao;
  APatrimTaxaDepreciacao.Id := InserirBase(APatrimTaxaDepreciacao, 'PATRIM_TAXA_DEPRECIACAO');
  
end;

class function TPatrimTaxaDepreciacaoService.Alterar(APatrimTaxaDepreciacao: TPatrimTaxaDepreciacao): Integer;
begin
  APatrimTaxaDepreciacao.ValidarAlteracao;
  Result := AlterarBase(APatrimTaxaDepreciacao, 'PATRIM_TAXA_DEPRECIACAO');
  
  
end;


class function TPatrimTaxaDepreciacaoService.Excluir(APatrimTaxaDepreciacao: TPatrimTaxaDepreciacao): Integer;
begin
  APatrimTaxaDepreciacao.ValidarExclusao;
  
  Result := ExcluirBase(APatrimTaxaDepreciacao.Id, 'PATRIM_TAXA_DEPRECIACAO');
end;


end.
