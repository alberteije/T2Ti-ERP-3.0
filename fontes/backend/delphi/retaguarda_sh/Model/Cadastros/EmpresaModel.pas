unit EmpresaModel;

interface

uses
  Generics.Collections, System.SysUtils,
	AdmModuloModel, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TEmpresaModel = class(TModelBase)
  private
    FId: Integer;
    FRazaoSocial: string;
    FNomeFantasia: string;
    FCnpj: string;
    FInscricaoEstadual: string;
    FInscricaoMunicipal: string;
    FTipoRegime: string;
    FCrt: string;
    FDataConstituicao: TDateTime;
    FTipo: string;
    FEmail: string;
    FLogradouro: string;
    FNumero: string;
    FComplemento: string;
    FCep: string;
    FBairro: string;
    FCidade: string;
    FUf: string;
    FFone: string;
    FContato: string;
    FCodigoIbgeCidade: Integer;
    FCodigoIbgeUf: Integer;
    FLogotipo: string;
    FRegistrado: string;
    FNaturezaJuridica: string;
    FSimei: string;
    FEmailPagamento: string;
    FDataRegistro: TDateTime;
    FHoraRegistro: string;
    FIdPlataformaPagamento: string;
      
    FAdmModuloModelList: TObjectList<TAdmModuloModel>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('id', True)] 
		[MVCNameAsAttribute('id')] 
		property Id: Integer read FId write FId; 

    [MVCColumnAttribute('razao_social')] 
		[MVCNameAsAttribute('razaoSocial')] 
		property RazaoSocial: string read FRazaoSocial write FRazaoSocial; 

    [MVCColumnAttribute('nome_fantasia')] 
		[MVCNameAsAttribute('nomeFantasia')] 
		property NomeFantasia: string read FNomeFantasia write FNomeFantasia; 

    [MVCColumnAttribute('cnpj')] 
		[MVCNameAsAttribute('cnpj')] 
		property Cnpj: string read FCnpj write FCnpj; 

    [MVCColumnAttribute('inscricao_estadual')] 
		[MVCNameAsAttribute('inscricaoEstadual')] 
		property InscricaoEstadual: string read FInscricaoEstadual write FInscricaoEstadual; 

    [MVCColumnAttribute('inscricao_municipal')] 
		[MVCNameAsAttribute('inscricaoMunicipal')] 
		property InscricaoMunicipal: string read FInscricaoMunicipal write FInscricaoMunicipal; 

    [MVCColumnAttribute('tipo_regime')] 
		[MVCNameAsAttribute('tipoRegime')] 
		property TipoRegime: string read FTipoRegime write FTipoRegime; 

    [MVCColumnAttribute('crt')] 
		[MVCNameAsAttribute('crt')] 
		property Crt: string read FCrt write FCrt; 

    [MVCColumnAttribute('data_constituicao')] 
		[MVCNameAsAttribute('dataConstituicao')] 
		property DataConstituicao: TDateTime read FDataConstituicao write FDataConstituicao; 

    [MVCColumnAttribute('tipo')] 
		[MVCNameAsAttribute('tipo')] 
		property Tipo: string read FTipo write FTipo; 

    [MVCColumnAttribute('email')] 
		[MVCNameAsAttribute('email')] 
		property Email: string read FEmail write FEmail; 

    [MVCColumnAttribute('logradouro')] 
		[MVCNameAsAttribute('logradouro')] 
		property Logradouro: string read FLogradouro write FLogradouro; 

    [MVCColumnAttribute('numero')] 
		[MVCNameAsAttribute('numero')] 
		property Numero: string read FNumero write FNumero; 

    [MVCColumnAttribute('complemento')] 
		[MVCNameAsAttribute('complemento')] 
		property Complemento: string read FComplemento write FComplemento; 

    [MVCColumnAttribute('cep')] 
		[MVCNameAsAttribute('cep')] 
		property Cep: string read FCep write FCep; 

    [MVCColumnAttribute('bairro')] 
		[MVCNameAsAttribute('bairro')] 
		property Bairro: string read FBairro write FBairro; 

    [MVCColumnAttribute('cidade')] 
		[MVCNameAsAttribute('cidade')] 
		property Cidade: string read FCidade write FCidade; 

    [MVCColumnAttribute('uf')] 
		[MVCNameAsAttribute('uf')] 
		property Uf: string read FUf write FUf; 

    [MVCColumnAttribute('fone')] 
		[MVCNameAsAttribute('fone')] 
		property Fone: string read FFone write FFone; 

    [MVCColumnAttribute('contato')] 
		[MVCNameAsAttribute('contato')] 
		property Contato: string read FContato write FContato; 

    [MVCColumnAttribute('codigo_ibge_cidade')] 
		[MVCNameAsAttribute('codigoIbgeCidade')] 
		property CodigoIbgeCidade: Integer read FCodigoIbgeCidade write FCodigoIbgeCidade; 

    [MVCColumnAttribute('codigo_ibge_uf')] 
		[MVCNameAsAttribute('codigoIbgeUf')] 
		property CodigoIbgeUf: Integer read FCodigoIbgeUf write FCodigoIbgeUf; 

    [MVCColumnAttribute('logotipo')] 
		[MVCNameAsAttribute('logotipo')] 
		property Logotipo: string read FLogotipo write FLogotipo; 

    [MVCColumnAttribute('registrado')] 
		[MVCNameAsAttribute('registrado')] 
		property Registrado: string read FRegistrado write FRegistrado; 

    [MVCColumnAttribute('natureza_juridica')] 
		[MVCNameAsAttribute('naturezaJuridica')] 
		property NaturezaJuridica: string read FNaturezaJuridica write FNaturezaJuridica; 

    [MVCColumnAttribute('simei')] 
		[MVCNameAsAttribute('simei')] 
		property Simei: string read FSimei write FSimei; 

    [MVCColumnAttribute('email_pagamento')] 
		[MVCNameAsAttribute('emailPagamento')] 
		property EmailPagamento: string read FEmailPagamento write FEmailPagamento; 

    [MVCColumnAttribute('data_registro')] 
		[MVCNameAsAttribute('dataRegistro')] 
		property DataRegistro: TDateTime read FDataRegistro write FDataRegistro; 

    [MVCColumnAttribute('hora_registro')] 
		[MVCNameAsAttribute('horaRegistro')] 
		property HoraRegistro: string read FHoraRegistro write FHoraRegistro; 

    [MVCColumnAttribute('id_plataforma_pagamento')] 
		[MVCNameAsAttribute('idPlataformaPagamento')] 
		property IdPlataformaPagamento: string read FIdPlataformaPagamento write FIdPlataformaPagamento; 

    [MapperListOf(TAdmModuloModel)] 
		[MVCNameAsAttribute('admModuloModelList')] 
		property AdmModuloModelList: TObjectList<TAdmModuloModel> read FAdmModuloModelList write FAdmModuloModelList; 

  end;

implementation

{ TEmpresaModel }

constructor TEmpresaModel.Create;
begin
  inherited;
	FAdmModuloModelList := TObjectList<TAdmModuloModel>.Create;
end;

destructor TEmpresaModel.Destroy;
begin
	FreeAndNil(FAdmModuloModelList);
  inherited;
end;


end.