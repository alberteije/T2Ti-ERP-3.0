{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_PPP_CAT] 
                                                                                
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
unit FolhaPppCatService;

interface

uses
  FolhaPppCat, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaPppCatService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TFolhaPppCat>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaPppCat>;
    class function ConsultarObjeto(AId: Integer): TFolhaPppCat;
    class procedure Inserir(AFolhaPppCat: TFolhaPppCat);
    class function Alterar(AFolhaPppCat: TFolhaPppCat): Integer;
    class function Excluir(AFolhaPppCat: TFolhaPppCat): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaPppCatService }



class function TFolhaPppCatService.ConsultarLista: TObjectList<TFolhaPppCat>;
begin
  sql := 'SELECT * FROM FOLHA_PPP_CAT ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaPppCat>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaPppCatService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaPppCat>;
begin
  sql := 'SELECT * FROM FOLHA_PPP_CAT where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaPppCat>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaPppCatService.ConsultarObjeto(AId: Integer): TFolhaPppCat;
begin
  sql := 'SELECT * FROM FOLHA_PPP_CAT WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaPppCat>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaPppCatService.Inserir(AFolhaPppCat: TFolhaPppCat);
begin
  AFolhaPppCat.ValidarInsercao;
  AFolhaPppCat.Id := InserirBase(AFolhaPppCat, 'FOLHA_PPP_CAT');
  
end;

class function TFolhaPppCatService.Alterar(AFolhaPppCat: TFolhaPppCat): Integer;
begin
  AFolhaPppCat.ValidarAlteracao;
  Result := AlterarBase(AFolhaPppCat, 'FOLHA_PPP_CAT');
  
  
end;


class function TFolhaPppCatService.Excluir(AFolhaPppCat: TFolhaPppCat): Integer;
begin
  AFolhaPppCat.ValidarExclusao;
  
  Result := ExcluirBase(AFolhaPppCat.Id, 'FOLHA_PPP_CAT');
end;


end.
