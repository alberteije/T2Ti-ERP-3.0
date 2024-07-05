{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [ESOCIAL_CLASSIFICACAO_TRIBUT] 
                                                                                
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
unit EsocialClassificacaoTributService;

interface

uses
  EsocialClassificacaoTribut, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TEsocialClassificacaoTributService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TEsocialClassificacaoTribut>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TEsocialClassificacaoTribut>;
    class function ConsultarObjeto(AId: Integer): TEsocialClassificacaoTribut;
    class procedure Inserir(AEsocialClassificacaoTribut: TEsocialClassificacaoTribut);
    class function Alterar(AEsocialClassificacaoTribut: TEsocialClassificacaoTribut): Integer;
    class function Excluir(AEsocialClassificacaoTribut: TEsocialClassificacaoTribut): Integer;
  end;

var
  sql: string;


implementation

{ TEsocialClassificacaoTributService }



class function TEsocialClassificacaoTributService.ConsultarLista: TObjectList<TEsocialClassificacaoTribut>;
begin
  sql := 'SELECT * FROM ESOCIAL_CLASSIFICACAO_TRIBUT ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TEsocialClassificacaoTribut>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEsocialClassificacaoTributService.ConsultarListaFiltro(AWhere: string): TObjectList<TEsocialClassificacaoTribut>;
begin
  sql := 'SELECT * FROM ESOCIAL_CLASSIFICACAO_TRIBUT where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TEsocialClassificacaoTribut>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TEsocialClassificacaoTributService.ConsultarObjeto(AId: Integer): TEsocialClassificacaoTribut;
begin
  sql := 'SELECT * FROM ESOCIAL_CLASSIFICACAO_TRIBUT WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TEsocialClassificacaoTribut>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TEsocialClassificacaoTributService.Inserir(AEsocialClassificacaoTribut: TEsocialClassificacaoTribut);
begin
  AEsocialClassificacaoTribut.ValidarInsercao;
  AEsocialClassificacaoTribut.Id := InserirBase(AEsocialClassificacaoTribut, 'ESOCIAL_CLASSIFICACAO_TRIBUT');
  
end;

class function TEsocialClassificacaoTributService.Alterar(AEsocialClassificacaoTribut: TEsocialClassificacaoTribut): Integer;
begin
  AEsocialClassificacaoTribut.ValidarAlteracao;
  Result := AlterarBase(AEsocialClassificacaoTribut, 'ESOCIAL_CLASSIFICACAO_TRIBUT');
  
  
end;


class function TEsocialClassificacaoTributService.Excluir(AEsocialClassificacaoTribut: TEsocialClassificacaoTribut): Integer;
begin
  AEsocialClassificacaoTribut.ValidarExclusao;
  
  Result := ExcluirBase(AEsocialClassificacaoTribut.Id, 'ESOCIAL_CLASSIFICACAO_TRIBUT');
end;


end.
