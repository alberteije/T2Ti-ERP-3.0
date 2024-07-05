{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [COLABORADOR] 
                                                                                
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
unit Colaborador;

interface

uses
  Generics.Collections, System.SysUtils,
  ViewPessoaColaborador,
  Cargo, Setor, ColaboradorSituacao, TipoAdmissao, ColaboradorTipo, Sindicato,
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TColaborador = class(TModelBase)
  private
    FId: Integer;
    FIdPessoa: Integer;
    FIdCargo: Integer;
    FIdSetor: Integer;
    FIdColaboradorSituacao: Integer;
    FIdTipoAdmissao: Integer;
    FIdColaboradorTipo: Integer;
    FIdSindicato: Integer;
    FMatricula: string;
    FDataCadastro: TDateTime;
    FDataAdmissao: TDateTime;
    FDataDemissao: TDateTime;
    FCtpsNumero: string;
    FCtpsSerie: string;
    FCtpsDataExpedicao: TDateTime;
    FCtpsUf: string;
    FObservacao: string;
      
    FCargo: TCargo;
    FSetor: TSetor;
    FColaboradorSituacao: TColaboradorSituacao;
    FTipoAdmissao: TTipoAdmissao;
    FColaboradorTipo: TColaboradorTipo;
    FSindicato: TSindicato;
    FViewPessoaColaborador: TViewPessoaColaborador;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_PESSOA')]
		[MVCNameAsAttribute('idPessoa')]
		property IdPessoa: Integer read FIdPessoa write FIdPessoa;
    [MVCColumnAttribute('ID_CARGO')]
		[MVCNameAsAttribute('idCargo')]
		property IdCargo: Integer read FIdCargo write FIdCargo;
    [MVCColumnAttribute('ID_SETOR')]
		[MVCNameAsAttribute('idSetor')]
		property IdSetor: Integer read FIdSetor write FIdSetor;
    [MVCColumnAttribute('ID_COLABORADOR_SITUACAO')]
		[MVCNameAsAttribute('idColaboradorSituacao')]
		property IdColaboradorSituacao: Integer read FIdColaboradorSituacao write FIdColaboradorSituacao;
    [MVCColumnAttribute('ID_TIPO_ADMISSAO')]
		[MVCNameAsAttribute('idTipoAdmissao')]
		property IdTipoAdmissao: Integer read FIdTipoAdmissao write FIdTipoAdmissao;
    [MVCColumnAttribute('ID_COLABORADOR_TIPO')]
		[MVCNameAsAttribute('idColaboradorTipo')]
		property IdColaboradorTipo: Integer read FIdColaboradorTipo write FIdColaboradorTipo;
    [MVCColumnAttribute('ID_SINDICATO')]
		[MVCNameAsAttribute('idSindicato')]
		property IdSindicato: Integer read FIdSindicato write FIdSindicato;
    [MVCColumnAttribute('MATRICULA')]
		[MVCNameAsAttribute('matricula')]
		property Matricula: string read FMatricula write FMatricula;
    [MVCColumnAttribute('DATA_CADASTRO')]
		[MVCNameAsAttribute('dataCadastro')]
		property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
    [MVCColumnAttribute('DATA_ADMISSAO')]
		[MVCNameAsAttribute('dataAdmissao')]
		property DataAdmissao: TDateTime read FDataAdmissao write FDataAdmissao;
    [MVCColumnAttribute('DATA_DEMISSAO')]
		[MVCNameAsAttribute('dataDemissao')]
		property DataDemissao: TDateTime read FDataDemissao write FDataDemissao;
    [MVCColumnAttribute('CTPS_NUMERO')]
		[MVCNameAsAttribute('ctpsNumero')]
		property CtpsNumero: string read FCtpsNumero write FCtpsNumero;
    [MVCColumnAttribute('CTPS_SERIE')]
		[MVCNameAsAttribute('ctpsSerie')]
		property CtpsSerie: string read FCtpsSerie write FCtpsSerie;
    [MVCColumnAttribute('CTPS_DATA_EXPEDICAO')]
		[MVCNameAsAttribute('ctpsDataExpedicao')]
		property CtpsDataExpedicao: TDateTime read FCtpsDataExpedicao write FCtpsDataExpedicao;
    [MVCColumnAttribute('CTPS_UF')]
		[MVCNameAsAttribute('ctpsUf')]
		property CtpsUf: string read FCtpsUf write FCtpsUf;
    [MVCColumnAttribute('OBSERVACAO')]
		[MVCNameAsAttribute('observacao')]
		property Observacao: string read FObservacao write FObservacao;
      
    [MVCNameAsAttribute('cargo')]
		property Cargo: TCargo read FCargo write FCargo;
    [MVCNameAsAttribute('setor')]
		property Setor: TSetor read FSetor write FSetor;
    [MVCNameAsAttribute('colaboradorSituacao')]
		property ColaboradorSituacao: TColaboradorSituacao read FColaboradorSituacao write FColaboradorSituacao;
    [MVCNameAsAttribute('tipoAdmissao')]
		property TipoAdmissao: TTipoAdmissao read FTipoAdmissao write FTipoAdmissao;
    [MVCNameAsAttribute('colaboradorTipo')]
		property ColaboradorTipo: TColaboradorTipo read FColaboradorTipo write FColaboradorTipo;
    [MVCNameAsAttribute('sindicato')]
		property Sindicato: TSindicato read FSindicato write FSindicato;

    [MVCNameAsAttribute('viewPessoaColaborador')]
  	property ViewPessoaColaborador: TViewPessoaColaborador read FViewPessoaColaborador write FViewPessoaColaborador;
  end;

implementation

{ TColaborador }

constructor TColaborador.Create;
begin
  inherited;
  FCargo := TCargo.Create;
  FSetor := TSetor.Create;
  FColaboradorSituacao := TColaboradorSituacao.Create;
  FTipoAdmissao := TTipoAdmissao.Create;
  FColaboradorTipo := TColaboradorTipo.Create;
  FSindicato := TSindicato.Create;
  FViewPessoaColaborador := TViewPessoaColaborador.Create;
end;

destructor TColaborador.Destroy;
begin
  FreeAndNil(FCargo);
  FreeAndNil(FSetor);
  FreeAndNil(FColaboradorSituacao);
  FreeAndNil(FTipoAdmissao);
  FreeAndNil(FColaboradorTipo);
  FreeAndNil(FSindicato);
  FreeAndNil(FViewPessoaColaborador);
  inherited;
end;

end.