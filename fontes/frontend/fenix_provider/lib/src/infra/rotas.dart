/*
Title: T2Ti ERP 3.0                                                                
Description: Define as rotas da aplicação
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
*******************************************************************************/
import 'package:flutter/material.dart';

import 'package:fenix/src/view/menu/home_page.dart';
// import 'package:fenix/src/view/login/login_page.dart';
import 'package:fenix/src/view/menu/menu_cadastros.dart';
import 'package:fenix/src/view/menu/menu_financeiro.dart';
import 'package:fenix/src/view/menu/menu_tributacao.dart';
import 'package:fenix/src/view/menu/menu_estoque.dart';
import 'package:fenix/src/view/menu/menu_vendas.dart';
import 'package:fenix/src/view/menu/menu_compras.dart';
import 'package:fenix/src/view/menu/menu_comissoes.dart';
import 'package:fenix/src/view/menu/menu_os.dart';
import 'package:fenix/src/view/menu/menu_afv.dart';
import 'package:fenix/src/view/menu/menu_nfse.dart';
import 'package:fenix/src/view/menu/menu_nfe.dart';
import 'package:fenix/src/view/menu/menu_ged.dart';
import 'package:fenix/src/view/menu/menu_cte.dart';
import 'package:fenix/src/view/menu/menu_inventario.dart';

// import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view/page/page.dart';

class Rotas {
  static Route<dynamic> definirRotas(RouteSettings settings) {
    switch (settings.name) {
      
      // Login
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());//LoginPage());

      // Home
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());

      // Menus
      case '/cadastrosMenu':
        return MaterialPageRoute(builder: (_) => const MenuCadastros());
      case '/financeiroMenu':
        return MaterialPageRoute(builder: (_) => const MenuFinanceiro());
      case '/tributacaoMenu':
        return MaterialPageRoute(builder: (_) => const MenuTributacao());
      case '/estoqueMenu':
        return MaterialPageRoute(builder: (_) => const MenuEstoque());
      case '/vendasMenu':
        return MaterialPageRoute(builder: (_) => const MenuVendas());
      case '/comprasMenu':
        return MaterialPageRoute(builder: (_) => const MenuCompras());
      case '/comissoesMenu':
        return MaterialPageRoute(builder: (_) => const MenuComissoes());
      case '/ordemServicoMenu':
        return MaterialPageRoute(builder: (_) => const MenuOrdemServico());
      case '/afvMenu':
        return MaterialPageRoute(builder: (_) => const MenuAFV());
      case '/nfseMenu':
        return MaterialPageRoute(builder: (_) => const MenuNFSe());
      case '/nfeMenu':
        return MaterialPageRoute(builder: (_) => const MenuNFe());
      case '/gedMenu':
        return MaterialPageRoute(builder: (_) => const MenuGed());
      case '/cteMenu':
        return MaterialPageRoute(builder: (_) => const MenuCTe());
      case '/inventarioMenu':
        return MaterialPageRoute(builder: (_) => const MenuInventario());
		
      ////////////////////////////////////////////////////////// 
      /// CADASTROS
      //////////////////////////////////////////////////////////

      // Banco
      case '/bancoLista':
        return MaterialPageRoute(builder: (_) => const BancoListaPage());

      // BancoAgencia
      case '/bancoAgenciaLista':
        return MaterialPageRoute(builder: (_) => const BancoAgenciaListaPage());

      // Pessoa
      case '/pessoaLista':
        return MaterialPageRoute(builder: (_) => const PessoaListaPage());

      // Produto
      case '/produtoLista':
        return MaterialPageRoute(builder: (_) => const ProdutoListaPage());

			// BancoContaCaixa
			case '/bancoContaCaixaLista':
			  return MaterialPageRoute(builder: (_) => const BancoContaCaixaListaPage());

			// Cargo
			case '/cargoLista':
			  return MaterialPageRoute(builder: (_) => const CargoListaPage());

			// Cep
			case '/cepLista':
			  return MaterialPageRoute(builder: (_) => const CepListaPage());

			// Cfop
			case '/cfopLista':
			  return MaterialPageRoute(builder: (_) => const CfopListaPage());
			
			// Cnae
			case '/cnaeLista':
			  return MaterialPageRoute(builder: (_) => const CnaeListaPage());

			// Setor
			case '/setorLista':
			  return MaterialPageRoute(builder: (_) => const SetorListaPage());
			  			
			// Csosn
			case '/csosnLista':
			  return MaterialPageRoute(builder: (_) => const CsosnListaPage());
			
			// CstCofins
			case '/cstCofinsLista':
			  return MaterialPageRoute(builder: (_) => const CstCofinsListaPage());
			
			// CstIcms
			case '/cstIcmsLista':
			  return MaterialPageRoute(builder: (_) => const CstIcmsListaPage());
			
			// CstIpi
			case '/cstIpiLista':
			  return MaterialPageRoute(builder: (_) => const CstIpiListaPage());
			
			// CstPis
			case '/cstPisLista':
			  return MaterialPageRoute(builder: (_) => const CstPisListaPage());

			// EstadoCivil
			case '/estadoCivilLista':
			  return MaterialPageRoute(builder: (_) => const EstadoCivilListaPage());
						
			// Municipio
			case '/municipioLista':
			  return MaterialPageRoute(builder: (_) => const MunicipioListaPage());
			
			// Ncm
			case '/ncmLista':
			  return MaterialPageRoute(builder: (_) => const NcmListaPage());
			
			// NivelFormacao
			case '/nivelFormacaoLista':
			  return MaterialPageRoute(builder: (_) => const NivelFormacaoListaPage());
			// case '/nivelFormacaoPersiste':
			//   return MaterialPageRoute(builder: (_) => const NivelFormacaoPersistePage());
									
			// Uf
			case '/ufLista':
			  return MaterialPageRoute(builder: (_) => const UfListaPage());
			// case '/ufPersiste':
			//   return MaterialPageRoute(builder: (_) => const UfPersistePage());
						
			// ProdutoGrupo
			case '/produtoGrupoLista':
			  return MaterialPageRoute(builder: (_) => const ProdutoGrupoListaPage());
			// case '/produtoGrupoPersiste':
			//   return MaterialPageRoute(builder: (_) => const ProdutoGrupoPersistePage());
			
			// ProdutoMarca
			case '/produtoMarcaLista':
			  return MaterialPageRoute(builder: (_) => const ProdutoMarcaListaPage());
			// case '/produtoMarcaPersiste':
			//   return MaterialPageRoute(builder: (_) => const ProdutoMarcaPersistePage());
			
			// ProdutoSubgrupo
			case '/produtoSubgrupoLista':
			  return MaterialPageRoute(builder: (_) => const ProdutoSubgrupoListaPage());
			// case '/produtoSubgrupoPersiste':
			//   return MaterialPageRoute(builder: (_) => const ProdutoSubgrupoPersistePage());
			
			// ProdutoUnidade
			case '/produtoUnidadeLista':
			  return MaterialPageRoute(builder: (_) => const ProdutoUnidadeListaPage());
			// case '/produtoUnidadePersiste':
			//   return MaterialPageRoute(builder: (_) => const ProdutoUnidadePersistePage());


      ////////////////////////////////////////////////////////// 
      /// BLOCO FINANCEIRO
      //////////////////////////////////////////////////////////

			// FinChequeEmitido
			case '/finChequeEmitidoLista':
			  return MaterialPageRoute(builder: (_) => const FinChequeEmitidoListaPage());
			// case '/finChequeEmitidoPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinChequeEmitidoPersistePage());
			
			// FinChequeRecebido
			case '/finChequeRecebidoLista':
			  return MaterialPageRoute(builder: (_) => const FinChequeRecebidoListaPage());
			// case '/finChequeRecebidoPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinChequeRecebidoPersistePage());
			
			// FinConfiguracaoBoleto
			case '/finConfiguracaoBoletoLista':
			  return MaterialPageRoute(builder: (_) => const FinConfiguracaoBoletoListaPage());
			// case '/finConfiguracaoBoletoPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinConfiguracaoBoletoPersistePage());
			
			// FinDocumentoOrigem
			case '/finDocumentoOrigemLista':
			  return MaterialPageRoute(builder: (_) => const FinDocumentoOrigemListaPage());
			// case '/finDocumentoOrigemPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinDocumentoOrigemPersistePage());
			
			// FinExtratoContaBanco
			case '/finExtratoContaBancoLista':
			  return MaterialPageRoute(builder: (_) => const FinExtratoContaBancoListaPage());
			// case '/finExtratoContaBancoPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinExtratoContaBancoPersistePage());
			
			// FinFechamentoCaixaBanco
			case '/finFechamentoCaixaBancoLista':
			  return MaterialPageRoute(builder: (_) => const FinFechamentoCaixaBancoListaPage());
			// case '/finFechamentoCaixaBancoPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinFechamentoCaixaBancoPersistePage());
			
			// FinLancamentoPagar
			case '/finLancamentoPagarLista':
			  return MaterialPageRoute(builder: (_) => const FinLancamentoPagarListaPage());
			// case '/finLancamentoPagarPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinLancamentoPagarPersistePage());
			
			// FinLancamentoReceber
			case '/finLancamentoReceberLista':
			  return MaterialPageRoute(builder: (_) => const FinLancamentoReceberListaPage());
			// case '/finLancamentoReceberPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinLancamentoReceberPersistePage());
			
			// FinNaturezaFinanceira
			case '/finNaturezaFinanceiraLista':
			  return MaterialPageRoute(builder: (_) => const FinNaturezaFinanceiraListaPage());
			// case '/finNaturezaFinanceiraPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinNaturezaFinanceiraPersistePage());

			// FinStatusParcela
			case '/finStatusParcelaLista':
			  return MaterialPageRoute(builder: (_) => const FinStatusParcelaListaPage());
			// case '/finStatusParcelaPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinStatusParcelaPersistePage());
			
			// FinTipoPagamento
			case '/finTipoPagamentoLista':
			  return MaterialPageRoute(builder: (_) => const FinTipoPagamentoListaPage());
			// case '/finTipoPagamentoPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinTipoPagamentoPersistePage());
			
			// FinTipoRecebimento
			case '/finTipoRecebimentoLista':
			  return MaterialPageRoute(builder: (_) => const FinTipoRecebimentoListaPage());
			// case '/finTipoRecebimentoPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinTipoRecebimentoPersistePage());

			// TalonarioCheque
			case '/talonarioChequeLista':
			  return MaterialPageRoute(builder: (_) => const TalonarioChequeListaPage());
			// case '/talonarioChequePersiste':
			//   return MaterialPageRoute(builder: (_) => const TalonarioChequePersistePage());
			  
			// FinParcelaPagamento
			case '/finParcelaPagamentoLista':
			  return MaterialPageRoute(builder: (_) => const ViewFinLancamentoPagarListaPage());
			// case '/finParcelaPagarPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinParcelaPagarPersistePage());

			// FinParcelaRecebimento
			case '/finParcelaRecebimentoLista':
			  return MaterialPageRoute(builder: (_) => const ViewFinLancamentoReceberListaPage());
			// case '/finParcelaReceberPersiste':
			//   return MaterialPageRoute(builder: (_) => const FinParcelaReceberPersistePage());
			  
			// ViewFinMovimentoCaixaBanco
			case '/viewFinMovimentoCaixaBancoLista':
			  return MaterialPageRoute(builder: (_) => const ViewFinMovimentoCaixaBancoListaPage());

			// Resumo Tesouraria
			case '/resumoTesouraria':
			  return MaterialPageRoute(builder: (_) => const ResumoTesourariaGeralPage());

			// Fluxo de Caixa
			case '/fluxoCaixa':
			  return MaterialPageRoute(builder: (_) => const FluxoCaixaGeralPage());

			// Conciliação Bancária
			case '/conciliacaoBancaria':
			  return MaterialPageRoute(builder: (_) => const ConciliacaoBancariaGeralPage());
			

      ////////////////////////////////////////////////////////// 
      /// TRIBUTAÇÃO
      //////////////////////////////////////////////////////////

			// TributConfiguraOfGt
			case '/tributConfiguraOfGtLista':
			  return MaterialPageRoute(builder: (_) => const TributConfiguraOfGtListaPage());
			// case '/tributConfiguraOfGtPersiste':
			//   return MaterialPageRoute(builder: (_) => const TributConfiguraOfGtPersistePage());
			
			// TributGrupoTributario
			case '/tributGrupoTributarioLista':
			  return MaterialPageRoute(builder: (_) => const TributGrupoTributarioListaPage());
			// case '/tributGrupoTributarioPersiste':
			//   return MaterialPageRoute(builder: (_) => const TributGrupoTributarioPersistePage());
			
			// TributIcmsCustomCab
			case '/tributIcmsCustomCabLista':
			  return MaterialPageRoute(builder: (_) => const TributIcmsCustomCabListaPage());
			// case '/tributIcmsCustomCabPersiste':
			//   return MaterialPageRoute(builder: (_) => const TributIcmsCustomCabPersistePage());
												
			// TributIss
			case '/tributIssLista':
			  return MaterialPageRoute(builder: (_) => const TributIssListaPage());
			// case '/tributIssPersiste':
			//   return MaterialPageRoute(builder: (_) => const TributIssPersistePage());
			
			// TributOperacaoFiscal
			case '/tributOperacaoFiscalLista':
			  return MaterialPageRoute(builder: (_) => const TributOperacaoFiscalListaPage());
			// case '/tributOperacaoFiscalPersiste':
			//   return MaterialPageRoute(builder: (_) => const TributOperacaoFiscalPersistePage());
			

      ////////////////////////////////////////////////////////// 
      /// CONTROLE DE ESTOQUE
      //////////////////////////////////////////////////////////

			// EstoqueReajusteCabecalho
			case '/estoqueReajusteCabecalhoLista':
			  return MaterialPageRoute(builder: (_) => const EstoqueReajusteCabecalhoListaPage());
			// case '/estoqueReajusteCabecalhoPersiste':
			//   return MaterialPageRoute(builder: (_) => const EstoqueReajusteCabecalhoPersistePage());

			// RequisicaoInternaCabecalho
			case '/requisicaoInternaCabecalhoLista':
			  return MaterialPageRoute(builder: (_) => const RequisicaoInternaCabecalhoListaPage());
			// case '/requisicaoInternaCabecalhoPersiste':
			//   return MaterialPageRoute(builder: (_) => const RequisicaoInternaCabecalhoPersistePage());

			// Entrada de Nota
			case '/estoqueNfeCabecalhoLista':
			  return MaterialPageRoute(builder: (_) => const EstoqueNfeCabecalhoListaPage());

			// Formação de Preço
			// case '/estoqueFormacaoPreco':
			//   return MaterialPageRoute(builder: (_) => const EstoqueFormacaoCabecalhoPage());

      ////////////////////////////////////////////////////////// 
      /// VENDAS
      //////////////////////////////////////////////////////////

			// NotaFiscalModelo
			case '/notaFiscalModeloLista':
			  return MaterialPageRoute(builder: (_) => const NotaFiscalModeloListaPage());
			// case '/notaFiscalModeloPersiste':
			//   return MaterialPageRoute(builder: (_) => const NotaFiscalModeloPersistePage());
			
			// NotaFiscalTipo
			case '/notaFiscalTipoLista':
			  return MaterialPageRoute(builder: (_) => const NotaFiscalTipoListaPage());
			// case '/notaFiscalTipoPersiste':
			//   return MaterialPageRoute(builder: (_) => const NotaFiscalTipoPersistePage());

			// VendaCabecalho
			case '/vendaCabecalhoLista':
			  return MaterialPageRoute(builder: (_) => const VendaCabecalhoListaPage());
			// case '/vendaCabecalhoPersiste':
			//   return MaterialPageRoute(builder: (_) => const VendaCabecalhoPersistePage());
			
			// VendaCondicoesPagamento
			case '/vendaCondicoesPagamentoLista':
			  return MaterialPageRoute(builder: (_) => const VendaCondicoesPagamentoListaPage());
			// case '/vendaCondicoesPagamentoPersiste':
			//   return MaterialPageRoute(builder: (_) => const VendaCondicoesPagamentoPersistePage());
									
			// VendaRomaneio
			// case '/vendaRomaneio':
			  // return MaterialPageRoute(builder: (_) => const VendaRomaneioListaPage());
			// case '/vendaFretePersiste':
			//   return MaterialPageRoute(builder: (_) => const VendaFretePersistePage());
			
			// VendaOrcamentoCabecalho
			case '/vendaOrcamentoCabecalhoLista':
			  return MaterialPageRoute(builder: (_) => const VendaOrcamentoCabecalhoListaPage());
			// case '/vendaOrcamentoCabecalhoPersiste':
			//   return MaterialPageRoute(builder: (_) => const VendaOrcamentoCabecalhoPersistePage());

			  
      ////////////////////////////////////////////////////////// 
      /// COMPRAS
      //////////////////////////////////////////////////////////

			// CompraCotacao
			case '/compraCotacaoLista':
			  return MaterialPageRoute(builder: (_) => const CompraCotacaoListaPage());
			// case '/compraCotacaoPersiste':
			//   return MaterialPageRoute(builder: (_) => const CompraCotacaoPersistePage());
			
			// CompraPedido
			case '/compraPedidoLista':
			  return MaterialPageRoute(builder: (_) => const CompraPedidoListaPage());
			// case '/compraPedidoPersiste':
			//   return MaterialPageRoute(builder: (_) => const CompraPedidoPersistePage());
			
			// CompraRequisicao
			case '/compraRequisicaoLista':
			  return MaterialPageRoute(builder: (_) => const CompraRequisicaoListaPage());
			// case '/compraRequisicaoPersiste':
			//   return MaterialPageRoute(builder: (_) => const CompraRequisicaoPersistePage());
			
			// CompraTipoPedido
			case '/compraTipoPedidoLista':
			  return MaterialPageRoute(builder: (_) => const CompraTipoPedidoListaPage());
			// case '/compraTipoPedidoPersiste':
			//   return MaterialPageRoute(builder: (_) => const CompraTipoPedidoPersistePage());
			
			// CompraTipoRequisicao
			case '/compraTipoRequisicaoLista':
			  return MaterialPageRoute(builder: (_) => const CompraTipoRequisicaoListaPage());
			// case '/compraTipoRequisicaoPersiste':
			//   return MaterialPageRoute(builder: (_) => const CompraTipoRequisicaoPersistePage());


      ////////////////////////////////////////////////////////// 
      /// COMISSÕES
      //////////////////////////////////////////////////////////

			// ComissaoObjetivo
			case '/comissaoObjetivoLista':
			  return MaterialPageRoute(builder: (_) => const ComissaoObjetivoListaPage());
			// case '/comissaoObjetivoPersiste':
			//   return MaterialPageRoute(builder: (_) => const ComissaoObjetivoPersistePage());
			
			// ComissaoPerfil
			case '/comissaoPerfilLista':
			  return MaterialPageRoute(builder: (_) => const ComissaoPerfilListaPage());
			// case '/comissaoPerfilPersiste':
			//   return MaterialPageRoute(builder: (_) => const ComissaoPerfilPersistePage());


      ////////////////////////////////////////////////////////// 
      /// ORDEM DE SERVIÇO
      //////////////////////////////////////////////////////////

			// OsAbertura
			case '/osAberturaLista':
			  return MaterialPageRoute(builder: (_) => const OsAberturaListaPage());
			// case '/osAberturaPersiste':
			//   return MaterialPageRoute(builder: (_) => const OsAberturaPersistePage());
						
			// OsEquipamento
			case '/osEquipamentoLista':
			  return MaterialPageRoute(builder: (_) => const OsEquipamentoListaPage());
			// case '/osEquipamentoPersiste':
			//   return MaterialPageRoute(builder: (_) => const OsEquipamentoPersistePage());
						
			// OsStatus
			case '/osStatusLista':
			  return MaterialPageRoute(builder: (_) => const OsStatusListaPage());
			// case '/osStatusPersiste':
			//   return MaterialPageRoute(builder: (_) => const OsStatusPersistePage());

      ////////////////////////////////////////////////////////// 
      /// AFV
      //////////////////////////////////////////////////////////

      //Visão Vendedor
			case '/visaoVendedor':
			  return MaterialPageRoute(builder: (_) => const ViewPessoaClientePage());

			// TabelaPreco
			case '/tabelaPrecoLista':
			  return MaterialPageRoute(builder: (_) => const TabelaPrecoListaPage());
			// case '/tabelaPrecoPersiste':
			//   return MaterialPageRoute(builder: (_) => const TabelaPrecoPersistePage());

			// VendedorMeta
			case '/vendedorMetaLista':
			  return MaterialPageRoute(builder: (_) => const VendedorMetaListaPage());
			// case '/vendedorMetaPersiste':
			//   return MaterialPageRoute(builder: (_) => const VendedorMetaPersistePage());
			
			// VendedorRota
			case '/vendedorRotaLista':
			  return MaterialPageRoute(builder: (_) => const VendedorRotaListaPage());
			// case '/vendedorRotaPersiste':
			//   return MaterialPageRoute(builder: (_) => const VendedorRotaPersistePage());

      ////////////////////////////////////////////////////////// 
      /// NFS-e
      //////////////////////////////////////////////////////////
			// NfseCabecalho
			case '/nfseCabecalhoLista':
			  return MaterialPageRoute(builder: (_) => const NfseCabecalhoListaPage());
			// case '/nfseCabecalhoPersiste':
			//   return MaterialPageRoute(builder: (_) => const NfseCabecalhoPersistePage());
						
			// NfseListaServico
			case '/nfseListaServicoLista':
			  return MaterialPageRoute(builder: (_) => const NfseListaServicoListaPage());
			// case '/nfseListaServicoPersiste':
			//   return MaterialPageRoute(builder: (_) => const NfseListaServicoPersistePage());


      ////////////////////////////////////////////////////////// 
      /// NF-e
      //////////////////////////////////////////////////////////
			// NfeCabecalho
			case '/nfeCabecalhoLista':
			  return MaterialPageRoute(builder: (_) => const NfeCabecalhoListaPage());
			// case '/nfeCabecalhoPersiste':
			//   return MaterialPageRoute(builder: (_) => const NfeCabecalhoPersistePage());


      ////////////////////////////////////////////////////////// 
      /// GED
      //////////////////////////////////////////////////////////
			// GedCabecalho
			case '/gedDocumentoCabecalhoLista':
			  return MaterialPageRoute(builder: (_) => const GedDocumentoCabecalhoListaPage());
			// case '/gedDocumentoCabecalhoPersiste':
			//   return MaterialPageRoute(builder: (_) => const GedDocumentoCabecalhoPersistePage());
			// GedTipoDocumento
			case '/gedTipoDocumentoLista':
			  return MaterialPageRoute(builder: (_) => const GedTipoDocumentoListaPage());
			// case '/gedTipoDocumentoPersiste':
			//   return MaterialPageRoute(builder: (_) => const GedTipoDocumentoPersistePage());


      ////////////////////////////////////////////////////////// 
      /// CT-e
      //////////////////////////////////////////////////////////
			// CTeCabecalho
			case '/cteCabecalhoLista':
			  return MaterialPageRoute(builder: (_) => const CteCabecalhoListaPage());
			// case '/cteCabecalhoPersiste':
			//   return MaterialPageRoute(builder: (_) => const CteCabecalhoPersistePage());


      ////////////////////////////////////////////////////////// 
      /// INVENTARIO
      //////////////////////////////////////////////////////////

			// InventarioContagemCabListaPage
			case '/inventarioContagemCabLista':
			  return MaterialPageRoute(builder: (_) => const InventarioContagemCabListaPage());


      // Será Implementado
      case '/seraImplementado':
        return MaterialPageRoute(builder: (_) => const SeraImplementadoPage());


		
      // default
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
              body: Center(
            child: Text('Nenhuma rota definida para {$settings.name}'),
          )),
        );
    }
  }
}
