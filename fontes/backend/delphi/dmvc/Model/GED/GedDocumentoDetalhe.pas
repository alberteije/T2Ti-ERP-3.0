{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [GED_DOCUMENTO_DETALHE] 
                                                                                
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
unit GedDocumentoDetalhe;

interface

uses
  Generics.Collections, System.SysUtils,
  GedVersaoDocumento, GedTipoDocumento, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TGedDocumentoDetalhe = class(TModelBase)
  private
    FId: Integer;
    FIdGedDocumentoCabecalho: Integer;
    FIdGedTipoDocumento: Integer;
    FNome: string;
    FDescricao: string;
    FPalavrasChave: string;
    FPodeExcluir: string;
    FPodeAlterar: string;
    FAssinado: string;
    FDataFimVigencia: TDateTime;
    FDataExclusao: TDateTime;
      
    FGedTipoDocumento: TGedTipoDocumento;
    FListaGedVersaoDocumento: TObjectList<TGedVersaoDocumento>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_GED_DOCUMENTO_CABECALHO')]
		[MVCNameAsAttribute('idGedDocumentoCabecalho')]
		property IdGedDocumentoCabecalho: Integer read FIdGedDocumentoCabecalho write FIdGedDocumentoCabecalho;
    [MVCColumnAttribute('ID_GED_TIPO_DOCUMENTO')]
		[MVCNameAsAttribute('idGedTipoDocumento')]
		property IdGedTipoDocumento: Integer read FIdGedTipoDocumento write FIdGedTipoDocumento;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('DESCRICAO')]
		[MVCNameAsAttribute('descricao')]
		property Descricao: string read FDescricao write FDescricao;
    [MVCColumnAttribute('PALAVRAS_CHAVE')]
		[MVCNameAsAttribute('palavrasChave')]
		property PalavrasChave: string read FPalavrasChave write FPalavrasChave;
    [MVCColumnAttribute('PODE_EXCLUIR')]
		[MVCNameAsAttribute('podeExcluir')]
		property PodeExcluir: string read FPodeExcluir write FPodeExcluir;
    [MVCColumnAttribute('PODE_ALTERAR')]
		[MVCNameAsAttribute('podeAlterar')]
		property PodeAlterar: string read FPodeAlterar write FPodeAlterar;
    [MVCColumnAttribute('ASSINADO')]
		[MVCNameAsAttribute('assinado')]
		property Assinado: string read FAssinado write FAssinado;
    [MVCColumnAttribute('DATA_FIM_VIGENCIA')]
		[MVCNameAsAttribute('dataFimVigencia')]
		property DataFimVigencia: TDateTime read FDataFimVigencia write FDataFimVigencia;
    [MVCColumnAttribute('DATA_EXCLUSAO')]
		[MVCNameAsAttribute('dataExclusao')]
		property DataExclusao: TDateTime read FDataExclusao write FDataExclusao;
      
    [MVCNameAsAttribute('gedTipoDocumento')]
		property GedTipoDocumento: TGedTipoDocumento read FGedTipoDocumento write FGedTipoDocumento;
    [MapperListOf(TGedVersaoDocumento)]
	[MVCNameAsAttribute('listaGedVersaoDocumento')]
	property ListaGedVersaoDocumento: TObjectList<TGedVersaoDocumento> read FListaGedVersaoDocumento write FListaGedVersaoDocumento;
  end;

implementation

{ TGedDocumentoDetalhe }

constructor TGedDocumentoDetalhe.Create;
begin
  inherited;

  FListaGedVersaoDocumento := TObjectList<TGedVersaoDocumento>.Create;
  FGedTipoDocumento := TGedTipoDocumento.Create;
end;

destructor TGedDocumentoDetalhe.Destroy;
begin
  FreeAndNil(FListaGedVersaoDocumento);
  FreeAndNil(FGedTipoDocumento);
  inherited;
end;



end.