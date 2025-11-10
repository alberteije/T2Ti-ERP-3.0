{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PONTO_PARAMETRO] 
                                                                                
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
unit PontoParametroVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TPontoParametroVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FMES_ANO: String;
    FDIA_INICIAL_APURACAO: Integer;
    FHORA_NOTURNA_INICIO: String;
    FHORA_NOTURNA_FIM: String;
    FPERIODO_MINIMO_INTERJORNADA: String;
    FPERCENTUAL_HE_DIURNA: Extended;
    FPERCENTUAL_HE_NOTURNA: Extended;
    FDURACAO_HORA_NOTURNA: String;
    FTRATAMENTO_HORA_MAIS: String;
    FTRATAMENTO_HORA_MENOS: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property MesAno: String  read FMES_ANO write FMES_ANO;
    property DiaInicialApuracao: Integer  read FDIA_INICIAL_APURACAO write FDIA_INICIAL_APURACAO;
    property HoraNoturnaInicio: String  read FHORA_NOTURNA_INICIO write FHORA_NOTURNA_INICIO;
    property HoraNoturnaFim: String  read FHORA_NOTURNA_FIM write FHORA_NOTURNA_FIM;
    property PeriodoMinimoInterjornada: String  read FPERIODO_MINIMO_INTERJORNADA write FPERIODO_MINIMO_INTERJORNADA;
    property PercentualHeDiurna: Extended  read FPERCENTUAL_HE_DIURNA write FPERCENTUAL_HE_DIURNA;
    property PercentualHeNoturna: Extended  read FPERCENTUAL_HE_NOTURNA write FPERCENTUAL_HE_NOTURNA;
    property DuracaoHoraNoturna: String  read FDURACAO_HORA_NOTURNA write FDURACAO_HORA_NOTURNA;
    property TratamentoHoraMais: String  read FTRATAMENTO_HORA_MAIS write FTRATAMENTO_HORA_MAIS;
    property TratamentoHoraMenos: String  read FTRATAMENTO_HORA_MENOS write FTRATAMENTO_HORA_MENOS;


    //Transientes



  end;

  TListaPontoParametroVO = specialize TFPGObjectList<TPontoParametroVO>;

implementation


initialization
  Classes.RegisterClass(TPontoParametroVO);

finalization
  Classes.UnRegisterClass(TPontoParametroVO);

end.
