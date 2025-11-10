{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DET_ESPECIFICO_COMBUSTIVEL] 
                                                                                
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
unit NfeDetEspecificoCombustivelVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNfeDetEspecificoCombustivelVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FCODIGO_ANP: Integer;
    FPERCENTUAL_GAS_NATURAL: Extended;
    FCODIF: String;
    FQUANTIDADE_TEMP_AMBIENTE: Extended;
    FUF_CONSUMO: String;
    FBASE_CALCULO_CIDE: Extended;
    FALIQUOTA_CIDE: Extended;
    FVALOR_CIDE: Extended;

  published 
    property Id: Integer  read FID write FID;
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    property CodigoAnp: Integer  read FCODIGO_ANP write FCODIGO_ANP;
    property PercentualGasNatural: Extended  read FPERCENTUAL_GAS_NATURAL write FPERCENTUAL_GAS_NATURAL;
    property Codif: String  read FCODIF write FCODIF;
    property QuantidadeTempAmbiente: Extended  read FQUANTIDADE_TEMP_AMBIENTE write FQUANTIDADE_TEMP_AMBIENTE;
    property UfConsumo: String  read FUF_CONSUMO write FUF_CONSUMO;
    property BaseCalculoCide: Extended  read FBASE_CALCULO_CIDE write FBASE_CALCULO_CIDE;
    property AliquotaCide: Extended  read FALIQUOTA_CIDE write FALIQUOTA_CIDE;
    property ValorCide: Extended  read FVALOR_CIDE write FVALOR_CIDE;

  end;

  TListaNfeDetEspecificoCombustivelVO = specialize TFPGObjectList<TNfeDetEspecificoCombustivelVO>;

implementation


initialization
  Classes.RegisterClass(TNfeDetEspecificoCombustivelVO);

finalization
  Classes.UnRegisterClass(TNfeDetEspecificoCombustivelVO);

end.
