{*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [VIEW_PESSOA_FORNECEDOR]

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
unit ViewPessoaFornecedor;

interface

uses
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TViewPessoaFornecedor = class(TModelBase)
  private
    FId: Integer;
    FNome: string;
    FTipo: string;
    FEmail: string;
    FSite: string;
    FCpfCnpj: string;
    FRgIe: string;
    FDesde: TDateTime;
    FDataCadastro: TDateTime;
    FObservacao: string;
    FLogradouro: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCidade: string;
    FCep: string;
    FMunicipioIbge: Integer;
    FUf: string;
    FIdPessoa: Integer;

  public
    //procedure ValidarInsercao; override;
    //procedure ValidarAlteracao; override;
    //procedure ValidarExclusao; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('NOME')]
		[MVCNameAsAttribute('nome')]
		property Nome: string read FNome write FNome;
    [MVCColumnAttribute('TIPO')]
		[MVCNameAsAttribute('tipo')]
		property Tipo: string read FTipo write FTipo;
    [MVCColumnAttribute('EMAIL')]
		[MVCNameAsAttribute('email')]
		property Email: string read FEmail write FEmail;
    [MVCColumnAttribute('SITE')]
		[MVCNameAsAttribute('site')]
		property Site: string read FSite write FSite;
    [MVCColumnAttribute('CPF_CNPJ')]
		[MVCNameAsAttribute('cpfCnpj')]
		property CpfCnpj: string read FCpfCnpj write FCpfCnpj;
    [MVCColumnAttribute('RG_IE')]
		[MVCNameAsAttribute('rgIe')]
		property RgIe: string read FRgIe write FRgIe;
    [MVCColumnAttribute('DESDE')]
		[MVCNameAsAttribute('desde')]
		property Desde: TDateTime read FDesde write FDesde;
    [MVCColumnAttribute('DATA_CADASTRO')]
		[MVCNameAsAttribute('dataCadastro')]
		property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
    [MVCColumnAttribute('OBSERVACAO')]
		[MVCNameAsAttribute('observacao')]
		property Observacao: string read FObservacao write FObservacao;
    [MVCColumnAttribute('LOGRADOURO')]
		[MVCNameAsAttribute('logradouro')]
		property Logradouro: string read FLogradouro write FLogradouro;
    [MVCColumnAttribute('NUMERO')]
		[MVCNameAsAttribute('numero')]
		property Numero: string read FNumero write FNumero;
    [MVCColumnAttribute('COMPLEMENTO')]
		[MVCNameAsAttribute('complemento')]
		property Complemento: string read FComplemento write FComplemento;
    [MVCColumnAttribute('BAIRRO')]
		[MVCNameAsAttribute('bairro')]
		property Bairro: string read FBairro write FBairro;
    [MVCColumnAttribute('CIDADE')]
		[MVCNameAsAttribute('cidade')]
		property Cidade: string read FCidade write FCidade;
    [MVCColumnAttribute('CEP')]
		[MVCNameAsAttribute('cep')]
		property Cep: string read FCep write FCep;
    [MVCColumnAttribute('MUNICIPIO_IBGE')]
		[MVCNameAsAttribute('municipioIbge')]
		property MunicipioIbge: Integer read FMunicipioIbge write FMunicipioIbge;
    [MVCColumnAttribute('UF')]
		[MVCNameAsAttribute('uf')]
		property Uf: string read FUf write FUf;
    [MVCColumnAttribute('ID_PESSOA')]
		[MVCNameAsAttribute('idPessoa')]
		property IdPessoa: Integer read FIdPessoa write FIdPessoa;

  end;

implementation

{ TViewPessoaFornecedor }



end.
