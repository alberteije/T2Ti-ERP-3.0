{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_COTACAO_DETALHE] 
                                                                                
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
unit CompraCotacaoDetalhe;

interface

uses
  Generics.Collections, System.SysUtils,
  Produto, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TCompraCotacaoDetalhe = class(TModelBase)
  private
    FId: Integer;
    FIdCompraFornecedorCotacao: Integer;
    FIdProduto: Integer;
    FQuantidade: Extended;
    FValorUnitario: Extended;
    FValorSubtotal: Extended;
    FTaxaDesconto: Extended;
    FValorDesconto: Extended;
    FValorTotal: Extended;
      
    FProduto: TProduto;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_COMPRA_FORNECEDOR_COTACAO')]
		[MVCNameAsAttribute('idCompraFornecedorCotacao')]
		property IdCompraFornecedorCotacao: Integer read FIdCompraFornecedorCotacao write FIdCompraFornecedorCotacao;
    [MVCColumnAttribute('ID_PRODUTO')]
		[MVCNameAsAttribute('idProduto')]
		property IdProduto: Integer read FIdProduto write FIdProduto;
    [MVCColumnAttribute('QUANTIDADE')]
		[MVCNameAsAttribute('quantidade')]
		property Quantidade: Extended read FQuantidade write FQuantidade;
    [MVCColumnAttribute('VALOR_UNITARIO')]
		[MVCNameAsAttribute('valorUnitario')]
		property ValorUnitario: Extended read FValorUnitario write FValorUnitario;
    [MVCColumnAttribute('VALOR_SUBTOTAL')]
		[MVCNameAsAttribute('valorSubtotal')]
		property ValorSubtotal: Extended read FValorSubtotal write FValorSubtotal;
    [MVCColumnAttribute('TAXA_DESCONTO')]
		[MVCNameAsAttribute('taxaDesconto')]
		property TaxaDesconto: Extended read FTaxaDesconto write FTaxaDesconto;
    [MVCColumnAttribute('VALOR_DESCONTO')]
		[MVCNameAsAttribute('valorDesconto')]
		property ValorDesconto: Extended read FValorDesconto write FValorDesconto;
    [MVCColumnAttribute('VALOR_TOTAL')]
		[MVCNameAsAttribute('valorTotal')]
		property ValorTotal: Extended read FValorTotal write FValorTotal;
      
    [MVCNameAsAttribute('produto')]
		property Produto: TProduto read FProduto write FProduto;
  end;

implementation

{ TCompraCotacaoDetalhe }

constructor TCompraCotacaoDetalhe.Create;
begin
  inherited;

  FProduto := TProduto.Create;
end;

destructor TCompraCotacaoDetalhe.Destroy;
begin
  FreeAndNil(FProduto);
  inherited;
end;



end.