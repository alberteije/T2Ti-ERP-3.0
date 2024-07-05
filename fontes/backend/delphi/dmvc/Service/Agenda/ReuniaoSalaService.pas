{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [REUNIAO_SALA] 
                                                                                
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
unit ReuniaoSalaService;

interface

uses
  ReuniaoSala, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TReuniaoSalaService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TReuniaoSala>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TReuniaoSala>;
    class function ConsultarObjeto(AId: Integer): TReuniaoSala;
    class procedure Inserir(AReuniaoSala: TReuniaoSala);
    class function Alterar(AReuniaoSala: TReuniaoSala): Integer;
    class function Excluir(AReuniaoSala: TReuniaoSala): Integer;
  end;

var
  sql: string;


implementation

{ TReuniaoSalaService }



class function TReuniaoSalaService.ConsultarLista: TObjectList<TReuniaoSala>;
begin
  sql := 'SELECT * FROM REUNIAO_SALA ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TReuniaoSala>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TReuniaoSalaService.ConsultarListaFiltro(AWhere: string): TObjectList<TReuniaoSala>;
begin
  sql := 'SELECT * FROM REUNIAO_SALA where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TReuniaoSala>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TReuniaoSalaService.ConsultarObjeto(AId: Integer): TReuniaoSala;
begin
  sql := 'SELECT * FROM REUNIAO_SALA WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TReuniaoSala>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TReuniaoSalaService.Inserir(AReuniaoSala: TReuniaoSala);
begin
  AReuniaoSala.ValidarInsercao;
  AReuniaoSala.Id := InserirBase(AReuniaoSala, 'REUNIAO_SALA');
  
end;

class function TReuniaoSalaService.Alterar(AReuniaoSala: TReuniaoSala): Integer;
begin
  AReuniaoSala.ValidarAlteracao;
  Result := AlterarBase(AReuniaoSala, 'REUNIAO_SALA');
  
  
end;


class function TReuniaoSalaService.Excluir(AReuniaoSala: TReuniaoSala): Integer;
begin
  AReuniaoSala.ValidarExclusao;
  
  Result := ExcluirBase(AReuniaoSala.Id, 'REUNIAO_SALA');
end;


end.