{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS] 
                                                                                
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
unit NfeDetalheImpostoIcmsVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNfeDetalheImpostoIcmsVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FORIGEM_MERCADORIA: Integer;
    FCST_ICMS: String;
    FCSOSN: String;
    FMODALIDADE_BC_ICMS: Integer;
    FTAXA_REDUCAO_BC_ICMS: Extended;
    FBASE_CALCULO_ICMS: Extended;
    FALIQUOTA_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FVALOR_ICMS_OPERACAO: Extended;
    FPERCENTUAL_DIFERIMENTO: Extended;
    FVALOR_ICMS_DIFERIDO: Extended;
    FMOTIVO_DESONERACAO_ICMS: Integer;
    FVALOR_ICMS_DESONERADO: Extended;
    FMODALIDADE_BC_ICMS_ST: Integer;
    FPERCENTUAL_MVA_ICMS_ST: Extended;
    FPERCENTUAL_REDUCAO_BC_ICMS_ST: Extended;
    FVALOR_BASE_CALCULO_ICMS_ST: Extended;
    FALIQUOTA_ICMS_ST: Extended;
    FVALOR_ICMS_ST: Extended;
    FVALOR_BC_ICMS_ST_RETIDO: Extended;
    FVALOR_ICMS_ST_RETIDO: Extended;
    FVALOR_BC_ICMS_ST_DESTINO: Extended;
    FVALOR_ICMS_ST_DESTINO: Extended;
    FALIQUOTA_CREDITO_ICMS_SN: Extended;
    FVALOR_CREDITO_ICMS_SN: Extended;
    FPERCENTUAL_BC_OPERACAO_PROPRIA: Extended;
    FUF_ST: String;

  published 
    property Id: Integer  read FID write FID;
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    property OrigemMercadoria: Integer  read FORIGEM_MERCADORIA write FORIGEM_MERCADORIA;
    property CstIcms: String  read FCST_ICMS write FCST_ICMS;
    property Csosn: String  read FCSOSN write FCSOSN;
    property ModalidadeBcIcms: Integer  read FMODALIDADE_BC_ICMS write FMODALIDADE_BC_ICMS;
    property TaxaReducaoBcIcms: Extended  read FTAXA_REDUCAO_BC_ICMS write FTAXA_REDUCAO_BC_ICMS;
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    property AliquotaIcms: Extended  read FALIQUOTA_ICMS write FALIQUOTA_ICMS;
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    property ValorIcmsOperacao: Extended  read FVALOR_ICMS_OPERACAO write FVALOR_ICMS_OPERACAO;
    property PercentualDiferimento: Extended  read FPERCENTUAL_DIFERIMENTO write FPERCENTUAL_DIFERIMENTO;
    property ValorIcmsDiferido: Extended  read FVALOR_ICMS_DIFERIDO write FVALOR_ICMS_DIFERIDO;
    property MotivoDesoneracaoIcms: Integer  read FMOTIVO_DESONERACAO_ICMS write FMOTIVO_DESONERACAO_ICMS;
    property ValorIcmsDesonerado: Extended  read FVALOR_ICMS_DESONERADO write FVALOR_ICMS_DESONERADO;
    property ModalidadeBcIcmsSt: Integer  read FMODALIDADE_BC_ICMS_ST write FMODALIDADE_BC_ICMS_ST;
    property PercentualMvaIcmsSt: Extended  read FPERCENTUAL_MVA_ICMS_ST write FPERCENTUAL_MVA_ICMS_ST;
    property PercentualReducaoBcIcmsSt: Extended  read FPERCENTUAL_REDUCAO_BC_ICMS_ST write FPERCENTUAL_REDUCAO_BC_ICMS_ST;
    property ValorBaseCalculoIcmsSt: Extended  read FVALOR_BASE_CALCULO_ICMS_ST write FVALOR_BASE_CALCULO_ICMS_ST;
    property AliquotaIcmsSt: Extended  read FALIQUOTA_ICMS_ST write FALIQUOTA_ICMS_ST;
    property ValorIcmsSt: Extended  read FVALOR_ICMS_ST write FVALOR_ICMS_ST;
    property ValorBcIcmsStRetido: Extended  read FVALOR_BC_ICMS_ST_RETIDO write FVALOR_BC_ICMS_ST_RETIDO;
    property ValorIcmsStRetido: Extended  read FVALOR_ICMS_ST_RETIDO write FVALOR_ICMS_ST_RETIDO;
    property ValorBcIcmsStDestino: Extended  read FVALOR_BC_ICMS_ST_DESTINO write FVALOR_BC_ICMS_ST_DESTINO;
    property ValorIcmsStDestino: Extended  read FVALOR_ICMS_ST_DESTINO write FVALOR_ICMS_ST_DESTINO;
    property AliquotaCreditoIcmsSn: Extended  read FALIQUOTA_CREDITO_ICMS_SN write FALIQUOTA_CREDITO_ICMS_SN;
    property ValorCreditoIcmsSn: Extended  read FVALOR_CREDITO_ICMS_SN write FVALOR_CREDITO_ICMS_SN;
    property PercentualBcOperacaoPropria: Extended  read FPERCENTUAL_BC_OPERACAO_PROPRIA write FPERCENTUAL_BC_OPERACAO_PROPRIA;
    property UfSt: String  read FUF_ST write FUF_ST;

  end;

  TListaNfeDetalheImpostoIcmsVO = specialize TFPGObjectList<TNfeDetalheImpostoIcmsVO>;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheImpostoIcmsVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheImpostoIcmsVO);

end.
