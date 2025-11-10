{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DETALHE_IMPOSTO_ISSQN] 
                                                                                
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
unit NfeDetalheImpostoIssqnVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNfeDetalheImpostoIssqnVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FBASE_CALCULO_ISSQN: Extended;
    FALIQUOTA_ISSQN: Extended;
    FVALOR_ISSQN: Extended;
    FMUNICIPIO_ISSQN: Integer;
    FITEM_LISTA_SERVICOS: Integer;
    FVALOR_DEDUCAO: Extended;
    FVALOR_OUTRAS_RETENCOES: Extended;
    FVALOR_DESCONTO_INCONDICIONADO: Extended;
    FVALOR_DESCONTO_CONDICIONADO: Extended;
    FVALOR_RETENCAO_ISS: Extended;
    FINDICADOR_EXIGIBILIDADE_ISS: Integer;
    FCODIGO_SERVICO: String;
    FMUNICIPIO_INCIDENCIA: Integer;
    FPAIS_SEVICO_PRESTADO: Integer;
    FNUMERO_PROCESSO: String;
    FINDICADOR_INCENTIVO_FISCAL: Integer;

  published 
    property Id: Integer  read FID write FID;
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    property BaseCalculoIssqn: Extended  read FBASE_CALCULO_ISSQN write FBASE_CALCULO_ISSQN;
    property AliquotaIssqn: Extended  read FALIQUOTA_ISSQN write FALIQUOTA_ISSQN;
    property ValorIssqn: Extended  read FVALOR_ISSQN write FVALOR_ISSQN;
    property MunicipioIssqn: Integer  read FMUNICIPIO_ISSQN write FMUNICIPIO_ISSQN;
    property ItemListaServicos: Integer  read FITEM_LISTA_SERVICOS write FITEM_LISTA_SERVICOS;
    property ValorDeducao: Extended  read FVALOR_DEDUCAO write FVALOR_DEDUCAO;
    property ValorOutrasRetencoes: Extended  read FVALOR_OUTRAS_RETENCOES write FVALOR_OUTRAS_RETENCOES;
    property ValorDescontoIncondicionado: Extended  read FVALOR_DESCONTO_INCONDICIONADO write FVALOR_DESCONTO_INCONDICIONADO;
    property ValorDescontoCondicionado: Extended  read FVALOR_DESCONTO_CONDICIONADO write FVALOR_DESCONTO_CONDICIONADO;
    property ValorRetencaoIss: Extended  read FVALOR_RETENCAO_ISS write FVALOR_RETENCAO_ISS;
    property IndicadorExigibilidadeIss: Integer  read FINDICADOR_EXIGIBILIDADE_ISS write FINDICADOR_EXIGIBILIDADE_ISS;
    property CodigoServico: String  read FCODIGO_SERVICO write FCODIGO_SERVICO;
    property MunicipioIncidencia: Integer  read FMUNICIPIO_INCIDENCIA write FMUNICIPIO_INCIDENCIA;
    property PaisSevicoPrestado: Integer  read FPAIS_SEVICO_PRESTADO write FPAIS_SEVICO_PRESTADO;
    property NumeroProcesso: String  read FNUMERO_PROCESSO write FNUMERO_PROCESSO;
    property IndicadorIncentivoFiscal: Integer  read FINDICADOR_INCENTIVO_FISCAL write FINDICADOR_INCENTIVO_FISCAL;

  end;

  TListaNfeDetalheImpostoIssqnVO = specialize TFPGObjectList<TNfeDetalheImpostoIssqnVO>;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheImpostoIssqnVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheImpostoIssqnVO);

end.
