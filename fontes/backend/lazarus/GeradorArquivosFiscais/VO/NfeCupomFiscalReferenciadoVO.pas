{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_CUPOM_FISCAL_REFERENCIADO] 
                                                                                
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
unit NfeCupomFiscalReferenciadoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNfeCupomFiscalReferenciadoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FMODELO_DOCUMENTO_FISCAL: String;
    FNUMERO_ORDEM_ECF: Integer;
    FCOO: Integer;
    FDATA_EMISSAO_CUPOM: TDateTime;
    FNUMERO_CAIXA: Integer;
    FNUMERO_SERIE_ECF: String;

  published 
    property Id: Integer  read FID write FID;
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    property ModeloDocumentoFiscal: String  read FMODELO_DOCUMENTO_FISCAL write FMODELO_DOCUMENTO_FISCAL;
    property NumeroOrdemEcf: Integer  read FNUMERO_ORDEM_ECF write FNUMERO_ORDEM_ECF;
    property Coo: Integer  read FCOO write FCOO;
    property DataEmissaoCupom: TDateTime  read FDATA_EMISSAO_CUPOM write FDATA_EMISSAO_CUPOM;
    property NumeroCaixa: Integer  read FNUMERO_CAIXA write FNUMERO_CAIXA;
    property NumeroSerieEcf: String  read FNUMERO_SERIE_ECF write FNUMERO_SERIE_ECF;

  end;

  TListaNfeCupomFiscalReferenciadoVO = specialize TFPGObjectList<TNfeCupomFiscalReferenciadoVO>;

implementation


initialization
  Classes.RegisterClass(TNfeCupomFiscalReferenciadoVO);

finalization
  Classes.UnRegisterClass(TNfeCupomFiscalReferenciadoVO);

end.
