{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [ESOCIAL_RUBRICA] 
                                                                                
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
unit EsocialRubricaService;

interface

uses
  EsocialRubrica, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TEsocialRubricaService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TEsocialRubrica>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TEsocialRubrica>;
    class function ConsultarObjeto(AId: Integer): TEsocialRubrica;
    class procedure Inserir(AEsocialRubrica: TEsocialRubrica);
    class function Alterar(AEsocialRubrica: TEsocialRubrica): Integer;
    class function Excluir(AEsocialRubrica: TEsocialRubrica): Integer;
  end;

var
  sql: string;


implementation

{ TEsocialRubricaService }



class function TEsocialRubricaService.ConsultarLista: TObjectList<TEsocialRubrica>;
begin
  sql := 'SELECT * FROM ESOCIAL_RUBRICA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TEsocialRubrica>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEsocialRubricaService.ConsultarListaFiltro(AWhere: string): TObjectList<TEsocialRubrica>;
begin
  sql := 'SELECT * FROM ESOCIAL_RUBRICA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TEsocialRubrica>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEsocialRubricaService.ConsultarObjeto(AId: Integer): TEsocialRubrica;
begin
  sql := 'SELECT * FROM ESOCIAL_RUBRICA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TEsocialRubrica>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TEsocialRubricaService.Inserir(AEsocialRubrica: TEsocialRubrica);
begin
  AEsocialRubrica.ValidarInsercao;
  AEsocialRubrica.Id := InserirBase(AEsocialRubrica, 'ESOCIAL_RUBRICA');
  
end;

class function TEsocialRubricaService.Alterar(AEsocialRubrica: TEsocialRubrica): Integer;
begin
  AEsocialRubrica.ValidarAlteracao;
  Result := AlterarBase(AEsocialRubrica, 'ESOCIAL_RUBRICA');
  
  
end;


class function TEsocialRubricaService.Excluir(AEsocialRubrica: TEsocialRubrica): Integer;
begin
  AEsocialRubrica.ValidarExclusao;
  
  Result := ExcluirBase(AEsocialRubrica.Id, 'ESOCIAL_RUBRICA');
end;


end.
