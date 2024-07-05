{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [ETIQUETA_LAYOUT] 
                                                                                
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
unit EtiquetaLayoutService;

interface

uses
  EtiquetaLayout, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TEtiquetaLayoutService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TEtiquetaLayout>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TEtiquetaLayout>;
    class function ConsultarObjeto(AId: Integer): TEtiquetaLayout;
    class procedure Inserir(AEtiquetaLayout: TEtiquetaLayout);
    class function Alterar(AEtiquetaLayout: TEtiquetaLayout): Integer;
    class function Excluir(AEtiquetaLayout: TEtiquetaLayout): Integer;
  end;

var
  sql: string;


implementation

{ TEtiquetaLayoutService }



class function TEtiquetaLayoutService.ConsultarLista: TObjectList<TEtiquetaLayout>;
begin
  sql := 'SELECT * FROM ETIQUETA_LAYOUT ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TEtiquetaLayout>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEtiquetaLayoutService.ConsultarListaFiltro(AWhere: string): TObjectList<TEtiquetaLayout>;
begin
  sql := 'SELECT * FROM ETIQUETA_LAYOUT where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TEtiquetaLayout>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEtiquetaLayoutService.ConsultarObjeto(AId: Integer): TEtiquetaLayout;
begin
  sql := 'SELECT * FROM ETIQUETA_LAYOUT WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TEtiquetaLayout>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TEtiquetaLayoutService.Inserir(AEtiquetaLayout: TEtiquetaLayout);
begin
  AEtiquetaLayout.ValidarInsercao;
  AEtiquetaLayout.Id := InserirBase(AEtiquetaLayout, 'ETIQUETA_LAYOUT');
  
end;

class function TEtiquetaLayoutService.Alterar(AEtiquetaLayout: TEtiquetaLayout): Integer;
begin
  AEtiquetaLayout.ValidarAlteracao;
  Result := AlterarBase(AEtiquetaLayout, 'ETIQUETA_LAYOUT');
  
  
end;


class function TEtiquetaLayoutService.Excluir(AEtiquetaLayout: TEtiquetaLayout): Integer;
begin
  AEtiquetaLayout.ValidarExclusao;
  
  Result := ExcluirBase(AEtiquetaLayout.Id, 'ETIQUETA_LAYOUT');
end;


end.
