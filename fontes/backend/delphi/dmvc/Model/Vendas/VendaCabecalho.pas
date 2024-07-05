{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_CABECALHO] 
                                                                                
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
unit VendaCabecalho;

interface

uses
  Generics.Collections, System.SysUtils,
  VendaFrete, VendaComissao, VendaDetalhe, VendaOrcamentoCabecalho, VendaCondicoesPagamento, NotaFiscalTipo, Cliente, Transportadora, Vendedor,
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TVendaCabecalho = class(TModelBase)
  private
    FId: Integer;
    FIdVendaOrcamentoCabecalho: Integer;
    FIdVendaCondicoesPagamento: Integer;
    FIdNotaFiscalTipo: Integer;
    FIdCliente: Integer;
    FIdTransportadora: Integer;
    FIdVendedor: Integer;
    FDataVenda: TDateTime;
    FDataSaida: TDateTime;
    FHoraSaida: string;
    FNumeroFatura: Integer;
    FLocalEntrega: string;
    FLocalCobranca: string;
    FValorSubtotal: Extended;
    FTaxaComissao: Extended;
    FValorComissao: Extended;
    FTaxaDesconto: Extended;
    FValorDesconto: Extended;
    FValorTotal: Extended;
    FTipoFrete: string;
    FFormaPagamento: string;
    FValorFrete: Extended;
    FValorSeguro: Extended;
    FObservacao: string;
    FSituacao: string;
    FDiaFixoParcela: string;

    FVendaFrete: TVendaFrete;
    FVendaOrcamentoCabecalho: TVendaOrcamentoCabecalho;
    FVendaCondicoesPagamento: TVendaCondicoesPagamento;
    FNotaFiscalTipo: TNotaFiscalTipo;
    FCliente: TCliente;
    FTransportadora: TTransportadora;
    FVendedor: TVendedor;
    FListaVendaComissao: TObjectList<TVendaComissao>;
    FListaVendaDetalhe: TObjectList<TVendaDetalhe>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_VENDA_ORCAMENTO_CABECALHO')]
		[MVCNameAsAttribute('idVendaOrcamentoCabecalho')]
		property IdVendaOrcamentoCabecalho: Integer read FIdVendaOrcamentoCabecalho write FIdVendaOrcamentoCabecalho;
    [MVCColumnAttribute('ID_VENDA_CONDICOES_PAGAMENTO')]
		[MVCNameAsAttribute('idVendaCondicoesPagamento')]
		property IdVendaCondicoesPagamento: Integer read FIdVendaCondicoesPagamento write FIdVendaCondicoesPagamento;
    [MVCColumnAttribute('ID_NOTA_FISCAL_TIPO')]
		[MVCNameAsAttribute('idNotaFiscalTipo')]
		property IdNotaFiscalTipo: Integer read FIdNotaFiscalTipo write FIdNotaFiscalTipo;
    [MVCColumnAttribute('ID_CLIENTE')]
		[MVCNameAsAttribute('idCliente')]
		property IdCliente: Integer read FIdCliente write FIdCliente;
    [MVCColumnAttribute('ID_TRANSPORTADORA')]
		[MVCNameAsAttribute('idTransportadora')]
		property IdTransportadora: Integer read FIdTransportadora write FIdTransportadora;
    [MVCColumnAttribute('ID_VENDEDOR')]
		[MVCNameAsAttribute('idVendedor')]
		property IdVendedor: Integer read FIdVendedor write FIdVendedor;
    [MVCColumnAttribute('DATA_VENDA')]
		[MVCNameAsAttribute('dataVenda')]
		property DataVenda: TDateTime read FDataVenda write FDataVenda;
    [MVCColumnAttribute('DATA_SAIDA')]
		[MVCNameAsAttribute('dataSaida')]
		property DataSaida: TDateTime read FDataSaida write FDataSaida;
    [MVCColumnAttribute('HORA_SAIDA')]
		[MVCNameAsAttribute('horaSaida')]
		property HoraSaida: string read FHoraSaida write FHoraSaida;
    [MVCColumnAttribute('NUMERO_FATURA')]
		[MVCNameAsAttribute('numeroFatura')]
		property NumeroFatura: Integer read FNumeroFatura write FNumeroFatura;
    [MVCColumnAttribute('LOCAL_ENTREGA')]
		[MVCNameAsAttribute('localEntrega')]
		property LocalEntrega: string read FLocalEntrega write FLocalEntrega;
    [MVCColumnAttribute('LOCAL_COBRANCA')]
		[MVCNameAsAttribute('localCobranca')]
		property LocalCobranca: string read FLocalCobranca write FLocalCobranca;
    [MVCColumnAttribute('VALOR_SUBTOTAL')]
		[MVCNameAsAttribute('valorSubtotal')]
		property ValorSubtotal: Extended read FValorSubtotal write FValorSubtotal;
    [MVCColumnAttribute('TAXA_COMISSAO')]
		[MVCNameAsAttribute('taxaComissao')]
		property TaxaComissao: Extended read FTaxaComissao write FTaxaComissao;
    [MVCColumnAttribute('VALOR_COMISSAO')]
		[MVCNameAsAttribute('valorComissao')]
		property ValorComissao: Extended read FValorComissao write FValorComissao;
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
    [MVCColumnAttribute('VALOR_FRETE')]
		[MVCNameAsAttribute('valorFrete')]
		property ValorFrete: Extended read FValorFrete write FValorFrete;
    [MVCColumnAttribute('VALOR_SEGURO')]
		[MVCNameAsAttribute('valorSeguro')]
		property ValorSeguro: Extended read FValorSeguro write FValorSeguro;
    [MVCColumnAttribute('OBSERVACAO')]
		[MVCNameAsAttribute('observacao')]
		property Observacao: string read FObservacao write FObservacao;
    [MVCColumnAttribute('SITUACAO')]
		[MVCNameAsAttribute('situacao')]
		property Situacao: string read FSituacao write FSituacao;
    [MVCColumnAttribute('DIA_FIXO_PARCELA')]
		[MVCNameAsAttribute('diaFixoParcela')]
		property DiaFixoParcela: string read FDiaFixoParcela write FDiaFixoParcela;
      
    [MVCNameAsAttribute('vendaFrete')]
		property VendaFrete: TVendaFrete read FVendaFrete write FVendaFrete;

    [MVCNameAsAttribute('vendaOrcamentoCabecalho')]
		property VendaOrcamentoCabecalho: TVendaOrcamentoCabecalho read FVendaOrcamentoCabecalho write FVendaOrcamentoCabecalho;
    [MVCNameAsAttribute('vendaCondicoesPagamento')]
		property VendaCondicoesPagamento: TVendaCondicoesPagamento read FVendaCondicoesPagamento write FVendaCondicoesPagamento;
    [MVCNameAsAttribute('notaFiscalTipo')]
		property NotaFiscalTipo: TNotaFiscalTipo read FNotaFiscalTipo write FNotaFiscalTipo;
    [MVCNameAsAttribute('cliente')]
		property Cliente: TCliente read FCliente write FCliente;
    [MVCNameAsAttribute('transportadora')]
		property Transportadora: TTransportadora read FTransportadora write FTransportadora;
    [MVCNameAsAttribute('vendedor')]
		property Vendedor: TVendedor read FVendedor write FVendedor;
    [MapperListOf(TVendaComissao)]
	[MVCNameAsAttribute('listaVendaComissao')]
	property ListaVendaComissao: TObjectList<TVendaComissao> read FListaVendaComissao write FListaVendaComissao;
    [MapperListOf(TVendaDetalhe)]
	[MVCNameAsAttribute('listaVendaDetalhe')]
	property ListaVendaDetalhe: TObjectList<TVendaDetalhe> read FListaVendaDetalhe write FListaVendaDetalhe;
  end;

implementation

{ TVendaCabecalho }

constructor TVendaCabecalho.Create;
begin
  inherited;

  FListaVendaComissao := TObjectList<TVendaComissao>.Create;
  FListaVendaDetalhe := TObjectList<TVendaDetalhe>.Create;
  FVendaOrcamentoCabecalho := TVendaOrcamentoCabecalho.Create;
  FVendaCondicoesPagamento := TVendaCondicoesPagamento.Create;
  FNotaFiscalTipo := TNotaFiscalTipo.Create;
  FCliente := TCliente.Create;
  FTransportadora := TTransportadora.Create;
  FVendedor := TVendedor.Create;
  FVendaFrete := TVendaFrete.Create;
end;

destructor TVendaCabecalho.Destroy;
begin
  FreeAndNil(FListaVendaComissao);
  FreeAndNil(FListaVendaDetalhe);
  FreeAndNil(FVendaOrcamentoCabecalho);
  FreeAndNil(FVendaCondicoesPagamento);
  FreeAndNil(FNotaFiscalTipo);
  FreeAndNil(FCliente);
  FreeAndNil(FTransportadora);
  FreeAndNil(FVendedor);
  FreeAndNil(FVendaFrete);
  inherited;
end;



end.