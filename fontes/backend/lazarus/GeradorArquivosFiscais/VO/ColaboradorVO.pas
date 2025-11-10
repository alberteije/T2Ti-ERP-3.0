{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [COLABORADOR] 
                                                                                
The MIT License

Copyright: Copyright (C) 2014 T2Ti.COM

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

@author Albert Eije (t2ti.com@gmail.com)
@version 2.0
*******************************************************************************}
unit ColaboradorVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  TipoAdmissaoVO, SituacaoColaboradorVO, PessoaVO, TipoColaboradorVO,
  NivelFormacaoVO, CargoVO, SetorVO;

type
  TColaboradorVO = class(TVO)
  private
    FID: Integer;
    FID_SINDICATO: Integer;
    FID_TIPO_ADMISSAO: Integer;
    FID_SITUACAO_COLABORADOR: Integer;
    FID_PESSOA: Integer;
    FID_TIPO_COLABORADOR: Integer;
    FID_NIVEL_FORMACAO: Integer;
    FID_CARGO: Integer;
    FID_SETOR: Integer;
    FMATRICULA: String;
    FFOTO_34: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_ADMISSAO: TDateTime;
    FVENCIMENTO_FERIAS: TDateTime;
    FDATA_TRANSFERENCIA: TDateTime;
    FFGTS_OPTANTE: String;
    FFGTS_DATA_OPCAO: TDateTime;
    FFGTS_CONTA: Integer;
    FPAGAMENTO_FORMA: String;
    FPAGAMENTO_BANCO: String;
    FPAGAMENTO_AGENCIA: String;
    FPAGAMENTO_AGENCIA_DIGITO: String;
    FPAGAMENTO_CONTA: String;
    FPAGAMENTO_CONTA_DIGITO: String;
    FEXAME_MEDICO_ULTIMO: TDateTime;
    FEXAME_MEDICO_VENCIMENTO: TDateTime;
    FPIS_DATA_CADASTRO: TDateTime;
    FPIS_NUMERO: String;
    FPIS_BANCO: String;
    FPIS_AGENCIA: String;
    FPIS_AGENCIA_DIGITO: String;
    FCTPS_NUMERO: String;
    FCTPS_SERIE: String;
    FCTPS_DATA_EXPEDICAO: TDateTime;
    FCTPS_UF: String;
    FDESCONTO_PLANO_SAUDE: String;
    FSAI_NA_RAIS: String;
    FCATEGORIA_SEFIP: String;
    FOBSERVACAO: String;
    FOCORRENCIA_SEFIP: Integer;
    FCODIGO_ADMISSAO_CAGED: Integer;
    FCODIGO_DEMISSAO_CAGED: Integer;
    FCODIGO_DEMISSAO_SEFIP: Integer;
    FDATA_DEMISSAO: TDateTime;
    FCODIGO_TURMA_PONTO: String;
    FCAGED_APRENDIZ: String;
    FCAGED_DEFICIENCIA: String;
    FCLASSIFICACAO_CONTABIL_CONTA: String;

    FTipoAdmissaoVO: TTipoAdmissaoVO;
    FSituacaoColaboradorVO: TSituacaoColaboradorVO;
    FPessoaVO: TPessoaVO;
    FTipoColaboradorVO: TTipoColaboradorVO;
    FNivelFormacaoVO: TNivelFormacaoVO;
    FCargoVO: TCargoVO;
    FSetorVO: TSetorVO;

  published
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdSindicato: Integer  read FID_SINDICATO write FID_SINDICATO;
    // Pessoa
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    // Tipo Admissão
    property IdTipoAdmissao: Integer  read FID_TIPO_ADMISSAO write FID_TIPO_ADMISSAO;
    // Situação Colaborador
    property IdSituacaoColaborador: Integer  read FID_SITUACAO_COLABORADOR write FID_SITUACAO_COLABORADOR;
    // Tipo de Colaborador
    property IdTipoColaborador: Integer  read FID_TIPO_COLABORADOR write FID_TIPO_COLABORADOR;
    // Nível de Formação
    property IdNivelFormacao: Integer  read FID_NIVEL_FORMACAO write FID_NIVEL_FORMACAO;
    // Cargo
    property IdCargo: Integer  read FID_CARGO write FID_CARGO;
    // Setor
    property IdSetor: Integer  read FID_SETOR write FID_SETOR;

    property Matricula: String  read FMATRICULA write FMATRICULA;
    property Foto34: String  read FFOTO_34 write FFOTO_34;
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    property DataAdmissao: TDateTime  read FDATA_ADMISSAO write FDATA_ADMISSAO;
    property VencimentoFerias: TDateTime  read FVENCIMENTO_FERIAS write FVENCIMENTO_FERIAS;
    property DataTransferencia: TDateTime  read FDATA_TRANSFERENCIA write FDATA_TRANSFERENCIA;
    property FgtsOptante: String  read FFGTS_OPTANTE write FFGTS_OPTANTE;
    property FgtsDataOpcao: TDateTime  read FFGTS_DATA_OPCAO write FFGTS_DATA_OPCAO;
    property FgtsConta: Integer  read FFGTS_CONTA write FFGTS_CONTA;
    property PagamentoForma: String  read FPAGAMENTO_FORMA write FPAGAMENTO_FORMA;
    property PagamentoBanco: String  read FPAGAMENTO_BANCO write FPAGAMENTO_BANCO;
    property PagamentoAgencia: String  read FPAGAMENTO_AGENCIA write FPAGAMENTO_AGENCIA;
    property PagamentoAgenciaDigito: String  read FPAGAMENTO_AGENCIA_DIGITO write FPAGAMENTO_AGENCIA_DIGITO;
    property PagamentoConta: String  read FPAGAMENTO_CONTA write FPAGAMENTO_CONTA;
    property PagamentoContaDigito: String  read FPAGAMENTO_CONTA_DIGITO write FPAGAMENTO_CONTA_DIGITO;
    property ExameMedicoUltimo: TDateTime  read FEXAME_MEDICO_ULTIMO write FEXAME_MEDICO_ULTIMO;
    property ExameMedicoVencimento: TDateTime  read FEXAME_MEDICO_VENCIMENTO write FEXAME_MEDICO_VENCIMENTO;
    property PisDataCadastro: TDateTime  read FPIS_DATA_CADASTRO write FPIS_DATA_CADASTRO;
    property PisNumero: String  read FPIS_NUMERO write FPIS_NUMERO;
    property PisBanco: String  read FPIS_BANCO write FPIS_BANCO;
    property PisAgencia: String  read FPIS_AGENCIA write FPIS_AGENCIA;
    property PisAgenciaDigito: String  read FPIS_AGENCIA_DIGITO write FPIS_AGENCIA_DIGITO;
    property CtpsNumero: String  read FCTPS_NUMERO write FCTPS_NUMERO;
    property CtpsSerie: String  read FCTPS_SERIE write FCTPS_SERIE;
    property CtpsDataExpedicao: TDateTime  read FCTPS_DATA_EXPEDICAO write FCTPS_DATA_EXPEDICAO;
    property CtpsUf: String  read FCTPS_UF write FCTPS_UF;
    property DescontoPlanoSaude: String  read FDESCONTO_PLANO_SAUDE write FDESCONTO_PLANO_SAUDE;
    property SaiNaRais: String  read FSAI_NA_RAIS write FSAI_NA_RAIS;
    property CategoriaSefip: String  read FCATEGORIA_SEFIP write FCATEGORIA_SEFIP;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    property OcorrenciaSefip: Integer  read FOCORRENCIA_SEFIP write FOCORRENCIA_SEFIP;
    property CodigoAdmissaoCaged: Integer  read FCODIGO_ADMISSAO_CAGED write FCODIGO_ADMISSAO_CAGED;
    property CodigoDemissaoCaged: Integer  read FCODIGO_DEMISSAO_CAGED write FCODIGO_DEMISSAO_CAGED;
    property CodigoDemissaoSefip: Integer  read FCODIGO_DEMISSAO_SEFIP write FCODIGO_DEMISSAO_SEFIP;
    property DataDemissao: TDateTime  read FDATA_DEMISSAO write FDATA_DEMISSAO;
    property CodigoTurmaPonto: String  read FCODIGO_TURMA_PONTO write FCODIGO_TURMA_PONTO;
    property CagedAprendiz: String  read FCAGED_APRENDIZ write FCAGED_APRENDIZ;
    property CagedDeficiencia: String  read FCAGED_DEFICIENCIA write FCAGED_DEFICIENCIA;
    property ClassificacaoContabilConta: String  read FCLASSIFICACAO_CONTABIL_CONTA write FCLASSIFICACAO_CONTABIL_CONTA;

    property TipoAdmissaoVO: TTipoAdmissaoVO read FTipoAdmissaoVO write FTipoAdmissaoVO;

    property SituacaoColaboradorVO: TSituacaoColaboradorVO read FSituacaoColaboradorVO write FSituacaoColaboradorVO;

    property PessoaVO: TPessoaVO read FPessoaVO write FPessoaVO;

    property TipoColaboradorVO: TTipoColaboradorVO read FTipoColaboradorVO write FTipoColaboradorVO;

    property NivelFormacaoVO: TNivelFormacaoVO read FNivelFormacaoVO write FNivelFormacaoVO;

    property CargoVO: TCargoVO read FCargoVO write FCargoVO;

    property SetorVO: TSetorVO read FSetorVO write FSetorVO;


  end;

  TListaColaboradorVO = specialize TFPGObjectList<TColaboradorVO>;

implementation

constructor TColaboradorVO.Create;
begin
  inherited;

  FTipoAdmissaoVO := TTipoAdmissaoVO.Create;
  FSituacaoColaboradorVO := TSituacaoColaboradorVO.Create;
  FPessoaVO := TPessoaVO.Create;
  FTipoColaboradorVO := TTipoColaboradorVO.Create;
  FNivelFormacaoVO := TNivelFormacaoVO.Create;
  FCargoVO := TCargoVO.Create;
  FSetorVO := TSetorVO.Create;
end;

destructor TColaboradorVO.Destroy;
begin
  FreeAndNil(FTipoAdmissaoVO);
  FreeAndNil(FSituacaoColaboradorVO);
  FreeAndNil(FPessoaVO);
  FreeAndNil(FTipoColaboradorVO);
  FreeAndNil(FNivelFormacaoVO);
  FreeAndNil(FCargoVO);
  FreeAndNil(FSetorVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TColaboradorVO);

finalization
  Classes.UnRegisterClass(TColaboradorVO);

end.
