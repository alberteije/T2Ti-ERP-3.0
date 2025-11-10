{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_INFORMACAO_NF_OUTROS] 
                                                                                
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
unit CteInformacaoNfOutrosVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TCteInformacaoNfOutrosVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_CABECALHO: Integer;
    FNUMERO_ROMANEIO: String;
    FNUMERO_PEDIDO: String;
    FCHAVE_ACESSO_NFE: String;
    FCODIGO_MODELO: String;
    FSERIE: String;
    FNUMERO: String;
    FDATA_EMISSAO: TDateTime;
    FUF_EMITENTE: Integer;
    FBASE_CALCULO_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FBASE_CALCULO_ICMS_ST: Extended;
    FVALOR_ICMS_ST: Extended;
    FVALOR_TOTAL_PRODUTOS: Extended;
    FVALOR_TOTAL: Extended;
    FCFOP_PREDOMINANTE: Integer;
    FPESO_TOTAL_KG: Extended;
    FPIN_SUFRAMA: Integer;
    FDATA_PREVISTA_ENTREGA: TDateTime;
    FOUTRO_TIPO_DOC_ORIG: String;
    FOUTRO_DESCRICAO: String;
    FOUTRO_VALOR_DOCUMENTO: Extended;

    //Transientes



  published 
    property Id: Integer  read FID write FID;
    property IdCteCabecalho: Integer  read FID_CTE_CABECALHO write FID_CTE_CABECALHO;
    property NumeroRomaneio: String  read FNUMERO_ROMANEIO write FNUMERO_ROMANEIO;
    property NumeroPedido: String  read FNUMERO_PEDIDO write FNUMERO_PEDIDO;
    property ChaveAcessoNfe: String  read FCHAVE_ACESSO_NFE write FCHAVE_ACESSO_NFE;
    property CodigoModelo: String  read FCODIGO_MODELO write FCODIGO_MODELO;
    property Serie: String  read FSERIE write FSERIE;
    property Numero: String  read FNUMERO write FNUMERO;
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    property UfEmitente: Integer  read FUF_EMITENTE write FUF_EMITENTE;
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    property BaseCalculoIcmsSt: Extended  read FBASE_CALCULO_ICMS_ST write FBASE_CALCULO_ICMS_ST;
    property ValorIcmsSt: Extended  read FVALOR_ICMS_ST write FVALOR_ICMS_ST;
    property ValorTotalProdutos: Extended  read FVALOR_TOTAL_PRODUTOS write FVALOR_TOTAL_PRODUTOS;
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    property CfopPredominante: Integer  read FCFOP_PREDOMINANTE write FCFOP_PREDOMINANTE;
    property PesoTotalKg: Extended  read FPESO_TOTAL_KG write FPESO_TOTAL_KG;
    property PinSuframa: Integer  read FPIN_SUFRAMA write FPIN_SUFRAMA;
    property DataPrevistaEntrega: TDateTime  read FDATA_PREVISTA_ENTREGA write FDATA_PREVISTA_ENTREGA;
    property OutroTipoDocOrig: String  read FOUTRO_TIPO_DOC_ORIG write FOUTRO_TIPO_DOC_ORIG;
    property OutroDescricao: String  read FOUTRO_DESCRICAO write FOUTRO_DESCRICAO;
    property OutroValorDocumento: Extended  read FOUTRO_VALOR_DOCUMENTO write FOUTRO_VALOR_DOCUMENTO;


    //Transientes



  end;

  TListaCteInformacaoNfOutrosVO = specialize TFPGObjectList<TCteInformacaoNfOutrosVO>;

implementation


initialization
  Classes.RegisterClass(TCteInformacaoNfOutrosVO);

finalization
  Classes.UnRegisterClass(TCteInformacaoNfOutrosVO);

end.
