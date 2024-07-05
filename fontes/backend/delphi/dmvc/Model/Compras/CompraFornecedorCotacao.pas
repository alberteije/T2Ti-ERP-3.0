{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_FORNECEDOR_COTACAO] 
                                                                                
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
unit CompraFornecedorCotacao;

interface

uses
  Generics.Collections, System.SysUtils,
  CompraCotacaoDetalhe, Fornecedor, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TCompraFornecedorCotacao = class(TModelBase)
  private
    FId: Integer;
    FIdCompraCotacao: Integer;
    FIdFornecedor: Integer;
    FCodigo: string;
    FPrazoEntrega: string;
    FVendaCondicoesPagamento: string;
    FValorSubtotal: Extended;
    FTaxaDesconto: Extended;
    FValorDesconto: Extended;
    FValorTotal: Extended;
      
    FFornecedor: TFornecedor;
    FListaCompraCotacaoDetalhe: TObjectList<TCompraCotacaoDetalhe>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_COMPRA_COTACAO')]
		[MVCNameAsAttribute('idCompraCotacao')]
		property IdCompraCotacao: Integer read FIdCompraCotacao write FIdCompraCotacao;
    [MVCColumnAttribute('ID_FORNECEDOR')]
		[MVCNameAsAttribute('idFornecedor')]
		property IdFornecedor: Integer read FIdFornecedor write FIdFornecedor;
    [MVCColumnAttribute('CODIGO')]
		[MVCNameAsAttribute('codigo')]
		property Codigo: string read FCodigo write FCodigo;
    [MVCColumnAttribute('PRAZO_ENTREGA')]
		[MVCNameAsAttribute('prazoEntrega')]
		property PrazoEntrega: string read FPrazoEntrega write FPrazoEntrega;
    [MVCColumnAttribute('VENDA_CONDICOES_PAGAMENTO')]
		[MVCNameAsAttribute('vendaCondicoesPagamento')]
		property VendaCondicoesPagamento: string read FVendaCondicoesPagamento write FVendaCondicoesPagamento;
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
      
    [MVCNameAsAttribute('fornecedor')]
		property Fornecedor: TFornecedor read FFornecedor write FFornecedor;
    [MapperListOf(TCompraCotacaoDetalhe)]
	[MVCNameAsAttribute('listaCompraCotacaoDetalhe')]
	property ListaCompraCotacaoDetalhe: TObjectList<TCompraCotacaoDetalhe> read FListaCompraCotacaoDetalhe write FListaCompraCotacaoDetalhe;
  end;

implementation

{ TCompraFornecedorCotacao }

constructor TCompraFornecedorCotacao.Create;
begin
  inherited;

  FListaCompraCotacaoDetalhe := TObjectList<TCompraCotacaoDetalhe>.Create;
  FFornecedor := TFornecedor.Create;
end;

destructor TCompraFornecedorCotacao.Destroy;
begin
  FreeAndNil(FListaCompraCotacaoDetalhe);
  FreeAndNil(FFornecedor);
  inherited;
end;



end.