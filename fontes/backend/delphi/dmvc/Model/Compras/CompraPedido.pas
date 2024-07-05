{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COMPRA_PEDIDO] 
                                                                                
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
unit CompraPedido;

interface

uses
  Generics.Collections, System.SysUtils,
  CompraPedidoDetalhe, CompraTipoPedido, Fornecedor, Colaborador, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TCompraPedido = class(TModelBase)
  private
    FId: Integer;
    FIdCompraTipoPedido: Integer;
    FIdFornecedor: Integer;
    FIdColaborador: Integer;
    FDataPedido: TDateTime;
    FDataPrevistaEntrega: TDateTime;
    FDataPrevisaoPagamento: TDateTime;
    FLocalEntrega: string;
    FLocalCobranca: string;
    FContato: string;
    FValorSubtotal: Extended;
    FTaxaDesconto: Extended;
    FValorDesconto: Extended;
    FValorTotal: Extended;
    FTipoFrete: string;
    FFormaPagamento: string;
    FBaseCalculoIcms: Extended;
    FValorIcms: Extended;
    FBaseCalculoIcmsSt: Extended;
    FValorIcmsSt: Extended;
    FValorTotalProdutos: Extended;
    FValorFrete: Extended;
    FValorSeguro: Extended;
    FValorOutrasDespesas: Extended;
    FValorIpi: Extended;
    FValorTotalNf: Extended;
    FQuantidadeParcelas: Integer;
    FDiaPrimeiroVencimento: string;
    FIntervaloEntreParcelas: Integer;
    FDiaFixoParcela: string;
    FCodigoCotacao: string;
      
    FCompraTipoPedido: TCompraTipoPedido;
    FFornecedor: TFornecedor;
    FColaborador: TColaborador;
    FListaCompraPedidoDetalhe: TObjectList<TCompraPedidoDetalhe>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_COMPRA_TIPO_PEDIDO')]
		[MVCNameAsAttribute('idCompraTipoPedido')]
		property IdCompraTipoPedido: Integer read FIdCompraTipoPedido write FIdCompraTipoPedido;
    [MVCColumnAttribute('ID_FORNECEDOR')]
		[MVCNameAsAttribute('idFornecedor')]
		property IdFornecedor: Integer read FIdFornecedor write FIdFornecedor;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('DATA_PEDIDO')]
		[MVCNameAsAttribute('dataPedido')]
		property DataPedido: TDateTime read FDataPedido write FDataPedido;
    [MVCColumnAttribute('DATA_PREVISTA_ENTREGA')]
		[MVCNameAsAttribute('dataPrevistaEntrega')]
		property DataPrevistaEntrega: TDateTime read FDataPrevistaEntrega write FDataPrevistaEntrega;
    [MVCColumnAttribute('DATA_PREVISAO_PAGAMENTO')]
		[MVCNameAsAttribute('dataPrevisaoPagamento')]
		property DataPrevisaoPagamento: TDateTime read FDataPrevisaoPagamento write FDataPrevisaoPagamento;
    [MVCColumnAttribute('LOCAL_ENTREGA')]
		[MVCNameAsAttribute('localEntrega')]
		property LocalEntrega: string read FLocalEntrega write FLocalEntrega;
    [MVCColumnAttribute('LOCAL_COBRANCA')]
		[MVCNameAsAttribute('localCobranca')]
		property LocalCobranca: string read FLocalCobranca write FLocalCobranca;
    [MVCColumnAttribute('CONTATO')]
		[MVCNameAsAttribute('contato')]
		property Contato: string read FContato write FContato;
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
    [MVCColumnAttribute('TIPO_FRETE')]
		[MVCNameAsAttribute('tipoFrete')]
		property TipoFrete: string read FTipoFrete write FTipoFrete;
    [MVCColumnAttribute('FORMA_PAGAMENTO')]
		[MVCNameAsAttribute('formaPagamento')]
		property FormaPagamento: string read FFormaPagamento write FFormaPagamento;
    [MVCColumnAttribute('BASE_CALCULO_ICMS')]
		[MVCNameAsAttribute('baseCalculoIcms')]
		property BaseCalculoIcms: Extended read FBaseCalculoIcms write FBaseCalculoIcms;
    [MVCColumnAttribute('VALOR_ICMS')]
		[MVCNameAsAttribute('valorIcms')]
		property ValorIcms: Extended read FValorIcms write FValorIcms;
    [MVCColumnAttribute('BASE_CALCULO_ICMS_ST')]
		[MVCNameAsAttribute('baseCalculoIcmsSt')]
		property BaseCalculoIcmsSt: Extended read FBaseCalculoIcmsSt write FBaseCalculoIcmsSt;
    [MVCColumnAttribute('VALOR_ICMS_ST')]
		[MVCNameAsAttribute('valorIcmsSt')]
		property ValorIcmsSt: Extended read FValorIcmsSt write FValorIcmsSt;
    [MVCColumnAttribute('VALOR_TOTAL_PRODUTOS')]
		[MVCNameAsAttribute('valorTotalProdutos')]
		property ValorTotalProdutos: Extended read FValorTotalProdutos write FValorTotalProdutos;
    [MVCColumnAttribute('VALOR_FRETE')]
		[MVCNameAsAttribute('valorFrete')]
		property ValorFrete: Extended read FValorFrete write FValorFrete;
    [MVCColumnAttribute('VALOR_SEGURO')]
		[MVCNameAsAttribute('valorSeguro')]
		property ValorSeguro: Extended read FValorSeguro write FValorSeguro;
    [MVCColumnAttribute('VALOR_OUTRAS_DESPESAS')]
		[MVCNameAsAttribute('valorOutrasDespesas')]
		property ValorOutrasDespesas: Extended read FValorOutrasDespesas write FValorOutrasDespesas;
    [MVCColumnAttribute('VALOR_IPI')]
		[MVCNameAsAttribute('valorIpi')]
		property ValorIpi: Extended read FValorIpi write FValorIpi;
    [MVCColumnAttribute('VALOR_TOTAL_NF')]
		[MVCNameAsAttribute('valorTotalNf')]
		property ValorTotalNf: Extended read FValorTotalNf write FValorTotalNf;
    [MVCColumnAttribute('QUANTIDADE_PARCELAS')]
		[MVCNameAsAttribute('quantidadeParcelas')]
		property QuantidadeParcelas: Integer read FQuantidadeParcelas write FQuantidadeParcelas;
    [MVCColumnAttribute('DIA_PRIMEIRO_VENCIMENTO')]
		[MVCNameAsAttribute('diaPrimeiroVencimento')]
		property DiaPrimeiroVencimento: string read FDiaPrimeiroVencimento write FDiaPrimeiroVencimento;
    [MVCColumnAttribute('INTERVALO_ENTRE_PARCELAS')]
		[MVCNameAsAttribute('intervaloEntreParcelas')]
		property IntervaloEntreParcelas: Integer read FIntervaloEntreParcelas write FIntervaloEntreParcelas;
    [MVCColumnAttribute('DIA_FIXO_PARCELA')]
		[MVCNameAsAttribute('diaFixoParcela')]
		property DiaFixoParcela: string read FDiaFixoParcela write FDiaFixoParcela;
    [MVCColumnAttribute('CODIGO_COTACAO')]
		[MVCNameAsAttribute('codigoCotacao')]
		property CodigoCotacao: string read FCodigoCotacao write FCodigoCotacao;
      
    [MVCNameAsAttribute('compraTipoPedido')]
		property CompraTipoPedido: TCompraTipoPedido read FCompraTipoPedido write FCompraTipoPedido;
    [MVCNameAsAttribute('fornecedor')]
		property Fornecedor: TFornecedor read FFornecedor write FFornecedor;
    [MVCNameAsAttribute('colaborador')]
		property Colaborador: TColaborador read FColaborador write FColaborador;
    [MapperListOf(TCompraPedidoDetalhe)]
	[MVCNameAsAttribute('listaCompraPedidoDetalhe')]
	property ListaCompraPedidoDetalhe: TObjectList<TCompraPedidoDetalhe> read FListaCompraPedidoDetalhe write FListaCompraPedidoDetalhe;
  end;

implementation

{ TCompraPedido }

constructor TCompraPedido.Create;
begin
  inherited;

  FListaCompraPedidoDetalhe := TObjectList<TCompraPedidoDetalhe>.Create;
  FCompraTipoPedido := TCompraTipoPedido.Create;
  FFornecedor := TFornecedor.Create;
  FColaborador := TColaborador.Create;
end;

destructor TCompraPedido.Destroy;
begin
  FreeAndNil(FListaCompraPedidoDetalhe);
  FreeAndNil(FCompraTipoPedido);
  FreeAndNil(FFornecedor);
  FreeAndNil(FColaborador);
  inherited;
end;



end.