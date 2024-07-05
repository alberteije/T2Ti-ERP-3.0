{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [EMPRESA] 
                                                                                
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
unit Empresa;

interface

uses
  Generics.Collections, System.SysUtils,
  EmpresaContato, EmpresaEndereco, EmpresaTelefone, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TEmpresa = class(TModelBase)
  private
    FId: Integer;
    FRazaoSocial: string;
    FNomeFantasia: string;
    FCnpj: string;
    FInscricaoEstadual: string;
    FInscricaoMunicipal: string;
    FTipoRegime: string;
    FCrt: string;
    FEmail: string;
    FSite: string;
    FContato: string;
    FDataConstituicao: TDateTime;
    FTipo: string;
    FInscricaoJuntaComercial: string;
    FDataInscJuntaComercial: TDateTime;
    FCodigoIbgeCidade: Integer;
    FCodigoIbgeUf: Integer;
    FCei: string;
    FCodigoCnaePrincipal: string;

    FEnderecoPrincipal: TEmpresaEndereco;

    FListaEmpresaContato: TObjectList<TEmpresaContato>;
    FListaEmpresaEndereco: TObjectList<TEmpresaEndereco>;
    FListaEmpresaTelefone: TObjectList<TEmpresaTelefone>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('RAZAO_SOCIAL')]
		[MVCNameAsAttribute('razaoSocial')]
		property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    [MVCColumnAttribute('NOME_FANTASIA')]
		[MVCNameAsAttribute('nomeFantasia')]
		property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    [MVCColumnAttribute('CNPJ')]
		[MVCNameAsAttribute('cnpj')]
		property Cnpj: string read FCnpj write FCnpj;
    [MVCColumnAttribute('INSCRICAO_ESTADUAL')]
		[MVCNameAsAttribute('inscricaoEstadual')]
		property InscricaoEstadual: string read FInscricaoEstadual write FInscricaoEstadual;
    [MVCColumnAttribute('INSCRICAO_MUNICIPAL')]
		[MVCNameAsAttribute('inscricaoMunicipal')]
		property InscricaoMunicipal: string read FInscricaoMunicipal write FInscricaoMunicipal;
    [MVCColumnAttribute('TIPO_REGIME')]
		[MVCNameAsAttribute('tipoRegime')]
		property TipoRegime: string read FTipoRegime write FTipoRegime;
    [MVCColumnAttribute('CRT')]
		[MVCNameAsAttribute('crt')]
		property Crt: string read FCrt write FCrt;
    [MVCColumnAttribute('EMAIL')]
		[MVCNameAsAttribute('email')]
		property Email: string read FEmail write FEmail;
    [MVCColumnAttribute('SITE')]
		[MVCNameAsAttribute('site')]
		property Site: string read FSite write FSite;
    [MVCColumnAttribute('CONTATO')]
		[MVCNameAsAttribute('contato')]
		property Contato: string read FContato write FContato;
    [MVCColumnAttribute('DATA_CONSTITUICAO')]
		[MVCNameAsAttribute('dataConstituicao')]
		property DataConstituicao: TDateTime read FDataConstituicao write FDataConstituicao;
    [MVCColumnAttribute('TIPO')]
		[MVCNameAsAttribute('tipo')]
		property Tipo: string read FTipo write FTipo;
    [MVCColumnAttribute('INSCRICAO_JUNTA_COMERCIAL')]
		[MVCNameAsAttribute('inscricaoJuntaComercial')]
		property InscricaoJuntaComercial: string read FInscricaoJuntaComercial write FInscricaoJuntaComercial;
    [MVCColumnAttribute('DATA_INSC_JUNTA_COMERCIAL')]
		[MVCNameAsAttribute('dataInscJuntaComercial')]
		property DataInscJuntaComercial: TDateTime read FDataInscJuntaComercial write FDataInscJuntaComercial;
    [MVCColumnAttribute('CODIGO_IBGE_CIDADE')]
		[MVCNameAsAttribute('codigoIbgeCidade')]
		property CodigoIbgeCidade: Integer read FCodigoIbgeCidade write FCodigoIbgeCidade;
    [MVCColumnAttribute('CODIGO_IBGE_UF')]
		[MVCNameAsAttribute('codigoIbgeUf')]
		property CodigoIbgeUf: Integer read FCodigoIbgeUf write FCodigoIbgeUf;
    [MVCColumnAttribute('CEI')]
		[MVCNameAsAttribute('cei')]
		property Cei: string read FCei write FCei;
    [MVCColumnAttribute('CODIGO_CNAE_PRINCIPAL')]
		[MVCNameAsAttribute('codigoCnaePrincipal')]
		property CodigoCnaePrincipal: string read FCodigoCnaePrincipal write FCodigoCnaePrincipal;

    [MVCNameAsAttribute('enderecoPrincipal')]
  	property EnderecoPrincipal: TEmpresaEndereco read FEnderecoPrincipal write FEnderecoPrincipal;

    [MapperListOf(TEmpresaContato)]
	[MVCNameAsAttribute('listaEmpresaContato')]
	property ListaEmpresaContato: TObjectList<TEmpresaContato> read FListaEmpresaContato write FListaEmpresaContato;
    [MapperListOf(TEmpresaEndereco)]
	[MVCNameAsAttribute('listaEmpresaEndereco')]
	property ListaEmpresaEndereco: TObjectList<TEmpresaEndereco> read FListaEmpresaEndereco write FListaEmpresaEndereco;
    [MapperListOf(TEmpresaTelefone)]
	[MVCNameAsAttribute('listaEmpresaTelefone')]
	property ListaEmpresaTelefone: TObjectList<TEmpresaTelefone> read FListaEmpresaTelefone write FListaEmpresaTelefone;
  end;

implementation

{ TEmpresa }

constructor TEmpresa.Create;
begin
  inherited;

  FEnderecoPrincipal := TEmpresaEndereco.Create;

  FListaEmpresaContato := TObjectList<TEmpresaContato>.Create;
  FListaEmpresaEndereco := TObjectList<TEmpresaEndereco>.Create;
  FListaEmpresaTelefone := TObjectList<TEmpresaTelefone>.Create;
end;

destructor TEmpresa.Destroy;
begin
  FreeAndNil(FEnderecoPrincipal);

  FreeAndNil(FListaEmpresaContato);
  FreeAndNil(FListaEmpresaEndereco);
  FreeAndNil(FListaEmpresaTelefone);
  inherited;
end;



end.