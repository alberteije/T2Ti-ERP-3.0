{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [FISCAL_NOTA_FISCAL_ENTRADA] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
unit FiscalNotaFiscalEntrada;

interface

uses
  Generics.Collections, System.SysUtils,
  NfeCabecalho, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TFiscalNotaFiscalEntrada = class(TModelBase)
  private
    FId: Integer;
    FIdNfeCabecalho: Integer;
    FCompetencia: string;
    FCfopEntrada: Integer;
    FValorRateioFrete: Extended;
    FValorCustoMedio: Extended;
    FValorIcmsAntecipado: Extended;
    FValorBcIcmsAntecipado: Extended;
    FValorBcIcmsCreditado: Extended;
    FValorBcPisCreditado: Extended;
    FValorBcCofinsCreditado: Extended;
    FValorBcIpiCreditado: Extended;
    FCstCreditoIcms: string;
    FCstCreditoPis: string;
    FCstCreditoCofins: string;
    FCstCreditoIpi: string;
    FValorIcmsCreditado: Extended;
    FValorPisCreditado: Extended;
    FValorCofinsCreditado: Extended;
    FValorIpiCreditado: Extended;
    FQtdeParcelaCreditoPis: Integer;
    FQtdeParcelaCreditoCofins: Integer;
    FQtdeParcelaCreditoIcms: Integer;
    FQtdeParcelaCreditoIpi: Integer;
    FAliquotaCreditoIcms: Extended;
    FAliquotaCreditoPis: Extended;
    FAliquotaCreditoCofins: Extended;
    FAliquotaCreditoIpi: Extended;
      
    FNfeCabecalho: TNfeCabecalho;
  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_CABECALHO')]
		[MVCNameAsAttribute('idNfeCabecalho')]
		property IdNfeCabecalho: Integer read FIdNfeCabecalho write FIdNfeCabecalho;
    [MVCColumnAttribute('COMPETENCIA')]
		[MVCNameAsAttribute('competencia')]
		property Competencia: string read FCompetencia write FCompetencia;
    [MVCColumnAttribute('CFOP_ENTRADA')]
		[MVCNameAsAttribute('cfopEntrada')]
		property CfopEntrada: Integer read FCfopEntrada write FCfopEntrada;
    [MVCColumnAttribute('VALOR_RATEIO_FRETE')]
		[MVCNameAsAttribute('valorRateioFrete')]
		property ValorRateioFrete: Extended read FValorRateioFrete write FValorRateioFrete;
    [MVCColumnAttribute('VALOR_CUSTO_MEDIO')]
		[MVCNameAsAttribute('valorCustoMedio')]
		property ValorCustoMedio: Extended read FValorCustoMedio write FValorCustoMedio;
    [MVCColumnAttribute('VALOR_ICMS_ANTECIPADO')]
		[MVCNameAsAttribute('valorIcmsAntecipado')]
		property ValorIcmsAntecipado: Extended read FValorIcmsAntecipado write FValorIcmsAntecipado;
    [MVCColumnAttribute('VALOR_BC_ICMS_ANTECIPADO')]
		[MVCNameAsAttribute('valorBcIcmsAntecipado')]
		property ValorBcIcmsAntecipado: Extended read FValorBcIcmsAntecipado write FValorBcIcmsAntecipado;
    [MVCColumnAttribute('VALOR_BC_ICMS_CREDITADO')]
		[MVCNameAsAttribute('valorBcIcmsCreditado')]
		property ValorBcIcmsCreditado: Extended read FValorBcIcmsCreditado write FValorBcIcmsCreditado;
    [MVCColumnAttribute('VALOR_BC_PIS_CREDITADO')]
		[MVCNameAsAttribute('valorBcPisCreditado')]
		property ValorBcPisCreditado: Extended read FValorBcPisCreditado write FValorBcPisCreditado;
    [MVCColumnAttribute('VALOR_BC_COFINS_CREDITADO')]
		[MVCNameAsAttribute('valorBcCofinsCreditado')]
		property ValorBcCofinsCreditado: Extended read FValorBcCofinsCreditado write FValorBcCofinsCreditado;
    [MVCColumnAttribute('VALOR_BC_IPI_CREDITADO')]
		[MVCNameAsAttribute('valorBcIpiCreditado')]
		property ValorBcIpiCreditado: Extended read FValorBcIpiCreditado write FValorBcIpiCreditado;
    [MVCColumnAttribute('CST_CREDITO_ICMS')]
		[MVCNameAsAttribute('cstCreditoIcms')]
		property CstCreditoIcms: string read FCstCreditoIcms write FCstCreditoIcms;
    [MVCColumnAttribute('CST_CREDITO_PIS')]
		[MVCNameAsAttribute('cstCreditoPis')]
		property CstCreditoPis: string read FCstCreditoPis write FCstCreditoPis;
    [MVCColumnAttribute('CST_CREDITO_COFINS')]
		[MVCNameAsAttribute('cstCreditoCofins')]
		property CstCreditoCofins: string read FCstCreditoCofins write FCstCreditoCofins;
    [MVCColumnAttribute('CST_CREDITO_IPI')]
		[MVCNameAsAttribute('cstCreditoIpi')]
		property CstCreditoIpi: string read FCstCreditoIpi write FCstCreditoIpi;
    [MVCColumnAttribute('VALOR_ICMS_CREDITADO')]
		[MVCNameAsAttribute('valorIcmsCreditado')]
		property ValorIcmsCreditado: Extended read FValorIcmsCreditado write FValorIcmsCreditado;
    [MVCColumnAttribute('VALOR_PIS_CREDITADO')]
		[MVCNameAsAttribute('valorPisCreditado')]
		property ValorPisCreditado: Extended read FValorPisCreditado write FValorPisCreditado;
    [MVCColumnAttribute('VALOR_COFINS_CREDITADO')]
		[MVCNameAsAttribute('valorCofinsCreditado')]
		property ValorCofinsCreditado: Extended read FValorCofinsCreditado write FValorCofinsCreditado;
    [MVCColumnAttribute('VALOR_IPI_CREDITADO')]
		[MVCNameAsAttribute('valorIpiCreditado')]
		property ValorIpiCreditado: Extended read FValorIpiCreditado write FValorIpiCreditado;
    [MVCColumnAttribute('QTDE_PARCELA_CREDITO_PIS')]
		[MVCNameAsAttribute('qtdeParcelaCreditoPis')]
		property QtdeParcelaCreditoPis: Integer read FQtdeParcelaCreditoPis write FQtdeParcelaCreditoPis;
    [MVCColumnAttribute('QTDE_PARCELA_CREDITO_COFINS')]
		[MVCNameAsAttribute('qtdeParcelaCreditoCofins')]
		property QtdeParcelaCreditoCofins: Integer read FQtdeParcelaCreditoCofins write FQtdeParcelaCreditoCofins;
    [MVCColumnAttribute('QTDE_PARCELA_CREDITO_ICMS')]
		[MVCNameAsAttribute('qtdeParcelaCreditoIcms')]
		property QtdeParcelaCreditoIcms: Integer read FQtdeParcelaCreditoIcms write FQtdeParcelaCreditoIcms;
    [MVCColumnAttribute('QTDE_PARCELA_CREDITO_IPI')]
		[MVCNameAsAttribute('qtdeParcelaCreditoIpi')]
		property QtdeParcelaCreditoIpi: Integer read FQtdeParcelaCreditoIpi write FQtdeParcelaCreditoIpi;
    [MVCColumnAttribute('ALIQUOTA_CREDITO_ICMS')]
		[MVCNameAsAttribute('aliquotaCreditoIcms')]
		property AliquotaCreditoIcms: Extended read FAliquotaCreditoIcms write FAliquotaCreditoIcms;
    [MVCColumnAttribute('ALIQUOTA_CREDITO_PIS')]
		[MVCNameAsAttribute('aliquotaCreditoPis')]
		property AliquotaCreditoPis: Extended read FAliquotaCreditoPis write FAliquotaCreditoPis;
    [MVCColumnAttribute('ALIQUOTA_CREDITO_COFINS')]
		[MVCNameAsAttribute('aliquotaCreditoCofins')]
		property AliquotaCreditoCofins: Extended read FAliquotaCreditoCofins write FAliquotaCreditoCofins;
    [MVCColumnAttribute('ALIQUOTA_CREDITO_IPI')]
		[MVCNameAsAttribute('aliquotaCreditoIpi')]
		property AliquotaCreditoIpi: Extended read FAliquotaCreditoIpi write FAliquotaCreditoIpi;
      
    [MVCNameAsAttribute('nfeCabecalho')]
		property NfeCabecalho: TNfeCabecalho read FNfeCabecalho write FNfeCabecalho;
  end;

implementation

{ TFiscalNotaFiscalEntrada }

constructor TFiscalNotaFiscalEntrada.Create;
begin
  inherited;
  FNfeCabecalho := TNfeCabecalho.Create;
end;

destructor TFiscalNotaFiscalEntrada.Destroy;
begin
  FreeAndNil(FNfeCabecalho);
  inherited;
end;

end.