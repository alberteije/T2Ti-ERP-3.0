{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DET_ESPECIFICO_MEDICAMENTO] 
                                                                                
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
unit NfeDetEspecificoMedicamentoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNfeDetEspecificoMedicamentoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FNUMERO_LOTE: String;
    FQUANTIDADE_LOTE: Extended;
    FDATA_FABRICACAO: TDateTime;
    FDATA_VALIDADE: TDateTime;
    FPRECO_MAXIMO_CONSUMIDOR: Extended;

  published 
    property Id: Integer  read FID write FID;
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    property NumeroLote: String  read FNUMERO_LOTE write FNUMERO_LOTE;
    property QuantidadeLote: Extended  read FQUANTIDADE_LOTE write FQUANTIDADE_LOTE;
    property DataFabricacao: TDateTime  read FDATA_FABRICACAO write FDATA_FABRICACAO;
    property DataValidade: TDateTime  read FDATA_VALIDADE write FDATA_VALIDADE;
    property PrecoMaximoConsumidor: Extended  read FPRECO_MAXIMO_CONSUMIDOR write FPRECO_MAXIMO_CONSUMIDOR;

  end;

  TListaNfeDetEspecificoMedicamentoVO = specialize TFPGObjectList<TNfeDetEspecificoMedicamentoVO>;

implementation


initialization
  Classes.RegisterClass(TNfeDetEspecificoMedicamentoVO);

finalization
  Classes.UnRegisterClass(TNfeDetEspecificoMedicamentoVO);

end.
