{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_FIN_CHEQUE_EMITIDO] 
                                                                                
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
unit ViewFinChequeEmitidoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TViewFinChequeEmitidoVO = class(TVO)
  private
    FID_CONTA_CAIXA: Integer;
    FNOME_CONTA_CAIXA: String;
    FTALAO: String;
    FNUMERO_TALAO: Integer;
    FID_CHEQUE: Integer;
    FNUMERO_CHEQUE: Integer;
    FSTATUS_CHEQUE: String;
    FDATA_STATUS: TDateTime;
    FVALOR: Extended;

    //Transientes



  published 
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    property NomeContaCaixa: String  read FNOME_CONTA_CAIXA write FNOME_CONTA_CAIXA;
    property Talao: String  read FTALAO write FTALAO;
    property NumeroTalao: Integer  read FNUMERO_TALAO write FNUMERO_TALAO;
    property IdCheque: Integer  read FID_CHEQUE write FID_CHEQUE;
    property NumeroCheque: Integer  read FNUMERO_CHEQUE write FNUMERO_CHEQUE;
    property StatusCheque: String  read FSTATUS_CHEQUE write FSTATUS_CHEQUE;
    property DataStatus: TDateTime  read FDATA_STATUS write FDATA_STATUS;
    property Valor: Extended  read FVALOR write FVALOR;


    //Transientes



  end;

  TListaViewFinChequeEmitidoVO = specialize TFPGObjectList<TViewFinChequeEmitidoVO>;

implementation


initialization
  Classes.RegisterClass(TViewFinChequeEmitidoVO);

finalization
  Classes.UnRegisterClass(TViewFinChequeEmitidoVO);

end.
