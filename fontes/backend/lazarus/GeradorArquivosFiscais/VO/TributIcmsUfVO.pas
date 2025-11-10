{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [TRIBUT_ICMS_UF] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2014 T2Ti.COM                                          
                                                                                
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
unit TributIcmsUfVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TTributIcmsUfVO = class(TVO)
  private
    FID: Integer;
    FID_TRIBUT_CONFIGURA_OF_GT: Integer;
    FUF_DESTINO: String;
    FCFOP: Integer;
    FCSOSN_B: String;
    FCST_B: String;
    FMODALIDADE_BC: String;
    FALIQUOTA: Extended;
    FVALOR_PAUTA: Extended;
    FVALOR_PRECO_MAXIMO: Extended;
    FMVA: Extended;
    FPORCENTO_BC: Extended;
    FMODALIDADE_BC_ST: String;
    FALIQUOTA_INTERNA_ST: Extended;
    FALIQUOTA_INTERESTADUAL_ST: Extended;
    FPORCENTO_BC_ST: Extended;
    FALIQUOTA_ICMS_ST: Extended;
    FVALOR_PAUTA_ST: Extended;
    FVALOR_PRECO_MAXIMO_ST: Extended;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

  published 
    property Id: Integer  read FID write FID;
    property IdTributConfiguraOfGt: Integer  read FID_TRIBUT_CONFIGURA_OF_GT write FID_TRIBUT_CONFIGURA_OF_GT;
    property UfDestino: String  read FUF_DESTINO write FUF_DESTINO;
    property Cfop: Integer  read FCFOP write FCFOP;
    property CsosnB: String  read FCSOSN_B write FCSOSN_B;
    property CstB: String  read FCST_B write FCST_B;
    property ModalidadeBc: String  read FMODALIDADE_BC write FMODALIDADE_BC;
    property Aliquota: Extended  read FALIQUOTA write FALIQUOTA;
    property ValorPauta: Extended  read FVALOR_PAUTA write FVALOR_PAUTA;
    property ValorPrecoMaximo: Extended  read FVALOR_PRECO_MAXIMO write FVALOR_PRECO_MAXIMO;
    property Mva: Extended  read FMVA write FMVA;
    property PorcentoBc: Extended  read FPORCENTO_BC write FPORCENTO_BC;
    property ModalidadeBcSt: String  read FMODALIDADE_BC_ST write FMODALIDADE_BC_ST;
    property AliquotaInternaSt: Extended  read FALIQUOTA_INTERNA_ST write FALIQUOTA_INTERNA_ST;
    property AliquotaInterestadualSt: Extended  read FALIQUOTA_INTERESTADUAL_ST write FALIQUOTA_INTERESTADUAL_ST;
    property PorcentoBcSt: Extended  read FPORCENTO_BC_ST write FPORCENTO_BC_ST;
    property AliquotaIcmsSt: Extended  read FALIQUOTA_ICMS_ST write FALIQUOTA_ICMS_ST;
    property ValorPautaSt: Extended  read FVALOR_PAUTA_ST write FVALOR_PAUTA_ST;
    property ValorPrecoMaximoSt: Extended  read FVALOR_PRECO_MAXIMO_ST write FVALOR_PRECO_MAXIMO_ST;

    property Persiste: String  read FPersiste write FPersiste;
  end;

  TListaTributIcmsUfVO = specialize TFPGObjectList<TTributIcmsUfVO>;

implementation


initialization
  Classes.RegisterClass(TTributIcmsUfVO);

finalization
  Classes.UnRegisterClass(TTributIcmsUfVO);

end.
