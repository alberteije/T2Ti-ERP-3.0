{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [WMS_PARAMETRO] 
                                                                                
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
unit WmsParametroVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TWmsParametroVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FHORA_POR_VOLUME: Integer;
    FPESSOA_POR_VOLUME: Integer;
    FHORA_POR_PESO: Integer;
    FPESSOA_POR_PESO: Integer;
    FITEM_DIFERENTE_CAIXA: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property HoraPorVolume: Integer  read FHORA_POR_VOLUME write FHORA_POR_VOLUME;
    property PessoaPorVolume: Integer  read FPESSOA_POR_VOLUME write FPESSOA_POR_VOLUME;
    property HoraPorPeso: Integer  read FHORA_POR_PESO write FHORA_POR_PESO;
    property PessoaPorPeso: Integer  read FPESSOA_POR_PESO write FPESSOA_POR_PESO;
    property ItemDiferenteCaixa: String  read FITEM_DIFERENTE_CAIXA write FITEM_DIFERENTE_CAIXA;


    //Transientes



  end;

  TListaWmsParametroVO = specialize TFPGObjectList<TWmsParametroVO>;

implementation


initialization
  Classes.RegisterClass(TWmsParametroVO);

finalization
  Classes.UnRegisterClass(TWmsParametroVO);

end.
