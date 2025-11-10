unit EmpresaVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL,
  EmpresaContatoVO,
  EmpresaEnderecoVO, ContadorVO, UfVO, EmpresaTelefoneVO;

type
  TEmpresaVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FID_SINDICATO_PATRONAL: Integer;
    FID_FPAS: Integer;
    FID_CONTADOR: Integer;
    FRAZAO_SOCIAL: String;
    FNOME_FANTASIA: String;
    FCNPJ: String;
    FINSCRICAO_ESTADUAL: String;
    FINSCRICAO_ESTADUAL_ST: String;
    FINSCRICAO_MUNICIPAL: String;
    FINSCRICAO_JUNTA_COMERCIAL: String;
    FDATA_INSC_JUNTA_COMERCIAL: TDateTime;
    FTIPO: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_INICIO_ATIVIDADES: TDateTime;
    FSUFRAMA: String;
    FEMAIL: String;
    FIMAGEM_LOGOTIPO: String;
    FCRT: String;
    FTIPO_REGIME: String;
    FALIQUOTA_PIS: Extended;
    FCONTATO: String;
    FALIQUOTA_COFINS: Extended;
    FCODIGO_IBGE_CIDADE: Integer;
    FCODIGO_IBGE_UF: Integer;
    FCODIGO_TERCEIROS: Integer;
    FCODIGO_GPS: Integer;
    FALIQUOTA_SAT: Extended;
    FCEI: String;
    FCODIGO_CNAE_PRINCIPAL: String;
    FTIPO_CONTROLE_ESTOQUE: String;

    FContadorVO: TContadorVO;
    FUfVO: TUfVo;
    FEnderecoPrincipal: TEmpresaEnderecoVO;

    FListaEmpresaContatoVO: TListaEmpresaContatoVO;
    FListaEmpresaEnderecoVO: TListaEmpresaEnderecoVO;
    FListaEmpresaTelefoneVO: TListaEmpresaTelefoneVO;

  published
    constructor Create; overload; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdMatriz: Integer  read FID_EMPRESA write FID_EMPRESA;
    property IdSindicatoPatronal: Integer  read FID_SINDICATO_PATRONAL write FID_SINDICATO_PATRONAL;
    property IdFpas: Integer  read FID_FPAS write FID_FPAS;
    property IdContador: Integer  read FID_CONTADOR write FID_CONTADOR;
    property RazaoSocial: String  read FRAZAO_SOCIAL write FRAZAO_SOCIAL;
    property NomeFantasia: String  read FNOME_FANTASIA write FNOME_FANTASIA;
    property Cnpj: String  read FCNPJ write FCNPJ;
    property InscricaoEstadual: String  read FINSCRICAO_ESTADUAL write FINSCRICAO_ESTADUAL;
    property InscricaoEstadualSt: String  read FINSCRICAO_ESTADUAL_ST write FINSCRICAO_ESTADUAL_ST;
    property InscricaoMunicipal: String  read FINSCRICAO_MUNICIPAL write FINSCRICAO_MUNICIPAL;
    property InscricaoJuntaComercial: String  read FINSCRICAO_JUNTA_COMERCIAL write FINSCRICAO_JUNTA_COMERCIAL;
    property DataInscJuntaComercial: TDateTime  read FDATA_INSC_JUNTA_COMERCIAL write FDATA_INSC_JUNTA_COMERCIAL;
    property Tipo: String  read FTIPO write FTIPO;
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    property DataInicioAtividades: TDateTime  read FDATA_INICIO_ATIVIDADES write FDATA_INICIO_ATIVIDADES;
    property Suframa: String  read FSUFRAMA write FSUFRAMA;
    property Email: String  read FEMAIL write FEMAIL;
    property ImagemLogotipo: String  read FIMAGEM_LOGOTIPO write FIMAGEM_LOGOTIPO;
    property Crt: String  read FCRT write FCRT;
    property TipoRegime: String  read FTIPO_REGIME write FTIPO_REGIME;
    property AliquotaPis: Extended  read FALIQUOTA_PIS write FALIQUOTA_PIS;
    property Contato: String  read FCONTATO write FCONTATO;
    property AliquotaCofins: Extended  read FALIQUOTA_COFINS write FALIQUOTA_COFINS;
    property CodigoIbgeCidade: Integer  read FCODIGO_IBGE_CIDADE write FCODIGO_IBGE_CIDADE;

    property CodigoIbgeUf: Integer  read FCODIGO_IBGE_UF write FCODIGO_IBGE_UF;

    property CodigoTerceiros: Integer  read FCODIGO_TERCEIROS write FCODIGO_TERCEIROS;
    property CodigoGps: Integer  read FCODIGO_GPS write FCODIGO_GPS;
    property AliquotaSat: Extended  read FALIQUOTA_SAT write FALIQUOTA_SAT;
    property Cei: String  read FCEI write FCEI;
    property CodigoCnaePrincipal: String  read FCODIGO_CNAE_PRINCIPAL write FCODIGO_CNAE_PRINCIPAL;

    property TipoControleEstoque: String  read FTIPO_CONTROLE_ESTOQUE write FTIPO_CONTROLE_ESTOQUE;

    // Pega da lista de endereços o principal e seta nessa propriedade
    property EnderecoPrincipal: TEmpresaEnderecoVO read FEnderecoPrincipal write FEnderecoPrincipal;

    property ContadorVO: TContadorVO read FContadorVO write FContadorVO;

    property UfVO: TUfVO read FUfVO write FUfVO;

    property ListaEmpresaContatoVO: TListaEmpresaContatoVO read FListaEmpresaContatoVO write FListaEmpresaContatoVO;

    property ListaEmpresaEnderecoVO: TListaEmpresaEnderecoVO read FListaEmpresaEnderecoVO write FListaEmpresaEnderecoVO;

    property ListaEmpresaTelefoneVO: TListaEmpresaTelefoneVO read FListaEmpresaTelefoneVO write FListaEmpresaTelefoneVO;
  end;

  TListaEmpresaVO = specialize TFPGObjectList<TEmpresaVO>;

implementation


{ TEmpresaVO }

constructor TEmpresaVO.Create;
begin
  inherited;
  FContadorVO := TContadorVO.Create;
  FUfVO := TUfVO.Create;

  FListaEmpresaContatoVO := TListaEmpresaContatoVO.Create;
  FListaEmpresaEnderecoVO := TListaEmpresaEnderecoVO.Create;
  FListaEmpresaTelefoneVO := TListaEmpresaTelefoneVO.Create;
end;

destructor TEmpresaVO.Destroy;
begin
  FreeAndNil(FContadorVO);
  FreeAndNil(FUfVO);

  FreeAndNil(FListaEmpresaContatoVO);
  FreeAndNil(FListaEmpresaEnderecoVO);
  FreeAndNil(FListaEmpresaTelefoneVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TEmpresaVO);

finalization
  Classes.UnRegisterClass(TEmpresaVO);

end.
