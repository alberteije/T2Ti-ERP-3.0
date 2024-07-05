{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_SPED_NFE_ITEM] 
                                                                                
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
unit ViewSpedNfeItem;

interface

uses
  Generics.Collections, System.SysUtils,
  ProdutoUnidade, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TViewSpedNfeItem = class(TModelBase)
  private
    FId: Integer;
    FNome: string;
    FGtin: string;
    FIdProdutoUnidade: Integer;
    FSigla: string;
    FCodigoNcm: string;
      
    FProdutoUnidade: TProdutoUnidade;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('GTIN')]
		[MVCNameAsAttribute('gtin')]
		property Gtin: string read FGtin write FGtin;
    [MVCColumnAttribute('ID_PRODUTO_UNIDADE')]
		[MVCNameAsAttribute('idProdutoUnidade')]
		property IdProdutoUnidade: Integer read FIdProdutoUnidade write FIdProdutoUnidade;
    [MVCColumnAttribute('SIGLA')]
		[MVCNameAsAttribute('sigla')]
		property Sigla: string read FSigla write FSigla;
    [MVCColumnAttribute('CODIGO_NCM')]
		[MVCNameAsAttribute('codigoNcm')]
		property CodigoNcm: string read FCodigoNcm write FCodigoNcm;
      
    [MVCNameAsAttribute('produtoUnidade')]
		property ProdutoUnidade: TProdutoUnidade read FProdutoUnidade write FProdutoUnidade;
  end;

implementation

{ TViewSpedNfeItem }

constructor TViewSpedNfeItem.Create;
begin
  inherited;

  FProdutoUnidade := TProdutoUnidade.Create;
end;

destructor TViewSpedNfeItem.Destroy;
begin
  FreeAndNil(FProdutoUnidade);
  inherited;
end;



end.