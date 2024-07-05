{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [ESOCIAL_TIPO_AFASTAMENTO] 
                                                                                
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
unit EsocialTipoAfastamentoService;

interface

uses
  EsocialTipoAfastamento, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TEsocialTipoAfastamentoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TEsocialTipoAfastamento>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TEsocialTipoAfastamento>;
    class function ConsultarObjeto(AId: Integer): TEsocialTipoAfastamento;
    class procedure Inserir(AEsocialTipoAfastamento: TEsocialTipoAfastamento);
    class function Alterar(AEsocialTipoAfastamento: TEsocialTipoAfastamento): Integer;
    class function Excluir(AEsocialTipoAfastamento: TEsocialTipoAfastamento): Integer;
  end;

var
  sql: string;


implementation

{ TEsocialTipoAfastamentoService }



class function TEsocialTipoAfastamentoService.ConsultarLista: TObjectList<TEsocialTipoAfastamento>;
begin
  sql := 'SELECT * FROM ESOCIAL_TIPO_AFASTAMENTO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TEsocialTipoAfastamento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEsocialTipoAfastamentoService.ConsultarListaFiltro(AWhere: string): TObjectList<TEsocialTipoAfastamento>;
begin
  sql := 'SELECT * FROM ESOCIAL_TIPO_AFASTAMENTO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TEsocialTipoAfastamento>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEsocialTipoAfastamentoService.ConsultarObjeto(AId: Integer): TEsocialTipoAfastamento;
begin
  sql := 'SELECT * FROM ESOCIAL_TIPO_AFASTAMENTO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TEsocialTipoAfastamento>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TEsocialTipoAfastamentoService.Inserir(AEsocialTipoAfastamento: TEsocialTipoAfastamento);
begin
  AEsocialTipoAfastamento.ValidarInsercao;
  AEsocialTipoAfastamento.Id := InserirBase(AEsocialTipoAfastamento, 'ESOCIAL_TIPO_AFASTAMENTO');
  
end;

class function TEsocialTipoAfastamentoService.Alterar(AEsocialTipoAfastamento: TEsocialTipoAfastamento): Integer;
begin
  AEsocialTipoAfastamento.ValidarAlteracao;
  Result := AlterarBase(AEsocialTipoAfastamento, 'ESOCIAL_TIPO_AFASTAMENTO');
  
  
end;


class function TEsocialTipoAfastamentoService.Excluir(AEsocialTipoAfastamento: TEsocialTipoAfastamento): Integer;
begin
  AEsocialTipoAfastamento.ValidarExclusao;
  
  Result := ExcluirBase(AEsocialTipoAfastamento.Id, 'ESOCIAL_TIPO_AFASTAMENTO');
end;


end.
