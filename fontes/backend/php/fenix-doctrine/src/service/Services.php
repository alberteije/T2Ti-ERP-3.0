<?php

include 'ServiceBase.php';

// Administrativo
include 'administrativo/EmpresaService.php';

// Cadastros
include 'cadastros/BancoService.php';
include 'cadastros/BancoAgenciaService.php';
include 'cadastros/PessoaService.php';
include 'cadastros/ProdutoService.php';
include 'cadastros/ProdutoMarcaService.php';
include 'cadastros/ProdutoSubgrupoService.php';
include 'cadastros/ProdutoUnidadeService.php';
include 'cadastros/ProdutoGrupoService.php';
include 'cadastros/NivelFormacaoService.php';
include 'cadastros/EstadoCivilService.php';
include 'cadastros/BancoContaCaixaService.php';
include 'cadastros/CargoService.php';
include 'cadastros/CepService.php';
include 'cadastros/CfopService.php';
include 'cadastros/ClienteService.php';
include 'cadastros/CnaeService.php';
include 'cadastros/ColaboradorService.php';
include 'cadastros/ContadorService.php';
include 'cadastros/CsosnService.php';
include 'cadastros/CstCofinsService.php';
include 'cadastros/CstIcmsService.php';
include 'cadastros/CstIpiService.php';
include 'cadastros/CstPisService.php';
include 'cadastros/FornecedorService.php';
include 'cadastros/MunicipioService.php';
include 'cadastros/NcmService.php';
include 'cadastros/PapelService.php';
include 'cadastros/SetorService.php';
include 'cadastros/TransportadoraService.php';
include 'cadastros/UfService.php';
include 'cadastros/UsuarioService.php';
include 'cadastros/VendedorService.php';

// Financeiro
include 'financeiro/FinChequeEmitidoService.php';
include 'financeiro/FinChequeRecebidoService.php';
include 'financeiro/FinConfiguracaoBoletoService.php';
include 'financeiro/FinDocumentoOrigemService.php';
include 'financeiro/FinExtratoContaBancoService.php';
include 'financeiro/FinFechamentoCaixaBancoService.php';
include 'financeiro/FinLancamentoPagarService.php';
include 'financeiro/FinLancamentoReceberService.php';
include 'financeiro/FinNaturezaFinanceiraService.php';
include 'financeiro/FinTipoPagamentoService.php';
include 'financeiro/FinTipoRecebimentoService.php';
include 'financeiro/FinStatusParcelaService.php';
include 'financeiro/TalonarioChequeService.php';
include 'financeiro/FinParcelaPagarService.php';
include 'financeiro/FinParcelaReceberService.php';

// Estoque
include 'estoque/EstoqueReajusteCabecalhoService.php';
include 'estoque/RequisicaoInternaCabecalhoService.php';

// Tributação
include 'tributacao/TributConfiguraOfGtService.php';
include 'tributacao/TributGrupoTributarioService.php';
include 'tributacao/TributIcmsCustomCabService.php';
include 'tributacao/TributIssService.php';
include 'tributacao/TributOperacaoFiscalService.php';

// Vendas
include 'vendas/NotaFiscalModeloService.php';
include 'vendas/NotaFiscalTipoService.php';
include 'vendas/VendaCabecalhoService.php';
include 'vendas/VendaCondicoesPagamentoService.php';
include 'vendas/VendaFreteService.php';
include 'vendas/VendaOrcamentoCabecalhoService.php';

// Compras
include 'compras/CompraCotacaoService.php';
include 'compras/CompraPedidoService.php';
include 'compras/CompraRequisicaoService.php';
include 'compras/CompraTipoPedidoService.php';
include 'compras/CompraTipoRequisicaoService.php';

// NF-e
include 'nfe/NfeCabecalhoService.php';
include 'nfe/NfeCalculoService.php';

// Sped
include 'sped/SpedFiscalService.php';
include 'sped/SpedContabilService.php';

// Comissões
include 'comissoes/ComissaoObjetivoService.php';
include 'comissoes/ComissaoPerfilService.php';

// Ordem de Serviço
include 'os/OsAberturaService.php';
include 'os/OsEquipamentoService.php';
include 'os/OsStatusService.php';

// AFV
include 'afv/TabelaPrecoService.php';
include 'afv/VendedorMetaService.php';
include 'afv/VendedorRotaService.php';

// GED
include 'ged/GedDocumentoCabecalhoService.php';
include 'ged/GedTipoDocumentoService.php';

// Views
include 'viewsDB/ViewFinLancamentoPagarService.php';
include 'viewsDB/ViewPessoaClienteService.php';
include 'viewsDB/ViewPessoaColaboradorService.php';
include 'viewsDB/ViewPessoaFornecedorService.php';
include 'viewsDB/ViewFinLancamentoReceberService.php';
include 'viewsDB/ViewFinFluxoCaixaService.php';
include 'viewsDB/ViewFinChequeNaoCompensadoService.php';
include 'viewsDB/ViewFinMovimentoCaixaBancoService.php';