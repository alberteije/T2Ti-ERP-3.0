{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************}
unit NfeDetalheImpostoIcms;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeDetalheImpostoIcms = class(TModelBase)
  private
    FId: Integer;
    FIdNfeDetalhe: Integer;
    FOrigemMercadoria: string;
    FCstIcms: string;
    FCsosn: string;
    FModalidadeBcIcms: string;
    FPercentualReducaoBcIcms: Extended;
    FValorBcIcms: Extended;
    FAliquotaIcms: Extended;
    FValorIcmsOperacao: Extended;
    FPercentualDiferimento: Extended;
    FValorIcmsDiferido: Extended;
    FValorIcms: Extended;
    FBaseCalculoFcp: Extended;
    FPercentualFcp: Extended;
    FValorFcp: Extended;
    FModalidadeBcIcmsSt: string;
    FPercentualMvaIcmsSt: Extended;
    FPercentualReducaoBcIcmsSt: Extended;
    FValorBaseCalculoIcmsSt: Extended;
    FAliquotaIcmsSt: Extended;
    FValorIcmsSt: Extended;
    FBaseCalculoFcpSt: Extended;
    FPercentualFcpSt: Extended;
    FValorFcpSt: Extended;
    FUfSt: string;
    FPercentualBcOperacaoPropria: Extended;
    FValorBcIcmsStRetido: Extended;
    FAliquotaSuportadaConsumidor: Extended;
    FValorIcmsSubstituto: Extended;
    FValorIcmsStRetido: Extended;
    FBaseCalculoFcpStRetido: Extended;
    FPercentualFcpStRetido: Extended;
    FValorFcpStRetido: Extended;
    FMotivoDesoneracaoIcms: string;
    FValorIcmsDesonerado: Extended;
    FAliquotaCreditoIcmsSn: Extended;
    FValorCreditoIcmsSn: Extended;
    FValorBcIcmsStDestino: Extended;
    FValorIcmsStDestino: Extended;
    FPercentualReducaoBcEfetivo: Extended;
    FValorBcEfetivo: Extended;
    FAliquotaIcmsEfetivo: Extended;
    FValorIcmsEfetivo: Extended;
      
  public


    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_DETALHE')]
		[MVCNameAsAttribute('idNfeDetalhe')]
		property IdNfeDetalhe: Integer read FIdNfeDetalhe write FIdNfeDetalhe;
    [MVCColumnAttribute('ORIGEM_MERCADORIA')]
		[MVCNameAsAttribute('origemMercadoria')]
		property OrigemMercadoria: string read FOrigemMercadoria write FOrigemMercadoria;
    [MVCColumnAttribute('CST_ICMS')]
		[MVCNameAsAttribute('cstIcms')]
		property CstIcms: string read FCstIcms write FCstIcms;
    [MVCColumnAttribute('CSOSN')]
		[MVCNameAsAttribute('csosn')]
		property Csosn: string read FCsosn write FCsosn;
    [MVCColumnAttribute('MODALIDADE_BC_ICMS')]
		[MVCNameAsAttribute('modalidadeBcIcms')]
		property ModalidadeBcIcms: string read FModalidadeBcIcms write FModalidadeBcIcms;
    [MVCColumnAttribute('PERCENTUAL_REDUCAO_BC_ICMS')]
		[MVCNameAsAttribute('percentualReducaoBcIcms')]
		property PercentualReducaoBcIcms: Extended read FPercentualReducaoBcIcms write FPercentualReducaoBcIcms;
    [MVCColumnAttribute('VALOR_BC_ICMS')]
		[MVCNameAsAttribute('valorBcIcms')]
		property ValorBcIcms: Extended read FValorBcIcms write FValorBcIcms;
    [MVCColumnAttribute('ALIQUOTA_ICMS')]
		[MVCNameAsAttribute('aliquotaIcms')]
		property AliquotaIcms: Extended read FAliquotaIcms write FAliquotaIcms;
    [MVCColumnAttribute('VALOR_ICMS_OPERACAO')]
		[MVCNameAsAttribute('valorIcmsOperacao')]
		property ValorIcmsOperacao: Extended read FValorIcmsOperacao write FValorIcmsOperacao;
    [MVCColumnAttribute('PERCENTUAL_DIFERIMENTO')]
		[MVCNameAsAttribute('percentualDiferimento')]
		property PercentualDiferimento: Extended read FPercentualDiferimento write FPercentualDiferimento;
    [MVCColumnAttribute('VALOR_ICMS_DIFERIDO')]
		[MVCNameAsAttribute('valorIcmsDiferido')]
		property ValorIcmsDiferido: Extended read FValorIcmsDiferido write FValorIcmsDiferido;
    [MVCColumnAttribute('VALOR_ICMS')]
		[MVCNameAsAttribute('valorIcms')]
		property ValorIcms: Extended read FValorIcms write FValorIcms;
    [MVCColumnAttribute('BASE_CALCULO_FCP')]
		[MVCNameAsAttribute('baseCalculoFcp')]
		property BaseCalculoFcp: Extended read FBaseCalculoFcp write FBaseCalculoFcp;
    [MVCColumnAttribute('PERCENTUAL_FCP')]
		[MVCNameAsAttribute('percentualFcp')]
		property PercentualFcp: Extended read FPercentualFcp write FPercentualFcp;
    [MVCColumnAttribute('VALOR_FCP')]
		[MVCNameAsAttribute('valorFcp')]
		property ValorFcp: Extended read FValorFcp write FValorFcp;
    [MVCColumnAttribute('MODALIDADE_BC_ICMS_ST')]
		[MVCNameAsAttribute('modalidadeBcIcmsSt')]
		property ModalidadeBcIcmsSt: string read FModalidadeBcIcmsSt write FModalidadeBcIcmsSt;
    [MVCColumnAttribute('PERCENTUAL_MVA_ICMS_ST')]
		[MVCNameAsAttribute('percentualMvaIcmsSt')]
		property PercentualMvaIcmsSt: Extended read FPercentualMvaIcmsSt write FPercentualMvaIcmsSt;
    [MVCColumnAttribute('PERCENTUAL_REDUCAO_BC_ICMS_ST')]
		[MVCNameAsAttribute('percentualReducaoBcIcmsSt')]
		property PercentualReducaoBcIcmsSt: Extended read FPercentualReducaoBcIcmsSt write FPercentualReducaoBcIcmsSt;
    [MVCColumnAttribute('VALOR_BASE_CALCULO_ICMS_ST')]
		[MVCNameAsAttribute('valorBaseCalculoIcmsSt')]
		property ValorBaseCalculoIcmsSt: Extended read FValorBaseCalculoIcmsSt write FValorBaseCalculoIcmsSt;
    [MVCColumnAttribute('ALIQUOTA_ICMS_ST')]
		[MVCNameAsAttribute('aliquotaIcmsSt')]
		property AliquotaIcmsSt: Extended read FAliquotaIcmsSt write FAliquotaIcmsSt;
    [MVCColumnAttribute('VALOR_ICMS_ST')]
		[MVCNameAsAttribute('valorIcmsSt')]
		property ValorIcmsSt: Extended read FValorIcmsSt write FValorIcmsSt;
    [MVCColumnAttribute('BASE_CALCULO_FCP_ST')]
		[MVCNameAsAttribute('baseCalculoFcpSt')]
		property BaseCalculoFcpSt: Extended read FBaseCalculoFcpSt write FBaseCalculoFcpSt;
    [MVCColumnAttribute('PERCENTUAL_FCP_ST')]
		[MVCNameAsAttribute('percentualFcpSt')]
		property PercentualFcpSt: Extended read FPercentualFcpSt write FPercentualFcpSt;
    [MVCColumnAttribute('VALOR_FCP_ST')]
		[MVCNameAsAttribute('valorFcpSt')]
		property ValorFcpSt: Extended read FValorFcpSt write FValorFcpSt;
    [MVCColumnAttribute('UF_ST')]
		[MVCNameAsAttribute('ufSt')]
		property UfSt: string read FUfSt write FUfSt;
    [MVCColumnAttribute('PERCENTUAL_BC_OPERACAO_PROPRIA')]
		[MVCNameAsAttribute('percentualBcOperacaoPropria')]
		property PercentualBcOperacaoPropria: Extended read FPercentualBcOperacaoPropria write FPercentualBcOperacaoPropria;
    [MVCColumnAttribute('VALOR_BC_ICMS_ST_RETIDO')]
		[MVCNameAsAttribute('valorBcIcmsStRetido')]
		property ValorBcIcmsStRetido: Extended read FValorBcIcmsStRetido write FValorBcIcmsStRetido;
    [MVCColumnAttribute('ALIQUOTA_SUPORTADA_CONSUMIDOR')]
		[MVCNameAsAttribute('aliquotaSuportadaConsumidor')]
		property AliquotaSuportadaConsumidor: Extended read FAliquotaSuportadaConsumidor write FAliquotaSuportadaConsumidor;
    [MVCColumnAttribute('VALOR_ICMS_SUBSTITUTO')]
		[MVCNameAsAttribute('valorIcmsSubstituto')]
		property ValorIcmsSubstituto: Extended read FValorIcmsSubstituto write FValorIcmsSubstituto;
    [MVCColumnAttribute('VALOR_ICMS_ST_RETIDO')]
		[MVCNameAsAttribute('valorIcmsStRetido')]
		property ValorIcmsStRetido: Extended read FValorIcmsStRetido write FValorIcmsStRetido;
    [MVCColumnAttribute('BASE_CALCULO_FCP_ST_RETIDO')]
		[MVCNameAsAttribute('baseCalculoFcpStRetido')]
		property BaseCalculoFcpStRetido: Extended read FBaseCalculoFcpStRetido write FBaseCalculoFcpStRetido;
    [MVCColumnAttribute('PERCENTUAL_FCP_ST_RETIDO')]
		[MVCNameAsAttribute('percentualFcpStRetido')]
		property PercentualFcpStRetido: Extended read FPercentualFcpStRetido write FPercentualFcpStRetido;
    [MVCColumnAttribute('VALOR_FCP_ST_RETIDO')]
		[MVCNameAsAttribute('valorFcpStRetido')]
		property ValorFcpStRetido: Extended read FValorFcpStRetido write FValorFcpStRetido;
    [MVCColumnAttribute('MOTIVO_DESONERACAO_ICMS')]
		[MVCNameAsAttribute('motivoDesoneracaoIcms')]
		property MotivoDesoneracaoIcms: string read FMotivoDesoneracaoIcms write FMotivoDesoneracaoIcms;
    [MVCColumnAttribute('VALOR_ICMS_DESONERADO')]
		[MVCNameAsAttribute('valorIcmsDesonerado')]
		property ValorIcmsDesonerado: Extended read FValorIcmsDesonerado write FValorIcmsDesonerado;
    [MVCColumnAttribute('ALIQUOTA_CREDITO_ICMS_SN')]
		[MVCNameAsAttribute('aliquotaCreditoIcmsSn')]
		property AliquotaCreditoIcmsSn: Extended read FAliquotaCreditoIcmsSn write FAliquotaCreditoIcmsSn;
    [MVCColumnAttribute('VALOR_CREDITO_ICMS_SN')]
		[MVCNameAsAttribute('valorCreditoIcmsSn')]
		property ValorCreditoIcmsSn: Extended read FValorCreditoIcmsSn write FValorCreditoIcmsSn;
    [MVCColumnAttribute('VALOR_BC_ICMS_ST_DESTINO')]
		[MVCNameAsAttribute('valorBcIcmsStDestino')]
		property ValorBcIcmsStDestino: Extended read FValorBcIcmsStDestino write FValorBcIcmsStDestino;
    [MVCColumnAttribute('VALOR_ICMS_ST_DESTINO')]
		[MVCNameAsAttribute('valorIcmsStDestino')]
		property ValorIcmsStDestino: Extended read FValorIcmsStDestino write FValorIcmsStDestino;
    [MVCColumnAttribute('PERCENTUAL_REDUCAO_BC_EFETIVO')]
		[MVCNameAsAttribute('percentualReducaoBcEfetivo')]
		property PercentualReducaoBcEfetivo: Extended read FPercentualReducaoBcEfetivo write FPercentualReducaoBcEfetivo;
    [MVCColumnAttribute('VALOR_BC_EFETIVO')]
		[MVCNameAsAttribute('valorBcEfetivo')]
		property ValorBcEfetivo: Extended read FValorBcEfetivo write FValorBcEfetivo;
    [MVCColumnAttribute('ALIQUOTA_ICMS_EFETIVO')]
		[MVCNameAsAttribute('aliquotaIcmsEfetivo')]
		property AliquotaIcmsEfetivo: Extended read FAliquotaIcmsEfetivo write FAliquotaIcmsEfetivo;
    [MVCColumnAttribute('VALOR_ICMS_EFETIVO')]
		[MVCNameAsAttribute('valorIcmsEfetivo')]
		property ValorIcmsEfetivo: Extended read FValorIcmsEfetivo write FValorIcmsEfetivo;
      
  end;

implementation

{ TNfeDetalheImpostoIcms }





end.