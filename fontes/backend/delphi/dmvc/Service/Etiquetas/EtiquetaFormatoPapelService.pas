{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [ETIQUETA_FORMATO_PAPEL] 
                                                                                
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
unit EtiquetaFormatoPapelService;

interface

uses
  EtiquetaFormatoPapel, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TEtiquetaFormatoPapelService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TEtiquetaFormatoPapel>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TEtiquetaFormatoPapel>;
    class function ConsultarObjeto(AId: Integer): TEtiquetaFormatoPapel;
    class procedure Inserir(AEtiquetaFormatoPapel: TEtiquetaFormatoPapel);
    class function Alterar(AEtiquetaFormatoPapel: TEtiquetaFormatoPapel): Integer;
    class function Excluir(AEtiquetaFormatoPapel: TEtiquetaFormatoPapel): Integer;
  end;

var
  sql: string;


implementation

{ TEtiquetaFormatoPapelService }



class function TEtiquetaFormatoPapelService.ConsultarLista: TObjectList<TEtiquetaFormatoPapel>;
begin
  sql := 'SELECT * FROM ETIQUETA_FORMATO_PAPEL ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TEtiquetaFormatoPapel>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEtiquetaFormatoPapelService.ConsultarListaFiltro(AWhere: string): TObjectList<TEtiquetaFormatoPapel>;
begin
  sql := 'SELECT * FROM ETIQUETA_FORMATO_PAPEL where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TEtiquetaFormatoPapel>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEtiquetaFormatoPapelService.ConsultarObjeto(AId: Integer): TEtiquetaFormatoPapel;
begin
  sql := 'SELECT * FROM ETIQUETA_FORMATO_PAPEL WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TEtiquetaFormatoPapel>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TEtiquetaFormatoPapelService.Inserir(AEtiquetaFormatoPapel: TEtiquetaFormatoPapel);
begin
  AEtiquetaFormatoPapel.ValidarInsercao;
  AEtiquetaFormatoPapel.Id := InserirBase(AEtiquetaFormatoPapel, 'ETIQUETA_FORMATO_PAPEL');
  
end;

class function TEtiquetaFormatoPapelService.Alterar(AEtiquetaFormatoPapel: TEtiquetaFormatoPapel): Integer;
begin
  AEtiquetaFormatoPapel.ValidarAlteracao;
  Result := AlterarBase(AEtiquetaFormatoPapel, 'ETIQUETA_FORMATO_PAPEL');
  
  
end;


class function TEtiquetaFormatoPapelService.Excluir(AEtiquetaFormatoPapel: TEtiquetaFormatoPapel): Integer;
begin
  AEtiquetaFormatoPapel.ValidarExclusao;
  
  Result := ExcluirBase(AEtiquetaFormatoPapel.Id, 'ETIQUETA_FORMATO_PAPEL');
end;


end.
