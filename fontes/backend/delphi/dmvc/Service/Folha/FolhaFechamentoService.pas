{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_FECHAMENTO] 
                                                                                
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
unit FolhaFechamentoService;

interface

uses
  FolhaFechamento, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaFechamentoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TFolhaFechamento>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaFechamento>;
    class function ConsultarObjeto(AId: Integer): TFolhaFechamento;
    class procedure Inserir(AFolhaFechamento: TFolhaFechamento);
    class function Alterar(AFolhaFechamento: TFolhaFechamento): Integer;
    class function Excluir(AFolhaFechamento: TFolhaFechamento): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaFechamentoService }



class function TFolhaFechamentoService.ConsultarLista: TObjectList<TFolhaFechamento>;
begin
  sql := 'SELECT * FROM FOLHA_FECHAMENTO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaFechamento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaFechamentoService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaFechamento>;
begin
  sql := 'SELECT * FROM FOLHA_FECHAMENTO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaFechamento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaFechamentoService.ConsultarObjeto(AId: Integer): TFolhaFechamento;
begin
  sql := 'SELECT * FROM FOLHA_FECHAMENTO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaFechamento>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaFechamentoService.Inserir(AFolhaFechamento: TFolhaFechamento);
begin
  AFolhaFechamento.ValidarInsercao;
  AFolhaFechamento.Id := InserirBase(AFolhaFechamento, 'FOLHA_FECHAMENTO');
  
end;

class function TFolhaFechamentoService.Alterar(AFolhaFechamento: TFolhaFechamento): Integer;
begin
  AFolhaFechamento.ValidarAlteracao;
  Result := AlterarBase(AFolhaFechamento, 'FOLHA_FECHAMENTO');
  
  
end;


class function TFolhaFechamentoService.Excluir(AFolhaFechamento: TFolhaFechamento): Integer;
begin
  AFolhaFechamento.ValidarExclusao;
  
  Result := ExcluirBase(AFolhaFechamento.Id, 'FOLHA_FECHAMENTO');
end;


end.
