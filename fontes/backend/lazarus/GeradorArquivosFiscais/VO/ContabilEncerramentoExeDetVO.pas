{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_ENCERRAMENTO_EXE_DET] 
                                                                                
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
unit ContabilEncerramentoExeDetVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TContabilEncerramentoExeDetVO = class(TVO)
  private
    FID: Integer;
    FID_CONTABIL_CONTA: Integer;
    FID_CONTABIL_ENCERRAMENTO_EXE: Integer;
    FSALDO_ANTERIOR: Extended;
    FVALOR_DEBITO: Extended;
    FVALOR_CREDITO: Extended;
    FSALDO: Extended;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdContabilConta: Integer  read FID_CONTABIL_CONTA write FID_CONTABIL_CONTA;
    property IdContabilEncerramentoExe: Integer  read FID_CONTABIL_ENCERRAMENTO_EXE write FID_CONTABIL_ENCERRAMENTO_EXE;
    property SaldoAnterior: Extended  read FSALDO_ANTERIOR write FSALDO_ANTERIOR;
    property ValorDebito: Extended  read FVALOR_DEBITO write FVALOR_DEBITO;
    property ValorCredito: Extended  read FVALOR_CREDITO write FVALOR_CREDITO;
    property Saldo: Extended  read FSALDO write FSALDO;


    //Transientes



  end;

  TListaContabilEncerramentoExeDetVO = specialize TFPGObjectList<TContabilEncerramentoExeDetVO>;

implementation


initialization
  Classes.RegisterClass(TContabilEncerramentoExeDetVO);

finalization
  Classes.UnRegisterClass(TContabilEncerramentoExeDetVO);

end.
