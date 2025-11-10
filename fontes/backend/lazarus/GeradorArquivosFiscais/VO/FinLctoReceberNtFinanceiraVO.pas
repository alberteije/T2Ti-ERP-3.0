{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_LCTO_RECEBER_NT_FINANCEIRA] 
                                                                                
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
unit FinLctoReceberNtFinanceiraVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFinLctoReceberNtFinanceiraVO = class(TVO)
  private
    FID: Integer;
    FID_FIN_LANCAMENTO_RECEBER: Integer;
    FID_CONTABIL_LANCAMENTO_DET: Integer;
    FID_NATUREZA_FINANCEIRA: Integer;
    FDATA_INCLUSAO: TDateTime;
    FVALOR: Extended;
    FPERCENTUAL: Extended;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdFinLancamentoReceber: Integer  read FID_FIN_LANCAMENTO_RECEBER write FID_FIN_LANCAMENTO_RECEBER;
    property IdContabilLancamentoDet: Integer  read FID_CONTABIL_LANCAMENTO_DET write FID_CONTABIL_LANCAMENTO_DET;
    property IdNaturezaFinanceira: Integer  read FID_NATUREZA_FINANCEIRA write FID_NATUREZA_FINANCEIRA;
    property DataInclusao: TDateTime  read FDATA_INCLUSAO write FDATA_INCLUSAO;
    property Valor: Extended  read FVALOR write FVALOR;
    property Percentual: Extended  read FPERCENTUAL write FPERCENTUAL;


    //Transientes



  end;

  TListaFinLctoReceberNtFinanceiraVO = specialize TFPGObjectList<TFinLctoReceberNtFinanceiraVO>;

implementation


initialization
  Classes.RegisterClass(TFinLctoReceberNtFinanceiraVO);

finalization
  Classes.UnRegisterClass(TFinLctoReceberNtFinanceiraVO);

end.
