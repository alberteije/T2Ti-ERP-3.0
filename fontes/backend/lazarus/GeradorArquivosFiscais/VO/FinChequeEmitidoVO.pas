{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_CHEQUE_EMITIDO] 
                                                                                
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
unit FinChequeEmitidoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFinChequeEmitidoVO = class(TVO)
  private
    FID: Integer;
    FID_CHEQUE: Integer;
    FDATA_EMISSAO: TDateTime;
    FBOM_PARA: TDateTime;
    FDATA_COMPENSACAO: TDateTime;
    FVALOR: Extended;
    FNOMINAL_A: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdCheque: Integer  read FID_CHEQUE write FID_CHEQUE;
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    property BomPara: TDateTime  read FBOM_PARA write FBOM_PARA;
    property DataCompensacao: TDateTime  read FDATA_COMPENSACAO write FDATA_COMPENSACAO;
    property Valor: Extended  read FVALOR write FVALOR;
    property NominalA: String  read FNOMINAL_A write FNOMINAL_A;


    //Transientes



  end;

  TListaFinChequeEmitidoVO = specialize TFPGObjectList<TFinChequeEmitidoVO>;

implementation


initialization
  Classes.RegisterClass(TFinChequeEmitidoVO);

finalization
  Classes.UnRegisterClass(TFinChequeEmitidoVO);

end.
