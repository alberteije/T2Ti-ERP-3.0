{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_PARCELA_RECEBER] 
                                                                                
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
unit FinParcelaReceberVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  FinParcelaRecebimentoVO, FinChequeRecebidoVO;

type
  TFinParcelaReceberVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FID_FIN_LANCAMENTO_RECEBER: Integer;
    FID_FIN_STATUS_PARCELA: Integer;
    FNUMERO_PARCELA: Integer;
    FDATA_EMISSAO: TDateTime;
    FDATA_VENCIMENTO: TDateTime;
    FDESCONTO_ATE: TDateTime;
    FVALOR: Extended;
    FTAXA_JURO: Extended;
    FTAXA_MULTA: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_JURO: Extended;
    FVALOR_MULTA: Extended;
    FVALOR_DESCONTO: Extended;
    FEMITIU_BOLETO: String;
    FBOLETO_NOSSO_NUMERO: String;

    //Objetos utilizados apenas para persistência - Não serão utilizados nas consultas
    //Serão usados no método BaixarParcela
    FFinParcelaRecebimentoVO: TFinParcelaRecebimentoVO;
    FFinChequeRecebidoVO: TFinChequeRecebidoVO;
    //FListaParcelaReceberVO: TListaFinParcelaReceberVO;
    FListaParcelaRecebimentoVO: TListaFinParcelaRecebimentoVO;

  published 
    property Id: Integer  read FID write FID;
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    property IdFinLancamentoReceber: Integer  read FID_FIN_LANCAMENTO_RECEBER write FID_FIN_LANCAMENTO_RECEBER;
    property IdFinStatusParcela: Integer  read FID_FIN_STATUS_PARCELA write FID_FIN_STATUS_PARCELA;
    property NumeroParcela: Integer  read FNUMERO_PARCELA write FNUMERO_PARCELA;
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    property DescontoAte: TDateTime  read FDESCONTO_ATE write FDESCONTO_ATE;
    property Valor: Extended  read FVALOR write FVALOR;
    property TaxaJuro: Extended  read FTAXA_JURO write FTAXA_JURO;
    property TaxaMulta: Extended  read FTAXA_MULTA write FTAXA_MULTA;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property ValorJuro: Extended  read FVALOR_JURO write FVALOR_JURO;
    property ValorMulta: Extended  read FVALOR_MULTA write FVALOR_MULTA;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    property EmitiuBoleto: String  read FEMITIU_BOLETO write FEMITIU_BOLETO;
    property BoletoNossoNumero: String  read FBOLETO_NOSSO_NUMERO write FBOLETO_NOSSO_NUMERO;


    //Objetos utilizados apenas para persistência - Não serão utilizados nas consultas
    //Serão usados no método BaixarParcela
    property FinParcelaRecebimentoVO: TFinParcelaRecebimentoVO read FFinParcelaRecebimentoVO write FFinParcelaRecebimentoVO;
    property FinChequeRecebidoVO: TFinChequeRecebidoVO read FFinChequeRecebidoVO write FFinChequeRecebidoVO;
    //property ListaParcelaReceberVO: TListaFinParcelaReceberVO read FListaParcelaReceberVO write FListaParcelaReceberVO;
    property ListaParcelaRecebimentoVO: TListaFinParcelaRecebimentoVO read FListaParcelaRecebimentoVO write FListaParcelaRecebimentoVO;

  end;

  TListaFinParcelaReceberVO = specialize TFPGObjectList<TFinParcelaReceberVO>;

implementation


initialization
  Classes.RegisterClass(TFinParcelaReceberVO);

finalization
  Classes.UnRegisterClass(TFinParcelaReceberVO);

end.
