{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CONTABIL_ENCERRAMENTO_EXE_CAB] 
                                                                                
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
unit ContabilEncerramentoExeCabService;

interface

uses
  ContabilEncerramentoExeCab, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TContabilEncerramentoExeCabService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TContabilEncerramentoExeCab>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TContabilEncerramentoExeCab>;
    class function ConsultarObjeto(AId: Integer): TContabilEncerramentoExeCab;
    class procedure Inserir(AContabilEncerramentoExeCab: TContabilEncerramentoExeCab);
    class function Alterar(AContabilEncerramentoExeCab: TContabilEncerramentoExeCab): Integer;
    class function Excluir(AContabilEncerramentoExeCab: TContabilEncerramentoExeCab): Integer;
  end;

var
  sql: string;


implementation

{ TContabilEncerramentoExeCabService }



class function TContabilEncerramentoExeCabService.ConsultarLista: TObjectList<TContabilEncerramentoExeCab>;
begin
  sql := 'SELECT * FROM CONTABIL_ENCERRAMENTO_EXE_CAB ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TContabilEncerramentoExeCab>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilEncerramentoExeCabService.ConsultarListaFiltro(AWhere: string): TObjectList<TContabilEncerramentoExeCab>;
begin
  sql := 'SELECT * FROM CONTABIL_ENCERRAMENTO_EXE_CAB where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TContabilEncerramentoExeCab>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilEncerramentoExeCabService.ConsultarObjeto(AId: Integer): TContabilEncerramentoExeCab;
begin
  sql := 'SELECT * FROM CONTABIL_ENCERRAMENTO_EXE_CAB WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TContabilEncerramentoExeCab>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TContabilEncerramentoExeCabService.Inserir(AContabilEncerramentoExeCab: TContabilEncerramentoExeCab);
begin
  AContabilEncerramentoExeCab.ValidarInsercao;
  AContabilEncerramentoExeCab.Id := InserirBase(AContabilEncerramentoExeCab, 'CONTABIL_ENCERRAMENTO_EXE_CAB');
  
end;

class function TContabilEncerramentoExeCabService.Alterar(AContabilEncerramentoExeCab: TContabilEncerramentoExeCab): Integer;
begin
  AContabilEncerramentoExeCab.ValidarAlteracao;
  Result := AlterarBase(AContabilEncerramentoExeCab, 'CONTABIL_ENCERRAMENTO_EXE_CAB');
  
  
end;


class function TContabilEncerramentoExeCabService.Excluir(AContabilEncerramentoExeCab: TContabilEncerramentoExeCab): Integer;
begin
  AContabilEncerramentoExeCab.ValidarExclusao;
  
  Result := ExcluirBase(AContabilEncerramentoExeCab.Id, 'CONTABIL_ENCERRAMENTO_EXE_CAB');
end;


end.
