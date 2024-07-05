{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FISCAL_LIVRO] 
                                                                                
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
unit FiscalLivroService;

interface

uses
  FiscalLivro, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFiscalLivroService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TFiscalLivro>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalLivro>;
    class function ConsultarObjeto(AId: Integer): TFiscalLivro;
    class procedure Inserir(AFiscalLivro: TFiscalLivro);
    class function Alterar(AFiscalLivro: TFiscalLivro): Integer;
    class function Excluir(AFiscalLivro: TFiscalLivro): Integer;
  end;

var
  sql: string;


implementation

{ TFiscalLivroService }



class function TFiscalLivroService.ConsultarLista: TObjectList<TFiscalLivro>;
begin
  sql := 'SELECT * FROM FISCAL_LIVRO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFiscalLivro>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalLivroService.ConsultarListaFiltro(AWhere: string): TObjectList<TFiscalLivro>;
begin
  sql := 'SELECT * FROM FISCAL_LIVRO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFiscalLivro>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFiscalLivroService.ConsultarObjeto(AId: Integer): TFiscalLivro;
begin
  sql := 'SELECT * FROM FISCAL_LIVRO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFiscalLivro>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFiscalLivroService.Inserir(AFiscalLivro: TFiscalLivro);
begin
  AFiscalLivro.ValidarInsercao;
  AFiscalLivro.Id := InserirBase(AFiscalLivro, 'FISCAL_LIVRO');
  
end;

class function TFiscalLivroService.Alterar(AFiscalLivro: TFiscalLivro): Integer;
begin
  AFiscalLivro.ValidarAlteracao;
  Result := AlterarBase(AFiscalLivro, 'FISCAL_LIVRO');
  
  
end;


class function TFiscalLivroService.Excluir(AFiscalLivro: TFiscalLivro): Integer;
begin
  AFiscalLivro.ValidarExclusao;
  
  Result := ExcluirBase(AFiscalLivro.Id, 'FISCAL_LIVRO');
end;


end.
