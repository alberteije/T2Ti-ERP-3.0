{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [GED_DOCUMENTO_CABECALHO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
unit GedDocumentoCabecalhoService;

interface

uses
  GedDocumentoCabecalho, GedDocumentoDetalhe,
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils,
  System.IOUtils,
  System.Classes,
  System.Types,
  Biblioteca;

type

  TGedDocumentoCabecalhoService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaGedDocumentoCabecalho: TObjectList<TGedDocumentoCabecalho>); overload;
    class procedure AnexarObjetosVinculados(AGedDocumentoCabecalho: TGedDocumentoCabecalho); overload;
    class procedure InserirObjetosFilhos(AGedDocumentoCabecalho: TGedDocumentoCabecalho);
    class procedure ExcluirObjetosFilhos(AGedDocumentoCabecalho: TGedDocumentoCabecalho);
  public
    class function ConsultarLista: TObjectList<TGedDocumentoCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TGedDocumentoCabecalho>;
    class function ConsultarObjeto(AId: Integer): TGedDocumentoCabecalho;
    class procedure Inserir(AGedDocumentoCabecalho: TGedDocumentoCabecalho);
    class function Alterar(AGedDocumentoCabecalho: TGedDocumentoCabecalho): Integer;
    class function Excluir(AGedDocumentoCabecalho: TGedDocumentoCabecalho): Integer;
    class function AtualizarDetalhe(AGedDocumentoCabecalho: TGedDocumentoCabecalho; ANomeArquivo: string; AArquivo: TStream): Integer;
  end;

var
  sql: string;


implementation

{ TGedDocumentoCabecalhoService }

class procedure TGedDocumentoCabecalhoService.AnexarObjetosVinculados(AGedDocumentoCabecalho: TGedDocumentoCabecalho);
begin
  // GedDocumentoDetalhe
  sql := 'SELECT * FROM GED_DOCUMENTO_DETALHE WHERE ID_GED_DOCUMENTO_CABECALHO = ' + AGedDocumentoCabecalho.Id.ToString;
  AGedDocumentoCabecalho.ListaGedDocumentoDetalhe := GetQuery(sql).AsObjectList<TGedDocumentoDetalhe>;

end;

class procedure TGedDocumentoCabecalhoService.AnexarObjetosVinculados(AListaGedDocumentoCabecalho: TObjectList<TGedDocumentoCabecalho>);
var
  GedDocumentoCabecalho: TGedDocumentoCabecalho;
begin
  for GedDocumentoCabecalho in AListaGedDocumentoCabecalho do
  begin
    AnexarObjetosVinculados(GedDocumentoCabecalho);
  end;
end;

class function TGedDocumentoCabecalhoService.ConsultarLista: TObjectList<TGedDocumentoCabecalho>;
begin
  sql := 'SELECT * FROM GED_DOCUMENTO_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TGedDocumentoCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TGedDocumentoCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TGedDocumentoCabecalho>;
begin
  sql := 'SELECT * FROM GED_DOCUMENTO_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TGedDocumentoCabecalho>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TGedDocumentoCabecalhoService.ConsultarObjeto(AId: Integer): TGedDocumentoCabecalho;
begin
  sql := 'SELECT * FROM GED_DOCUMENTO_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TGedDocumentoCabecalho>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TGedDocumentoCabecalhoService.Inserir(AGedDocumentoCabecalho: TGedDocumentoCabecalho);
begin
  AGedDocumentoCabecalho.ValidarInsercao;
  AGedDocumentoCabecalho.Id := InserirBase(AGedDocumentoCabecalho, 'GED_DOCUMENTO_CABECALHO');
  InserirObjetosFilhos(AGedDocumentoCabecalho);
end;

class function TGedDocumentoCabecalhoService.Alterar(AGedDocumentoCabecalho: TGedDocumentoCabecalho): Integer;
begin
  AGedDocumentoCabecalho.ValidarAlteracao;
  Result := AlterarBase(AGedDocumentoCabecalho, 'GED_DOCUMENTO_CABECALHO');
  ExcluirObjetosFilhos(AGedDocumentoCabecalho);
  InserirObjetosFilhos(AGedDocumentoCabecalho);
end;

class procedure TGedDocumentoCabecalhoService.InserirObjetosFilhos(AGedDocumentoCabecalho: TGedDocumentoCabecalho);
var
  GedDocumentoDetalhe: TGedDocumentoDetalhe;
begin
  // GedDocumentoDetalhe
  for GedDocumentoDetalhe in AGedDocumentoCabecalho.ListaGedDocumentoDetalhe do
  begin
    GedDocumentoDetalhe.IdGedDocumentoCabecalho := AGedDocumentoCabecalho.Id;
    InserirBase(GedDocumentoDetalhe, 'GED_DOCUMENTO_DETALHE');
  end;

end;

class function TGedDocumentoCabecalhoService.Excluir(AGedDocumentoCabecalho: TGedDocumentoCabecalho): Integer;
begin
  AGedDocumentoCabecalho.ValidarExclusao;
  ExcluirObjetosFilhos(AGedDocumentoCabecalho);
  Result := ExcluirBase(AGedDocumentoCabecalho.Id, 'GED_DOCUMENTO_CABECALHO');
end;

class procedure TGedDocumentoCabecalhoService.ExcluirObjetosFilhos(AGedDocumentoCabecalho: TGedDocumentoCabecalho);
begin
  ExcluirFilho(AGedDocumentoCabecalho.Id, 'GED_DOCUMENTO_DETALHE', 'ID_GED_DOCUMENTO_CABECALHO');
end;

class function TGedDocumentoCabecalhoService.AtualizarDetalhe(AGedDocumentoCabecalho: TGedDocumentoCabecalho; ANomeArquivo: string; AArquivo: TStream): Integer;
var
  fs: TFileStream;
  NomeArquivoCompleto, NomeArquivoMD5, TipoArquivo: string;
begin
  try
    NomeArquivoCompleto := TPath.Combine('c:\\T2Ti\\GED\\', ANomeArquivo);
    TipoArquivo := ExtractFileExt(NomeArquivoCompleto);

    // pega o MD5 do conteúdo do arquivo
    NomeArquivoMD5 := Biblioteca.MD5String(NomeArquivoCompleto);

    // salva o arquivo
    fs := TFile.Create(TPath.Combine('c:\\T2Ti\\GED\\', NomeArquivoMD5 + TipoArquivo));
    fs.CopyFrom(AArquivo, 0);

    // Exercício - observe o algoritmo abaixo e implemente
    (*
    01-verifique se o usuário mandou um detalhe com um cabeçalho que ainda não foi persistido
      01.1-se este for o caso, persista o cabeçalho
    02-verifique qual operação no detalhe foi solicitada pelo usuário
      02.1-se for 'gravar detalhe'
        02.1.1-verifique se é uma inserção
          02.1.1.1 - insira um novo registro em ged_documento_detalhe
          02.1.1.2 - insira um registro em ged_versao_documento com ação=I
            --- calcule o hash do arquivo e grave no campo HASH_ARQUIVO
        02.1.2-verifique se é uma alteração
          02.1.2.1 - altere o registro em ged_documento_detalhe
          02.1.2.2 - insira um registro em ged_versao_documento com ação=A
            --- calcule o hash do arquivo e grave no campo HASH_ARQUIVO
      02.2-se for 'excluir detalhe'
        02.2.1 - altere o registro em ged_documento_detalhe informando a data da exclusão
        02.2.2 - insira um registro em ged_versao_documento com ação=E
            --- calcule o hash do arquivo e grave no campo HASH_ARQUIVO
    03-verifique se o detalhe veio com o campo 'assinado="S"'
      03.1-neste caso utilize o OpenSSL para assinar o arquivo
    *)
  finally
    fs.Free;
  end;
end;

end.
