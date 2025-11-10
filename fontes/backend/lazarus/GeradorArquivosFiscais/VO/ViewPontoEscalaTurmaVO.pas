{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_PONTO_ESCALA_TURMA] 
                                                                                
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
unit ViewPontoEscalaTurmaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TViewPontoEscalaTurmaVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FNOME: String;
    FDESCONTO_HORA_DIA: String;
    FDESCONTO_DSR: String;
    FCODIGO_HORARIO_DOMINGO: String;
    FCODIGO_HORARIO_SEGUNDA: String;
    FCODIGO_HORARIO_TERCA: String;
    FCODIGO_HORARIO_QUARTA: String;
    FCODIGO_HORARIO_QUINTA: String;
    FCODIGO_HORARIO_SEXTA: String;
    FCODIGO_HORARIO_SABADO: String;
    FCODIGO_TURMA: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Nome: String  read FNOME write FNOME;
    property DescontoHoraDia: String  read FDESCONTO_HORA_DIA write FDESCONTO_HORA_DIA;
    property DescontoDsr: String  read FDESCONTO_DSR write FDESCONTO_DSR;
    property CodigoHorarioDomingo: String  read FCODIGO_HORARIO_DOMINGO write FCODIGO_HORARIO_DOMINGO;
    property CodigoHorarioSegunda: String  read FCODIGO_HORARIO_SEGUNDA write FCODIGO_HORARIO_SEGUNDA;
    property CodigoHorarioTerca: String  read FCODIGO_HORARIO_TERCA write FCODIGO_HORARIO_TERCA;
    property CodigoHorarioQuarta: String  read FCODIGO_HORARIO_QUARTA write FCODIGO_HORARIO_QUARTA;
    property CodigoHorarioQuinta: String  read FCODIGO_HORARIO_QUINTA write FCODIGO_HORARIO_QUINTA;
    property CodigoHorarioSexta: String  read FCODIGO_HORARIO_SEXTA write FCODIGO_HORARIO_SEXTA;
    property CodigoHorarioSabado: String  read FCODIGO_HORARIO_SABADO write FCODIGO_HORARIO_SABADO;
    property CodigoTurma: String  read FCODIGO_TURMA write FCODIGO_TURMA;


    //Transientes



  end;

  TListaViewPontoEscalaTurmaVO = specialize TFPGObjectList<TViewPontoEscalaTurmaVO>;

implementation


initialization
  Classes.RegisterClass(TViewPontoEscalaTurmaVO);

finalization
  Classes.UnRegisterClass(TViewPontoEscalaTurmaVO);

end.
