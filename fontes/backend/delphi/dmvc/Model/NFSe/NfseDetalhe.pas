{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFSE_DETALHE] 
                                                                                
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
unit NfseDetalhe;

interface

uses
  Generics.Collections, System.SysUtils,
  NfseListaServico, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfseDetalhe = class(TModelBase)
  private
    FId: Integer;
    FIdNfseListaServico: Integer;
    FIdNfseCabecalho: Integer;
    FValorServicos: Extended;
    FValorDeducoes: Extended;
    FValorPis: Extended;
    FValorCofins: Extended;
    FValorInss: Extended;
    FValorIr: Extended;
    FValorCsll: Extended;
    FCodigoCnae: string;
    FCodigoTributacaoMunicipio: string;
    FValorBaseCalculo: Extended;
    FAliquota: Extended;
    FValorIss: Extended;
    FValorLiquido: Extended;
    FOutrasRetencoes: Extended;
    FValorCredito: Extended;
    FIssRetido: string;
    FValorIssRetido: Extended;
    FValorDescontoCondicionado: Extended;
    FValorDescontoIncondicionado: Extended;
    FDiscriminacao: string;
    FMunicipioPrestacao: Integer;
      
    FNfseListaServico: TNfseListaServico;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFSE_LISTA_SERVICO')]
		[MVCNameAsAttribute('idNfseListaServico')]
		property IdNfseListaServico: Integer read FIdNfseListaServico write FIdNfseListaServico;
    [MVCColumnAttribute('ID_NFSE_CABECALHO')]
		[MVCNameAsAttribute('idNfseCabecalho')]
		property IdNfseCabecalho: Integer read FIdNfseCabecalho write FIdNfseCabecalho;
    [MVCColumnAttribute('VALOR_SERVICOS')]
		[MVCNameAsAttribute('valorServicos')]
		property ValorServicos: Extended read FValorServicos write FValorServicos;
    [MVCColumnAttribute('VALOR_DEDUCOES')]
		[MVCNameAsAttribute('valorDeducoes')]
		property ValorDeducoes: Extended read FValorDeducoes write FValorDeducoes;
    [MVCColumnAttribute('VALOR_PIS')]
		[MVCNameAsAttribute('valorPis')]
		property ValorPis: Extended read FValorPis write FValorPis;
    [MVCColumnAttribute('VALOR_COFINS')]
		[MVCNameAsAttribute('valorCofins')]
		property ValorCofins: Extended read FValorCofins write FValorCofins;
    [MVCColumnAttribute('VALOR_INSS')]
		[MVCNameAsAttribute('valorInss')]
		property ValorInss: Extended read FValorInss write FValorInss;
    [MVCColumnAttribute('VALOR_IR')]
		[MVCNameAsAttribute('valorIr')]
		property ValorIr: Extended read FValorIr write FValorIr;
    [MVCColumnAttribute('VALOR_CSLL')]
		[MVCNameAsAttribute('valorCsll')]
		property ValorCsll: Extended read FValorCsll write FValorCsll;
    [MVCColumnAttribute('CODIGO_CNAE')]
		[MVCNameAsAttribute('codigoCnae')]
		property CodigoCnae: string read FCodigoCnae write FCodigoCnae;
    [MVCColumnAttribute('CODIGO_TRIBUTACAO_MUNICIPIO')]
		[MVCNameAsAttribute('codigoTributacaoMunicipio')]
		property CodigoTributacaoMunicipio: string read FCodigoTributacaoMunicipio write FCodigoTributacaoMunicipio;
    [MVCColumnAttribute('VALOR_BASE_CALCULO')]
		[MVCNameAsAttribute('valorBaseCalculo')]
		property ValorBaseCalculo: Extended read FValorBaseCalculo write FValorBaseCalculo;
    [MVCColumnAttribute('ALIQUOTA')]
		[MVCNameAsAttribute('aliquota')]
		property Aliquota: Extended read FAliquota write FAliquota;
    [MVCColumnAttribute('VALOR_ISS')]
		[MVCNameAsAttribute('valorIss')]
		property ValorIss: Extended read FValorIss write FValorIss;
    [MVCColumnAttribute('VALOR_LIQUIDO')]
		[MVCNameAsAttribute('valorLiquido')]
		property ValorLiquido: Extended read FValorLiquido write FValorLiquido;
    [MVCColumnAttribute('OUTRAS_RETENCOES')]
		[MVCNameAsAttribute('outrasRetencoes')]
		property OutrasRetencoes: Extended read FOutrasRetencoes write FOutrasRetencoes;
    [MVCColumnAttribute('VALOR_CREDITO')]
		[MVCNameAsAttribute('valorCredito')]
		property ValorCredito: Extended read FValorCredito write FValorCredito;
    [MVCColumnAttribute('ISS_RETIDO')]
		[MVCNameAsAttribute('issRetido')]
		property IssRetido: string read FIssRetido write FIssRetido;
    [MVCColumnAttribute('VALOR_ISS_RETIDO')]
		[MVCNameAsAttribute('valorIssRetido')]
		property ValorIssRetido: Extended read FValorIssRetido write FValorIssRetido;
    [MVCColumnAttribute('VALOR_DESCONTO_CONDICIONADO')]
		[MVCNameAsAttribute('valorDescontoCondicionado')]
		property ValorDescontoCondicionado: Extended read FValorDescontoCondicionado write FValorDescontoCondicionado;
    [MVCColumnAttribute('VALOR_DESCONTO_INCONDICIONADO')]
		[MVCNameAsAttribute('valorDescontoIncondicionado')]
		property ValorDescontoIncondicionado: Extended read FValorDescontoIncondicionado write FValorDescontoIncondicionado;
    [MVCColumnAttribute('DISCRIMINACAO')]
		[MVCNameAsAttribute('discriminacao')]
		property Discriminacao: string read FDiscriminacao write FDiscriminacao;
    [MVCColumnAttribute('MUNICIPIO_PRESTACAO')]
		[MVCNameAsAttribute('municipioPrestacao')]
		property MunicipioPrestacao: Integer read FMunicipioPrestacao write FMunicipioPrestacao;
      
    [MVCNameAsAttribute('nfseListaServico')]
		property NfseListaServico: TNfseListaServico read FNfseListaServico write FNfseListaServico;
  end;

implementation

{ TNfseDetalhe }

constructor TNfseDetalhe.Create;
begin
  inherited;

  FNfseListaServico := TNfseListaServico.Create;
end;

destructor TNfseDetalhe.Destroy;
begin
  FreeAndNil(FNfseListaServico);
  inherited;
end;



end.