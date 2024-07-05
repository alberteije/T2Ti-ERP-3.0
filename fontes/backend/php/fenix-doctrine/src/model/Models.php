<?php

include 'ModelBase.php';

// Administrativo
include 'administrativo/Empresa.php';
include 'administrativo/EmpresaContato.php';
include 'administrativo/EmpresaEndereco.php';
include 'administrativo/EmpresaTelefone.php';

// Cadastros
include 'cadastros/Banco.php';
include 'cadastros/BancoAgencia.php';
include 'cadastros/Pessoa.php';
include 'cadastros/PessoaFisica.php';
include 'cadastros/PessoaJuridica.php';
include 'cadastros/PessoaContato.php';
include 'cadastros/PessoaTelefone.php';
include 'cadastros/PessoaEndereco.php';
include 'cadastros/Produto.php';
include 'cadastros/ProdutoGrupo.php';
include 'cadastros/ProdutoSubgrupo.php';
include 'cadastros/ProdutoUnidade.php';
include 'cadastros/ProdutoMarca.php';
include 'cadastros/NivelFormacao.php';
include 'cadastros/EstadoCivil.php';
include 'cadastros/BancoContaCaixa.php';
include 'cadastros/Cargo.php';
include 'cadastros/Cep.php';
include 'cadastros/Cfop.php';
include 'cadastros/Cliente.php';
include 'cadastros/Cnae.php';
include 'cadastros/Colaborador.php';
include 'cadastros/Contador.php';
include 'cadastros/Csosn.php';
include 'cadastros/CstCofins.php';
include 'cadastros/CstIcms.php';
include 'cadastros/CstIpi.php';
include 'cadastros/CstPis.php';
include 'cadastros/Fornecedor.php';
include 'cadastros/Municipio.php';
include 'cadastros/Ncm.php';
include 'cadastros/Papel.php';
include 'cadastros/Setor.php';
include 'cadastros/Transportadora.php';
include 'cadastros/Uf.php';
include 'cadastros/Usuario.php';
include 'cadastros/Vendedor.php';
include 'cadastros/TabelaPreco.php';
include 'cadastros/TabelaPrecoProduto.php';
include 'cadastros/TipoRelacionamento.php';
include 'cadastros/ColaboradorRelacionamento.php';
include 'cadastros/TipoAdmissao.php';
include 'cadastros/Sindicato.php';
include 'cadastros/ColaboradorTipo.php';
include 'cadastros/ColaboradorSituacao.php';


// Financeiro
include 'financeiro/Cheque.php';
include 'financeiro/FinChequeEmitido.php';
include 'financeiro/FinChequeRecebido.php';
include 'financeiro/FinConfiguracaoBoleto.php';
include 'financeiro/FinDocumentoOrigem.php';
include 'financeiro/FinExtratoContaBanco.php';
include 'financeiro/FinFechamentoCaixaBanco.php';
include 'financeiro/FinLancamentoPagar.php';
include 'financeiro/FinLancamentoReceber.php';
include 'financeiro/FinNaturezaFinanceira.php';
include 'financeiro/FinParcelaPagar.php';
include 'financeiro/FinParcelaReceber.php';
include 'financeiro/FinStatusParcela.php';
include 'financeiro/FinTipoPagamento.php';
include 'financeiro/FinTipoRecebimento.php';
include 'financeiro/TalonarioCheque.php';

// Estoque
include 'estoque/EstoqueReajusteCabecalho.php';
include 'estoque/EstoqueReajusteDetalhe.php';
include 'estoque/RequisicaoInternaCabecalho.php';
include 'estoque/RequisicaoInternaDetalhe.php';

// Tributação
include 'tributacao/TributGrupoTributario.php';
include 'tributacao/TributIcmsCustomCab.php';
include 'tributacao/TributIcmsCustomDet.php';
include 'tributacao/TributIss.php';
include 'tributacao/TributOperacaoFiscal.php';
include 'tributacao/TributConfiguraOfGt.php';
include 'tributacao/TributIpi.php';
include 'tributacao/TributPis.php';
include 'tributacao/TributCofins.php';
include 'tributacao/TributIcmsUf.php';

// Vendas
include 'vendas/NotaFiscalModelo.php';
include 'vendas/NotaFiscalTipo.php';
include 'vendas/VendaCabecalho.php';
include 'vendas/VendaComissao.php';
include 'vendas/VendaCondicoesPagamento.php';
include 'vendas/VendaCondicoesParcelas.php';
include 'vendas/VendaDetalhe.php';
include 'vendas/VendaFrete.php';
include 'vendas/VendaOrcamentoCabecalho.php';
include 'vendas/VendaOrcamentoDetalhe.php';

// Compras
include 'compras/CompraCotacao.php';
include 'compras/CompraCotacaoDetalhe.php';
include 'compras/CompraFornecedorCotacao.php';
include 'compras/CompraPedido.php';
include 'compras/CompraPedidoDetalhe.php';
include 'compras/CompraRequisicao.php';
include 'compras/CompraRequisicaoDetalhe.php';
include 'compras/CompraTipoPedido.php';
include 'compras/CompraTipoRequisicao.php';

// NF-e
include 'nfe/NfeAcessoXml.php';
include 'nfe/NfeCabecalho.php';
include 'nfe/NfeCana.php';
include 'nfe/NfeCanaDeducoesSafra.php';
include 'nfe/NfeCanaFornecimentoDiario.php';
include 'nfe/NfeCteReferenciado.php';
include 'nfe/NfeCupomFiscalReferenciado.php';
include 'nfe/NfeDeclaracaoImportacao.php';
include 'nfe/NfeDestinatario.php';
include 'nfe/NfeDetEspecificoArmamento.php';
include 'nfe/NfeDetEspecificoCombustivel.php';
include 'nfe/NfeDetEspecificoMedicamento.php';
include 'nfe/NfeDetEspecificoVeiculo.php';
include 'nfe/NfeDetalhe.php';
include 'nfe/NfeDetalheImpostoCofins.php';
include 'nfe/NfeDetalheImpostoCofinsSt.php';
include 'nfe/NfeDetalheImpostoIcms.php';
include 'nfe/NfeDetalheImpostoIcmsUfdest.php';
include 'nfe/NfeDetalheImpostoIi.php';
include 'nfe/NfeDetalheImpostoIpi.php';
include 'nfe/NfeDetalheImpostoIssqn.php';
include 'nfe/NfeDetalheImpostoPis.php';
include 'nfe/NfeDetalheImpostoPisSt.php';
include 'nfe/NfeDuplicata.php';
include 'nfe/NfeEmitente.php';
include 'nfe/NfeExportacao.php';
include 'nfe/NfeFatura.php';
include 'nfe/NfeImportacaoDetalhe.php';
include 'nfe/NfeInformacaoPagamento.php';
include 'nfe/NfeItemRastreado.php';
include 'nfe/NfeLocalEntrega.php';
include 'nfe/NfeLocalRetirada.php';
include 'nfe/NfeNfReferenciada.php';
include 'nfe/NfeNumero.php';
include 'nfe/NfeNumeroInutilizado.php';
include 'nfe/NfeProcessoReferenciado.php';
include 'nfe/NfeProdRuralReferenciada.php';
include 'nfe/NfeReferenciada.php';
include 'nfe/NfeResponsavelTecnico.php';
include 'nfe/NfeTransporte.php';
include 'nfe/NfeTransporteReboque.php';
include 'nfe/NfeTransporteVolume.php';
include 'nfe/NfeTransporteVolumeLacre.php';

// Comissões
include 'comissoes/ComissaoObjetivo.php';
include 'comissoes/ComissaoPerfil.php';

// Ordem de Serviço
include 'os/OsAbertura.php';
include 'os/OsAberturaEquipamento.php';
include 'os/OsEquipamento.php';
include 'os/OsEvolucao.php';
include 'os/OsProdutoServico.php';
include 'os/OsStatus.php';

// Sped
include 'sped/ViewSpedC190.php';
include 'sped/ViewSpedNfeDestinatario.php';
include 'sped/ViewSpedNfeDetalhe.php';
include 'sped/ViewSpedNfeEmitente.php';
include 'sped/ViewSpedNfeItem.php';

// Transientes
include 'transiente/Filtro.php';
include 'transiente/RetornoJsonErro.php';
include 'transiente/CalculoNFe.php';

// AFV
include 'afv/VendedorMeta.php';
include 'afv/VendedorRota.php';

// GED
include 'ged/GedDocumentoCabecalho.php';
include 'ged/GedDocumentoDetalhe.php';
include 'ged/GedTipoDocumento.php';
include 'ged/GedVersaoDocumento.php';

// Views
include 'viewsDB/ViewFinLancamentoPagar.php';
include 'viewsDB/ViewPessoaCliente.php';
include 'viewsDB/ViewPessoaColaborador.php';
include 'viewsDB/ViewPessoaFornecedor.php';
include 'viewsDB/ViewFinLancamentoReceber.php';
include 'viewsDB/ViewFinFluxoCaixa.php';
include 'viewsDB/ViewFinChequeNaoCompensado.php';
include 'viewsDB/ViewFinMovimentoCaixaBanco.php';
