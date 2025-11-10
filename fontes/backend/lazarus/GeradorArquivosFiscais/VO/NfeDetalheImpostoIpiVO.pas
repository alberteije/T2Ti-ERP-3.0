{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DETALHE_IMPOSTO_IPI] 
                                                                                
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
unit NfeDetalheImpostoIpiVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNfeDetalheImpostoIpiVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FENQUADRAMENTO_IPI: String;
    FCNPJ_PRODUTOR: String;
    FCODIGO_SELO_IPI: String;
    FQUANTIDADE_SELO_IPI: Integer;
    FENQUADRAMENTO_LEGAL_IPI: String;
    FCST_IPI: String;
    FVALOR_BASE_CALCULO_IPI: Extended;
    FALIQUOTA_IPI: Extended;
    FQUANTIDADE_UNIDADE_TRIBUTAVEL: Extended;
    FVALOR_UNIDADE_TRIBUTAVEL: Extended;
    FVALOR_IPI: Extended;

  published 
    property Id: Integer  read FID write FID;
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    property EnquadramentoIpi: String  read FENQUADRAMENTO_IPI write FENQUADRAMENTO_IPI;
    property CnpjProdutor: String  read FCNPJ_PRODUTOR write FCNPJ_PRODUTOR;
    property CodigoSeloIpi: String  read FCODIGO_SELO_IPI write FCODIGO_SELO_IPI;
    property QuantidadeSeloIpi: Integer  read FQUANTIDADE_SELO_IPI write FQUANTIDADE_SELO_IPI;
    property EnquadramentoLegalIpi: String  read FENQUADRAMENTO_LEGAL_IPI write FENQUADRAMENTO_LEGAL_IPI;
    property CstIpi: String  read FCST_IPI write FCST_IPI;
    property ValorBaseCalculoIpi: Extended  read FVALOR_BASE_CALCULO_IPI write FVALOR_BASE_CALCULO_IPI;
    property AliquotaIpi: Extended  read FALIQUOTA_IPI write FALIQUOTA_IPI;
    property QuantidadeUnidadeTributavel: Extended  read FQUANTIDADE_UNIDADE_TRIBUTAVEL write FQUANTIDADE_UNIDADE_TRIBUTAVEL;
    property ValorUnidadeTributavel: Extended  read FVALOR_UNIDADE_TRIBUTAVEL write FVALOR_UNIDADE_TRIBUTAVEL;
    property ValorIpi: Extended  read FVALOR_IPI write FVALOR_IPI;
  end;

  TListaNfeDetalheImpostoIpiVO = specialize TFPGObjectList<TNfeDetalheImpostoIpiVO>;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheImpostoIpiVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheImpostoIpiVO);

end.
