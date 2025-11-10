{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_PARCELA_RECEBIMENTO] 
                                                                                
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
unit FinParcelaRecebimentoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFinParcelaRecebimentoVO = class(TVO)
  private
    FID: Integer;
    FID_FIN_PARCELA_RECEBER: Integer;
    FID_FIN_TIPO_RECEBIMENTO: Integer;
    FID_FIN_CHEQUE_RECEBIDO: Integer;
    FID_CONTA_CAIXA: Integer;
    FDATA_RECEBIMENTO: TDateTime;
    FTAXA_JURO: Extended;
    FTAXA_MULTA: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_JURO: Extended;
    FVALOR_MULTA: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_RECEBIDO: Extended;
    FHISTORICO: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdFinParcelaReceber: Integer  read FID_FIN_PARCELA_RECEBER write FID_FIN_PARCELA_RECEBER;
    property IdFinTipoRecebimento: Integer  read FID_FIN_TIPO_RECEBIMENTO write FID_FIN_TIPO_RECEBIMENTO;
    property IdFinChequeRecebido: Integer  read FID_FIN_CHEQUE_RECEBIDO write FID_FIN_CHEQUE_RECEBIDO;
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    property DataRecebimento: TDateTime  read FDATA_RECEBIMENTO write FDATA_RECEBIMENTO;
    property TaxaJuro: Extended  read FTAXA_JURO write FTAXA_JURO;
    property TaxaMulta: Extended  read FTAXA_MULTA write FTAXA_MULTA;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property ValorJuro: Extended  read FVALOR_JURO write FVALOR_JURO;
    property ValorMulta: Extended  read FVALOR_MULTA write FVALOR_MULTA;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    property ValorRecebido: Extended  read FVALOR_RECEBIDO write FVALOR_RECEBIDO;
    property Historico: String  read FHISTORICO write FHISTORICO;


    //Transientes



  end;

  TListaFinParcelaRecebimentoVO = specialize TFPGObjectList<TFinParcelaRecebimentoVO>;

implementation


initialization
  Classes.RegisterClass(TFinParcelaRecebimentoVO);

finalization
  Classes.UnRegisterClass(TFinParcelaRecebimentoVO);

end.
