{*******************************************************************************
Title: T2Ti ERP Fenix
Description: Model relacionado à tabela [PESSOA]

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
unit Pessoa;

interface

uses
  Generics.Collections, System.SysUtils,
  Cliente, Colaborador, Contador, Fornecedor, PessoaContato, PessoaEndereco, PessoaFisica, PessoaJuridica, PessoaTelefone, Transportadora,
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TPessoa = class(TModelBase)
  private
    FId: Integer;
    FNome: string;
    FTipo: string;
    FSite: string;
    FEmail: string;
    FEhCliente: string;
    FEhFornecedor: string;
    FEhTransportadora: string;
    FEhColaborador: string;
    FEhContador: string;

    FCliente: TCliente;
    FColaborador: TColaborador;
    FContador: TContador;
    FFornecedor: TFornecedor;
    FPessoaFisica: TPessoaFisica;
    FPessoaJuridica: TPessoaJuridica;
    FTransportadora: TTransportadora;
    FListaPessoaContato: TObjectList<TPessoaContato>;
    FListaPessoaEndereco: TObjectList<TPessoaEndereco>;
    FListaPessoaTelefone: TObjectList<TPessoaTelefone>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('TIPO')]
		[MVCNameAsAttribute('tipo')]
		property Tipo: string read FTipo write FTipo;
    [MVCColumnAttribute('SITE')]
		[MVCNameAsAttribute('site')]
		property Site: string read FSite write FSite;
    [MVCColumnAttribute('EMAIL')]
		[MVCNameAsAttribute('email')]
		property Email: string read FEmail write FEmail;
    [MVCColumnAttribute('EH_CLIENTE')]
		[MVCNameAsAttribute('ehCliente')]
		property EhCliente: string read FEhCliente write FEhCliente;
    [MVCColumnAttribute('EH_FORNECEDOR')]
		[MVCNameAsAttribute('ehFornecedor')]
		property EhFornecedor: string read FEhFornecedor write FEhFornecedor;
    [MVCColumnAttribute('EH_TRANSPORTADORA')]
		[MVCNameAsAttribute('ehTransportadora')]
		property EhTransportadora: string read FEhTransportadora write FEhTransportadora;
    [MVCColumnAttribute('EH_COLABORADOR')]
		[MVCNameAsAttribute('ehColaborador')]
		property EhColaborador: string read FEhColaborador write FEhColaborador;
    [MVCColumnAttribute('EH_CONTADOR')]
		[MVCNameAsAttribute('ehContador')]
		property EhContador: string read FEhContador write FEhContador;

    [MVCNameAsAttribute('cliente')]
		property Cliente: TCliente read FCliente write FCliente;
    [MVCNameAsAttribute('colaborador')]
		property Colaborador: TColaborador read FColaborador write FColaborador;
    [MVCNameAsAttribute('contador')]
		property Contador: TContador read FContador write FContador;
    [MVCNameAsAttribute('fornecedor')]
		property Fornecedor: TFornecedor read FFornecedor write FFornecedor;
    [MVCNameAsAttribute('pessoaFisica')]
		property PessoaFisica: TPessoaFisica read FPessoaFisica write FPessoaFisica;
    [MVCNameAsAttribute('pessoaJuridica')]
		property PessoaJuridica: TPessoaJuridica read FPessoaJuridica write FPessoaJuridica;
    [MVCNameAsAttribute('transportadora')]
		property Transportadora: TTransportadora read FTransportadora write FTransportadora;
    [MapperListOf(TPessoaContato)]
		[MVCNameAsAttribute('listaPessoaContato')]
		property ListaPessoaContato: TObjectList<TPessoaContato> read FListaPessoaContato write FListaPessoaContato;
    [MapperListOf(TPessoaEndereco)]
		[MVCNameAsAttribute('listaPessoaEndereco')]
		property ListaPessoaEndereco: TObjectList<TPessoaEndereco> read FListaPessoaEndereco write FListaPessoaEndereco;
    [MapperListOf(TPessoaTelefone)]
		[MVCNameAsAttribute('listaPessoaTelefone')]
		property ListaPessoaTelefone: TObjectList<TPessoaTelefone> read FListaPessoaTelefone write FListaPessoaTelefone;
  end;

implementation

{ TPessoa }

constructor TPessoa.Create;
begin
  inherited;
  FCliente := TCliente.Create;
  FColaborador := TColaborador.Create;
  FContador := TContador.Create;
  FFornecedor := TFornecedor.Create;
  FListaPessoaContato := TObjectList<TPessoaContato>.Create;
  FListaPessoaEndereco := TObjectList<TPessoaEndereco>.Create;
  FPessoaFisica := TPessoaFisica.Create;
  FPessoaJuridica := TPessoaJuridica.Create;
  FListaPessoaTelefone := TObjectList<TPessoaTelefone>.Create;
  FTransportadora := TTransportadora.Create;
end;

destructor TPessoa.Destroy;
begin
  FreeAndNil(FCliente);
  FreeAndNil(FColaborador);
  FreeAndNil(FContador);
  FreeAndNil(FFornecedor);
  FreeAndNil(FListaPessoaContato);
  FreeAndNil(FListaPessoaEndereco);
  FreeAndNil(FPessoaFisica);
  FreeAndNil(FPessoaJuridica);
  FreeAndNil(FListaPessoaTelefone);
  FreeAndNil(FTransportadora);
  inherited;
end;

end.
