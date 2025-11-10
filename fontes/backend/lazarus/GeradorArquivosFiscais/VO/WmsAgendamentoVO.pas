{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [WMS_AGENDAMENTO] 
                                                                                
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
unit WmsAgendamentoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TWmsAgendamentoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FDATA_OPERACAO: TDateTime;
    FHORA_OPERACAO: String;
    FLOCAL_OPERACAO: String;
    FQUANTIDADE_VOLUME: Integer;
    FPESO_TOTAL_VOLUME: Extended;
    FQUANTIDADE_PESSOA: Integer;
    FQUANTIDADE_HORA: Integer;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property DataOperacao: TDateTime  read FDATA_OPERACAO write FDATA_OPERACAO;
    property HoraOperacao: String  read FHORA_OPERACAO write FHORA_OPERACAO;
    property LocalOperacao: String  read FLOCAL_OPERACAO write FLOCAL_OPERACAO;
    property QuantidadeVolume: Integer  read FQUANTIDADE_VOLUME write FQUANTIDADE_VOLUME;
    property PesoTotalVolume: Extended  read FPESO_TOTAL_VOLUME write FPESO_TOTAL_VOLUME;
    property QuantidadePessoa: Integer  read FQUANTIDADE_PESSOA write FQUANTIDADE_PESSOA;
    property QuantidadeHora: Integer  read FQUANTIDADE_HORA write FQUANTIDADE_HORA;


    //Transientes



  end;

  TListaWmsAgendamentoVO = specialize TFPGObjectList<TWmsAgendamentoVO>;

implementation


initialization
  Classes.RegisterClass(TWmsAgendamentoVO);

finalization
  Classes.UnRegisterClass(TWmsAgendamentoVO);

end.
