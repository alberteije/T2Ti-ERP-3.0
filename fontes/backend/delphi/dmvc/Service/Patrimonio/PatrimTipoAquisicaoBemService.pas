{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [PATRIM_TIPO_AQUISICAO_BEM] 
                                                                                
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
unit PatrimTipoAquisicaoBemService;

interface

uses
  PatrimTipoAquisicaoBem, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TPatrimTipoAquisicaoBemService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TPatrimTipoAquisicaoBem>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TPatrimTipoAquisicaoBem>;
    class function ConsultarObjeto(AId: Integer): TPatrimTipoAquisicaoBem;
    class procedure Inserir(APatrimTipoAquisicaoBem: TPatrimTipoAquisicaoBem);
    class function Alterar(APatrimTipoAquisicaoBem: TPatrimTipoAquisicaoBem): Integer;
    class function Excluir(APatrimTipoAquisicaoBem: TPatrimTipoAquisicaoBem): Integer;
  end;

var
  sql: string;


implementation

{ TPatrimTipoAquisicaoBemService }



class function TPatrimTipoAquisicaoBemService.ConsultarLista: TObjectList<TPatrimTipoAquisicaoBem>;
begin
  sql := 'SELECT * FROM PATRIM_TIPO_AQUISICAO_BEM ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TPatrimTipoAquisicaoBem>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPatrimTipoAquisicaoBemService.ConsultarListaFiltro(AWhere: string): TObjectList<TPatrimTipoAquisicaoBem>;
begin
  sql := 'SELECT * FROM PATRIM_TIPO_AQUISICAO_BEM where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TPatrimTipoAquisicaoBem>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TPatrimTipoAquisicaoBemService.ConsultarObjeto(AId: Integer): TPatrimTipoAquisicaoBem;
begin
  sql := 'SELECT * FROM PATRIM_TIPO_AQUISICAO_BEM WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TPatrimTipoAquisicaoBem>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TPatrimTipoAquisicaoBemService.Inserir(APatrimTipoAquisicaoBem: TPatrimTipoAquisicaoBem);
begin
  APatrimTipoAquisicaoBem.ValidarInsercao;
  APatrimTipoAquisicaoBem.Id := InserirBase(APatrimTipoAquisicaoBem, 'PATRIM_TIPO_AQUISICAO_BEM');
  
end;

class function TPatrimTipoAquisicaoBemService.Alterar(APatrimTipoAquisicaoBem: TPatrimTipoAquisicaoBem): Integer;
begin
  APatrimTipoAquisicaoBem.ValidarAlteracao;
  Result := AlterarBase(APatrimTipoAquisicaoBem, 'PATRIM_TIPO_AQUISICAO_BEM');
  
  
end;


class function TPatrimTipoAquisicaoBemService.Excluir(APatrimTipoAquisicaoBem: TPatrimTipoAquisicaoBem): Integer;
begin
  APatrimTipoAquisicaoBem.ValidarExclusao;
  
  Result := ExcluirBase(APatrimTipoAquisicaoBem.Id, 'PATRIM_TIPO_AQUISICAO_BEM');
end;


end.
