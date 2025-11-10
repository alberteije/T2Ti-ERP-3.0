{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_PARAMETRO] 
                                                                                
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
unit FolhaParametroVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFolhaParametroVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FCOMPETENCIA: String;
    FCONTRIBUI_PIS: String;
    FALIQUOTA_PIS: Extended;
    FDISCRIMINAR_DSR: String;
    FDIA_PAGAMENTO: String;
    FCALCULO_PROPORCIONALIDADE: String;
    FDESCONTAR_FALTAS_13: String;
    FPAGAR_ADICIONAIS_13: String;
    FPAGAR_ESTAGIARIOS_13: String;
    FMES_ADIANTAMENTO_13: String;
    FPERCENTUAL_ADIANTAM_13: Extended;
    FFERIAS_DESCONTAR_FALTAS: String;
    FFERIAS_PAGAR_ADICIONAIS: String;
    FFERIAS_ADIANTAR_13: String;
    FFERIAS_PAGAR_ESTAGIARIOS: String;
    FFERIAS_CALC_JUSTA_CAUSA: String;
    FFERIAS_MOVIMENTO_MENSAL: String;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Competencia: String  read FCOMPETENCIA write FCOMPETENCIA;
    property ContribuiPis: String  read FCONTRIBUI_PIS write FCONTRIBUI_PIS;
    property AliquotaPis: Extended  read FALIQUOTA_PIS write FALIQUOTA_PIS;
    property DiscriminarDsr: String  read FDISCRIMINAR_DSR write FDISCRIMINAR_DSR;
    property DiaPagamento: String  read FDIA_PAGAMENTO write FDIA_PAGAMENTO;
    property CalculoProporcionalidade: String  read FCALCULO_PROPORCIONALIDADE write FCALCULO_PROPORCIONALIDADE;
    property DescontarFaltas13: String  read FDESCONTAR_FALTAS_13 write FDESCONTAR_FALTAS_13;
    property PagarAdicionais13: String  read FPAGAR_ADICIONAIS_13 write FPAGAR_ADICIONAIS_13;
    property PagarEstagiarios13: String  read FPAGAR_ESTAGIARIOS_13 write FPAGAR_ESTAGIARIOS_13;
    property MesAdiantamento13: String  read FMES_ADIANTAMENTO_13 write FMES_ADIANTAMENTO_13;
    property PercentualAdiantam13: Extended  read FPERCENTUAL_ADIANTAM_13 write FPERCENTUAL_ADIANTAM_13;
    property FeriasDescontarFaltas: String  read FFERIAS_DESCONTAR_FALTAS write FFERIAS_DESCONTAR_FALTAS;
    property FeriasPagarAdicionais: String  read FFERIAS_PAGAR_ADICIONAIS write FFERIAS_PAGAR_ADICIONAIS;
    property FeriasAdiantar13: String  read FFERIAS_ADIANTAR_13 write FFERIAS_ADIANTAR_13;
    property FeriasPagarEstagiarios: String  read FFERIAS_PAGAR_ESTAGIARIOS write FFERIAS_PAGAR_ESTAGIARIOS;
    property FeriasCalcJustaCausa: String  read FFERIAS_CALC_JUSTA_CAUSA write FFERIAS_CALC_JUSTA_CAUSA;
    property FeriasMovimentoMensal: String  read FFERIAS_MOVIMENTO_MENSAL write FFERIAS_MOVIMENTO_MENSAL;


    //Transientes



  end;

  TListaFolhaParametroVO = specialize TFPGObjectList<TFolhaParametroVO>;

implementation


initialization
  Classes.RegisterClass(TFolhaParametroVO);

finalization
  Classes.UnRegisterClass(TFolhaParametroVO);

end.
