unit UWebModule;

interface

uses System.SysUtils, System.Classes, Web.HTTPApp,
  UAuthCriteria,
  mvcframework, MVCFramework.JWT;

type
  TFWebModule = class(TWebModule)
    procedure WebModuleCreate(Sender: TObject);
  private
    FEngine: TMVCEngine;
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TFWebModule;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses
  // outras classes do MVC
  MVCFramework.Commons,
  MVCFramework.Middleware.JWT,
  MVCFramework.Middleware.Compression,

  // cadastros
  BancoController,
  BancoAgenciaController,
  PessoaController,
  ProdutoController,
  ProdutoGrupoController,
  ProdutoSubgrupoController,
  ProdutoMarcaController,
  ProdutoUnidadeController,
  EstadoCivilController,
  NivelFormacaoController,
  CargoController,
  BancoContaCaixaController,
  CepController,
  CfopController,
  ClienteController,
  CnaeController,
  ColaboradorController,
  ContadorController,
  CsosnController,
  CstCofinsController,
  CstIcmsController,
  CstIpiController,
  CstPisController,
  FornecedorController,
  MunicipioController,
  NcmController,
  SetorController,
  TransportadoraController,
  UfController,
  UsuarioController,
  VendedorController,
  PapelController,
  ChequeController,

  // financeiro
  FinChequeEmitidoController,
  FinChequeRecebidoController,
  FinConfiguracaoBoletoController,
  FinDocumentoOrigemController,
  FinExtratoContaBancoController,
  FinFechamentoCaixaBancoController,
  FinLancamentoPagarController,
  FinLancamentoReceberController,
  FinNaturezaFinanceiraController,
  FinStatusParcelaController,
  FinTipoPagamentoController,
  FinTipoRecebimentoController,
  TalonarioChequeController,
  FinParcelaPagarController,

  // Estoque
  EstoqueReajusteCabecalhoController,
  RequisicaoInternaCabecalhoController,

  // Vendas
  VendaCabecalhoController,
  VendaComissaoController,
  VendaCondicoesPagamentoController,
  VendaFreteController,
  VendaOrcamentoCabecalhoController,
  NotaFiscalModeloController,
  NotaFiscalTipoController,

  // Compras
  CompraCotacaoController,
  CompraPedidoController,
  CompraRequisicaoController,
  CompraTipoPedidoController,
  CompraTipoRequisicaoController,

  // NF-e
  NfeCabecalhoController,

  // Sped
  SpedFiscalController,
  SpedContabilController,

  // Comissões
  ComissaoPerfilController,
  ComissaoObjetivoController,

  // Ordem de Serviço
  OsAberturaController,
  OsEquipamentoController,
  OsStatusController,

  // AFV
  TabelaPrecoController,
  VendedorMetaController,
  VendedorRotaController,

  // GED
  GedDocumentoCabecalhoController,
  GedTipoDocumentoController,

  // NFS-e
  NfseCabecalhoController,
  NfseListaServicoController,

  // CT-e
  CteCabecalhoController,

  // Inventário
  InventarioContagemCabController,

  // Views
  ViewPessoaColaboradorController,
  ViewPessoaClienteController,
  ViewPessoaFornecedorController,
  ViewPessoaTransportadoraController,
  ViewFinLancamentoPagarController,
  ViewFinLancamentoReceberController,
  ViewFinMovimentoCaixaBancoController,
  ViewFinChequeNaoCompensadoController,
  ViewFinFluxoCaixaController,
  ViewPessoaVendedorController,
  TributConfiguraOfGtController,
  TributGrupoTributarioController,
  TributIcmsCustomCabController,
  TributIssController,
  TributOperacaoFiscalController,


  MVCFramework.Middleware.CORS;

{$R *.dfm}

procedure TFWebModule.WebModuleCreate(Sender: TObject);
var
  lClaimsSetup: TJWTClaimsSetup;
begin
  // Token - JWT
  lClaimsSetup := procedure(const JWT: TJWT)
    begin
      JWT.Claims.Issuer := 'Delphi MVC Framework JWT Middleware Sample';
      JWT.Claims.ExpirationTime := Now + 1000;
      JWT.Claims.NotBefore := Now; // valid since now
      JWT.Claims.IssuedAt := Now;
      JWT.CustomClaims['t2ti'] := 'fenix';
    end;

  FEngine := TMVCEngine.Create(self);

  FEngine.AddMiddleware(TMVCJWTAuthenticationMiddleware.Create(
    TAuthCriteria.Create,
    lClaimsSetup,
    '#Sua-chave-de-32-caracteres-aqui',
    '/login'
    ));

  // cadastros
  FEngine.AddController(TBancoController);
  FEngine.AddController(TBancoAgenciaController);
  FEngine.AddController(TPessoaController);
  FEngine.AddController(TProdutoController);
  FEngine.AddController(TProdutoGrupoController);
  FEngine.AddController(TProdutoSubgrupoController);
  FEngine.AddController(TProdutoMarcaController);
  FEngine.AddController(TProdutoUnidadeController);
  FEngine.AddController(TEstadoCivilController);
  FEngine.AddController(TNivelFormacaoController);
  FEngine.AddController(TCargoController);
  FEngine.AddMiddleware(TCORSMiddleware.Create);
  FEngine.AddController(TBancoContaCaixaController);
  FEngine.AddController(TCepController);
  FEngine.AddController(TCfopController);
  FEngine.AddController(TClienteController);
  FEngine.AddController(TCnaeController);
  FEngine.AddController(TColaboradorController);
  FEngine.AddController(TContadorController);
  FEngine.AddController(TCsosnController);
  FEngine.AddController(TCstCofinsController);
  FEngine.AddController(TCstIcmsController);
  FEngine.AddController(TCstIpiController);
  FEngine.AddController(TCstPisController);
  FEngine.AddController(TFornecedorController);
  FEngine.AddController(TMunicipioController);
  FEngine.AddController(TNcmController);
  FEngine.AddController(TSetorController);
  FEngine.AddController(TTransportadoraController);
  FEngine.AddController(TUfController);
  FEngine.AddController(TUsuarioController);
  FEngine.AddController(TVendedorController);
  FEngine.AddController(TPapelController);
  FEngine.AddController(TChequeController);

  // financeiro
  FEngine.AddController(TFinChequeEmitidoController);
  FEngine.AddController(TFinChequeRecebidoController);
  FEngine.AddController(TFinConfiguracaoBoletoController);
  FEngine.AddController(TFinDocumentoOrigemController);
  FEngine.AddController(TFinExtratoContaBancoController);
  FEngine.AddController(TFinFechamentoCaixaBancoController);
  FEngine.AddController(TFinLancamentoPagarController);
  FEngine.AddController(TFinLancamentoReceberController);
  FEngine.AddController(TFinNaturezaFinanceiraController);
  FEngine.AddController(TFinStatusParcelaController);
  FEngine.AddController(TFinTipoPagamentoController);
  FEngine.AddController(TFinTipoRecebimentoController);
  FEngine.AddController(TTalonarioChequeController);
  FEngine.AddController(TFinParcelaPagarController);

  // tributação
  FEngine.AddController(TTributConfiguraOfGtController);
  FEngine.AddController(TTributGrupoTributarioController);
  FEngine.AddController(TTributIcmsCustomCabController);
  FEngine.AddController(TTributIssController);
  FEngine.AddController(TTributOperacaoFiscalController);

  // estoque
  FEngine.AddController(TEstoqueReajusteCabecalhoController);
  FEngine.AddController(TRequisicaoInternaCabecalhoController);

  // vendas
  FEngine.AddController(TVendaCabecalhoController);
  FEngine.AddController(TVendaComissaoController);
  FEngine.AddController(TVendaCondicoesPagamentoController);
  FEngine.AddController(TVendaFreteController);
  FEngine.AddController(TVendaOrcamentoCabecalhoController);
  FEngine.AddController(TNotaFiscalModeloController);
  FEngine.AddController(TNotaFiscalTipoController);

  // compras
  FEngine.AddController(TCompraCotacaoController);
  FEngine.AddController(TCompraPedidoController);
  FEngine.AddController(TCompraRequisicaoController);
  FEngine.AddController(TCompraTipoPedidoController);
  FEngine.AddController(TCompraTipoRequisicaoController);

  // NFe
  FEngine.AddController(TNfeCabecalhoController);

  // Sped
  FEngine.AddController(TSpedFiscalController);
  FEngine.AddController(TSpedContabilController);

  // Comissões
  FEngine.AddController(TComissaoPerfilController);
  FEngine.AddController(TComissaoObjetivoController);

  // Ordem de Serviço
  FEngine.AddController(TOsAberturaController);
  FEngine.AddController(TOsEquipamentoController);
  FEngine.AddController(TOsStatusController);

  // AFV
  FEngine.AddController(TTabelaPrecoController);
  FEngine.AddController(TVendedorMetaController);
  FEngine.AddController(TVendedorRotaController);

  // GED
  FEngine.AddController(TGedDocumentoCabecalhoController);
  FEngine.AddController(TGedTipoDocumentoController);

  // NFS-e
  FEngine.AddController(TNfseCabecalhoController);
  FEngine.AddController(TNfseListaServicoController);

  // CT-e
  FEngine.AddController(TCteCabecalhoController);

  // Inventário
  FEngine.AddController(TInventarioContagemCabController);

  // views
  FEngine.AddController(TViewPessoaColaboradorController);
  FEngine.AddController(TViewPessoaClienteController);
  FEngine.AddController(TViewPessoaFornecedorController);
  FEngine.AddController(TViewPessoaVendedorController);
  FEngine.AddController(TViewPessoaTransportadoraController);
  FEngine.AddController(TViewFinLancamentoPagarController);
  FEngine.AddController(TViewFinLancamentoReceberController);
  FEngine.AddController(TViewFinMovimentoCaixaBancoController);
  FEngine.AddController(TViewFinChequeNaoCompensadoController);
  FEngine.AddController(TViewFinFluxoCaixaController);
end;

end.
