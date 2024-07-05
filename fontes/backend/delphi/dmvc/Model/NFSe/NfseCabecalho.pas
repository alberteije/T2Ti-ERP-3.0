{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFSE_CABECALHO] 
                                                                                
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
unit NfseCabecalho;

interface

uses
  Generics.Collections, System.SysUtils,
  NfseDetalhe, NfseIntermediario, Cliente, OsAbertura, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfseCabecalho = class(TModelBase)
  private
    FId: Integer;
    FIdCliente: Integer;
    FIdOsAbertura: Integer;
    FNumero: string;
    FCodigoVerificacao: string;
    FDataHoraEmissao: TDateTime;
    FCompetencia: string;
    FNumeroSubstituida: string;
    FNaturezaOperacao: string;
    FRegimeEspecialTributacao: string;
    FOptanteSimplesNacional: string;
    FIncentivadorCultural: string;
    FNumeroRps: string;
    FSerieRps: string;
    FTipoRps: string;
    FDataEmissaoRps: TDateTime;
    FOutrasInformacoes: string;
      
    FNfseIntermediario: TNfseIntermediario;
    FCliente: TCliente;
    FOsAbertura: TOsAbertura;
    FListaNfseDetalhe: TObjectList<TNfseDetalhe>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_CLIENTE')]
		[MVCNameAsAttribute('idCliente')]
		property IdCliente: Integer read FIdCliente write FIdCliente;
    [MVCColumnAttribute('ID_OS_ABERTURA')]
		[MVCNameAsAttribute('idOsAbertura')]
		property IdOsAbertura: Integer read FIdOsAbertura write FIdOsAbertura;
    [MVCColumnAttribute('NUMERO')]
		[MVCNameAsAttribute('numero')]
		property Numero: string read FNumero write FNumero;
    [MVCColumnAttribute('CODIGO_VERIFICACAO')]
		[MVCNameAsAttribute('codigoVerificacao')]
		property CodigoVerificacao: string read FCodigoVerificacao write FCodigoVerificacao;
    [MVCColumnAttribute('DATA_HORA_EMISSAO')]
		[MVCNameAsAttribute('dataHoraEmissao')]
		property DataHoraEmissao: TDateTime read FDataHoraEmissao write FDataHoraEmissao;
    [MVCColumnAttribute('COMPETENCIA')]
		[MVCNameAsAttribute('competencia')]
		property Competencia: string read FCompetencia write FCompetencia;
    [MVCColumnAttribute('NUMERO_SUBSTITUIDA')]
		[MVCNameAsAttribute('numeroSubstituida')]
		property NumeroSubstituida: string read FNumeroSubstituida write FNumeroSubstituida;
    [MVCColumnAttribute('NATUREZA_OPERACAO')]
		[MVCNameAsAttribute('naturezaOperacao')]
		property NaturezaOperacao: string read FNaturezaOperacao write FNaturezaOperacao;
    [MVCColumnAttribute('REGIME_ESPECIAL_TRIBUTACAO')]
		[MVCNameAsAttribute('regimeEspecialTributacao')]
		property RegimeEspecialTributacao: string read FRegimeEspecialTributacao write FRegimeEspecialTributacao;
    [MVCColumnAttribute('OPTANTE_SIMPLES_NACIONAL')]
		[MVCNameAsAttribute('optanteSimplesNacional')]
		property OptanteSimplesNacional: string read FOptanteSimplesNacional write FOptanteSimplesNacional;
    [MVCColumnAttribute('INCENTIVADOR_CULTURAL')]
		[MVCNameAsAttribute('incentivadorCultural')]
		property IncentivadorCultural: string read FIncentivadorCultural write FIncentivadorCultural;
    [MVCColumnAttribute('NUMERO_RPS')]
		[MVCNameAsAttribute('numeroRps')]
		property NumeroRps: string read FNumeroRps write FNumeroRps;
    [MVCColumnAttribute('SERIE_RPS')]
		[MVCNameAsAttribute('serieRps')]
		property SerieRps: string read FSerieRps write FSerieRps;
    [MVCColumnAttribute('TIPO_RPS')]
		[MVCNameAsAttribute('tipoRps')]
		property TipoRps: string read FTipoRps write FTipoRps;
    [MVCColumnAttribute('DATA_EMISSAO_RPS')]
		[MVCNameAsAttribute('dataEmissaoRps')]
		property DataEmissaoRps: TDateTime read FDataEmissaoRps write FDataEmissaoRps;
    [MVCColumnAttribute('OUTRAS_INFORMACOES')]
		[MVCNameAsAttribute('outrasInformacoes')]
		property OutrasInformacoes: string read FOutrasInformacoes write FOutrasInformacoes;
      
    [MVCNameAsAttribute('nfseIntermediario')]
		property NfseIntermediario: TNfseIntermediario read FNfseIntermediario write FNfseIntermediario;
    [MVCNameAsAttribute('cliente')]
		property Cliente: TCliente read FCliente write FCliente;
    [MVCNameAsAttribute('osAbertura')]
		property OsAbertura: TOsAbertura read FOsAbertura write FOsAbertura;
    [MapperListOf(TNfseDetalhe)]
	[MVCNameAsAttribute('listaNfseDetalhe')]
	property ListaNfseDetalhe: TObjectList<TNfseDetalhe> read FListaNfseDetalhe write FListaNfseDetalhe;
  end;

implementation

{ TNfseCabecalho }

constructor TNfseCabecalho.Create;
begin
  inherited;

  FListaNfseDetalhe := TObjectList<TNfseDetalhe>.Create;
  FNfseIntermediario := TNfseIntermediario.Create;
  FCliente := TCliente.Create;
  FOsAbertura := TOsAbertura.Create;
end;

destructor TNfseCabecalho.Destroy;
begin
  FreeAndNil(FListaNfseDetalhe);
  FreeAndNil(FNfseIntermediario);
  FreeAndNil(FCliente);
  FreeAndNil(FOsAbertura);
  inherited;
end;



end.