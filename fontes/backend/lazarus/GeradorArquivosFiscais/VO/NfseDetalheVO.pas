{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFSE_DETALHE] 
                                                                                
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
unit NfseDetalheVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TNfseDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_NFSE_LISTA_SERVICO: Integer;
    FID_NFSE_CABECALHO: Integer;
    FVALOR_SERVICOS: Extended;
    FVALOR_DEDUCOES: Extended;
    FVALOR_PIS: Extended;
    FVALOR_COFINS: Extended;
    FVALOR_INSS: Extended;
    FVALOR_IR: Extended;
    FVALOR_CSLL: Extended;
    FCODIGO_CNAE: String;
    FCODIGO_TRIBUTACAO_MUNICIPIO: String;
    FVALOR_BASE_CALCULO: Extended;
    FALIQUOTA: Extended;
    FVALOR_ISS: Extended;
    FVALOR_LIQUIDO: Extended;
    FOUTRAS_RETENCOES: Extended;
    FVALOR_CREDITO: Extended;
    FISS_RETIDO: String;
    FVALOR_ISS_RETIDO: Extended;
    FVALOR_DESCONTO_CONDICIONADO: Extended;
    FVALOR_DESCONTO_INCONDICIONADO: Extended;
    FDISCRIMINACAO: String;
    FMUNICIPIO_PRESTACAO: Integer;

    //Transientes
    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;



  published 
    property Id: Integer  read FID write FID;
    property IdNfseListaServico: Integer  read FID_NFSE_LISTA_SERVICO write FID_NFSE_LISTA_SERVICO;
    property IdNfseCabecalho: Integer  read FID_NFSE_CABECALHO write FID_NFSE_CABECALHO;
    property ValorServicos: Extended  read FVALOR_SERVICOS write FVALOR_SERVICOS;
    property ValorDeducoes: Extended  read FVALOR_DEDUCOES write FVALOR_DEDUCOES;
    property ValorPis: Extended  read FVALOR_PIS write FVALOR_PIS;
    property ValorCofins: Extended  read FVALOR_COFINS write FVALOR_COFINS;
    property ValorInss: Extended  read FVALOR_INSS write FVALOR_INSS;
    property ValorIr: Extended  read FVALOR_IR write FVALOR_IR;
    property ValorCsll: Extended  read FVALOR_CSLL write FVALOR_CSLL;
    property CodigoCnae: String  read FCODIGO_CNAE write FCODIGO_CNAE;
    property CodigoTributacaoMunicipio: String  read FCODIGO_TRIBUTACAO_MUNICIPIO write FCODIGO_TRIBUTACAO_MUNICIPIO;
    property ValorBaseCalculo: Extended  read FVALOR_BASE_CALCULO write FVALOR_BASE_CALCULO;
    property Aliquota: Extended  read FALIQUOTA write FALIQUOTA;
    property ValorIss: Extended  read FVALOR_ISS write FVALOR_ISS;
    property ValorLiquido: Extended  read FVALOR_LIQUIDO write FVALOR_LIQUIDO;
    property OutrasRetencoes: Extended  read FOUTRAS_RETENCOES write FOUTRAS_RETENCOES;
    property ValorCredito: Extended  read FVALOR_CREDITO write FVALOR_CREDITO;
    property IssRetido: String  read FISS_RETIDO write FISS_RETIDO;
    property ValorIssRetido: Extended  read FVALOR_ISS_RETIDO write FVALOR_ISS_RETIDO;
    property ValorDescontoCondicionado: Extended  read FVALOR_DESCONTO_CONDICIONADO write FVALOR_DESCONTO_CONDICIONADO;
    property ValorDescontoIncondicionado: Extended  read FVALOR_DESCONTO_INCONDICIONADO write FVALOR_DESCONTO_INCONDICIONADO;
    property Discriminacao: String  read FDISCRIMINACAO write FDISCRIMINACAO;
    property MunicipioPrestacao: Integer  read FMUNICIPIO_PRESTACAO write FMUNICIPIO_PRESTACAO;


    //Transientes
    property Persiste: String  read FPersiste write FPersiste;



  end;

  TListaNfseDetalheVO = specialize TFPGObjectList<TNfseDetalheVO>;

implementation


initialization
  Classes.RegisterClass(TNfseDetalheVO);

finalization
  Classes.UnRegisterClass(TNfseDetalheVO);

end.
