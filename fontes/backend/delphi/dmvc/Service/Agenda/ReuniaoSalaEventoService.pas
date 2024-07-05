{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [REUNIAO_SALA_EVENTO] 
                                                                                
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
unit ReuniaoSalaEventoService;

interface

uses
  ReuniaoSalaEvento, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TReuniaoSalaEventoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TReuniaoSalaEvento>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TReuniaoSalaEvento>;
    class function ConsultarObjeto(AId: Integer): TReuniaoSalaEvento;
    class procedure Inserir(AReuniaoSalaEvento: TReuniaoSalaEvento);
    class function Alterar(AReuniaoSalaEvento: TReuniaoSalaEvento): Integer;
    class function Excluir(AReuniaoSalaEvento: TReuniaoSalaEvento): Integer;
  end;

var
  sql: string;


implementation

{ TReuniaoSalaEventoService }



class function TReuniaoSalaEventoService.ConsultarLista: TObjectList<TReuniaoSalaEvento>;
begin
  sql := 'SELECT * FROM REUNIAO_SALA_EVENTO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TReuniaoSalaEvento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TReuniaoSalaEventoService.ConsultarListaFiltro(AWhere: string): TObjectList<TReuniaoSalaEvento>;
begin
  sql := 'SELECT * FROM REUNIAO_SALA_EVENTO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TReuniaoSalaEvento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TReuniaoSalaEventoService.ConsultarObjeto(AId: Integer): TReuniaoSalaEvento;
begin
  sql := 'SELECT * FROM REUNIAO_SALA_EVENTO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TReuniaoSalaEvento>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TReuniaoSalaEventoService.Inserir(AReuniaoSalaEvento: TReuniaoSalaEvento);
begin
  AReuniaoSalaEvento.ValidarInsercao;
  AReuniaoSalaEvento.Id := InserirBase(AReuniaoSalaEvento, 'REUNIAO_SALA_EVENTO');
  
end;

class function TReuniaoSalaEventoService.Alterar(AReuniaoSalaEvento: TReuniaoSalaEvento): Integer;
begin
  AReuniaoSalaEvento.ValidarAlteracao;
  Result := AlterarBase(AReuniaoSalaEvento, 'REUNIAO_SALA_EVENTO');
  
  
end;


class function TReuniaoSalaEventoService.Excluir(AReuniaoSalaEvento: TReuniaoSalaEvento): Integer;
begin
  AReuniaoSalaEvento.ValidarExclusao;
  
  Result := ExcluirBase(AReuniaoSalaEvento.Id, 'REUNIAO_SALA_EVENTO');
end;


end.
