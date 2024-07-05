unit AdmModuloModel;

interface

uses
  Generics.Collections, System.SysUtils,
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TAdmModuloModel = class(TModelBase)
  private
    FId: Integer;
    FIdEmpresa: Integer;
    FCodigo: string;
    FBloco: string;
    FNome: string;
    FDescricao: string;
    FLink: string;
      
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('id', True)] 
		[MVCNameAsAttribute('id')] 
		property Id: Integer read FId write FId; 

    [MVCColumnAttribute('id_empresa')] 
		[MVCNameAsAttribute('idEmpresa')] 
		property IdEmpresa: Integer read FIdEmpresa write FIdEmpresa;

    [MVCColumnAttribute('codigo')] 
		[MVCNameAsAttribute('codigo')] 
		property Codigo: string read FCodigo write FCodigo; 

    [MVCColumnAttribute('bloco')] 
		[MVCNameAsAttribute('bloco')] 
		property Bloco: string read FBloco write FBloco; 

    [MVCColumnAttribute('nome')] 
		[MVCNameAsAttribute('nome')] 
		property Nome: string read FNome write FNome; 

    [MVCColumnAttribute('descricao')] 
		[MVCNameAsAttribute('descricao')] 
		property Descricao: string read FDescricao write FDescricao; 

    [MVCColumnAttribute('link')] 
		[MVCNameAsAttribute('link')] 
		property Link: string read FLink write FLink; 

      
  end;

implementation

{ TAdmModuloModel }

constructor TAdmModuloModel.Create;
begin
  inherited;
end;

destructor TAdmModuloModel.Destroy;
begin
  inherited;
end;


end.