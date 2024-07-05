{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMISSAO_OBJETIVO] 
                                                                                
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
unit ComissaoObjetivo;

interface

uses
  Generics.Collections, System.SysUtils,
  Produto, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TComissaoObjetivo = class(TModelBase)
  private
    FId: Integer;
    FIdComissaoPerfil: Integer;
    FIdProduto: Integer;
    FCodigo: string;
    FNome: string;
    FDescricao: string;
    FFormaPagamento: string;
    FTaxaPagamento: Extended;
    FValorPagamento: Extended;
    FValorMeta: Extended;
    FQuantidade: Extended;
      
    FProduto: TProduto;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_COMISSAO_PERFIL')]
		[MVCNameAsAttribute('idComissaoPerfil')]
		property IdComissaoPerfil: Integer read FIdComissaoPerfil write FIdComissaoPerfil;
    [MVCColumnAttribute('ID_PRODUTO')]
		[MVCNameAsAttribute('idProduto')]
		property IdProduto: Integer read FIdProduto write FIdProduto;
    [MVCColumnAttribute('CODIGO')]
		[MVCNameAsAttribute('codigo')]
		property Codigo: string read FCodigo write FCodigo;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('DESCRICAO')]
		[MVCNameAsAttribute('descricao')]
		property Descricao: string read FDescricao write FDescricao;
    [MVCColumnAttribute('FORMA_PAGAMENTO')]
		[MVCNameAsAttribute('formaPagamento')]
		property FormaPagamento: string read FFormaPagamento write FFormaPagamento;
    [MVCColumnAttribute('TAXA_PAGAMENTO')]
		[MVCNameAsAttribute('taxaPagamento')]
		property TaxaPagamento: Extended read FTaxaPagamento write FTaxaPagamento;
    [MVCColumnAttribute('VALOR_PAGAMENTO')]
		[MVCNameAsAttribute('valorPagamento')]
		property ValorPagamento: Extended read FValorPagamento write FValorPagamento;
    [MVCColumnAttribute('VALOR_META')]
		[MVCNameAsAttribute('valorMeta')]
		property ValorMeta: Extended read FValorMeta write FValorMeta;
    [MVCColumnAttribute('QUANTIDADE')]
		[MVCNameAsAttribute('quantidade')]
		property Quantidade: Extended read FQuantidade write FQuantidade;
      
    [MVCNameAsAttribute('produto')]
		property Produto: TProduto read FProduto write FProduto;
  end;

implementation

{ TComissaoObjetivo }

constructor TComissaoObjetivo.Create;
begin
  inherited;

  FProduto := TProduto.Create;
end;

destructor TComissaoObjetivo.Destroy;
begin
  FreeAndNil(FProduto);
  inherited;
end;



end.