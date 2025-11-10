{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_PPP_FATOR_RISCO] 
                                                                                
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
unit FolhaPppFatorRiscoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFolhaPppFatorRiscoVO = class(TVO)
  private
    FID: Integer;
    FID_FOLHA_PPP: Integer;
    FDATA_INICIO: TDateTime;
    FDATA_FIM: TDateTime;
    FTIPO: String;
    FFATOR_RISCO: String;
    FINTENSIDADE: String;
    FTECNICA_UTILIZADA: String;
    FEPC_EFICAZ: String;
    FEPI_EFICAZ: String;
    FCA_EPI: Integer;
    FATENDIMENTO_NR06_1: String;
    FATENDIMENTO_NR06_2: String;
    FATENDIMENTO_NR06_3: String;
    FATENDIMENTO_NR06_4: String;
    FATENDIMENTO_NR06_5: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdFolhaPpp: Integer  read FID_FOLHA_PPP write FID_FOLHA_PPP;
    property DataInicio: TDateTime  read FDATA_INICIO write FDATA_INICIO;
    property DataFim: TDateTime  read FDATA_FIM write FDATA_FIM;
    property Tipo: String  read FTIPO write FTIPO;
    property FatorRisco: String  read FFATOR_RISCO write FFATOR_RISCO;
    property Intensidade: String  read FINTENSIDADE write FINTENSIDADE;
    property TecnicaUtilizada: String  read FTECNICA_UTILIZADA write FTECNICA_UTILIZADA;
    property EpcEficaz: String  read FEPC_EFICAZ write FEPC_EFICAZ;
    property EpiEficaz: String  read FEPI_EFICAZ write FEPI_EFICAZ;
    property CaEpi: Integer  read FCA_EPI write FCA_EPI;
    property AtendimentoNr061: String  read FATENDIMENTO_NR06_1 write FATENDIMENTO_NR06_1;
    property AtendimentoNr062: String  read FATENDIMENTO_NR06_2 write FATENDIMENTO_NR06_2;
    property AtendimentoNr063: String  read FATENDIMENTO_NR06_3 write FATENDIMENTO_NR06_3;
    property AtendimentoNr064: String  read FATENDIMENTO_NR06_4 write FATENDIMENTO_NR06_4;
    property AtendimentoNr065: String  read FATENDIMENTO_NR06_5 write FATENDIMENTO_NR06_5;


    //Transientes



  end;

  TListaFolhaPppFatorRiscoVO = specialize TFPGObjectList<TFolhaPppFatorRiscoVO>;

implementation


initialization
  Classes.RegisterClass(TFolhaPppFatorRiscoVO);

finalization
  Classes.UnRegisterClass(TFolhaPppFatorRiscoVO);

end.
