program GeradorArquivosFiscais;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcore, zcomponent, uFormPrincipal, UAPIServer, EmpresaController,
  SpedContabilController, SpedFiscalController, SpedContribuicoesController,
  SintegraController, ReinfController, ESocialController, Biblioteca,
  Constantes, SessaoUsuario, T2TiORM, Tipos, AdministrativoformularioVO,
  AdmParametroVO, AgenciaBancoVO, AgendaCategoriaCompromissoVO,
  AgendaCompromissoVO, AidfAimdfVO, AlmoxarifadoVO, AtividadeForCliVO, BancoVO,
  CargoVO, CboVO, CentroResultadoVO, CepVO, CfopVO, ChequeVO, ClienteVO, CnaeVO,
  CodigoGpsVO, ColaboradorVO, ComissaoObjetivoVO, ComissaoPerfilVO,
  CompraCotacaoDetalheVO, CompraCotacaoPedidoDetalheVO, CompraCotacaoVO,
  CompraFornecedorCotacaoVO, CompraPedidoDetalheVO, CompraPedidoVO,
  CompraReqCotacaoDetalheVO, CompraRequisicaoDetalheVO, CompraRequisicaoVO,
  CompraTipoPedidoVO, CompraTipoRequisicaoVO, ContabilContaVO,
  ContabilDreCabecalhoVO, ContabilDreDetalheVO, ContabilEncerramentoExeCabVO,
  ContabilEncerramentoExeDetVO, ContabilFechamentoVO, ContabilHistoricoVO,
  ContabilIndiceValorVO, ContabilIndiceVO, ContabilLancamentoCabecalhoVO,
  ContabilLancamentoDetalheVO, ContabilLancamentoOrcadoVO,
  ContabilLancamentoPadraoVO, ContabilLivroVO, ContabilLoteVO,
  ContabilParametroVO, ContabilTermoVO, ContaCaixaVO, ContadorVO,
  ContratoHistFaturamentoVO, ContratoHistoricoReajusteVO,
  ContratoPrevFaturamentoVO, ContratoSolicitacaoServicoVO, ContratoTemplateVO,
  ContratoTipoServicoVO, ContratoVO, ConvenioVO, CsosnAVO, CsosnBVO,
  CstCofinsVO, CstIcmsAVO, CstIcmsBVO, CstIpiVO, CstPisVO, CteAereoVO,
  CteAquaviarioBalsaVO, CteAquaviarioVO, CteCabecalhoVO, CteCargaVO,
  CteComponenteVO, CteDestinatarioVO, CteDocumentoAnteriorIdVO,
  CteDocumentoAnteriorVO, CteDuplicataVO, CteDutoviarioVO, CteEmitenteVO,
  CteExpedidorVO, CteFaturaVO, CteFerroviarioFerroviaVO, CteFerroviarioVagaoVO,
  CteFerroviarioVO, CteInfNfCargaLacreVO, CteInfNfTransporteLacreVO,
  CteInformacaoNfCargaVO, CteInformacaoNfOutrosVO, CteInformacaoNfTransporteVO,
  CteLocalColetaVO, CteLocalEntregaVO, CteMultimodalVO, CtePassagemVO,
  CtePerigosoVO, CteRecebedorVO, CteRemetenteVO, CteRodoviarioLacreVO,
  CteRodoviarioMotoristaVO, CteRodoviarioOccVO, CteRodoviarioPedagioVO,
  CteRodoviarioVeiculoVO, CteRodoviarioVO, CteSeguroVO, CteTomadorVO,
  CteVeiculoNovoVO, DavCabecalhoVO, DavDetalheAlteracaoVO, DavDetalheVO,
  EcfE3VO, EcfImpressoraVO, EcfNotaFiscalCabecalhoVO, EcfProdutoVO, EcfR02VO,
  EcfR03VO, EcfSintegra60aVO, EcfSintegra60mVO, EcfVendaCabecalhoVO,
  EcfVendaDetalheVO, EfdTabela435VO, EfdTabela436VO, EfdTabela437VO,
  EfdTabela439VO, EfdTabela4310VO, EfdTabela4313VO, EfdTabela4314VO,
  EfdTabela4315VO, EfdTabela4316VO, EmpresaCnaeVO, EmpresaContatoVO,
  EmpresaEnderecoVO, EmpresaTelefoneVO, EmpresaTransporteItinerarioVO,
  EmpresaVO, EstadoCivilVO, EstoqueReajusteCabecalhoVO,
  EstoqueReajusteDetalheVO, EtiquetaFormatoPapelVO, EtiquetaLayoutVO,
  EtiquetaTemplateVO, FapVO, FeriadosVO, FeriasPeriodoAquisitivoVO,
  FichaTecnicaVO, FinChequeEmitidoVO, FinChequeRecebidoVO,
  FinCobrancaParcelaReceberVO, FinCobrancaVO, FinConfiguracaoBoletoVO,
  FinDocumentoOrigemVO, FinExtratoContaBancoVO, FinFechamentoCaixaBancoVO,
  FinLancamentoPagarVO, FinLancamentoReceberVO, FinLctoPagarNtFinanceiraVO,
  FinLctoReceberNtFinanceiraVO, FinPagamentoFixoVO, FinParcelaPagamentoVO,
  FinParcelaPagarVO, FinParcelaReceberVO, FinParcelaRecebimentoVO,
  FinStatusParcelaVO, FinTipoPagamentoVO, FinTipoRecebimentoVO,
  FiscalApuracaoIcmsVO, FiscalLivroVO, FiscalNotaFiscalEntradaVO,
  FiscalParametroVO, FiscalTermoVO, FolhaAfastamentoVO, FolhaEventoVO,
  FolhaFechamentoVO, FolhaFeriasColetivasVO, FolhaHistoricoSalarialVO,
  FolhaInssRetencaoVO, FolhaInssServicoVO, FolhaInssVO,
  FolhaLancamentoCabecalhoVO, FolhaLancamentoComissaoVO,
  FolhaLancamentoDetalheVO, FolhaParametroVO, FolhaPlanoSaudeVO,
  FolhaPppAtividadeVO, FolhaPppCatVO, FolhaPppExameMedicoVO,
  FolhaPppFatorRiscoVO, FolhaPppVO, FolhaRescisaoVO, FolhaTipoAfastamentoVO,
  FolhaValeTransporteVO, FornecedorVO, FuncaoVO, GedDocumentoCabecalhoVO,
  GedDocumentoDetalheVO, GedTipoDocumentoVO, GedVersaoDocumentoVO,
  GuiasAcumuladasVO, IndiceEconomicoVO, InventarioContagemCabVO,
  InventarioContagemDetVO, MunicipioVO, NaturezaFinanceiraVO, NcmVO,
  NfeAcessoXmlVO, NfeCabecalhoVO, NfeCanaDeducoesSafraVO,
  NfeCanaFornecimentoDiarioVO, NfeCanaVO, NfeConfiguracaoVO,
  NfeCteReferenciadoVO, NfeCupomFiscalReferenciadoVO, NfeDeclaracaoImportacaoVO,
  NfeDestinatarioVO, NfeDetalheImpostoCofinsVO, NfeDetalheImpostoIcmsVO,
  NfeDetalheImpostoIiVO, NfeDetalheImpostoIpiVO, NfeDetalheImpostoIssqnVO,
  NfeDetalheImpostoPisVO, NfeDetalheVO, NfeDetEspecificoArmamentoVO,
  NfeDetEspecificoCombustivelVO, NfeDetEspecificoMedicamentoVO,
  NfeDetEspecificoVeiculoVO, NfeDuplicataVO, NfeEmitenteVO, NfeExportacaoVO,
  NfeFaturaVO, NfeFormaPagamentoVO, NfeImportacaoDetalheVO, NfeLocalEntregaVO,
  NfeLocalRetiradaVO, NfeNfReferenciadaVO, NfeNumeroVO,
  NfeProcessoReferenciadoVO, NfeProdRuralReferenciadaVO, NfeReferenciadaVO,
  NfeTransporteReboqueVO, NfeTransporteVO, NfeTransporteVolumeLacreVO,
  NfeTransporteVolumeVO, NfseCabecalhoVO, NfseDetalheVO, NfseIntermediarioVO,
  NfseListaServicoVO, NivelFormacaoVO, NotaFiscalTipoVO, OperadoraCartaoVO,
  OperadoraPlanoSaudeVO, OrcamentoDetalheVO, OrcamentoEmpresarialVO,
  OrcamentoFluxoCaixaDetalheVO, OrcamentoFluxoCaixaPeriodoVO,
  OrcamentoFluxoCaixaVO, OrcamentoPeriodoVO, OsAberturaEquipamentoVO,
  OsAberturaVO, OsEquipamentoVO, OsEvolucaoVO, OsProdutoServicoVO, OsStatusVO,
  PaisVO, PapelFuncaoVO, PapelVO, PatrimApoliceSeguroVO, PatrimBemVO,
  PatrimDepreciacaoBemVO, PatrimDocumentoBemVO, PatrimEstadoConservacaoVO,
  PatrimGrupoBemVO, PatrimIndiceAtualizacaoVO, PatrimMovimentacaoBemVO,
  PatrimTaxaDepreciacaoVO, PatrimTipoAquisicaoBemVO, PatrimTipoMovimentacaoVO,
  PcpInstrucaoOpVO, PcpInstrucaoVO, PcpOpCabecalhoVO, PcpOpDetalheVO,
  PcpServicoColaboradorVO, PcpServicoEquipamentoVO, PcpServicoVO,
  PessoaAlteracaoVO, PessoaContatoVO, PessoaEnderecoVO, PessoaFisicaVO,
  PessoaJuridicaVO, PessoaTelefoneVO, PessoaVO, PlanoCentroResultadoVO,
  PlanoContaRefSpedVO, PlanoContaVO, PlanoNaturezaFinanceiraVO,
  PontoAbonoUtilizacaoVO, PontoAbonoVO, PontoBancoHorasUtilizacaoVO,
  PontoBancoHorasVO, PontoClassificacaoJornadaVO, PontoEscalaVO,
  PontoFechamentoJornadaVO, PontoHorarioAutorizadoVO, PontoHorarioVO,
  PontoMarcacaoVO, PontoParametroVO, PontoRelogioVO, PontoTurmaVO,
  PreVendaCabecalhoVO, PreVendaDetalheVO, ProdutoAlteracaoItemVO,
  ProdutoGrupoVO, ProdutoLoteVO, ProdutoMarcaVO, ProdutoSubGrupoVO, ProdutoVO,
  QuadroSocietarioVO, RecadoDestinatarioVO, RecadoRemetenteVO,
  RegistroCartorioVO, RequisicaoInternaCabecalhoVO, RequisicaoInternaDetalheVO,
  ReuniaoSalaVO, SalarioMinimoVO, SefipCategoriaTrabalhoVO,
  SefipCodigoMovimentacaoVO, SefipCodigoRecolhimentoVO, SeguradoraVO, SetorVO,
  SimplesNacionalCabecalhoVO, SimplesNacionalDetalheVO, SindicatoVO,
  SituacaoColaboradorVO, SituacaoDocumentoVO, SituacaoForCliVO,
  SocioDependenteVO, SocioParticipacaoSocietariaVO, SocioVO, TalonarioChequeVO,
  TipoAdmissaoVO, TipoColaboradorVO, TipoContratoVO, TipoDesligamentoVO,
  TipoItemSpedVO, TipoReceitaDipiVO, TipoRelacionamentoVO,
  TributCofinsCodApuracaoVO, TributConfiguraOfGtVO, TributGrupoTributarioVO,
  TributIcmsCustomCabVO, TributIcmsCustomDetVO, TributIcmsUfVO, TributIpiDipiVO,
  TributIssVO, TributOperacaoFiscalVO, TributPisCodApuracaoVO, UfVO,
  UnidadeConversaoVO, UnidadeProdutoVO, UsuarioVO, VendaCabecalhoVO,
  VendaComissaoVO, VendaCondicoesPagamentoVO, VendaCondicoesParcelasVO,
  VendaDetalheVO, VendaFreteVO, VendaOrcamentoCabecalhoVO,
  VendaOrcamentoDetalheVO, VendaRomaneioEntregaVO, VendedorVO,
  ViewCompraItemCotacaoVO, ViewCompraMapaComparativoVO,
  ViewCompraReqItemCotadoVO, ViewConciliaClienteVO, ViewConciliaFornecedorVO,
  ViewContratoDadosContratanteVO, ViewFinChequeEmitidoVO,
  ViewFinChequeNaoCompensadoVO, ViewFinChequesEmSerVO, ViewFinFluxoCaixaVO,
  ViewFinLancamentoPagarVO, ViewFinLancamentoReceberVO,
  ViewFinMovimentoCaixaBancoVO, ViewFinResumoTesourariaVO,
  ViewFinTotalPagamentosDiaVO, ViewFinTotalRecebimentosDiaVO,
  ViewPessoaClienteVO, ViewPessoaColaboradorVO, ViewPessoaFornecedorVO,
  ViewPessoaTransportadoraVO, ViewPontoEscalaTurmaVO, ViewPontoMarcacaoVO,
  ViewSessaoEmpresaVO, ViewSintegra60dVO, ViewSintegra60rVO, ViewSintegra61rVO,
  ViewSpedC190VO, ViewSpedC300VO, ViewSpedC321VO, ViewSpedC370VO,
  ViewSpedC390VO, ViewSpedC425VO, ViewSpedC490VO, ViewSpedI155VO,
  ViewSpedNfeDestinatarioVO, ViewSpedNfeDetalheVO, ViewSpedNfeEmitenteVO,
  ViewSpedNfeItemVO, ViewTributacaoCofinsVO, ViewTributacaoIcmsCustomVO,
  ViewTributacaoIcmsVO, ViewTributacaoIpiVO, ViewTributacaoIssVO,
  ViewTributacaoPisVO, VO, WmsAgendamentoVO, WmsArmazenamentoVO, WmsCaixaVO,
  WmsEstanteVO, WmsExpedicaoVO, WmsOrdemSeparacaoCabVO, WmsOrdemSeparacaoDetVO,
  WmsParametroVO, WmsRecebimentoCabecalhoVO, WmsRecebimentoDetalheVO, WmsRuaVO,
  UDataModule;

{$R *.res}

var
  ServerPort: Integer = 9000;

begin
  // Conectar ao banco
  TT2TiConnectionManager.Connect;

  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  {$PUSH}{$WARN 5044 OFF}
  Application.MainFormOnTaskbar:=True;
  {$POP}
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFDataModule, FDataModule);
  // Criar e iniciar servidor API
  APIServer := TAPIServer.Create(ServerPort);
  try
    APIServer.OnStatus := @FormPrincipal.AtualizarStatusServidor;
    APIServer.Start;
    Application.Run;

  finally
    APIServer.Stop;
    APIServer.Free;
  end;
end.

