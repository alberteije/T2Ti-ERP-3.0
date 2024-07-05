{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_TRANSPORTE] 
                                                                                
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
unit NfeTransporte;

interface

uses
  Generics.Collections, System.SysUtils,
  NfeTransporteReboque, NfeTransporteVolume, Transportadora, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeTransporte = class(TModelBase)
  private
    FId: Integer;
    FIdNfeCabecalho: Integer;
    FIdTransportadora: Integer;
    FModalidadeFrete: string;
    FCnpj: string;
    FCpf: string;
    FNome: string;
    FInscricaoEstadual: string;
    FEndereco: string;
    FNomeMunicipio: string;
    FUf: string;
    FValorServico: Extended;
    FValorBcRetencaoIcms: Extended;
    FAliquotaRetencaoIcms: Extended;
    FValorIcmsRetido: Extended;
    FCfop: Integer;
    FMunicipio: Integer;
    FPlacaVeiculo: string;
    FUfVeiculo: string;
    FRntcVeiculo: string;
      
    FTransportadora: TTransportadora;
    FListaNfeTransporteReboque: TObjectList<TNfeTransporteReboque>;
    FListaNfeTransporteVolume: TObjectList<TNfeTransporteVolume>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_CABECALHO')]
		[MVCNameAsAttribute('idNfeCabecalho')]
		property IdNfeCabecalho: Integer read FIdNfeCabecalho write FIdNfeCabecalho;
    [MVCColumnAttribute('ID_TRANSPORTADORA')]
		[MVCNameAsAttribute('idTransportadora')]
		property IdTransportadora: Integer read FIdTransportadora write FIdTransportadora;
    [MVCColumnAttribute('MODALIDADE_FRETE')]
		[MVCNameAsAttribute('modalidadeFrete')]
		property ModalidadeFrete: string read FModalidadeFrete write FModalidadeFrete;
    [MVCColumnAttribute('CNPJ')]
		[MVCNameAsAttribute('cnpj')]
		property Cnpj: string read FCnpj write FCnpj;
    [MVCColumnAttribute('CPF')]
		[MVCNameAsAttribute('cpf')]
		property Cpf: string read FCpf write FCpf;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('INSCRICAO_ESTADUAL')]
		[MVCNameAsAttribute('inscricaoEstadual')]
		property InscricaoEstadual: string read FInscricaoEstadual write FInscricaoEstadual;
    [MVCColumnAttribute('ENDERECO')]
		[MVCNameAsAttribute('endereco')]
		property Endereco: string read FEndereco write FEndereco;
    [MVCColumnAttribute('NOME_MUNICIPIO')]
		[MVCNameAsAttribute('nomeMunicipio')]
		property NomeMunicipio: string read FNomeMunicipio write FNomeMunicipio;
    [MVCColumnAttribute('UF')]
		[MVCNameAsAttribute('uf')]
		property Uf: string read FUf write FUf;
    [MVCColumnAttribute('VALOR_SERVICO')]
		[MVCNameAsAttribute('valorServico')]
		property ValorServico: Extended read FValorServico write FValorServico;
    [MVCColumnAttribute('VALOR_BC_RETENCAO_ICMS')]
		[MVCNameAsAttribute('valorBcRetencaoIcms')]
		property ValorBcRetencaoIcms: Extended read FValorBcRetencaoIcms write FValorBcRetencaoIcms;
    [MVCColumnAttribute('ALIQUOTA_RETENCAO_ICMS')]
		[MVCNameAsAttribute('aliquotaRetencaoIcms')]
		property AliquotaRetencaoIcms: Extended read FAliquotaRetencaoIcms write FAliquotaRetencaoIcms;
    [MVCColumnAttribute('VALOR_ICMS_RETIDO')]
		[MVCNameAsAttribute('valorIcmsRetido')]
		property ValorIcmsRetido: Extended read FValorIcmsRetido write FValorIcmsRetido;
    [MVCColumnAttribute('CFOP')]
		[MVCNameAsAttribute('cfop')]
		property Cfop: Integer read FCfop write FCfop;
    [MVCColumnAttribute('MUNICIPIO')]
		[MVCNameAsAttribute('municipio')]
		property Municipio: Integer read FMunicipio write FMunicipio;
    [MVCColumnAttribute('PLACA_VEICULO')]
		[MVCNameAsAttribute('placaVeiculo')]
		property PlacaVeiculo: string read FPlacaVeiculo write FPlacaVeiculo;
    [MVCColumnAttribute('UF_VEICULO')]
		[MVCNameAsAttribute('ufVeiculo')]
		property UfVeiculo: string read FUfVeiculo write FUfVeiculo;
    [MVCColumnAttribute('RNTC_VEICULO')]
		[MVCNameAsAttribute('rntcVeiculo')]
		property RntcVeiculo: string read FRntcVeiculo write FRntcVeiculo;
      
    [MVCNameAsAttribute('transportadora')]
		property Transportadora: TTransportadora read FTransportadora write FTransportadora;
    [MapperListOf(TNfeTransporteReboque)]
	[MVCNameAsAttribute('listaNfeTransporteReboque')]
	property ListaNfeTransporteReboque: TObjectList<TNfeTransporteReboque> read FListaNfeTransporteReboque write FListaNfeTransporteReboque;
    [MapperListOf(TNfeTransporteVolume)]
	[MVCNameAsAttribute('listaNfeTransporteVolume')]
	property ListaNfeTransporteVolume: TObjectList<TNfeTransporteVolume> read FListaNfeTransporteVolume write FListaNfeTransporteVolume;
  end;

implementation

{ TNfeTransporte }

constructor TNfeTransporte.Create;
begin
  inherited;

  FListaNfeTransporteReboque := TObjectList<TNfeTransporteReboque>.Create;
  FListaNfeTransporteVolume := TObjectList<TNfeTransporteVolume>.Create;
  FTransportadora := TTransportadora.Create;
end;

destructor TNfeTransporte.Destroy;
begin
  FreeAndNil(FListaNfeTransporteReboque);
  FreeAndNil(FListaNfeTransporteVolume);
  FreeAndNil(FTransportadora);
  inherited;
end;



end.