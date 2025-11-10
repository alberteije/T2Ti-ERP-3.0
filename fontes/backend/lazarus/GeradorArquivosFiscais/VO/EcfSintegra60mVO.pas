{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_SINTEGRA_60M] 
                                                                                
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
unit EcfSintegra60mVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TEcfSintegra60mVO = class(TVO)
  private
    FID: Integer;
    FNOME_CAIXA: String;
    FID_GERADO_CAIXA: Integer;
    FID_EMPRESA: Integer;
    FDATA_EMISSAO: TDateTime;
    FNUMERO_SERIE_ECF: String;
    FNUMERO_EQUIPAMENTO: Integer;
    FMODELO_DOCUMENTO_FISCAL: String;
    FCOO_INICIAL: Integer;
    FCOO_FINAL: Integer;
    FCRZ: Integer;
    FCRO: Integer;
    FVALOR_VENDA_BRUTA: Extended;
    FVALOR_GRANDE_TOTAL: Extended;
    FDATA_SINCRONIZACAO: TDateTime;
    FHORA_SINCRONIZACAO: String;

  published 
    property Id: Integer  read FID write FID;
    property NomeCaixa: String  read FNOME_CAIXA write FNOME_CAIXA;
    property IdGeradoCaixa: Integer  read FID_GERADO_CAIXA write FID_GERADO_CAIXA;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    property NumeroSerieEcf: String  read FNUMERO_SERIE_ECF write FNUMERO_SERIE_ECF;
    property NumeroEquipamento: Integer  read FNUMERO_EQUIPAMENTO write FNUMERO_EQUIPAMENTO;
    property ModeloDocumentoFiscal: String  read FMODELO_DOCUMENTO_FISCAL write FMODELO_DOCUMENTO_FISCAL;
    property CooInicial: Integer  read FCOO_INICIAL write FCOO_INICIAL;
    property CooFinal: Integer  read FCOO_FINAL write FCOO_FINAL;
    property Crz: Integer  read FCRZ write FCRZ;
    property Cro: Integer  read FCRO write FCRO;
    property ValorVendaBruta: Extended  read FVALOR_VENDA_BRUTA write FVALOR_VENDA_BRUTA;
    property ValorGrandeTotal: Extended  read FVALOR_GRANDE_TOTAL write FVALOR_GRANDE_TOTAL;
    property DataSincronizacao: TDateTime  read FDATA_SINCRONIZACAO write FDATA_SINCRONIZACAO;
    property HoraSincronizacao: String  read FHORA_SINCRONIZACAO write FHORA_SINCRONIZACAO;

  end;

  TListaEcfSintegra60mVO = specialize TFPGObjectList<TEcfSintegra60mVO>;

implementation


initialization
  Classes.RegisterClass(TEcfSintegra60mVO);

finalization
  Classes.UnRegisterClass(TEcfSintegra60mVO);

end.

