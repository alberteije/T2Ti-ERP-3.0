{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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
unit VendaOrcamentoCabecalho;

interface

uses
  Generics.Collections, System.SysUtils,
  VendaOrcamentoDetalhe, VendaCondicoesPagamento, Vendedor, Cliente, Transportadora, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TVendaOrcamentoCabecalho = class(TModelBase)
  private
    FId: Integer;
    FIdVendaCondicoesPagamento: Integer;
    FIdVendedor: Integer;
    FIdCliente: Integer;
    FIdTransportadora: Integer;
    FCodigo: string;
    FDataCadastro: TDateTime;
    FDataEntrega: TDateTime;
    FValidade: TDateTime;
    FTipoFrete: string;
    FValorSubtotal: Extended;
    FValorFrete: Extended;
    FTaxaComissao: Extended;
    FValorComissao: Extended;
    FTaxaDesconto: Extended;
    FValorDesconto: Extended;
    FValorTotal: Extended;
    FObservacao: string;
      
    FVendaCondicoesPagamento: TVendaCondicoesPagamento;
    FVendedor: TVendedor;
    FCliente: TCliente;
    FTransportadora: TTransportadora;
    FListaVendaOrcamentoDetalhe: TObjectList<TVendaOrcamentoDetalhe>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_VENDA_CONDICOES_PAGAMENTO')]
		[MVCNameAsAttribute('idVendaCondicoesPagamento')]
		property IdVendaCondicoesPagamento: Integer read FIdVendaCondicoesPagamento write FIdVendaCondicoesPagamento;
    [MVCColumnAttribute('ID_VENDEDOR')]
		[MVCNameAsAttribute('idVendedor')]
		property IdVendedor: Integer read FIdVendedor write FIdVendedor;
    [MVCColumnAttribute('ID_CLIENTE')]
		[MVCNameAsAttribute('idCliente')]
		property IdCliente: Integer read FIdCliente write FIdCliente;
    [MVCColumnAttribute('ID_TRANSPORTADORA')]
		[MVCNameAsAttribute('idTransportadora')]
		property IdTransportadora: Integer read FIdTransportadora write FIdTransportadora;
    [MVCColumnAttribute('CODIGO')]
		[MVCNameAsAttribute('codigo')]
		property Codigo: string read FCodigo write FCodigo;
    [MVCColumnAttribute('DATA_CADASTRO')]
		[MVCNameAsAttribute('dataCadastro')]
		property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
    [MVCColumnAttribute('DATA_ENTREGA')]
		[MVCNameAsAttribute('dataEntrega')]
		property DataEntrega: TDateTime read FDataEntrega write FDataEntrega;
    [MVCColumnAttribute('VALIDADE')]
		[MVCNameAsAttribute('validade')]
		property Validade: TDateTime read FValidade write FValidade;
    [MVCColumnAttribute('TIPO_FRETE')]
		[MVCNameAsAttribute('tipoFrete')]
		property TipoFrete: string read FTipoFrete write FTipoFrete;
    [MVCColumnAttribute('VALOR_SUBTOTAL')]
		[MVCNameAsAttribute('valorSubtotal')]
		property ValorSubtotal: Extended read FValorSubtotal write FValorSubtotal;
    [MVCColumnAttribute('VALOR_FRETE')]
		[MVCNameAsAttribute('valorFrete')]
		property ValorFrete: Extended read FValorFrete write FValorFrete;
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
    [MVCColumnAttribute('OBSERVACAO')]
		[MVCNameAsAttribute('observacao')]
		property Observacao: string read FObservacao write FObservacao;
      
    [MVCNameAsAttribute('vendaCondicoesPagamento')]
		property VendaCondicoesPagamento: TVendaCondicoesPagamento read FVendaCondicoesPagamento write FVendaCondicoesPagamento;
    [MVCNameAsAttribute('vendedor')]
		property Vendedor: TVendedor read FVendedor write FVendedor;
    [MVCNameAsAttribute('cliente')]
		property Cliente: TCliente read FCliente write FCliente;
    [MVCNameAsAttribute('transportadora')]
		property Transportadora: TTransportadora read FTransportadora write FTransportadora;
    [MapperListOf(TVendaOrcamentoDetalhe)]
	[MVCNameAsAttribute('listaVendaOrcamentoDetalhe')]
	property ListaVendaOrcamentoDetalhe: TObjectList<TVendaOrcamentoDetalhe> read FListaVendaOrcamentoDetalhe write FListaVendaOrcamentoDetalhe;
  end;

implementation

{ TVendaOrcamentoCabecalho }

constructor TVendaOrcamentoCabecalho.Create;
begin
  inherited;

  FListaVendaOrcamentoDetalhe := TObjectList<TVendaOrcamentoDetalhe>.Create;
  FVendaCondicoesPagamento := TVendaCondicoesPagamento.Create;
  FVendedor := TVendedor.Create;
  FCliente := TCliente.Create;
  FTransportadora := TTransportadora.Create;
end;

destructor TVendaOrcamentoCabecalho.Destroy;
begin
  FreeAndNil(FListaVendaOrcamentoDetalhe);
  FreeAndNil(FVendaCondicoesPagamento);
  FreeAndNil(FVendedor);
  FreeAndNil(FCliente);
  FreeAndNil(FTransportadora);
  inherited;
end;



end.