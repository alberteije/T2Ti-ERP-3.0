{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_FERROVIARIO_VAGAO] 
                                                                                
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
unit CteFerroviarioVagaoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TCteFerroviarioVagaoVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_FERROVIARIO: Integer;
    FNUMERO_VAGAO: Integer;
    FCAPACIDADE: Extended;
    FTIPO_VAGAO: String;
    FPESO_REAL: Extended;
    FPESO_BC: Extended;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdCteFerroviario: Integer  read FID_CTE_FERROVIARIO write FID_CTE_FERROVIARIO;
    property NumeroVagao: Integer  read FNUMERO_VAGAO write FNUMERO_VAGAO;
    property Capacidade: Extended  read FCAPACIDADE write FCAPACIDADE;
    property TipoVagao: String  read FTIPO_VAGAO write FTIPO_VAGAO;
    property PesoReal: Extended  read FPESO_REAL write FPESO_REAL;
    property PesoBc: Extended  read FPESO_BC write FPESO_BC;


    //Transientes



  end;

  TListaCteFerroviarioVagaoVO = specialize TFPGObjectList<TCteFerroviarioVagaoVO>;

implementation


initialization
  Classes.RegisterClass(TCteFerroviarioVagaoVO);

finalization
  Classes.UnRegisterClass(TCteFerroviarioVagaoVO);

end.
