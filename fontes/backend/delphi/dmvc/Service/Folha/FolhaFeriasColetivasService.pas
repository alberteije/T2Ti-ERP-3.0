{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_FERIAS_COLETIVAS] 
                                                                                
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
unit FolhaFeriasColetivasService;

interface

uses
  FolhaFeriasColetivas, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaFeriasColetivasService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TFolhaFeriasColetivas>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaFeriasColetivas>;
    class function ConsultarObjeto(AId: Integer): TFolhaFeriasColetivas;
    class procedure Inserir(AFolhaFeriasColetivas: TFolhaFeriasColetivas);
    class function Alterar(AFolhaFeriasColetivas: TFolhaFeriasColetivas): Integer;
    class function Excluir(AFolhaFeriasColetivas: TFolhaFeriasColetivas): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaFeriasColetivasService }



class function TFolhaFeriasColetivasService.ConsultarLista: TObjectList<TFolhaFeriasColetivas>;
begin
  sql := 'SELECT * FROM FOLHA_FERIAS_COLETIVAS ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaFeriasColetivas>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaFeriasColetivasService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaFeriasColetivas>;
begin
  sql := 'SELECT * FROM FOLHA_FERIAS_COLETIVAS where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaFeriasColetivas>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaFeriasColetivasService.ConsultarObjeto(AId: Integer): TFolhaFeriasColetivas;
begin
  sql := 'SELECT * FROM FOLHA_FERIAS_COLETIVAS WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaFeriasColetivas>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaFeriasColetivasService.Inserir(AFolhaFeriasColetivas: TFolhaFeriasColetivas);
begin
  AFolhaFeriasColetivas.ValidarInsercao;
  AFolhaFeriasColetivas.Id := InserirBase(AFolhaFeriasColetivas, 'FOLHA_FERIAS_COLETIVAS');
  
end;

class function TFolhaFeriasColetivasService.Alterar(AFolhaFeriasColetivas: TFolhaFeriasColetivas): Integer;
begin
  AFolhaFeriasColetivas.ValidarAlteracao;
  Result := AlterarBase(AFolhaFeriasColetivas, 'FOLHA_FERIAS_COLETIVAS');
  
  
end;


class function TFolhaFeriasColetivasService.Excluir(AFolhaFeriasColetivas: TFolhaFeriasColetivas): Integer;
begin
  AFolhaFeriasColetivas.ValidarExclusao;
  
  Result := ExcluirBase(AFolhaFeriasColetivas.Id, 'FOLHA_FERIAS_COLETIVAS');
end;


end.
