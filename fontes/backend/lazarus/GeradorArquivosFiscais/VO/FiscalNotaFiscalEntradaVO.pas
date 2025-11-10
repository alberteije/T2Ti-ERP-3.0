{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FISCAL_NOTA_FISCAL_ENTRADA] 
                                                                                
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
unit FiscalNotaFiscalEntradaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TFiscalNotaFiscalEntradaVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FCOMPETENCIA: String;
    FCFOP_ENTRADA: Integer;
    FVALOR_RATEIO_FRETE: Extended;
    FVALOR_CUSTO_MEDIO: Extended;
    FVALOR_ICMS_ANTECIPADO: Extended;
    FVALOR_BC_ICMS_ANTECIPADO: Extended;
    FVALOR_BC_ICMS_CREDITADO: Extended;
    FVALOR_BC_PIS_CREDITADO: Extended;
    FVALOR_BC_COFINS_CREDITADO: Extended;
    FVALOR_BC_IPI_CREDITADO: Extended;
    FCST_CREDITO_ICMS: String;
    FCST_CREDITO_PIS: String;
    FCST_CREDITO_COFINS: String;
    FCST_CREDITO_IPI: String;
    FVALOR_ICMS_CREDITADO: Extended;
    FVALOR_PIS_CREDITADO: Extended;
    FVALOR_COFINS_CREDITADO: Extended;
    FVALOR_IPI_CREDITADO: Extended;
    FQTDE_PARCELA_CREDITO_PIS: Integer;
    FQTDE_PARCELA_CREDITO_COFINS: Integer;
    FQTDE_PARCELA_CREDITO_ICMS: Integer;
    FQTDE_PARCELA_CREDITO_IPI: Integer;
    FALIQUOTA_CREDITO_ICMS: Extended;
    FALIQUOTA_CREDITO_PIS: Extended;
    FALIQUOTA_CREDITO_COFINS: Extended;
    FALIQUOTA_CREDITO_IPI: Extended;

  published 
    property Id: Integer  read FID write FID;
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    property Competencia: String  read FCOMPETENCIA write FCOMPETENCIA;
    property CfopEntrada: Integer  read FCFOP_ENTRADA write FCFOP_ENTRADA;
    property ValorRateioFrete: Extended  read FVALOR_RATEIO_FRETE write FVALOR_RATEIO_FRETE;
    property ValorCustoMedio: Extended  read FVALOR_CUSTO_MEDIO write FVALOR_CUSTO_MEDIO;
    property ValorIcmsAntecipado: Extended  read FVALOR_ICMS_ANTECIPADO write FVALOR_ICMS_ANTECIPADO;
    property ValorBcIcmsAntecipado: Extended  read FVALOR_BC_ICMS_ANTECIPADO write FVALOR_BC_ICMS_ANTECIPADO;
    property ValorBcIcmsCreditado: Extended  read FVALOR_BC_ICMS_CREDITADO write FVALOR_BC_ICMS_CREDITADO;
    property ValorBcPisCreditado: Extended  read FVALOR_BC_PIS_CREDITADO write FVALOR_BC_PIS_CREDITADO;
    property ValorBcCofinsCreditado: Extended  read FVALOR_BC_COFINS_CREDITADO write FVALOR_BC_COFINS_CREDITADO;
    property ValorBcIpiCreditado: Extended  read FVALOR_BC_IPI_CREDITADO write FVALOR_BC_IPI_CREDITADO;
    property CstCreditoIcms: String  read FCST_CREDITO_ICMS write FCST_CREDITO_ICMS;
    property CstCreditoPis: String  read FCST_CREDITO_PIS write FCST_CREDITO_PIS;
    property CstCreditoCofins: String  read FCST_CREDITO_COFINS write FCST_CREDITO_COFINS;
    property CstCreditoIpi: String  read FCST_CREDITO_IPI write FCST_CREDITO_IPI;
    property ValorIcmsCreditado: Extended  read FVALOR_ICMS_CREDITADO write FVALOR_ICMS_CREDITADO;
    property ValorPisCreditado: Extended  read FVALOR_PIS_CREDITADO write FVALOR_PIS_CREDITADO;
    property ValorCofinsCreditado: Extended  read FVALOR_COFINS_CREDITADO write FVALOR_COFINS_CREDITADO;
    property ValorIpiCreditado: Extended  read FVALOR_IPI_CREDITADO write FVALOR_IPI_CREDITADO;
    property QtdeParcelaCreditoPis: Integer  read FQTDE_PARCELA_CREDITO_PIS write FQTDE_PARCELA_CREDITO_PIS;
    property QtdeParcelaCreditoCofins: Integer  read FQTDE_PARCELA_CREDITO_COFINS write FQTDE_PARCELA_CREDITO_COFINS;
    property QtdeParcelaCreditoIcms: Integer  read FQTDE_PARCELA_CREDITO_ICMS write FQTDE_PARCELA_CREDITO_ICMS;
    property QtdeParcelaCreditoIpi: Integer  read FQTDE_PARCELA_CREDITO_IPI write FQTDE_PARCELA_CREDITO_IPI;
    property AliquotaCreditoIcms: Extended  read FALIQUOTA_CREDITO_ICMS write FALIQUOTA_CREDITO_ICMS;
    property AliquotaCreditoPis: Extended  read FALIQUOTA_CREDITO_PIS write FALIQUOTA_CREDITO_PIS;
    property AliquotaCreditoCofins: Extended  read FALIQUOTA_CREDITO_COFINS write FALIQUOTA_CREDITO_COFINS;
    property AliquotaCreditoIpi: Extended  read FALIQUOTA_CREDITO_IPI write FALIQUOTA_CREDITO_IPI;

  end;

  TListaFiscalNotaFiscalEntradaVO = specialize TFPGObjectList<TFiscalNotaFiscalEntradaVO>;

implementation


initialization
  Classes.RegisterClass(TFiscalNotaFiscalEntradaVO);

finalization
  Classes.UnRegisterClass(TFiscalNotaFiscalEntradaVO);

end.
