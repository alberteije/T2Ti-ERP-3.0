unit ErpTipoPlanoModel;

interface

uses
  Generics.Collections, System.SysUtils,
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TErpTipoPlanoModel = class(TModelBase)
  private
    FId: Integer;
    FNome: string;
    FValor: Extended;
    FFrequencia: string;
    FAcessoTotal: Boolean;
    FAtivo: Boolean;
      
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('id', True)] 
		[MVCNameAsAttribute('id')] 
		property Id: Integer read FId write FId; 

    [MVCColumnAttribute('nome')] 
		[MVCNameAsAttribute('nome')] 
		property Nome: string read FNome write FNome; 

    [MVCColumnAttribute('valor')] 
		[MVCNameAsAttribute('valor')] 
		property Valor: Extended read FValor write FValor; 

    [MVCColumnAttribute('frequencia')] 
		[MVCNameAsAttribute('frequencia')] 
		property Frequencia: string read FFrequencia write FFrequencia; 

    [MVCColumnAttribute('acesso_total')] 
		[MVCNameAsAttribute('acessoTotal')] 
		property AcessoTotal: Boolean read FAcessoTotal write FAcessoTotal; 

    [MVCColumnAttribute('ativo')] 
		[MVCNameAsAttribute('ativo')] 
		property Ativo: Boolean read FAtivo write FAtivo; 

      
  end;

implementation

{ TErpTipoPlanoModel }

constructor TErpTipoPlanoModel.Create;
begin
  inherited;
end;

destructor TErpTipoPlanoModel.Destroy;
begin
  inherited;
end;


end.