<?php

///////////////////////////////
// LOGIN
///////////////////////////////
// Authentication Manager middleware
$auth = new LoginController();
$app->post('/login[/]', \LoginController::class . ":login");
$app->options('/login[/]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

///////////////////////////////
// ADMINISTRATIVO
///////////////////////////////

// empresa
$app->get('/empresa[/]', \EmpresaController::class . CONSULTAR_LISTA)->add($auth);
$app->get('/empresa/{id}', \EmpresaController::class . CONSULTAR_OBJETO);
$app->post('/empresa', \EmpresaController::class . INSERIR);
$app->put('/empresa/{id}', \EmpresaController::class . ALTERAR);
$app->delete('/empresa/{id}', \EmpresaController::class . EXCLUIR);
$app->options('/empresa[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

///////////////////////////////
// CADASTROS
///////////////////////////////

// banco
$app->get('/banco[/]', \BancoController::class . CONSULTAR_LISTA);
$app->get('/banco/{id}', \BancoController::class . CONSULTAR_OBJETO);
$app->post('/banco', \BancoController::class . INSERIR);
$app->put('/banco/{id}', \BancoController::class . ALTERAR);
$app->delete('/banco/{id}', \BancoController::class . EXCLUIR);
// Allow preflight requests
// you must add the OPTIONS method. Read about preflight.
$app->options('/banco[/]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);
$app->options('/banco/{id}', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// banco-agencia
$app->get('/banco-agencia[/]', \BancoAgenciaController::class . CONSULTAR_LISTA);
$app->get('/banco-agencia/{id}', \BancoAgenciaController::class . CONSULTAR_OBJETO);
$app->post('/banco-agencia', \BancoAgenciaController::class . INSERIR);
$app->put('/banco-agencia/{id}', \BancoAgenciaController::class . ALTERAR);
$app->delete('/banco-agencia/{id}', \BancoAgenciaController::class . EXCLUIR);
$app->options('/banco-agencia[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// pessoa
$app->get('/pessoa[/]', \PessoaController::class . CONSULTAR_LISTA);
$app->get('/pessoa/{id}', \PessoaController::class . CONSULTAR_OBJETO);
$app->post('/pessoa', \PessoaController::class . INSERIR);
$app->put('/pessoa/{id}', \PessoaController::class . ALTERAR);
$app->delete('/pessoa/{id}', \PessoaController::class . EXCLUIR);
$app->options('/pessoa[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// produto
$app->get('/produto[/]', \ProdutoController::class . CONSULTAR_LISTA);
$app->get('/produto/{id}', \ProdutoController::class . CONSULTAR_OBJETO);
$app->post('/produto', \ProdutoController::class . INSERIR);
$app->put('/produto/{id}', \ProdutoController::class . ALTERAR);
$app->delete('/produto/{id}', \ProdutoController::class . EXCLUIR);
$app->options('/produto[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// produto-marca
$app->get('/produto-marca[/]', \ProdutoMarcaController::class . CONSULTAR_LISTA);
$app->get('/produto-marca/{id}', \ProdutoMarcaController::class . CONSULTAR_OBJETO);
$app->post('/produto-marca', \ProdutoMarcaController::class . INSERIR);
$app->put('/produto-marca/{id}', \ProdutoMarcaController::class . ALTERAR);
$app->delete('/produto-marca/{id}', \ProdutoMarcaController::class . EXCLUIR);
$app->options('/produto-marca[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// produto-unidade
$app->get('/produto-unidade[/]', \ProdutoUnidadeController::class . CONSULTAR_LISTA);
$app->get('/produto-unidade/{id}', \ProdutoUnidadeController::class . CONSULTAR_OBJETO);
$app->post('/produto-unidade', \ProdutoUnidadeController::class . INSERIR);
$app->put('/produto-unidade/{id}', \ProdutoUnidadeController::class . ALTERAR);
$app->delete('/produto-unidade/{id}', \ProdutoUnidadeController::class . EXCLUIR);
$app->options('/produto-unidade[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// produto-grupo
$app->get('/produto-grupo[/]', \ProdutoGrupoController::class . CONSULTAR_LISTA);
$app->get('/produto-grupo/{id}', \ProdutoGrupoController::class . CONSULTAR_OBJETO);
$app->post('/produto-grupo', \ProdutoGrupoController::class . INSERIR);
$app->put('/produto-grupo/{id}', \ProdutoGrupoController::class . ALTERAR);
$app->delete('/produto-grupo/{id}', \ProdutoGrupoController::class . EXCLUIR);
$app->options('/produto-grupo[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// produto-subgrupo
$app->get('/produto-subgrupo[/]', \ProdutoSubgrupoController::class . CONSULTAR_LISTA);
$app->get('/produto-subgrupo/{id}', \ProdutoSubgrupoController::class . CONSULTAR_OBJETO);
$app->post('/produto-subgrupo', \ProdutoSubgrupoController::class . INSERIR);
$app->put('/produto-subgrupo/{id}', \ProdutoSubgrupoController::class . ALTERAR);
$app->delete('/produto-subgrupo/{id}', \ProdutoSubgrupoController::class . EXCLUIR);
$app->options('/produto-subgrupo[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// nivel-formacao
$app->get('/nivel-formacao[/]', \NivelFormacaoController::class . CONSULTAR_LISTA);
$app->get('/nivel-formacao/{id}', \NivelFormacaoController::class . CONSULTAR_OBJETO);
$app->post('/nivel-formacao', \NivelFormacaoController::class . INSERIR);
$app->put('/nivel-formacao/{id}', \NivelFormacaoController::class . ALTERAR);
$app->delete('/nivel-formacao/{id}', \NivelFormacaoController::class . EXCLUIR);
$app->options('/nivel-formacao[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// estado-civil
$app->get('/estado-civil[/]', \EstadoCivilController::class . CONSULTAR_LISTA);
$app->get('/estado-civil/{id}', \EstadoCivilController::class . CONSULTAR_OBJETO);
$app->post('/estado-civil', \EstadoCivilController::class . INSERIR);
$app->put('/estado-civil/{id}', \EstadoCivilController::class . ALTERAR);
$app->delete('/estado-civil/{id}', \EstadoCivilController::class . EXCLUIR);
$app->options('/estado-civil[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// banco-conta-caixa
$app->get('/banco-conta-caixa[/]', \BancoContaCaixaController::class . CONSULTAR_LISTA);
$app->get('/banco-conta-caixa/{id}', \BancoContaCaixaController::class . CONSULTAR_OBJETO);
$app->post('/banco-conta-caixa', \BancoContaCaixaController::class . INSERIR);
$app->put('/banco-conta-caixa/{id}', \BancoContaCaixaController::class . ALTERAR);
$app->delete('/banco-conta-caixa/{id}', \BancoContaCaixaController::class . EXCLUIR);
$app->options('/banco-conta-caixa[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// cargo
$app->get('/cargo[/]', \CargoController::class . CONSULTAR_LISTA);
$app->get('/cargo/{id}', \CargoController::class . CONSULTAR_OBJETO);
$app->post('/cargo', \CargoController::class . INSERIR);
$app->put('/cargo/{id}', \CargoController::class . ALTERAR);
$app->delete('/cargo/{id}', \CargoController::class . EXCLUIR);
$app->options('/cargo[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// cep
$app->get('/cep[/]', \CepController::class . CONSULTAR_LISTA);
$app->get('/cep/{id}', \CepController::class . CONSULTAR_OBJETO);
$app->post('/cep', \CepController::class . INSERIR);
$app->put('/cep/{id}', \CepController::class . ALTERAR);
$app->delete('/cep/{id}', \CepController::class . EXCLUIR);
$app->options('/cep[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// cfop
$app->get('/cfop[/]', \CfopController::class . CONSULTAR_LISTA);
$app->get('/cfop/{id}', \CfopController::class . CONSULTAR_OBJETO);
$app->post('/cfop', \CfopController::class . INSERIR);
$app->put('/cfop/{id}', \CfopController::class . ALTERAR);
$app->delete('/cfop/{id}', \CfopController::class . EXCLUIR);
$app->options('/cfop[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// cliente
$app->get('/cliente[/]', \ClienteController::class . CONSULTAR_LISTA);
$app->get('/cliente/{id}', \ClienteController::class . CONSULTAR_OBJETO);
$app->post('/cliente', \ClienteController::class . INSERIR);
$app->put('/cliente/{id}', \ClienteController::class . ALTERAR);
$app->delete('/cliente/{id}', \ClienteController::class . EXCLUIR);
$app->options('/cliente[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// cnae
$app->get('/cnae[/]', \CnaeController::class . CONSULTAR_LISTA);
$app->get('/cnae/{id}', \CnaeController::class . CONSULTAR_OBJETO);
$app->post('/cnae', \CnaeController::class . INSERIR);
$app->put('/cnae/{id}', \CnaeController::class . ALTERAR);
$app->delete('/cnae/{id}', \CnaeController::class . EXCLUIR);
$app->options('/cnae[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// colaborador
$app->get('/colaborador[/]', \ColaboradorController::class . CONSULTAR_LISTA);
$app->get('/colaborador/{id}', \ColaboradorController::class . CONSULTAR_OBJETO);
$app->post('/colaborador', \ColaboradorController::class . INSERIR);
$app->put('/colaborador/{id}', \ColaboradorController::class . ALTERAR);
$app->delete('/colaborador/{id}', \ColaboradorController::class . EXCLUIR);
$app->options('/colaborador[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// contador
$app->get('/contador[/]', \ContadorController::class . CONSULTAR_LISTA);
$app->get('/contador/{id}', \ContadorController::class . CONSULTAR_OBJETO);
$app->post('/contador', \ContadorController::class . INSERIR);
$app->put('/contador/{id}', \ContadorController::class . ALTERAR);
$app->delete('/contador/{id}', \ContadorController::class . EXCLUIR);
$app->options('/contador[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// csosn
$app->get('/csosn[/]', \CsosnController::class . CONSULTAR_LISTA);
$app->get('/csosn/{id}', \CsosnController::class . CONSULTAR_OBJETO);
$app->post('/csosn', \CsosnController::class . INSERIR);
$app->put('/csosn/{id}', \CsosnController::class . ALTERAR);
$app->delete('/csosn/{id}', \CsosnController::class . EXCLUIR);
$app->options('/csosn[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// cst-cofins
$app->get('/cst-cofins[/]', \CstCofinsController::class . CONSULTAR_LISTA);
$app->get('/cst-cofins/{id}', \CstCofinsController::class . CONSULTAR_OBJETO);
$app->post('/cst-cofins', \CstCofinsController::class . INSERIR);
$app->put('/cst-cofins/{id}', \CstCofinsController::class . ALTERAR);
$app->delete('/cst-cofins/{id}', \CstCofinsController::class . EXCLUIR);
$app->options('/cst-cofins[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// cst-icms
$app->get('/cst-icms[/]', \CstIcmsController::class . CONSULTAR_LISTA);
$app->get('/cst-icms/{id}', \CstIcmsController::class . CONSULTAR_OBJETO);
$app->post('/cst-icms', \CstIcmsController::class . INSERIR);
$app->put('/cst-icms/{id}', \CstIcmsController::class . ALTERAR);
$app->delete('/cst-icms/{id}', \CstIcmsController::class . EXCLUIR);
$app->options('/cst-icms[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// cst-ipi
$app->get('/cst-ipi[/]', \CstIpiController::class . CONSULTAR_LISTA);
$app->get('/cst-ipi/{id}', \CstIpiController::class . CONSULTAR_OBJETO);
$app->post('/cst-ipi', \CstIpiController::class . INSERIR);
$app->put('/cst-ipi/{id}', \CstIpiController::class . ALTERAR);
$app->delete('/cst-ipi/{id}', \CstIpiController::class . EXCLUIR);
$app->options('/cst-ipi[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// cst-pis
$app->get('/cst-pis[/]', \CstPisController::class . CONSULTAR_LISTA);
$app->get('/cst-pis/{id}', \CstPisController::class . CONSULTAR_OBJETO);
$app->post('/cst-pis', \CstPisController::class . INSERIR);
$app->put('/cst-pis/{id}', \CstPisController::class . ALTERAR);
$app->delete('/cst-pis/{id}', \CstPisController::class . EXCLUIR);
$app->options('/cst-pis[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fornecedor
$app->get('/fornecedor[/]', \FornecedorController::class . CONSULTAR_LISTA);
$app->get('/fornecedor/{id}', \FornecedorController::class . CONSULTAR_OBJETO);
$app->post('/fornecedor', \FornecedorController::class . INSERIR);
$app->put('/fornecedor/{id}', \FornecedorController::class . ALTERAR);
$app->delete('/fornecedor/{id}', \FornecedorController::class . EXCLUIR);
$app->options('/fornecedor[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// municipio
$app->get('/municipio[/]', \MunicipioController::class . CONSULTAR_LISTA);
$app->get('/municipio/{id}', \MunicipioController::class . CONSULTAR_OBJETO);
$app->post('/municipio', \MunicipioController::class . INSERIR);
$app->put('/municipio/{id}', \MunicipioController::class . ALTERAR);
$app->delete('/municipio/{id}', \MunicipioController::class . EXCLUIR);
$app->options('/municipio[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// ncm
$app->get('/ncm[/]', \NcmController::class . CONSULTAR_LISTA);
$app->get('/ncm/{id}', \NcmController::class . CONSULTAR_OBJETO);
$app->post('/ncm', \NcmController::class . INSERIR);
$app->put('/ncm/{id}', \NcmController::class . ALTERAR);
$app->delete('/ncm/{id}', \NcmController::class . EXCLUIR);
$app->options('/ncm[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// papel
$app->get('/papel[/]', \PapelController::class . CONSULTAR_LISTA);
$app->get('/papel/{id}', \PapelController::class . CONSULTAR_OBJETO);
$app->post('/papel', \PapelController::class . INSERIR);
$app->put('/papel/{id}', \PapelController::class . ALTERAR);
$app->delete('/papel/{id}', \PapelController::class . EXCLUIR);
$app->options('/papel[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// setor
$app->get('/setor[/]', \SetorController::class . CONSULTAR_LISTA);
$app->get('/setor/{id}', \SetorController::class . CONSULTAR_OBJETO);
$app->post('/setor', \SetorController::class . INSERIR);
$app->put('/setor/{id}', \SetorController::class . ALTERAR);
$app->delete('/setor/{id}', \SetorController::class . EXCLUIR);
$app->options('/setor[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// transportadora
$app->get('/transportadora[/]', \TransportadoraController::class . CONSULTAR_LISTA);
$app->get('/transportadora/{id}', \TransportadoraController::class . CONSULTAR_OBJETO);
$app->post('/transportadora', \TransportadoraController::class . INSERIR);
$app->put('/transportadora/{id}', \TransportadoraController::class . ALTERAR);
$app->delete('/transportadora/{id}', \TransportadoraController::class . EXCLUIR);
$app->options('/transportadora[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// uf
$app->get('/uf[/]', \UfController::class . CONSULTAR_LISTA);
$app->get('/uf/{id}', \UfController::class . CONSULTAR_OBJETO);
$app->post('/uf', \UfController::class . INSERIR);
$app->put('/uf/{id}', \UfController::class . ALTERAR);
$app->delete('/uf/{id}', \UfController::class . EXCLUIR);
$app->options('/uf[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// usuario
$app->get('/usuario[/]', \UsuarioController::class . CONSULTAR_LISTA);
$app->get('/usuario/{id}', \UsuarioController::class . CONSULTAR_OBJETO);
$app->post('/usuario', \UsuarioController::class . INSERIR);
$app->put('/usuario/{id}', \UsuarioController::class . ALTERAR);
$app->delete('/usuario/{id}', \UsuarioController::class . EXCLUIR);
$app->options('/usuario[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// vendedor
$app->get('/vendedor[/]', \VendedorController::class . CONSULTAR_LISTA);
$app->get('/vendedor/{id}', \VendedorController::class . CONSULTAR_OBJETO);
$app->post('/vendedor', \VendedorController::class . INSERIR);
$app->put('/vendedor/{id}', \VendedorController::class . ALTERAR);
$app->delete('/vendedor/{id}', \VendedorController::class . EXCLUIR);
$app->options('/vendedor[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

///////////////////////////////
// FINANCEIRO
///////////////////////////////

// fin-cheque-emitido
$app->get('/fin-cheque-emitido[/]', \FinChequeEmitidoController::class . CONSULTAR_LISTA);
$app->get('/fin-cheque-emitido/{id}', \FinChequeEmitidoController::class . CONSULTAR_OBJETO);
$app->post('/fin-cheque-emitido', \FinChequeEmitidoController::class . INSERIR);
$app->put('/fin-cheque-emitido/{id}', \FinChequeEmitidoController::class . ALTERAR);
$app->delete('/fin-cheque-emitido/{id}', \FinChequeEmitidoController::class . EXCLUIR);
$app->options('/fin-cheque-emitido[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fin-cheque-recebido
$app->get('/fin-cheque-recebido[/]', \FinChequeRecebidoController::class . CONSULTAR_LISTA);
$app->get('/fin-cheque-recebido/{id}', \FinChequeRecebidoController::class . CONSULTAR_OBJETO);
$app->post('/fin-cheque-recebido', \FinChequeRecebidoController::class . INSERIR);
$app->put('/fin-cheque-recebido/{id}', \FinChequeRecebidoController::class . ALTERAR);
$app->delete('/fin-cheque-recebido/{id}', \FinChequeRecebidoController::class . EXCLUIR);
$app->options('/fin-cheque-recebido[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fin-configuracao-boleto
$app->get('/fin-configuracao-boleto[/]', \FinConfiguracaoBoletoController::class . CONSULTAR_LISTA);
$app->get('/fin-configuracao-boleto/{id}', \FinConfiguracaoBoletoController::class . CONSULTAR_OBJETO);
$app->post('/fin-configuracao-boleto', \FinConfiguracaoBoletoController::class . INSERIR);
$app->put('/fin-configuracao-boleto/{id}', \FinConfiguracaoBoletoController::class . ALTERAR);
$app->delete('/fin-configuracao-boleto/{id}', \FinConfiguracaoBoletoController::class . EXCLUIR);
$app->options('/fin-configuracao-boleto[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fin-documento-origem
$app->get('/fin-documento-origem[/]', \FinDocumentoOrigemController::class . CONSULTAR_LISTA);
$app->get('/fin-documento-origem/{id}', \FinDocumentoOrigemController::class . CONSULTAR_OBJETO);
$app->post('/fin-documento-origem', \FinDocumentoOrigemController::class . INSERIR);
$app->put('/fin-documento-origem/{id}', \FinDocumentoOrigemController::class . ALTERAR);
$app->delete('/fin-documento-origem/{id}', \FinDocumentoOrigemController::class . EXCLUIR);
$app->options('/fin-documento-origem[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fin-extrato-conta-banco
$app->get('/fin-extrato-conta-banco[/]', \FinExtratoContaBancoController::class . CONSULTAR_LISTA);
$app->get('/fin-extrato-conta-banco/{id}', \FinExtratoContaBancoController::class . CONSULTAR_OBJETO);
$app->post('/fin-extrato-conta-banco', \FinExtratoContaBancoController::class . INSERIR);
$app->put('/fin-extrato-conta-banco/{id}', \FinExtratoContaBancoController::class . ALTERAR);
$app->delete('/fin-extrato-conta-banco/{id}', \FinExtratoContaBancoController::class . EXCLUIR);
$app->options('/fin-extrato-conta-banco[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fin-fechamento-caixa-banco
$app->get('/fin-fechamento-caixa-banco[/]', \FinFechamentoCaixaBancoController::class . CONSULTAR_LISTA);
$app->get('/fin-fechamento-caixa-banco/{id}', \FinFechamentoCaixaBancoController::class . CONSULTAR_OBJETO);
$app->post('/fin-fechamento-caixa-banco', \FinFechamentoCaixaBancoController::class . INSERIR);
$app->put('/fin-fechamento-caixa-banco/{id}', \FinFechamentoCaixaBancoController::class . ALTERAR);
$app->delete('/fin-fechamento-caixa-banco/{id}', \FinFechamentoCaixaBancoController::class . EXCLUIR);
$app->options('/fin-fechamento-caixa-banco[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fin-lancamento-pagar
$app->get('/fin-lancamento-pagar[/]', \FinLancamentoPagarController::class . CONSULTAR_LISTA);
$app->get('/fin-lancamento-pagar/{id}', \FinLancamentoPagarController::class . CONSULTAR_OBJETO);
$app->post('/fin-lancamento-pagar', \FinLancamentoPagarController::class . INSERIR);
$app->put('/fin-lancamento-pagar/{id}', \FinLancamentoPagarController::class . ALTERAR);
$app->delete('/fin-lancamento-pagar/{id}', \FinLancamentoPagarController::class . EXCLUIR);
$app->options('/fin-lancamento-pagar[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fin-lancamento-receber
$app->get('/fin-lancamento-receber[/]', \FinLancamentoReceberController::class . CONSULTAR_LISTA);
$app->get('/fin-lancamento-receber/{id}', \FinLancamentoReceberController::class . CONSULTAR_OBJETO);
$app->post('/fin-lancamento-receber', \FinLancamentoReceberController::class . INSERIR);
$app->put('/fin-lancamento-receber/{id}', \FinLancamentoReceberController::class . ALTERAR);
$app->delete('/fin-lancamento-receber/{id}', \FinLancamentoReceberController::class . EXCLUIR);
$app->options('/fin-lancamento-receber[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);
$app->post('/fin-lancamento-receber/gera-boleto[/]', \FinLancamentoReceberController::class . ':gerarBoleto');

// fin-natureza-financeira
$app->get('/fin-natureza-financeira[/]', \FinNaturezaFinanceiraController::class . CONSULTAR_LISTA);
$app->get('/fin-natureza-financeira/{id}', \FinNaturezaFinanceiraController::class . CONSULTAR_OBJETO);
$app->post('/fin-natureza-financeira', \FinNaturezaFinanceiraController::class . INSERIR);
$app->put('/fin-natureza-financeira/{id}', \FinNaturezaFinanceiraController::class . ALTERAR);
$app->delete('/fin-natureza-financeira/{id}', \FinNaturezaFinanceiraController::class . EXCLUIR);
$app->options('/fin-natureza-financeira[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fin-status-parcela
$app->get('/fin-status-parcela[/]', \FinStatusParcelaController::class . CONSULTAR_LISTA);
$app->get('/fin-status-parcela/{id}', \FinStatusParcelaController::class . CONSULTAR_OBJETO);
$app->post('/fin-status-parcela', \FinStatusParcelaController::class . INSERIR);
$app->put('/fin-status-parcela/{id}', \FinStatusParcelaController::class . ALTERAR);
$app->delete('/fin-status-parcela/{id}', \FinStatusParcelaController::class . EXCLUIR);
$app->options('/fin-status-parcela[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fin-tipo-pagamento
$app->get('/fin-tipo-pagamento[/]', \FinTipoPagamentoController::class . CONSULTAR_LISTA);
$app->get('/fin-tipo-pagamento/{id}', \FinTipoPagamentoController::class . CONSULTAR_OBJETO);
$app->post('/fin-tipo-pagamento', \FinTipoPagamentoController::class . INSERIR);
$app->put('/fin-tipo-pagamento/{id}', \FinTipoPagamentoController::class . ALTERAR);
$app->delete('/fin-tipo-pagamento/{id}', \FinTipoPagamentoController::class . EXCLUIR);
$app->options('/fin-tipo-pagamento[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fin-tipo-recebimento
$app->get('/fin-tipo-recebimento[/]', \FinTipoRecebimentoController::class . CONSULTAR_LISTA);
$app->get('/fin-tipo-recebimento/{id}', \FinTipoRecebimentoController::class . CONSULTAR_OBJETO);
$app->post('/fin-tipo-recebimento', \FinTipoRecebimentoController::class . INSERIR);
$app->put('/fin-tipo-recebimento/{id}', \FinTipoRecebimentoController::class . ALTERAR);
$app->delete('/fin-tipo-recebimento/{id}', \FinTipoRecebimentoController::class . EXCLUIR);
$app->options('/fin-tipo-recebimento[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// talonario-cheque
$app->get('/talonario-cheque[/]', \TalonarioChequeController::class . CONSULTAR_LISTA);
$app->get('/talonario-cheque/{id}', \TalonarioChequeController::class . CONSULTAR_OBJETO);
$app->post('/talonario-cheque', \TalonarioChequeController::class . INSERIR);
$app->put('/talonario-cheque/{id}', \TalonarioChequeController::class . ALTERAR);
$app->delete('/talonario-cheque/{id}', \TalonarioChequeController::class . EXCLUIR);
$app->options('/talonario-cheque[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fin-parcela-pagar
$app->get('/fin-parcela-pagar[/]', \FinParcelaPagarController::class . CONSULTAR_LISTA);
$app->get('/fin-parcela-pagar/{id}', \FinParcelaPagarController::class . CONSULTAR_OBJETO);
$app->post('/fin-parcela-pagar', \FinParcelaPagarController::class . INSERIR);
$app->put('/fin-parcela-pagar/{id}', \FinParcelaPagarController::class . ALTERAR);
$app->delete('/fin-parcela-pagar/{id}', \FinParcelaPagarController::class . EXCLUIR);
$app->options('/fin-parcela-pagar[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// fin-parcela-receber
$app->get('/fin-parcela-receber[/]', \FinParcelaReceberController::class . CONSULTAR_LISTA);
$app->get('/fin-parcela-receber/{id}', \FinParcelaReceberController::class . CONSULTAR_OBJETO);
$app->post('/fin-parcela-receber', \FinParcelaReceberController::class . INSERIR);
$app->put('/fin-parcela-receber/{id}', \FinParcelaReceberController::class . ALTERAR);
$app->delete('/fin-parcela-receber/{id}', \FinParcelaReceberController::class . EXCLUIR);
$app->options('/fin-parcela-receber[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

///////////////////////////////
// ESTOQUE
///////////////////////////////

// estoque-reajuste-cabecalho
$app->get('/estoque-reajuste-cabecalho[/]', \EstoqueReajusteCabecalhoController::class . CONSULTAR_LISTA);
$app->get('/estoque-reajuste-cabecalho/{id}', \EstoqueReajusteCabecalhoController::class . CONSULTAR_OBJETO);
$app->post('/estoque-reajuste-cabecalho', \EstoqueReajusteCabecalhoController::class . INSERIR);
$app->put('/estoque-reajuste-cabecalho/{id}', \EstoqueReajusteCabecalhoController::class . ALTERAR);
$app->delete('/estoque-reajuste-cabecalho/{id}', \EstoqueReajusteCabecalhoController::class . EXCLUIR);
$app->options('/estoque-reajuste-cabecalho[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);
$app->post('/estoque-reajuste-cabecalho/forma-preco[/]', \EstoqueReajusteCabecalhoController::class . ':formarPreco');

// requisicao-interna-cabecalho
$app->get('/requisicao-interna-cabecalho[/]', \RequisicaoInternaCabecalhoController::class . CONSULTAR_LISTA);
$app->get('/requisicao-interna-cabecalho/{id}', \RequisicaoInternaCabecalhoController::class . CONSULTAR_OBJETO);
$app->post('/requisicao-interna-cabecalho', \RequisicaoInternaCabecalhoController::class . INSERIR);
$app->put('/requisicao-interna-cabecalho/{id}', \RequisicaoInternaCabecalhoController::class . ALTERAR);
$app->delete('/requisicao-interna-cabecalho/{id}', \RequisicaoInternaCabecalhoController::class . EXCLUIR);
$app->options('/requisicao-interna-cabecalho[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

///////////////////////////////
// TRIBUTAÇÃO
///////////////////////////////

// tribut-configura-of-gt
$app->get('/tribut-configura-of-gt[/]', \TributConfiguraOfGtController::class . CONSULTAR_LISTA);
$app->get('/tribut-configura-of-gt/consulta-tributacao[/]', \TributConfiguraOfGtController::class . ':consultarTributacao');
$app->get('/tribut-configura-of-gt/{id}', \TributConfiguraOfGtController::class . CONSULTAR_OBJETO);
$app->post('/tribut-configura-of-gt', \TributConfiguraOfGtController::class . INSERIR);
$app->put('/tribut-configura-of-gt/{id}', \TributConfiguraOfGtController::class . ALTERAR);
$app->delete('/tribut-configura-of-gt/{id}', \TributConfiguraOfGtController::class . EXCLUIR);
$app->options('/tribut-configura-of-gt[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);


// tribut-grupo-tributario
$app->get('/tribut-grupo-tributario[/]', \TributGrupoTributarioController::class . CONSULTAR_LISTA);
$app->get('/tribut-grupo-tributario/{id}', \TributGrupoTributarioController::class . CONSULTAR_OBJETO);
$app->post('/tribut-grupo-tributario', \TributGrupoTributarioController::class . INSERIR);
$app->put('/tribut-grupo-tributario/{id}', \TributGrupoTributarioController::class . ALTERAR);
$app->delete('/tribut-grupo-tributario/{id}', \TributGrupoTributarioController::class . EXCLUIR);
$app->options('/tribut-grupo-tributario[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// tribut-icms-custom-cab
$app->get('/tribut-icms-custom-cab[/]', \TributIcmsCustomCabController::class . CONSULTAR_LISTA);
$app->get('/tribut-icms-custom-cab/{id}', \TributIcmsCustomCabController::class . CONSULTAR_OBJETO);
$app->post('/tribut-icms-custom-cab', \TributIcmsCustomCabController::class . INSERIR);
$app->put('/tribut-icms-custom-cab/{id}', \TributIcmsCustomCabController::class . ALTERAR);
$app->delete('/tribut-icms-custom-cab/{id}', \TributIcmsCustomCabController::class . EXCLUIR);
$app->options('/tribut-icms-custom-cab[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// tribut-iss
$app->get('/tribut-iss[/]', \TributIssController::class . CONSULTAR_LISTA);
$app->get('/tribut-iss/{id}', \TributIssController::class . CONSULTAR_OBJETO);
$app->post('/tribut-iss', \TributIssController::class . INSERIR);
$app->put('/tribut-iss/{id}', \TributIssController::class . ALTERAR);
$app->delete('/tribut-iss/{id}', \TributIssController::class . EXCLUIR);
$app->options('/tribut-iss[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// tribut-operacao-fiscal
$app->get('/tribut-operacao-fiscal[/]', \TributOperacaoFiscalController::class . CONSULTAR_LISTA);
$app->get('/tribut-operacao-fiscal/{id}', \TributOperacaoFiscalController::class . CONSULTAR_OBJETO);
$app->post('/tribut-operacao-fiscal', \TributOperacaoFiscalController::class . INSERIR);
$app->put('/tribut-operacao-fiscal/{id}', \TributOperacaoFiscalController::class . ALTERAR);
$app->delete('/tribut-operacao-fiscal/{id}', \TributOperacaoFiscalController::class . EXCLUIR);
$app->options('/tribut-operacao-fiscal[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

///////////////////////////////
// VENDAS
///////////////////////////////

// nota-fiscal-modelo
$app->get('/nota-fiscal-modelo[/]', \NotaFiscalModeloController::class . CONSULTAR_LISTA);
$app->get('/nota-fiscal-modelo/{id}', \NotaFiscalModeloController::class . CONSULTAR_OBJETO);
$app->post('/nota-fiscal-modelo', \NotaFiscalModeloController::class . INSERIR);
$app->put('/nota-fiscal-modelo/{id}', \NotaFiscalModeloController::class . ALTERAR);
$app->delete('/nota-fiscal-modelo/{id}', \NotaFiscalModeloController::class . EXCLUIR);
$app->options('/nota-fiscal-modelo[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// nota-fiscal-tipo
$app->get('/nota-fiscal-tipo[/]', \NotaFiscalTipoController::class . CONSULTAR_LISTA);
$app->get('/nota-fiscal-tipo/{id}', \NotaFiscalTipoController::class . CONSULTAR_OBJETO);
$app->post('/nota-fiscal-tipo', \NotaFiscalTipoController::class . INSERIR);
$app->put('/nota-fiscal-tipo/{id}', \NotaFiscalTipoController::class . ALTERAR);
$app->delete('/nota-fiscal-tipo/{id}', \NotaFiscalTipoController::class . EXCLUIR);
$app->options('/nota-fiscal-tipo[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// venda-cabecalho
$app->get('/venda-cabecalho[/]', \VendaCabecalhoController::class . CONSULTAR_LISTA);
$app->get('/venda-cabecalho/{id}', \VendaCabecalhoController::class . CONSULTAR_OBJETO);
$app->post('/venda-cabecalho', \VendaCabecalhoController::class . INSERIR);
$app->put('/venda-cabecalho/{id}', \VendaCabecalhoController::class . ALTERAR);
$app->delete('/venda-cabecalho/{id}', \VendaCabecalhoController::class . EXCLUIR);
$app->options('/venda-cabecalho[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// venda-condicoes-pagamento
$app->get('/venda-condicoes-pagamento[/]', \VendaCondicoesPagamentoController::class . CONSULTAR_LISTA);
$app->get('/venda-condicoes-pagamento/{id}', \VendaCondicoesPagamentoController::class . CONSULTAR_OBJETO);
$app->post('/venda-condicoes-pagamento', \VendaCondicoesPagamentoController::class . INSERIR);
$app->put('/venda-condicoes-pagamento/{id}', \VendaCondicoesPagamentoController::class . ALTERAR);
$app->delete('/venda-condicoes-pagamento/{id}', \VendaCondicoesPagamentoController::class . EXCLUIR);
$app->options('/venda-condicoes-pagamento[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// venda-frete
$app->get('/venda-frete[/]', \VendaFreteController::class . CONSULTAR_LISTA);
$app->get('/venda-frete/{id}', \VendaFreteController::class . CONSULTAR_OBJETO);
$app->post('/venda-frete', \VendaFreteController::class . INSERIR);
$app->put('/venda-frete/{id}', \VendaFreteController::class . ALTERAR);
$app->delete('/venda-frete/{id}', \VendaFreteController::class . EXCLUIR);
$app->options('/venda-frete[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// venda-orcamento-cabecalho
$app->get('/venda-orcamento-cabecalho[/]', \VendaOrcamentoCabecalhoController::class . CONSULTAR_LISTA);
$app->get('/venda-orcamento-cabecalho/{id}', \VendaOrcamentoCabecalhoController::class . CONSULTAR_OBJETO);
$app->post('/venda-orcamento-cabecalho', \VendaOrcamentoCabecalhoController::class . INSERIR);
$app->put('/venda-orcamento-cabecalho/{id}', \VendaOrcamentoCabecalhoController::class . ALTERAR);
$app->delete('/venda-orcamento-cabecalho/{id}', \VendaOrcamentoCabecalhoController::class . EXCLUIR);
$app->options('/venda-orcamento-cabecalho[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

///////////////////////////////
// COMPRAS
///////////////////////////////

// compra-cotacao
$app->get('/compra-cotacao[/]', \CompraCotacaoController::class . CONSULTAR_LISTA);
$app->get('/compra-cotacao/{id}', \CompraCotacaoController::class . CONSULTAR_OBJETO);
$app->post('/compra-cotacao', \CompraCotacaoController::class . INSERIR);
$app->put('/compra-cotacao/{id}', \CompraCotacaoController::class . ALTERAR);
$app->delete('/compra-cotacao/{id}', \CompraCotacaoController::class . EXCLUIR);
$app->options('/compra-cotacao[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// compra-pedido
$app->get('/compra-pedido[/]', \CompraPedidoController::class . CONSULTAR_LISTA);
$app->get('/compra-pedido/{id}', \CompraPedidoController::class . CONSULTAR_OBJETO);
$app->post('/compra-pedido', \CompraPedidoController::class . INSERIR);
$app->put('/compra-pedido/{id}', \CompraPedidoController::class . ALTERAR);
$app->delete('/compra-pedido/{id}', \CompraPedidoController::class . EXCLUIR);
$app->options('/compra-pedido[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// compra-requisicao
$app->get('/compra-requisicao[/]', \CompraRequisicaoController::class . CONSULTAR_LISTA);
$app->get('/compra-requisicao/{id}', \CompraRequisicaoController::class . CONSULTAR_OBJETO);
$app->post('/compra-requisicao', \CompraRequisicaoController::class . INSERIR);
$app->put('/compra-requisicao/{id}', \CompraRequisicaoController::class . ALTERAR);
$app->delete('/compra-requisicao/{id}', \CompraRequisicaoController::class . EXCLUIR);
$app->options('/compra-requisicao[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// compra-tipo-pedido
$app->get('/compra-tipo-pedido[/]', \CompraTipoPedidoController::class . CONSULTAR_LISTA);
$app->get('/compra-tipo-pedido/{id}', \CompraTipoPedidoController::class . CONSULTAR_OBJETO);
$app->post('/compra-tipo-pedido', \CompraTipoPedidoController::class . INSERIR);
$app->put('/compra-tipo-pedido/{id}', \CompraTipoPedidoController::class . ALTERAR);
$app->delete('/compra-tipo-pedido/{id}', \CompraTipoPedidoController::class . EXCLUIR);
$app->options('/compra-tipo-pedido[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// compra-tipo-requisicao
$app->get('/compra-tipo-requisicao[/]', \CompraTipoRequisicaoController::class . CONSULTAR_LISTA);
$app->get('/compra-tipo-requisicao/{id}', \CompraTipoRequisicaoController::class . CONSULTAR_OBJETO);
$app->post('/compra-tipo-requisicao', \CompraTipoRequisicaoController::class . INSERIR);
$app->put('/compra-tipo-requisicao/{id}', \CompraTipoRequisicaoController::class . ALTERAR);
$app->delete('/compra-tipo-requisicao/{id}', \CompraTipoRequisicaoController::class . EXCLUIR);
$app->options('/compra-tipo-requisicao[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

///////////////////////////////
// NF-e
///////////////////////////////

// nfe-cabecalho
$app->get('/nfe-cabecalho[/]', \NfeCabecalhoController::class . CONSULTAR_LISTA);
$app->get('/nfe-cabecalho/{id}', \NfeCabecalhoController::class . CONSULTAR_OBJETO);
$app->post('/nfe-cabecalho', \NfeCabecalhoController::class . INSERIR);
$app->put('/nfe-cabecalho/{id}', \NfeCabecalhoController::class . ALTERAR);
$app->delete('/nfe-cabecalho/{id}', \NfeCabecalhoController::class . EXCLUIR);
$app->options('/nfe-cabecalho[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);
$app->post('/nfe-cabecalho/calcula-totais[/]', \NfeCabecalhoController::class . ':calcularTotais');
$app->post('/nfe-cabecalho/transmite-nfe[/]', \NfeCabecalhoController::class . ':transmitirNfe');
$app->get('/nfe-cabecalho/gera-pdf-nfe/', \NfeCabecalhoController::class . ':gerarPdfNfe');

///////////////////////////////
// SPED
///////////////////////////////

// Sped Fiscal
$app->get('/sped-fiscal/{filter}', \SpedFiscalController::class . ':gerarSpedFiscal');
$app->get('/sped-contabil/{filter}', \SpedContabilController::class . ':gerarSpedContabil');

///////////////////////////////
// COMISSÕES
///////////////////////////////

// comissao-objetivo
$app->get('/comissao-objetivo[/]', \ComissaoObjetivoController::class . CONSULTAR_LISTA);
$app->get('/comissao-objetivo/{id}', \ComissaoObjetivoController::class . CONSULTAR_OBJETO);
$app->post('/comissao-objetivo', \ComissaoObjetivoController::class . INSERIR);
$app->put('/comissao-objetivo/{id}', \ComissaoObjetivoController::class . ALTERAR);
$app->delete('/comissao-objetivo/{id}', \ComissaoObjetivoController::class . EXCLUIR);
$app->options('/comissao-objetivo[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// comissao-perfil
$app->get('/comissao-perfil[/]', \ComissaoPerfilController::class . CONSULTAR_LISTA);
$app->get('/comissao-perfil/{id}', \ComissaoPerfilController::class . CONSULTAR_OBJETO);
$app->post('/comissao-perfil', \ComissaoPerfilController::class . INSERIR);
$app->put('/comissao-perfil/{id}', \ComissaoPerfilController::class . ALTERAR);
$app->delete('/comissao-perfil/{id}', \ComissaoPerfilController::class . EXCLUIR);
$app->options('/comissao-perfil[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

///////////////////////////////
// ORDEM DE SERVIÇO
///////////////////////////////

// os-abertura
$app->get('/os-abertura[/]', \OsAberturaController::class . CONSULTAR_LISTA);
$app->get('/os-abertura/{id}', \OsAberturaController::class . CONSULTAR_OBJETO);
$app->post('/os-abertura', \OsAberturaController::class . INSERIR);
$app->put('/os-abertura/{id}', \OsAberturaController::class . ALTERAR);
$app->delete('/os-abertura/{id}', \OsAberturaController::class . EXCLUIR);
$app->options('/os-abertura[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// os-equipamento
$app->get('/os-equipamento[/]', \OsEquipamentoController::class . CONSULTAR_LISTA);
$app->get('/os-equipamento/{id}', \OsEquipamentoController::class . CONSULTAR_OBJETO);
$app->post('/os-equipamento', \OsEquipamentoController::class . INSERIR);
$app->put('/os-equipamento/{id}', \OsEquipamentoController::class . ALTERAR);
$app->delete('/os-equipamento/{id}', \OsEquipamentoController::class . EXCLUIR);
$app->options('/os-equipamento[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// os-status
$app->get('/os-status[/]', \OsStatusController::class . CONSULTAR_LISTA);
$app->get('/os-status/{id}', \OsStatusController::class . CONSULTAR_OBJETO);
$app->post('/os-status', \OsStatusController::class . INSERIR);
$app->put('/os-status/{id}', \OsStatusController::class . ALTERAR);
$app->delete('/os-status/{id}', \OsStatusController::class . EXCLUIR);
$app->options('/os-status[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);


///////////////////////////////
// AFV
///////////////////////////////

// tabela-preco
$app->get('/tabela-preco[/]', \TabelaPrecoController::class . CONSULTAR_LISTA);
$app->get('/tabela-preco/{id}', \TabelaPrecoController::class . CONSULTAR_OBJETO);
$app->post('/tabela-preco', \TabelaPrecoController::class . INSERIR);
$app->put('/tabela-preco/{id}', \TabelaPrecoController::class . ALTERAR);
$app->delete('/tabela-preco/{id}', \TabelaPrecoController::class . EXCLUIR);
$app->options('/tabela-preco[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// vendedor-meta
$app->get('/vendedor-meta[/]', \VendedorMetaController::class . CONSULTAR_LISTA);
$app->get('/vendedor-meta/{id}', \VendedorMetaController::class . CONSULTAR_OBJETO);
$app->post('/vendedor-meta', \VendedorMetaController::class . INSERIR);
$app->put('/vendedor-meta/{id}', \VendedorMetaController::class . ALTERAR);
$app->delete('/vendedor-meta/{id}', \VendedorMetaController::class . EXCLUIR);
$app->options('/vendedor-meta[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// vendedor-rota
$app->get('/vendedor-rota[/]', \VendedorRotaController::class . CONSULTAR_LISTA);
$app->get('/vendedor-rota/{id}', \VendedorRotaController::class . CONSULTAR_OBJETO);
$app->post('/vendedor-rota', \VendedorRotaController::class . INSERIR);
$app->put('/vendedor-rota/{id}', \VendedorRotaController::class . ALTERAR);
$app->delete('/vendedor-rota/{id}', \VendedorRotaController::class . EXCLUIR);
$app->options('/vendedor-rota[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);


///////////////////////////////
// GED
///////////////////////////////

// ged-documento-cabecalho
$app->get('/ged-documento-cabecalho[/]', \GedDocumentoCabecalhoController::class . CONSULTAR_LISTA);
$app->get('/ged-documento-cabecalho/{id}', \GedDocumentoCabecalhoController::class . CONSULTAR_OBJETO);
$app->post('/ged-documento-cabecalho', \GedDocumentoCabecalhoController::class . INSERIR);
$app->put('/ged-documento-cabecalho/{id}', \GedDocumentoCabecalhoController::class . ALTERAR);
$app->delete('/ged-documento-cabecalho/{id}', \GedDocumentoCabecalhoController::class . EXCLUIR);
$app->options('/ged-documento-cabecalho[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);
$app->post('/ged-documento-cabecalho/atualiza-detalhe/', \GedDocumentoCabecalhoController::class . ':atualizarDetalhe');

// ged-tipo-documento
$app->get('/ged-tipo-documento[/]', \GedTipoDocumentoController::class . CONSULTAR_LISTA);
$app->get('/ged-tipo-documento/{id}', \GedTipoDocumentoController::class . CONSULTAR_OBJETO);
$app->post('/ged-tipo-documento', \GedTipoDocumentoController::class . INSERIR);
$app->put('/ged-tipo-documento/{id}', \GedTipoDocumentoController::class . ALTERAR);
$app->delete('/ged-tipo-documento/{id}', \GedTipoDocumentoController::class . EXCLUIR);
$app->options('/ged-tipo-documento[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);


///////////////////////////////
// VIEWS
///////////////////////////////

// view-fin-lancamento-pagar
$app->get('/view-fin-lancamento-pagar[/]', \ViewFinLancamentoPagarController::class . CONSULTAR_LISTA);
$app->get('/view-fin-lancamento-pagar/{id}', \ViewFinLancamentoPagarController::class . CONSULTAR_OBJETO);
$app->post('/view-fin-lancamento-pagar', \ViewFinLancamentoPagarController::class . INSERIR);
$app->put('/view-fin-lancamento-pagar/{id}', \ViewFinLancamentoPagarController::class . ALTERAR);
$app->delete('/view-fin-lancamento-pagar/{id}', \ViewFinLancamentoPagarController::class . EXCLUIR);
$app->options('/view-fin-lancamento-pagar[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// view-fin-lancamento-receber
$app->get('/view-fin-lancamento-receber[/]', \ViewFinLancamentoreceberController::class . CONSULTAR_LISTA);
$app->get('/view-fin-lancamento-receber/{id}', \ViewFinLancamentoreceberController::class . CONSULTAR_OBJETO);
$app->post('/view-fin-lancamento-receber', \ViewFinLancamentoreceberController::class . INSERIR);
$app->put('/view-fin-lancamento-receber/{id}', \ViewFinLancamentoreceberController::class . ALTERAR);
$app->delete('/view-fin-lancamento-receber/{id}', \ViewFinLancamentoreceberController::class . EXCLUIR);
$app->options('/view-fin-lancamento-receber[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// view-pessoa-cliente
$app->get('/view-pessoa-cliente[/]', \ViewPessoaClienteController::class . CONSULTAR_LISTA);
$app->get('/view-pessoa-cliente/{id}', \ViewPessoaClienteController::class . CONSULTAR_OBJETO);
$app->post('/view-pessoa-cliente', \ViewPessoaClienteController::class . INSERIR);
$app->put('/view-pessoa-cliente/{id}', \ViewPessoaClienteController::class . ALTERAR);
$app->delete('/view-pessoa-cliente/{id}', \ViewPessoaClienteController::class . EXCLUIR);
$app->options('/view-pessoa-cliente[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// view-pessoa-colaborador
$app->get('/view-pessoa-colaborador[/]', \ViewPessoaColaboradorController::class . CONSULTAR_LISTA);
$app->get('/view-pessoa-colaborador/{id}', \ViewPessoaColaboradorController::class . CONSULTAR_OBJETO);
$app->post('/view-pessoa-colaborador', \ViewPessoaColaboradorController::class . INSERIR);
$app->put('/view-pessoa-colaborador/{id}', \ViewPessoaColaboradorController::class . ALTERAR);
$app->delete('/view-pessoa-colaborador/{id}', \ViewPessoaColaboradorController::class . EXCLUIR);
$app->options('/view-pessoa-colaborador[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// view-pessoa-fornecedor
$app->get('/view-pessoa-fornecedor[/]', \ViewPessoaFornecedorController::class . CONSULTAR_LISTA);
$app->get('/view-pessoa-fornecedor/{id}', \ViewPessoaFornecedorController::class . CONSULTAR_OBJETO);
$app->post('/view-pessoa-fornecedor', \ViewPessoaFornecedorController::class . INSERIR);
$app->put('/view-pessoa-fornecedor/{id}', \ViewPessoaFornecedorController::class . ALTERAR);
$app->delete('/view-pessoa-fornecedor/{id}', \ViewPessoaFornecedorController::class . EXCLUIR);
$app->options('/view-pessoa-fornecedor[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);

// view-fin-movimento-caixa-banco
$app->get('/view-fin-movimento-caixa-banco[/]', \ViewFinMovimentoCaixaBancoController::class . ':consultarLista');
$app->get('/view-fin-movimento-caixa-banco/{id}', \ViewFinMovimentoCaixaBancoController::class . ':consultarObjeto');
$app->post('/view-fin-movimento-caixa-banco', \ViewFinMovimentoCaixaBancoController::class . ':inserir');
$app->put('/view-fin-movimento-caixa-banco/{id}', \ViewFinMovimentoCaixaBancoController::class . ':alterar');
$app->delete('/view-fin-movimento-caixa-banco/{id}', \ViewFinMovimentoCaixaBancoController::class . ':excluir');
$app->options('/view-fin-movimento-caixa-banco[/{id}]', \ControllerBase::class . ':browserOptionsRetornarResponse');

// view-fin-cheque-nao-compensado
$app->get('/view-fin-cheque-nao-compensado[/]', \ViewFinChequeNaoCompensadoController::class . ':consultarLista');
$app->get('/view-fin-cheque-nao-compensado/{id}', \ViewFinChequeNaoCompensadoController::class . ':consultarObjeto');
$app->post('/view-fin-cheque-nao-compensado', \ViewFinChequeNaoCompensadoController::class . ':inserir');
$app->put('/view-fin-cheque-nao-compensado/{id}', \ViewFinChequeNaoCompensadoController::class . ':alterar');
$app->delete('/view-fin-cheque-nao-compensado/{id}', \ViewFinChequeNaoCompensadoController::class . ':excluir');
$app->options('/view-fin-cheque-nao-compensado[/{id}]', \ControllerBase::class . ':browserOptionsRetornarResponse');

// view-fin-fluxo-caixa
$app->get('/view-fin-fluxo-caixa[/]', \ViewFinFluxoCaixaController::class . ':consultarLista');
$app->get('/view-fin-fluxo-caixa/{id}', \ViewFinFluxoCaixaController::class . ':consultarObjeto');
$app->post('/view-fin-fluxo-caixa', \ViewFinFluxoCaixaController::class . ':inserir');
$app->put('/view-fin-fluxo-caixa/{id}', \ViewFinFluxoCaixaController::class . ':alterar');
$app->delete('/view-fin-fluxo-caixa/{id}', \ViewFinFluxoCaixaController::class . ':excluir');
$app->options('/view-fin-fluxo-caixa[/{id}]', \ControllerBase::class . ':browserOptionsRetornarResponse');

///////////////////////////////
// INVENTARIO
///////////////////////////////

// inventario-contagem-cab
$app->get('/inventario-contagem-cab[/]', \InventarioContagemCabController::class . CONSULTAR_LISTA);
$app->get('/inventario-contagem-cab/{id}', \InventarioContagemCabController::class . CONSULTAR_OBJETO);
$app->post('/inventario-contagem-cab', \InventarioContagemCabController::class . INSERIR);
$app->put('/inventario-contagem-cab/{id}', \InventarioContagemCabController::class . ALTERAR);
$app->delete('/inventario-contagem-cab/{id}', \InventarioContagemCabController::class . EXCLUIR);
$app->options('/inventario-contagem-cab[/{id}]', \ControllerBase::class . BROWSER_OPTION_RETORNAR_RESPONSE);
