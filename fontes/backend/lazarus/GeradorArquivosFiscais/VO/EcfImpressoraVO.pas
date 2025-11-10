{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_IMPRESSORA] 
                                                                                
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
unit EcfImpressoraVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TEcfImpressoraVO = class(TVO)
  private
    FID: Integer;
    FNUMERO: Integer;
    FCODIGO: String;
    FSERIE: String;
    FIDENTIFICACAO: String;
    FMC: String;
    FMD: String;
    FVR: String;
    FTIPO: String;
    FMARCA: String;
    FMODELO: String;
    FMODELO_ACBR: String;
    FMODELO_DOCUMENTO_FISCAL: String;
    FVERSAO: String;
    FLE: String;
    FLEF: String;
    FMFD: String;
    FLACRE_NA_MFD: String;
    FDATA_INSTALACAO_SB: TDateTime;
    FHORA_INSTALACAO_SB: String;
    FDOCTO: String;
    FECF_IMPRESSORA: String;

  published 
    property Id: Integer  read FID write FID;
    property Numero: Integer  read FNUMERO write FNUMERO;
    property Codigo: String  read FCODIGO write FCODIGO;
    property Serie: String  read FSERIE write FSERIE;
    property Identificacao: String  read FIDENTIFICACAO write FIDENTIFICACAO;
    property Mc: String  read FMC write FMC;
    property Md: String  read FMD write FMD;
    property Vr: String  read FVR write FVR;
    property Tipo: String  read FTIPO write FTIPO;
    property Marca: String  read FMARCA write FMARCA;
    property Modelo: String  read FMODELO write FMODELO;
    property ModeloAcbr: String  read FMODELO_ACBR write FMODELO_ACBR;
    property ModeloDocumentoFiscal: String  read FMODELO_DOCUMENTO_FISCAL write FMODELO_DOCUMENTO_FISCAL;
    property Versao: String  read FVERSAO write FVERSAO;
    property Le: String  read FLE write FLE;
    property Lef: String  read FLEF write FLEF;
    property Mfd: String  read FMFD write FMFD;
    property LacreNaMfd: String  read FLACRE_NA_MFD write FLACRE_NA_MFD;
    property DataInstalacaoSb: TDateTime  read FDATA_INSTALACAO_SB write FDATA_INSTALACAO_SB;
    property HoraInstalacaoSb: String  read FHORA_INSTALACAO_SB write FHORA_INSTALACAO_SB;
    property Docto: String  read FDOCTO write FDOCTO;
    property EcfImpressora: String  read FECF_IMPRESSORA write FECF_IMPRESSORA;

  end;

  TListaEcfImpressoraVO = specialize TFPGObjectList<TEcfImpressoraVO>;

implementation


initialization
  Classes.RegisterClass(TEcfImpressoraVO);

finalization
  Classes.UnRegisterClass(TEcfImpressoraVO);

end.
