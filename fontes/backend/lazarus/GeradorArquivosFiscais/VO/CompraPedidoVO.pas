{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [COMPRA_PEDIDO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2015 T2Ti.COM
                                                                                
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
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit CompraPedidoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaFornecedorVO, CompraTipoPedidoVO, CompraPedidoDetalheVO,
  CompraCotacaoPedidoDetalheVO;

type
  TCompraPedidoVO = class(TVO)
  private
    FID: Integer;
    FID_COMPRA_TIPO_PEDIDO: Integer;
    FID_FORNECEDOR: Integer;
    FDATA_PEDIDO: TDateTime;
    FDATA_PREVISTA_ENTREGA: TDateTime;
    FDATA_PREVISAO_PAGAMENTO: TDateTime;
    FLOCAL_ENTREGA: String;
    FLOCAL_COBRANCA: String;
    FCONTATO: String;
    FVALOR_SUBTOTAL: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_TOTAL_PEDIDO: Extended;
    FTIPO_FRETE: String;
    FFORMA_PAGAMENTO: String;
    FBASE_CALCULO_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FBASE_CALCULO_ICMS_ST: Extended;
    FVALOR_ICMS_ST: Extended;
    FVALOR_TOTAL_PRODUTOS: Extended;
    FVALOR_FRETE: Extended;
    FVALOR_SEGURO: Extended;
    FVALOR_OUTRAS_DESPESAS: Extended;
    FVALOR_IPI: Extended;
    FVALOR_TOTAL_NF: Extended;
    FQUANTIDADE_PARCELAS: Integer;
    FDIAS_PRIMEIRO_VENCIMENTO: Integer;
    FDIAS_INTERVALO: Integer;

    //Transientes
    FFornecedorNome: String;
    FCompraTipoPedidoNome: String;

    FFornecedorVO: TViewPessoaFornecedorVO;
    FCompraTipoPedidoVO: TCompraTipoPedidoVO;

    FListaCompraPedidoDetalheVO: TListaCompraPedidoDetalheVO;
    FListaCompraCotacaoPedidoDetalheVO: TListaCompraCotacaoPedidoDetalheVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdCompraTipoPedido: Integer  read FID_COMPRA_TIPO_PEDIDO write FID_COMPRA_TIPO_PEDIDO;
    property CompraTipoPedidoNome: String read FCompraTipoPedidoNome write FCompraTipoPedidoNome;

    property IdFornecedor: Integer  read FID_FORNECEDOR write FID_FORNECEDOR;
    property FornecedorNome: String read FFornecedorNome write FFornecedorNome;

    property DataPedido: TDateTime  read FDATA_PEDIDO write FDATA_PEDIDO;
    property DataPrevistaEntrega: TDateTime  read FDATA_PREVISTA_ENTREGA write FDATA_PREVISTA_ENTREGA;
    property DataPrevisaoPagamento: TDateTime  read FDATA_PREVISAO_PAGAMENTO write FDATA_PREVISAO_PAGAMENTO;
    property LocalEntrega: String  read FLOCAL_ENTREGA write FLOCAL_ENTREGA;
    property LocalCobranca: String  read FLOCAL_COBRANCA write FLOCAL_COBRANCA;
    property Contato: String  read FCONTATO write FCONTATO;
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    property ValorTotalPedido: Extended  read FVALOR_TOTAL_PEDIDO write FVALOR_TOTAL_PEDIDO;
    property TipoFrete: String  read FTIPO_FRETE write FTIPO_FRETE;
    property FormaPagamento: String  read FFORMA_PAGAMENTO write FFORMA_PAGAMENTO;
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    property BaseCalculoIcmsSt: Extended  read FBASE_CALCULO_ICMS_ST write FBASE_CALCULO_ICMS_ST;
    property ValorIcmsSt: Extended  read FVALOR_ICMS_ST write FVALOR_ICMS_ST;
    property ValorTotalProdutos: Extended  read FVALOR_TOTAL_PRODUTOS write FVALOR_TOTAL_PRODUTOS;
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
    property ValorSeguro: Extended  read FVALOR_SEGURO write FVALOR_SEGURO;
    property ValorOutrasDespesas: Extended  read FVALOR_OUTRAS_DESPESAS write FVALOR_OUTRAS_DESPESAS;
    property ValorIpi: Extended  read FVALOR_IPI write FVALOR_IPI;
    property ValorTotalNf: Extended  read FVALOR_TOTAL_NF write FVALOR_TOTAL_NF;
    property QuantidadeParcelas: Integer  read FQUANTIDADE_PARCELAS write FQUANTIDADE_PARCELAS;
    property DiasPrimeiroVencimento: Integer  read FDIAS_PRIMEIRO_VENCIMENTO write FDIAS_PRIMEIRO_VENCIMENTO;
    property DiasIntervalo: Integer  read FDIAS_INTERVALO write FDIAS_INTERVALO;

    //Transientes
    property CompraTipoPedidoVO: TCompraTipoPedidoVO read FCompraTipoPedidoVO write FCompraTipoPedidoVO;

    property FornecedorVO: TViewPessoaFornecedorVO read FFornecedorVO write FFornecedorVO;

    property ListaCompraPedidoDetalheVO: TListaCompraPedidoDetalheVO read FListaCompraPedidoDetalheVO write FListaCompraPedidoDetalheVO;

    property ListaCompraCotacaoPedidoDetalheVO: TListaCompraCotacaoPedidoDetalheVO read FListaCompraCotacaoPedidoDetalheVO write FListaCompraCotacaoPedidoDetalheVO;

  end;

  TListaCompraPedidoVO = specialize TFPGObjectList<TCompraPedidoVO>;

implementation

constructor TCompraPedidoVO.Create;
begin
  inherited;

  FFornecedorVO := TViewPessoaFornecedorVO.Create;
  FCompraTipoPedidoVO := TCompraTipoPedidoVO.Create;

  FListaCompraPedidoDetalheVO := TListaCompraPedidoDetalheVO.Create;
  FListaCompraCotacaoPedidoDetalheVO := TListaCompraCotacaoPedidoDetalheVO.Create;
end;

destructor TCompraPedidoVO.Destroy;
begin
  FreeAndNil(FFornecedorVO);
  FreeAndNil(FCompraTipoPedidoVO);

  FreeAndNil(FListaCompraPedidoDetalheVO);
  FreeAndNil(FListaCompraCotacaoPedidoDetalheVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TCompraPedidoVO);

finalization
  Classes.UnRegisterClass(TCompraPedidoVO);

end.
