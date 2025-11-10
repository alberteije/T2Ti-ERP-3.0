{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFSE_CABECALHO] 
                                                                                
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
unit NfseCabecalhoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  NFSeDetalheVO, NFSeIntermediarioVO;

type
  TNfseCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_OS_ABERTURA: Integer;
    FID_CLIENTE: Integer;
    FID_EMPRESA: Integer;
    FNUMERO: String;
    FCODIGO_VERIFICACAO: String;
    FDATA_HORA_EMISSAO: TDateTime;
    FCOMPETENCIA: String;
    FNUMERO_SUBSTITUIDA: String;
    FNATUREZA_OPERACAO: Integer;
    FREGIME_ESPECIAL_TRIBUTACAO: Integer;
    FOPTANTE_SIMPLES_NACIONAL: String;
    FINCENTIVADOR_CULTURAL: String;
    FNUMERO_RPS: String;
    FSERIE_RPS: String;
    FTIPO_RPS: Integer;
    FDATA_EMISSAO_RPS: TDateTime;
    FOUTRAS_INFORMACOES: String;
    FCODIGO_OBRA: String;
    FNUMERO_ART: String;

    //Transientes
    FListaNFSeDetalheVO: TListaNFSeDetalheVO;
    FListaNFSeIntermediarioVO: TListaNFSeIntermediarioVO;


  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdOsAbertura: Integer  read FID_OS_ABERTURA write FID_OS_ABERTURA;
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property Numero: String  read FNUMERO write FNUMERO;
    property CodigoVerificacao: String  read FCODIGO_VERIFICACAO write FCODIGO_VERIFICACAO;
    property DataHoraEmissao: TDateTime  read FDATA_HORA_EMISSAO write FDATA_HORA_EMISSAO;
    property Competencia: String  read FCOMPETENCIA write FCOMPETENCIA;
    property NumeroSubstituida: String  read FNUMERO_SUBSTITUIDA write FNUMERO_SUBSTITUIDA;
    property NaturezaOperacao: Integer  read FNATUREZA_OPERACAO write FNATUREZA_OPERACAO;
    property RegimeEspecialTributacao: Integer  read FREGIME_ESPECIAL_TRIBUTACAO write FREGIME_ESPECIAL_TRIBUTACAO;
    property OptanteSimplesNacional: String  read FOPTANTE_SIMPLES_NACIONAL write FOPTANTE_SIMPLES_NACIONAL;
    property IncentivadorCultural: String  read FINCENTIVADOR_CULTURAL write FINCENTIVADOR_CULTURAL;
    property NumeroRps: String  read FNUMERO_RPS write FNUMERO_RPS;
    property SerieRps: String  read FSERIE_RPS write FSERIE_RPS;
    property TipoRps: Integer  read FTIPO_RPS write FTIPO_RPS;
    property DataEmissaoRps: TDateTime  read FDATA_EMISSAO_RPS write FDATA_EMISSAO_RPS;
    property OutrasInformacoes: String  read FOUTRAS_INFORMACOES write FOUTRAS_INFORMACOES;
    property CodigoObra: String  read FCODIGO_OBRA write FCODIGO_OBRA;
    property NumeroArt: String  read FNUMERO_ART write FNUMERO_ART;


    //Transientes
    property ListaNFSeDetalheVO: TListaNFSeDetalheVO read FListaNfseDetalheVO write FListaNfseDetalheVO;


    //Transientes
    property ListaNFSeIntermediarioVO: TListaNFSeIntermediarioVO read FListaNFSeIntermediarioVO write FListaNFSeIntermediarioVO;

  end;

  TListaNfseCabecalhoVO = specialize TFPGObjectList<TNfseCabecalhoVO>;

implementation

constructor TNfseCabecalhoVO.Create;
begin
  inherited;

  FListaNfseDetalheVO := TListaNFSeDetalheVO.Create;
  FListaNFSeIntermediarioVO := TListaNFSeIntermediarioVO.Create;
end;

destructor TNfseCabecalhoVO.Destroy;
begin
  FreeAndNil(FListaNfseDetalheVO);
  FreeAndNil(FListaNFSeIntermediarioVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TNfseCabecalhoVO);

finalization
  Classes.UnRegisterClass(TNfseCabecalhoVO);

end.
