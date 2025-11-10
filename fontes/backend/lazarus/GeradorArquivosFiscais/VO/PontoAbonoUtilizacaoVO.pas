{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PONTO_ABONO_UTILIZACAO] 
                                                                                
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
unit PontoAbonoUtilizacaoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TPontoAbonoUtilizacaoVO = class(TVO)
  private
    FID: Integer;
    FID_PONTO_ABONO: Integer;
    FDATA_UTILIZACAO: TDateTime;
    FOBSERVACAO: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdPontoAbono: Integer  read FID_PONTO_ABONO write FID_PONTO_ABONO;
    property DataUtilizacao: TDateTime  read FDATA_UTILIZACAO write FDATA_UTILIZACAO;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes



  end;

  TListaPontoAbonoUtilizacaoVO = specialize TFPGObjectList<TPontoAbonoUtilizacaoVO>;

implementation


initialization
  Classes.RegisterClass(TPontoAbonoUtilizacaoVO);

finalization
  Classes.UnRegisterClass(TPontoAbonoUtilizacaoVO);

end.
