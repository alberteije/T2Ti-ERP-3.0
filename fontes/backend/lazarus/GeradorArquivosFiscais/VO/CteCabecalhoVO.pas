unit CteCabecalhoVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL, EmpresaVO, CTeDestinatarioVO, CTeLocalEntregaVO, CteLocalColetaVO,
  CTeFaturaVO, CTeDuplicataVO, CteInformacaoNfOutrosVO;

type
  TCteCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FUF_EMITENTE: Integer;
    FCODIGO_NUMERICO: String;
    FCFOP: Integer;
    FNATUREZA_OPERACAO: String;
    FFORMA_PAGAMENTO: Integer;
    FMODELO: String;
    FSERIE: String;
    FNUMERO: String;
    FDATA_HORA_EMISSAO: TDateTime;
    FFORMATO_IMPRESSAO_DACTE: Integer;
    FTIPO_EMISSAO: Integer;
    FCHAVE_ACESSO: String;
    FDIGITO_CHAVE_ACESSO: String;
    FAMBIENTE: Integer;
    FTIPO_CTE: Integer;
    FPROCESSO_EMISSAO: Integer;
    FVERSAO_PROCESSO_EMISSAO: String;
    FCHAVE_REFERENCIADO: String;
    FCODIGO_MUNICIPIO_ENVIO: Integer;
    FNOME_MUNICIPIO_ENVIO: String;
    FUF_ENVIO: String;
    FMODAL: String;
    FTIPO_SERVICO: Integer;
    FCODIGO_MUNICIPIO_INI_PRESTACAO: Integer;
    FNOME_MUNICIPIO_INI_PRESTACAO: String;
    FUF_INI_PRESTACAO: String;
    FCODIGO_MUNICIPIO_FIM_PRESTACAO: Integer;
    FNOME_MUNICIPIO_FIM_PRESTACAO: String;
    FUF_FIM_PRESTACAO: String;
    FRETIRA: Integer;
    FRETIRA_DETALHE: String;
    FTOMADOR: Integer;
    FDATA_ENTRADA_CONTINGENCIA: TDateTime;
    FJUSTIFICATIVA_CONTINGENCIA: String;
    FCARAC_ADICIONAL_TRANSPORTE: String;
    FCARAC_ADICIONAL_SERVICO: String;
    FFUNCIONARIO_EMISSOR: String;
    FFLUXO_ORIGEM: String;
    FENTREGA_TIPO_PERIODO: Integer;
    FENTREGA_DATA_PROGRAMADA: TDateTime;
    FENTREGA_DATA_INICIAL: TDateTime;
    FENTREGA_DATA_FINAL: TDateTime;
    FENTREGA_TIPO_HORA: Integer;
    FENTREGA_HORA_PROGRAMADA: String;
    FENTREGA_HORA_INICIAL: String;
    FENTREGA_HORA_FINAL: String;
    FMUNICIPIO_ORIGEM_CALCULO: String;
    FMUNICIPIO_DESTINO_CALCULO: String;
    FOBSERVACOES_GERAIS: String;
    FVALOR_TOTAL_SERVICO: Extended;
    FVALOR_RECEBER: Extended;
    FCST: String;
    FBASE_CALCULO_ICMS: Extended;
    FALIQUOTA_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FPERCENTUAL_REDUCAO_BC_ICMS: Extended;
    FVALOR_BC_ICMS_ST_RETIDO: Extended;
    FVALOR_ICMS_ST_RETIDO: Extended;
    FALIQUOTA_ICMS_ST_RETIDO: Extended;
    FVALOR_CREDITO_PRESUMIDO_ICMS: Extended;
    FPERCENTUAL_BC_ICMS_OUTRA_UF: Extended;
    FVALOR_BC_ICMS_OUTRA_UF: Extended;
    FALIQUOTA_ICMS_OUTRA_UF: Extended;
    FVALOR_ICMS_OUTRA_UF: Extended;
    FSIMPLES_NACIONAL_INDICADOR: Integer;
    FSIMPLES_NACIONAL_TOTAL: Extended;
    FINFORMACOES_ADD_FISCO: String;
    FVALOR_TOTAL_CARGA: Extended;
    FPRODUTO_PREDOMINANTE: String;
    FCARGA_OUTRAS_CARACTERISTICAS: String;
    FMODAL_VERSAO_LAYOUT: Integer;
    FCHAVE_CTE_SUBSTITUIDO: String;

    //Transientes
    FEmpresaVO: TEmpresaVO;
    FCTeDestinatarioVO: TCTeDestinatarioVO;
    FCTeLocalEntregaVO: TCteLocalEntregaVO;
    FCteLocalColetaVO: TCteLocalColetaVO;
    FCTeFaturaVO: TCTeFaturaVO;

    FListaCTeDuplicataVO: TListaCTeDuplicataVO;
    FListaCteInformacaoNfOutrosVO: TListaCteInformacaoNfOutrosVO;


  published 
    constructor Create; override;
    destructor Destroy; override;

    property Id: Integer  read FID write FID;
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    property UfEmitente: Integer  read FUF_EMITENTE write FUF_EMITENTE;
    property CodigoNumerico: String  read FCODIGO_NUMERICO write FCODIGO_NUMERICO;
    property Cfop: Integer  read FCFOP write FCFOP;
    property NaturezaOperacao: String  read FNATUREZA_OPERACAO write FNATUREZA_OPERACAO;
    property FormaPagamento: Integer  read FFORMA_PAGAMENTO write FFORMA_PAGAMENTO;
    property Modelo: String  read FMODELO write FMODELO;
    property Serie: String  read FSERIE write FSERIE;
    property Numero: String  read FNUMERO write FNUMERO;
    property DataHoraEmissao: TDateTime  read FDATA_HORA_EMISSAO write FDATA_HORA_EMISSAO;
    property FormatoImpressaoDacte: Integer  read FFORMATO_IMPRESSAO_DACTE write FFORMATO_IMPRESSAO_DACTE;
    property TipoEmissao: Integer  read FTIPO_EMISSAO write FTIPO_EMISSAO;
    property ChaveAcesso: String  read FCHAVE_ACESSO write FCHAVE_ACESSO;
    property DigitoChaveAcesso: String  read FDIGITO_CHAVE_ACESSO write FDIGITO_CHAVE_ACESSO;
    property Ambiente: Integer  read FAMBIENTE write FAMBIENTE;
    property TipoCte: Integer  read FTIPO_CTE write FTIPO_CTE;
    property ProcessoEmissao: Integer  read FPROCESSO_EMISSAO write FPROCESSO_EMISSAO;
    property VersaoProcessoEmissao: String  read FVERSAO_PROCESSO_EMISSAO write FVERSAO_PROCESSO_EMISSAO;
    property ChaveReferenciado: String  read FCHAVE_REFERENCIADO write FCHAVE_REFERENCIADO;
    property CodigoMunicipioEnvio: Integer  read FCODIGO_MUNICIPIO_ENVIO write FCODIGO_MUNICIPIO_ENVIO;
    property NomeMunicipioEnvio: String  read FNOME_MUNICIPIO_ENVIO write FNOME_MUNICIPIO_ENVIO;
    property UfEnvio: String  read FUF_ENVIO write FUF_ENVIO;
    property Modal: String  read FMODAL write FMODAL;
    property TipoServico: Integer  read FTIPO_SERVICO write FTIPO_SERVICO;
    property CodigoMunicipioIniPrestacao: Integer  read FCODIGO_MUNICIPIO_INI_PRESTACAO write FCODIGO_MUNICIPIO_INI_PRESTACAO;
    property NomeMunicipioIniPrestacao: String  read FNOME_MUNICIPIO_INI_PRESTACAO write FNOME_MUNICIPIO_INI_PRESTACAO;
    property UfIniPrestacao: String  read FUF_INI_PRESTACAO write FUF_INI_PRESTACAO;
    property CodigoMunicipioFimPrestacao: Integer  read FCODIGO_MUNICIPIO_FIM_PRESTACAO write FCODIGO_MUNICIPIO_FIM_PRESTACAO;
    property NomeMunicipioFimPrestacao: String  read FNOME_MUNICIPIO_FIM_PRESTACAO write FNOME_MUNICIPIO_FIM_PRESTACAO;
    property UfFimPrestacao: String  read FUF_FIM_PRESTACAO write FUF_FIM_PRESTACAO;
    property Retira: Integer  read FRETIRA write FRETIRA;
    property RetiraDetalhe: String  read FRETIRA_DETALHE write FRETIRA_DETALHE;
    property Tomador: Integer  read FTOMADOR write FTOMADOR;
    property DataEntradaContingencia: TDateTime  read FDATA_ENTRADA_CONTINGENCIA write FDATA_ENTRADA_CONTINGENCIA;
    property JustificativaContingencia: String  read FJUSTIFICATIVA_CONTINGENCIA write FJUSTIFICATIVA_CONTINGENCIA;
    property CaracAdicionalTransporte: String  read FCARAC_ADICIONAL_TRANSPORTE write FCARAC_ADICIONAL_TRANSPORTE;
    property CaracAdicionalServico: String  read FCARAC_ADICIONAL_SERVICO write FCARAC_ADICIONAL_SERVICO;
    property FuncionarioEmissor: String  read FFUNCIONARIO_EMISSOR write FFUNCIONARIO_EMISSOR;
    property FluxoOrigem: String  read FFLUXO_ORIGEM write FFLUXO_ORIGEM;
    property EntregaTipoPeriodo: Integer  read FENTREGA_TIPO_PERIODO write FENTREGA_TIPO_PERIODO;
    property EntregaDataProgramada: TDateTime  read FENTREGA_DATA_PROGRAMADA write FENTREGA_DATA_PROGRAMADA;
    property EntregaDataInicial: TDateTime  read FENTREGA_DATA_INICIAL write FENTREGA_DATA_INICIAL;
    property EntregaDataFinal: TDateTime  read FENTREGA_DATA_FINAL write FENTREGA_DATA_FINAL;
    property EntregaTipoHora: Integer  read FENTREGA_TIPO_HORA write FENTREGA_TIPO_HORA;
    property EntregaHoraProgramada: String  read FENTREGA_HORA_PROGRAMADA write FENTREGA_HORA_PROGRAMADA;
    property EntregaHoraInicial: String  read FENTREGA_HORA_INICIAL write FENTREGA_HORA_INICIAL;
    property EntregaHoraFinal: String  read FENTREGA_HORA_FINAL write FENTREGA_HORA_FINAL;
    property MunicipioOrigemCalculo: String  read FMUNICIPIO_ORIGEM_CALCULO write FMUNICIPIO_ORIGEM_CALCULO;
    property MunicipioDestinoCalculo: String  read FMUNICIPIO_DESTINO_CALCULO write FMUNICIPIO_DESTINO_CALCULO;
    property ObservacoesGerais: String  read FOBSERVACOES_GERAIS write FOBSERVACOES_GERAIS;
    property ValorTotalServico: Extended  read FVALOR_TOTAL_SERVICO write FVALOR_TOTAL_SERVICO;
    property ValorReceber: Extended  read FVALOR_RECEBER write FVALOR_RECEBER;
    property Cst: String  read FCST write FCST;
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    property AliquotaIcms: Extended  read FALIQUOTA_ICMS write FALIQUOTA_ICMS;
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    property PercentualReducaoBcIcms: Extended  read FPERCENTUAL_REDUCAO_BC_ICMS write FPERCENTUAL_REDUCAO_BC_ICMS;
    property ValorBcIcmsStRetido: Extended  read FVALOR_BC_ICMS_ST_RETIDO write FVALOR_BC_ICMS_ST_RETIDO;
    property ValorIcmsStRetido: Extended  read FVALOR_ICMS_ST_RETIDO write FVALOR_ICMS_ST_RETIDO;
    property AliquotaIcmsStRetido: Extended  read FALIQUOTA_ICMS_ST_RETIDO write FALIQUOTA_ICMS_ST_RETIDO;
    property ValorCreditoPresumidoIcms: Extended  read FVALOR_CREDITO_PRESUMIDO_ICMS write FVALOR_CREDITO_PRESUMIDO_ICMS;
    property PercentualBcIcmsOutraUf: Extended  read FPERCENTUAL_BC_ICMS_OUTRA_UF write FPERCENTUAL_BC_ICMS_OUTRA_UF;
    property ValorBcIcmsOutraUf: Extended  read FVALOR_BC_ICMS_OUTRA_UF write FVALOR_BC_ICMS_OUTRA_UF;
    property AliquotaIcmsOutraUf: Extended  read FALIQUOTA_ICMS_OUTRA_UF write FALIQUOTA_ICMS_OUTRA_UF;
    property ValorIcmsOutraUf: Extended  read FVALOR_ICMS_OUTRA_UF write FVALOR_ICMS_OUTRA_UF;
    property SimplesNacionalIndicador: Integer  read FSIMPLES_NACIONAL_INDICADOR write FSIMPLES_NACIONAL_INDICADOR;
    property SimplesNacionalTotal: Extended  read FSIMPLES_NACIONAL_TOTAL write FSIMPLES_NACIONAL_TOTAL;
    property InformacoesAddFisco: String  read FINFORMACOES_ADD_FISCO write FINFORMACOES_ADD_FISCO;
    property ValorTotalCarga: Extended  read FVALOR_TOTAL_CARGA write FVALOR_TOTAL_CARGA;
    property ProdutoPredominante: String  read FPRODUTO_PREDOMINANTE write FPRODUTO_PREDOMINANTE;
    property CargaOutrasCaracteristicas: String  read FCARGA_OUTRAS_CARACTERISTICAS write FCARGA_OUTRAS_CARACTERISTICAS;
    property ModalVersaoLayout: Integer  read FMODAL_VERSAO_LAYOUT write FMODAL_VERSAO_LAYOUT;
    property ChaveCteSubstituido: String  read FCHAVE_CTE_SUBSTITUIDO write FCHAVE_CTE_SUBSTITUIDO;


    //Transientes
    property EmpresaVO: TEmpresaVO read FEmpresaVO write FEmpresaVO;

    property CteDestinatarioVO: TCTeDestinatarioVO read FCTeDestinatarioVO write FCTeDestinatarioVO;

    property CteLocalEntregaVO: TCTeLocalEntregaVO read FCteLocalEntregaVO write FCteLocalEntregaVO;

    property CteLocalColetaVO: TCteLocalColetaVO read FCteLocalColetaVO write FCteLocalColetaVO;

    property CTeFaturaVO: TCTeFaturaVO read FCTeFaturaVO write FCTeFaturaVO;

    property ListaCTeDuplicataVO: TListaCTeDuplicataVO read FListaCTeDuplicataVO write FListaCTeDuplicataVO;

    property ListaCteInformacaoNfOutrosVO: TListaCteInformacaoNfOutrosVO read FListaCteInformacaoNfOutrosVO write FListaCteInformacaoNfOutrosVO;

  end;

  TListaCteCabecalhoVO = specialize TFPGObjectList<TCteCabecalhoVO>;

implementation

constructor TCteCabecalhoVO.Create;
begin
  inherited;

  FEmpresaVO := TEmpresaVO.Create;
  FCTeDestinatarioVO := TCTeDestinatarioVO.Create;
  FCteLocalEntregaVO := TCTeLocalEntregaVO.Create;
  FCteLocalColetaVO := TCteLocalColetaVO.Create;
  FCTeFaturaVO := TCTeFaturaVO.Create;

  FListaCTeDuplicataVO := TListaCTeDuplicataVO.Create;
  FListaCteInformacaoNfOutrosVO := TListaCteInformacaoNfOutrosVO.Create;
end;

destructor TCteCabecalhoVO.Destroy;
begin
  FreeAndNil(FEmpresaVO);
  FreeAndNil(FCTeDestinatarioVO);
  FreeAndNil(FCteLocalEntregaVO);
  FreeAndNil(FCteLocalColetaVO);
  FreeAndNil(FCTeFaturaVO);

  FreeAndNil(FListaCTeDuplicataVO);
  FreeAndNil(FListaCteInformacaoNfOutrosVO);
  inherited;
end;


initialization
  Classes.RegisterClass(TCteCabecalhoVO);

finalization
  Classes.UnRegisterClass(TCteCabecalhoVO);

end.
