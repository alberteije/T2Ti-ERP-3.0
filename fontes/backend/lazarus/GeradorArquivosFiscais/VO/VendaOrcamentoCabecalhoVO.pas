{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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
unit VendaOrcamentoCabecalhoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  VendedorVO, ViewPessoaTransportadoraVO, ViewPessoaClienteVO, VendaCondicoesPagamentoVO,
  VendaOrcamentoDetalheVO;

type
  TVendaOrcamentoCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_VENDA_CONDICOES_PAGAMENTO: Integer;
    FID_VENDEDOR: Integer;
    FID_TRANSPORTADORA: Integer;
    FID_CLIENTE: Integer;
    FTIPO: String;
    FCODIGO: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_ENTREGA: TDateTime;
    FVALIDADE: TDateTime;
    FTIPO_FRETE: String;
    FVALOR_SUBTOTAL: Extended;
    FVALOR_FRETE: Extended;
    FTAXA_COMISSAO: Extended;
    FVALOR_COMISSAO: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_TOTAL: Extended;
    FOBSERVACAO: String;
    FSITUACAO: String;

    //Transientes
    FVendedorNome: String;
    FTransportadoraNome: String;
    FClienteNome: String;
    FVendaCondicoesPagamentoNome: String;

    FVendedorVO: TVendedorVO;
    FTransportadoraVO: TViewPessoaTransportadoraVO;
    FClienteVO: TViewPessoaClienteVO;
    FVendaCondicoesPagamentoVO: TVendaCondicoesPagamentoVO;

    FListaVendaOrcamentoDetalheVO: TListaVendaOrcamentoDetalheVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;

    property IdVendaCondicoesPagamento: Integer  read FID_VENDA_CONDICOES_PAGAMENTO write FID_VENDA_CONDICOES_PAGAMENTO;
    property VendaCondicoesPagamentoNome: String read FVendaCondicoesPagamentoNome write FVendaCondicoesPagamentoNome;

    property IdVendedor: Integer  read FID_VENDEDOR write FID_VENDEDOR;
    property VendedorNome: String read FVendedorNome write FVendedorNome;

    property IdTransportadora: Integer  read FID_TRANSPORTADORA write FID_TRANSPORTADORA;
    property TransportadoraNome: String read FTransportadoraNome write FTransportadoraNome;

    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    property ClienteNome: String read FClienteNome write FClienteNome;

    property Tipo: String  read FTIPO write FTIPO;
    property Codigo: String  read FCODIGO write FCODIGO;
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    property DataEntrega: TDateTime  read FDATA_ENTREGA write FDATA_ENTREGA;
    property Validade: TDateTime  read FVALIDADE write FVALIDADE;
    property TipoFrete: String  read FTIPO_FRETE write FTIPO_FRETE;
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
    property TaxaComissao: Extended  read FTAXA_COMISSAO write FTAXA_COMISSAO;
    property ValorComissao: Extended  read FVALOR_COMISSAO write FVALOR_COMISSAO;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    property Situacao: String  read FSITUACAO write FSITUACAO;


    //Transientes

    property TransportadoraVO: TViewPessoaTransportadoraVO read FTransportadoraVO write FTransportadoraVO;

    property ClienteVO: TViewPessoaClienteVO read FClienteVO write FClienteVO;

    property VendedorVO: TVendedorVO read FVendedorVO write FVendedorVO;

    property VendaCondicoesPagamentoVO: TVendaCondicoesPagamentoVO read FVendaCondicoesPagamentoVO write FVendaCondicoesPagamentoVO;

    property ListaVendaOrcamentoDetalheVO: TListaVendaOrcamentoDetalheVO read FListaVendaOrcamentoDetalheVO write FListaVendaOrcamentoDetalheVO;


  end;

  TListaVendaOrcamentoCabecalhoVO = specialize TFPGObjectList<TVendaOrcamentoCabecalhoVO>;

implementation


constructor TVendaOrcamentoCabecalhoVO.Create;
begin
  inherited;

  FTransportadoraVO := TViewPessoaTransportadoraVO.Create;
  FClienteVO := TViewPessoaClienteVO.Create;
  FVendedorVO := TVendedorVO.Create;
  FVendaCondicoesPagamentoVO := TVendaCondicoesPagamentoVO.Create;

  FListaVendaOrcamentoDetalheVO := TListaVendaOrcamentoDetalheVO.Create;
end;

destructor TVendaOrcamentoCabecalhoVO.Destroy;
begin
  FreeAndNil(FTransportadoraVO);
  FreeAndNil(FClienteVO);
  FreeAndNil(FVendedorVO);
  FreeAndNil(FVendaCondicoesPagamentoVO);

  FreeAndNil(FListaVendaOrcamentoDetalheVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TVendaOrcamentoCabecalhoVO);

finalization
  Classes.UnRegisterClass(TVendaOrcamentoCabecalhoVO);

end.
