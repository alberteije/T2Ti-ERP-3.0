{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_PARCELA_PAGAR] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2014 T2Ti.COM                                          
                                                                                
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
unit FinParcelaPagarVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  FinParcelaPagamentoVO, FinChequeEmitidoVO;

type
  TFinParcelaPagarVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FID_FIN_LANCAMENTO_PAGAR: Integer;
    FID_FIN_STATUS_PARCELA: Integer;
    FNUMERO_PARCELA: Integer;
    FDATA_EMISSAO: TDateTime;
    FDATA_VENCIMENTO: TDateTime;
    FDESCONTO_ATE: TDateTime;
    FSOFRE_RETENCAO: String;
    FVALOR: Extended;
    FTAXA_JURO: Extended;
    FTAXA_MULTA: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_JURO: Extended;
    FVALOR_MULTA: Extended;
    FVALOR_DESCONTO: Extended;

    //Objetos utilizados apenas para persistência - Não serão utilizados nas consultas
    //Serão usados no método BaixarParcela
    FFinParcelaPagamentoVO: TFinParcelaPagamentoVO;
    FFinChequeEmitidoVO: TFinChequeEmitidoVO;
    //FListaParcelaPagarVO: TListaFinParcelaPagarVO;
    FListaParcelaPagamentoVO: TListaFinParcelaPagamentoVO;

  published
    property Id: Integer  read FID write FID;
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    property IdFinLancamentoPagar: Integer  read FID_FIN_LANCAMENTO_PAGAR write FID_FIN_LANCAMENTO_PAGAR;
    property IdFinStatusParcela: Integer  read FID_FIN_STATUS_PARCELA write FID_FIN_STATUS_PARCELA;
    property NumeroParcela: Integer  read FNUMERO_PARCELA write FNUMERO_PARCELA;
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    property DescontoAte: TDateTime  read FDESCONTO_ATE write FDESCONTO_ATE;
    property SofreRetencao: String  read FSOFRE_RETENCAO write FSOFRE_RETENCAO;
    property Valor: Extended  read FVALOR write FVALOR;
    property TaxaJuro: Extended  read FTAXA_JURO write FTAXA_JURO;
    property TaxaMulta: Extended  read FTAXA_MULTA write FTAXA_MULTA;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property ValorJuro: Extended  read FVALOR_JURO write FVALOR_JURO;
    property ValorMulta: Extended  read FVALOR_MULTA write FVALOR_MULTA;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;


    //Objetos utilizados apenas para persistência - Não serão utilizados nas consultas
    //Serão usados no método BaixarParcela
    property FinParcelaPagamentoVO: TFinParcelaPagamentoVO read FFinParcelaPagamentoVO write FFinParcelaPagamentoVO;
    property FinChequeEmitidoVO: TFinChequeEmitidoVO read FFinChequeEmitidoVO write FFinChequeEmitidoVO;
    //property ListaParcelaPagarVO: TListaFinParcelaPagarVO read FListaParcelaPagarVO write FListaParcelaPagarVO;
    property ListaParcelaPagamentoVO: TListaFinParcelaPagamentoVO read FListaParcelaPagamentoVO write FListaParcelaPagamentoVO;


  end;

  TListaFinParcelaPagarVO = specialize TFPGObjectList<TFinParcelaPagarVO>;

implementation


initialization
  Classes.RegisterClass(TFinParcelaPagarVO);

finalization
  Classes.UnRegisterClass(TFinParcelaPagarVO);

end.
