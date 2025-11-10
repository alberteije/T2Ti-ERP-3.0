{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VENDA_CABECALHO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2016 T2Ti.COM                                          
                                                                                
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
unit VendaCabecalhoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  ViewPessoaTransportadoraVO, NotaFiscalTipoVO, ViewPessoaClienteVO, VendedorVO,
  VendaCondicoesPagamentoVO, VendaOrcamentoCabecalhoVO, VendaDetalheVO,
  VendaComissaoVO;

type
  TVendaCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_VENDA_ROMANEIO_ENTREGA: Integer;
    FID_VENDA_ORCAMENTO_CABECALHO: Integer;
    FID_VENDA_CONDICOES_PAGAMENTO: Integer;
    FID_TRANSPORTADORA: Integer;
    FID_TIPO_NOTA_FISCAL: Integer;
    FID_CLIENTE: Integer;
    FID_VENDEDOR: Integer;
    FDATA_VENDA: TDateTime;
    FDATA_SAIDA: TDateTime;
    FHORA_SAIDA: String;
    FNUMERO_FATURA: Integer;
    FLOCAL_ENTREGA: String;
    FLOCAL_COBRANCA: String;
    FVALOR_SUBTOTAL: Extended;
    FTAXA_COMISSAO: Extended;
    FVALOR_COMISSAO: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_TOTAL: Extended;
    FTIPO_FRETE: String;
    FFORMA_PAGAMENTO: String;
    FVALOR_FRETE: Extended;
    FVALOR_SEGURO: Extended;
    FOBSERVACAO: String;
    FSITUACAO: String;

    //Transientes
    FTransportadoraNome: String;
    FTipoNotaFiscalModelo: String;
    FClienteNome: String;
    FVendedorNome: String;
    FVendaCondicoesPagamentoNome: String;
    FVendaOrcamentoCabecalhoCodigo: String;

    FTransportadoraVO: TViewPessoaTransportadoraVO;
    FTipoNotaFiscalVO: TNotaFiscalTipoVO;
    FClienteVO: TViewPessoaClienteVO;
    FVendedorVO: TVendedorVO;
    FVendaCondicoesPagamentoVO: TVendaCondicoesPagamentoVO;
    FVendaOrcamentoCabecalhoVO: TVendaOrcamentoCabecalhoVO;
    FVendaComissaoVO: TVendaComissaoVO;

    FListaVendaDetalheVO: TListaVendaDetalheVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdVendaRomaneioEntrega: Integer  read FID_VENDA_ROMANEIO_ENTREGA write FID_VENDA_ROMANEIO_ENTREGA;

    property IdVendaOrcamentoCabecalho: Integer  read FID_VENDA_ORCAMENTO_CABECALHO write FID_VENDA_ORCAMENTO_CABECALHO;
    property VendaOrcamentoCabecalhoCodigo: String read FVendaOrcamentoCabecalhoCodigo write FVendaOrcamentoCabecalhoCodigo;

    property IdVendaCondicoesPagamento: Integer  read FID_VENDA_CONDICOES_PAGAMENTO write FID_VENDA_CONDICOES_PAGAMENTO;
    property VendaCondicoesPagamentoNome: String read FVendaCondicoesPagamentoNome write FVendaCondicoesPagamentoNome;

    property IdTransportadora: Integer  read FID_TRANSPORTADORA write FID_TRANSPORTADORA;
    property TransportadoraNome: String read FTransportadoraNome write FTransportadoraNome;

    property IdTipoNotaFiscal: Integer  read FID_TIPO_NOTA_FISCAL write FID_TIPO_NOTA_FISCAL;
    property TipoNotaFiscalModelo: String read FTipoNotaFiscalModelo write FTipoNotaFiscalModelo;

    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    property ClienteNome: String read FClienteNome write FClienteNome;

    property IdVendedor: Integer  read FID_VENDEDOR write FID_VENDEDOR;
    property VendedorNome: String read FVendedorNome write FVendedorNome;

    property DataVenda: TDateTime  read FDATA_VENDA write FDATA_VENDA;
    property DataSaida: TDateTime  read FDATA_SAIDA write FDATA_SAIDA;
    property HoraSaida: String  read FHORA_SAIDA write FHORA_SAIDA;
    property NumeroFatura: Integer  read FNUMERO_FATURA write FNUMERO_FATURA;
    property LocalEntrega: String  read FLOCAL_ENTREGA write FLOCAL_ENTREGA;
    property LocalCobranca: String  read FLOCAL_COBRANCA write FLOCAL_COBRANCA;
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    property TaxaComissao: Extended  read FTAXA_COMISSAO write FTAXA_COMISSAO;
    property ValorComissao: Extended  read FVALOR_COMISSAO write FVALOR_COMISSAO;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    property TipoFrete: String  read FTIPO_FRETE write FTIPO_FRETE;
    property FormaPagamento: String  read FFORMA_PAGAMENTO write FFORMA_PAGAMENTO;
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
    property ValorSeguro: Extended  read FVALOR_SEGURO write FVALOR_SEGURO;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    property Situacao: String  read FSITUACAO write FSITUACAO;


    //Transientes

    property TransportadoraVO: TViewPessoaTransportadoraVO read FTransportadoraVO write FTransportadoraVO;

    property ClienteVO: TViewPessoaClienteVO read FClienteVO write FClienteVO;

    property VendedorVO: TVendedorVO read FVendedorVO write FVendedorVO;

    property VendaCondicoesPagamentoVO: TVendaCondicoesPagamentoVO read FVendaCondicoesPagamentoVO write FVendaCondicoesPagamentoVO;

    property TipoNotaFiscalVO: TNotaFiscalTipoVO read FTipoNotaFiscalVO write FTipoNotaFiscalVO;

    property VendaOrcamentoCabecalhoVO: TVendaOrcamentoCabecalhoVO read FVendaOrcamentoCabecalhoVO write FVendaOrcamentoCabecalhoVO;

    property VendaComissaoVO: TVendaComissaoVO read FVendaComissaoVO write FVendaComissaoVO;

    property ListaVendaDetalheVO: TListaVendaDetalheVO read FListaVendaDetalheVO write FListaVendaDetalheVO;


  end;

  TListaVendaCabecalhoVO = specialize TFPGObjectList<TVendaCabecalhoVO>;

implementation


constructor TVendaCabecalhoVO.Create;
begin
  inherited;

  FTransportadoraVO := TViewPessoaTransportadoraVO.Create;
  FTipoNotaFiscalVO := TNotaFiscalTipoVO.Create;
  FClienteVO := TViewPessoaClienteVO.Create;
  FVendedorVO := TVendedorVO.Create;
  FVendaCondicoesPagamentoVO := TVendaCondicoesPagamentoVO.Create;
  FVendaOrcamentoCabecalhoVO := TVendaOrcamentoCabecalhoVO.Create;
  FVendaComissaoVO := TVendaComissaoVO.Create;

  FListaVendaDetalheVO := TListaVendaDetalheVO.Create;
end;

destructor TVendaCabecalhoVO.Destroy;
begin
  FreeAndNil(FTransportadoraVO);
  FreeAndNil(FTipoNotaFiscalVO);
  FreeAndNil(FClienteVO);
  FreeAndNil(FVendedorVO);
  FreeAndNil(FVendaCondicoesPagamentoVO);
  FreeAndNil(FVendaOrcamentoCabecalhoVO);
  FreeAndNil(FVendaComissaoVO);

  FreeAndNil(FListaVendaDetalheVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TVendaCabecalhoVO);

finalization
  Classes.UnRegisterClass(TVendaCabecalhoVO);

end.
