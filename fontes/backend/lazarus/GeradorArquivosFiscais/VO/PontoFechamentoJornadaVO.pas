{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PONTO_FECHAMENTO_JORNADA] 
                                                                                
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
unit PontoFechamentoJornadaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TPontoFechamentoJornadaVO = class(TVO)
  private
    FID: Integer;
    FID_PONTO_CLASSIFICACAO_JORNADA: Integer;
    FID_COLABORADOR: Integer;
    FDATA_FECHAMENTO: TDateTime;
    FDIA_SEMANA: String;
    FCODIGO_HORARIO: String;
    FCARGA_HORARIA_ESPERADA: String;
    FCARGA_HORARIA_DIURNA: String;
    FCARGA_HORARIA_NOTURNA: String;
    FCARGA_HORARIA_TOTAL: String;
    FENTRADA01: String;
    FSAIDA01: String;
    FENTRADA02: String;
    FSAIDA02: String;
    FENTRADA03: String;
    FSAIDA03: String;
    FENTRADA04: String;
    FSAIDA04: String;
    FENTRADA05: String;
    FSAIDA05: String;
    FHORA_INICIO_JORNADA: String;
    FHORA_FIM_JORNADA: String;
    FHORA_EXTRA01: String;
    FPERCENTUAL_HORA_EXTRA01: Extended;
    FMODALIDADE_HORA_EXTRA01: String;
    FHORA_EXTRA02: String;
    FPERCENTUAL_HORA_EXTRA02: Extended;
    FMODALIDADE_HORA_EXTRA02: String;
    FHORA_EXTRA03: String;
    FPERCENTUAL_HORA_EXTRA03: Extended;
    FMODALIDADE_HORA_EXTRA03: String;
    FHORA_EXTRA04: String;
    FPERCENTUAL_HORA_EXTRA04: Extended;
    FMODALIDADE_HORA_EXTRA04: String;
    FFALTA_ATRASO: String;
    FCOMPENSAR: String;
    FBANCO_HORAS: String;
    FOBSERVACAO: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdPontoClassificacaoJornada: Integer  read FID_PONTO_CLASSIFICACAO_JORNADA write FID_PONTO_CLASSIFICACAO_JORNADA;
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    property DataFechamento: TDateTime  read FDATA_FECHAMENTO write FDATA_FECHAMENTO;
    property DiaSemana: String  read FDIA_SEMANA write FDIA_SEMANA;
    property CodigoHorario: String  read FCODIGO_HORARIO write FCODIGO_HORARIO;
    property CargaHorariaEsperada: String  read FCARGA_HORARIA_ESPERADA write FCARGA_HORARIA_ESPERADA;
    property CargaHorariaDiurna: String  read FCARGA_HORARIA_DIURNA write FCARGA_HORARIA_DIURNA;
    property CargaHorariaNoturna: String  read FCARGA_HORARIA_NOTURNA write FCARGA_HORARIA_NOTURNA;
    property CargaHorariaTotal: String  read FCARGA_HORARIA_TOTAL write FCARGA_HORARIA_TOTAL;
    property Entrada01: String  read FENTRADA01 write FENTRADA01;
    property Saida01: String  read FSAIDA01 write FSAIDA01;
    property Entrada02: String  read FENTRADA02 write FENTRADA02;
    property Saida02: String  read FSAIDA02 write FSAIDA02;
    property Entrada03: String  read FENTRADA03 write FENTRADA03;
    property Saida03: String  read FSAIDA03 write FSAIDA03;
    property Entrada04: String  read FENTRADA04 write FENTRADA04;
    property Saida04: String  read FSAIDA04 write FSAIDA04;
    property Entrada05: String  read FENTRADA05 write FENTRADA05;
    property Saida05: String  read FSAIDA05 write FSAIDA05;
    property HoraInicioJornada: String  read FHORA_INICIO_JORNADA write FHORA_INICIO_JORNADA;
    property HoraFimJornada: String  read FHORA_FIM_JORNADA write FHORA_FIM_JORNADA;
    property HoraExtra01: String  read FHORA_EXTRA01 write FHORA_EXTRA01;
    property PercentualHoraExtra01: Extended  read FPERCENTUAL_HORA_EXTRA01 write FPERCENTUAL_HORA_EXTRA01;
    property ModalidadeHoraExtra01: String  read FMODALIDADE_HORA_EXTRA01 write FMODALIDADE_HORA_EXTRA01;
    property HoraExtra02: String  read FHORA_EXTRA02 write FHORA_EXTRA02;
    property PercentualHoraExtra02: Extended  read FPERCENTUAL_HORA_EXTRA02 write FPERCENTUAL_HORA_EXTRA02;
    property ModalidadeHoraExtra02: String  read FMODALIDADE_HORA_EXTRA02 write FMODALIDADE_HORA_EXTRA02;
    property HoraExtra03: String  read FHORA_EXTRA03 write FHORA_EXTRA03;
    property PercentualHoraExtra03: Extended  read FPERCENTUAL_HORA_EXTRA03 write FPERCENTUAL_HORA_EXTRA03;
    property ModalidadeHoraExtra03: String  read FMODALIDADE_HORA_EXTRA03 write FMODALIDADE_HORA_EXTRA03;
    property HoraExtra04: String  read FHORA_EXTRA04 write FHORA_EXTRA04;
    property PercentualHoraExtra04: Extended  read FPERCENTUAL_HORA_EXTRA04 write FPERCENTUAL_HORA_EXTRA04;
    property ModalidadeHoraExtra04: String  read FMODALIDADE_HORA_EXTRA04 write FMODALIDADE_HORA_EXTRA04;
    property FaltaAtraso: String  read FFALTA_ATRASO write FFALTA_ATRASO;
    property Compensar: String  read FCOMPENSAR write FCOMPENSAR;
    property BancoHoras: String  read FBANCO_HORAS write FBANCO_HORAS;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes



  end;

  TListaPontoFechamentoJornadaVO = specialize TFPGObjectList<TPontoFechamentoJornadaVO>;

implementation


initialization
  Classes.RegisterClass(TPontoFechamentoJornadaVO);

finalization
  Classes.UnRegisterClass(TPontoFechamentoJornadaVO);

end.
