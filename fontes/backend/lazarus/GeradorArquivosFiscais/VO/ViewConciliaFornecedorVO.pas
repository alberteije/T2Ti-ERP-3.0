{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_CONCILIA_FORNECEDOR] 
                                                                                
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
unit ViewConciliaFornecedorVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TViewConciliaFornecedorVO = class(TVO)
  private
    FID: Integer;
    FID_FIN_PARCELA_PAGAR: Integer;
    FID_FIN_TIPO_PAGAMENTO: Integer;
    FID_CONTA_CAIXA: Integer;
    FDATA_PAGAMENTO: TDateTime;
    FTAXA_JURO: Extended;
    FTAXA_MULTA: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_JURO: Extended;
    FVALOR_MULTA: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_PAGO: Extended;
    FHISTORICO: String;
    FID_FORNECEDOR: Integer;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdFinParcelaPagar: Integer  read FID_FIN_PARCELA_PAGAR write FID_FIN_PARCELA_PAGAR;
    property IdFinTipoPagamento: Integer  read FID_FIN_TIPO_PAGAMENTO write FID_FIN_TIPO_PAGAMENTO;
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    property DataPagamento: TDateTime  read FDATA_PAGAMENTO write FDATA_PAGAMENTO;
    property TaxaJuro: Extended  read FTAXA_JURO write FTAXA_JURO;
    property TaxaMulta: Extended  read FTAXA_MULTA write FTAXA_MULTA;
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    property ValorJuro: Extended  read FVALOR_JURO write FVALOR_JURO;
    property ValorMulta: Extended  read FVALOR_MULTA write FVALOR_MULTA;
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    property ValorPago: Extended  read FVALOR_PAGO write FVALOR_PAGO;
    property Historico: String  read FHISTORICO write FHISTORICO;
    property IdFornecedor: Integer  read FID_FORNECEDOR write FID_FORNECEDOR;


    //Transientes



  end;

  TListaViewConciliaFornecedorVO = specialize TFPGObjectList<TViewConciliaFornecedorVO>;

implementation


initialization
  Classes.RegisterClass(TViewConciliaFornecedorVO);

finalization
  Classes.UnRegisterClass(TViewConciliaFornecedorVO);

end.
