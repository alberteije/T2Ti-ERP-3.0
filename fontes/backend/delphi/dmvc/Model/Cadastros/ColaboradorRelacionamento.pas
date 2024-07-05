{*******************************************************************************
Title: T2Ti ERP Fenix
Description: Model relacionado à tabela [COLABORADOR_RELACIONAMENTO]

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
unit ColaboradorRelacionamento;

interface

uses
  Generics.Collections, System.SysUtils,
  TipoRelacionamento, Colaborador,
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TColaboradorRelacionamento = class(TModelBase)
  private
    FId: Integer;
    FIdTipoRelacionamento: Integer;
    FIdColaborador: Integer;
    FNome: string;
    FDataNascimento: TDateTime;
    FCpf: string;
    FRegistroMatricula: string;
    FRegistroCartorio: string;
    FRegistroCartorioNumero: string;
    FRegistroNumeroLivro: string;
    FRegistroNumeroFolha: string;
    FDataEntregaDocumento: TDateTime;
    FSalarioFamilia: string;
    FSalarioFamiliaIdadeLimite: Integer;
    FSalarioFamiliaDataFim: TDateTime;
    FImpostoRendaIdadeLimite: Integer;
    FImpostoRendaDataFim: Integer;

    FTipoRelacionamento: TTipoRelacionamento;
    FColaborador: TColaborador;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_TIPO_RELACIONAMENTO')]
		[MVCNameAsAttribute('idTipoRelacionamento')]
		property IdTipoRelacionamento: Integer read FIdTipoRelacionamento write FIdTipoRelacionamento;
    [MVCColumnAttribute('ID_COLABORADOR')]
		[MVCNameAsAttribute('idColaborador')]
		property IdColaborador: Integer read FIdColaborador write FIdColaborador;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('DATA_NASCIMENTO')]
		[MVCNameAsAttribute('dataNascimento')]
		property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    [MVCColumnAttribute('CPF')]
		[MVCNameAsAttribute('cpf')]
		property Cpf: string read FCpf write FCpf;
    [MVCColumnAttribute('REGISTRO_MATRICULA')]
		[MVCNameAsAttribute('registroMatricula')]
		property RegistroMatricula: string read FRegistroMatricula write FRegistroMatricula;
    [MVCColumnAttribute('REGISTRO_CARTORIO')]
		[MVCNameAsAttribute('registroCartorio')]
		property RegistroCartorio: string read FRegistroCartorio write FRegistroCartorio;
    [MVCColumnAttribute('REGISTRO_CARTORIO_NUMERO')]
		[MVCNameAsAttribute('registroCartorioNumero')]
		property RegistroCartorioNumero: string read FRegistroCartorioNumero write FRegistroCartorioNumero;
    [MVCColumnAttribute('REGISTRO_NUMERO_LIVRO')]
		[MVCNameAsAttribute('registroNumeroLivro')]
		property RegistroNumeroLivro: string read FRegistroNumeroLivro write FRegistroNumeroLivro;
    [MVCColumnAttribute('REGISTRO_NUMERO_FOLHA')]
		[MVCNameAsAttribute('registroNumeroFolha')]
		property RegistroNumeroFolha: string read FRegistroNumeroFolha write FRegistroNumeroFolha;
    [MVCColumnAttribute('DATA_ENTREGA_DOCUMENTO')]
		[MVCNameAsAttribute('dataEntregaDocumento')]
		property DataEntregaDocumento: TDateTime read FDataEntregaDocumento write FDataEntregaDocumento;
    [MVCColumnAttribute('SALARIO_FAMILIA')]
		[MVCNameAsAttribute('salarioFamilia')]
		property SalarioFamilia: string read FSalarioFamilia write FSalarioFamilia;
    [MVCColumnAttribute('SALARIO_FAMILIA_IDADE_LIMITE')]
		[MVCNameAsAttribute('salarioFamiliaIdadeLimite')]
		property SalarioFamiliaIdadeLimite: Integer read FSalarioFamiliaIdadeLimite write FSalarioFamiliaIdadeLimite;
    [MVCColumnAttribute('SALARIO_FAMILIA_DATA_FIM')]
		[MVCNameAsAttribute('salarioFamiliaDataFim')]
		property SalarioFamiliaDataFim: TDateTime read FSalarioFamiliaDataFim write FSalarioFamiliaDataFim;
    [MVCColumnAttribute('IMPOSTO_RENDA_IDADE_LIMITE')]
		[MVCNameAsAttribute('impostoRendaIdadeLimite')]
		property ImpostoRendaIdadeLimite: Integer read FImpostoRendaIdadeLimite write FImpostoRendaIdadeLimite;
    [MVCColumnAttribute('IMPOSTO_RENDA_DATA_FIM')]
		[MVCNameAsAttribute('impostoRendaDataFim')]
		property ImpostoRendaDataFim: Integer read FImpostoRendaDataFim write FImpostoRendaDataFim;

    [MVCNameAsAttribute('tipoRelacionamento')]
		property TipoRelacionamento: TTipoRelacionamento read FTipoRelacionamento write FTipoRelacionamento;
    [MVCNameAsAttribute('colaborador')]
		property Colaborador: TColaborador read FColaborador write FColaborador;
  end;

implementation

{ TColaboradorRelacionamento }

constructor TColaboradorRelacionamento.Create;
begin
  inherited;
  FTipoRelacionamento := TTipoRelacionamento.Create;
  FColaborador := TColaborador.Create;
end;

destructor TColaboradorRelacionamento.Destroy;
begin
  FreeAndNil(FTipoRelacionamento);
  FreeAndNil(FColaborador);
  inherited;
end;

end.
