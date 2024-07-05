{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [GED_TIPO_DOCUMENTO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
unit GedTipoDocumentoService;

interface

uses
  GedTipoDocumento, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TGedTipoDocumentoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TGedTipoDocumento>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TGedTipoDocumento>;
    class function ConsultarObjeto(AId: Integer): TGedTipoDocumento;
    class procedure Inserir(AGedTipoDocumento: TGedTipoDocumento);
    class function Alterar(AGedTipoDocumento: TGedTipoDocumento): Integer;
    class function Excluir(AGedTipoDocumento: TGedTipoDocumento): Integer;
  end;

var
  sql: string;


implementation

{ TGedTipoDocumentoService }



class function TGedTipoDocumentoService.ConsultarLista: TObjectList<TGedTipoDocumento>;
begin
  sql := 'SELECT * FROM GED_TIPO_DOCUMENTO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TGedTipoDocumento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TGedTipoDocumentoService.ConsultarListaFiltro(AWhere: string): TObjectList<TGedTipoDocumento>;
begin
  sql := 'SELECT * FROM GED_TIPO_DOCUMENTO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TGedTipoDocumento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TGedTipoDocumentoService.ConsultarObjeto(AId: Integer): TGedTipoDocumento;
begin
  sql := 'SELECT * FROM GED_TIPO_DOCUMENTO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TGedTipoDocumento>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TGedTipoDocumentoService.Inserir(AGedTipoDocumento: TGedTipoDocumento);
begin
  AGedTipoDocumento.ValidarInsercao;
  AGedTipoDocumento.Id := InserirBase(AGedTipoDocumento, 'GED_TIPO_DOCUMENTO');
  
end;

class function TGedTipoDocumentoService.Alterar(AGedTipoDocumento: TGedTipoDocumento): Integer;
begin
  AGedTipoDocumento.ValidarAlteracao;
  Result := AlterarBase(AGedTipoDocumento, 'GED_TIPO_DOCUMENTO');
  
  
end;


class function TGedTipoDocumentoService.Excluir(AGedTipoDocumento: TGedTipoDocumento): Integer;
begin
  AGedTipoDocumento.ValidarExclusao;
  
  Result := ExcluirBase(AGedTipoDocumento.Id, 'GED_TIPO_DOCUMENTO');
end;


end.
