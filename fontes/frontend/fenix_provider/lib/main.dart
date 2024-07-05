import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:catcher/catcher.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:fenix/src/infra/locator.dart';
import 'package:fenix/src/infra/infra.dart';
import 'package:fenix/src/view_model/view_model.dart';
import 'package:fenix/src/view/menu/home_page.dart';
import 'package:fenix/src/view/shared/page/splash_screen_page.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

void main() async {
  await dotenv.load(fileName: ".env");
  setupLocator();

  // runApp(MyApp()); // 2021-06-04 - EIJE - Comentado para dar lugar à configuração do Catcher como feito no Pegasus PDV

  ///configuração para tratar erros em modo de debug (desenvolvimento)
  CatcherOptions debugOptions = CatcherOptions(
    ///Vai mostrar o erro numa caixa de diálogo
    PageReportMode(),
    [
      //Manda os erros para o Sentry
      SentryHandler(
        SentryClient(SentryOptions(dsn: Constantes.sentryDns)),
      ),

      ///Imprime os erros no Console
      ConsoleHandler()
    ],
    localizationOptions: [
      LocalizationOptions.buildDefaultPortugueseOptions(),
    ],
  );

  ///configuração para tratar erros em modo de release (produção)
  CatcherOptions releaseOptions = CatcherOptions(
    ///Vai mostrar o erro numa página
    PageReportMode(),
    [
      //Manda os erros para o Sentry
      SentryHandler(
        SentryClient(SentryOptions(dsn: Constantes.sentryDns)),
      ),

      ///Imprime os erros no Console
      ConsoleHandler(),
    ],
    localizationOptions: [
      LocalizationOptions.buildDefaultPortugueseOptions(),
    ],
  );

  ///Inicia o Catcher e então inicia a aplicação. 
  ///O Catcher vai pegar e reportar os erros de forma global
  Catcher(
    runAppFunction: () {
      runApp(const MyApp());
    },
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
  );  

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // cadastros
        ChangeNotifierProvider(create: (_) => locator<BancoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<BancoAgenciaViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<PessoaViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<ProdutoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<BancoContaCaixaViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<CargoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<CepViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<CfopViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<ClienteViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<CnaeViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<ColaboradorViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<SetorViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<ContadorViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<CsosnViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<CstCofinsViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<CstIcmsViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<CstIpiViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<CstPisViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<EstadoCivilViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<FornecedorViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<MunicipioViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<NcmViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<NivelFormacaoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<TransportadoraViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<UfViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<VendedorViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<ProdutoGrupoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<ProdutoMarcaViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<ProdutoSubgrupoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<ProdutoUnidadeViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<UsuarioViewModel>()),

        // financeiro
        ChangeNotifierProvider(create: (_) => locator<FinChequeEmitidoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<FinChequeRecebidoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<FinConfiguracaoBoletoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<FinDocumentoOrigemViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<FinExtratoContaBancoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<FinFechamentoCaixaBancoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<FinLancamentoPagarViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<FinLancamentoReceberViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<FinNaturezaFinanceiraViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<FinStatusParcelaViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<FinTipoPagamentoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<FinTipoRecebimentoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<TalonarioChequeViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<FinParcelaPagarViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<FinParcelaReceberViewModel>()),

        // tributação
				ChangeNotifierProvider(create: (_) => locator<TributConfiguraOfGtViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<TributGrupoTributarioViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<TributIcmsCustomCabViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<TributIssViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<TributOperacaoFiscalViewModel>()),

        // estoque
				ChangeNotifierProvider(create: (_) => locator<EstoqueReajusteCabecalhoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<RequisicaoInternaCabecalhoViewModel>()),

        // vendas
				ChangeNotifierProvider(create: (_) => locator<NotaFiscalModeloViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<NotaFiscalTipoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<VendaCabecalhoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<VendaCondicoesPagamentoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<VendaFreteViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<VendaOrcamentoCabecalhoViewModel>()),

		    // compras
				ChangeNotifierProvider(create: (_) => locator<CompraCotacaoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<CompraPedidoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<CompraRequisicaoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<CompraTipoPedidoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<CompraTipoRequisicaoViewModel>()),
		
        // comissões
				ChangeNotifierProvider(create: (_) => locator<ComissaoObjetivoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<ComissaoPerfilViewModel>()),
				
        // ordem de serviço
				ChangeNotifierProvider(create: (_) => locator<OsAberturaViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<OsEquipamentoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<OsStatusViewModel>()),

	    	// afv
				ChangeNotifierProvider(create: (_) => locator<ViewPessoaClienteViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<TabelaPrecoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<VendedorMetaViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<VendedorRotaViewModel>()),

			  //nfs-e
				ChangeNotifierProvider(create: (_) => locator<NfseCabecalhoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<NfseListaServicoViewModel>()),			
				
        // views
				ChangeNotifierProvider(create: (_) => locator<ViewFinLancamentoPagarViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<ViewFinLancamentoReceberViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<ViewFinMovimentoCaixaBancoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<ViewFinChequeNaoCompensadoViewModel>()),
				ChangeNotifierProvider(create: (_) => locator<ViewFinFluxoCaixaViewModel>()),

			  //nf-e
				ChangeNotifierProvider(create: (_) => locator<NfeCabecalhoViewModel>()),

			  //ged
				ChangeNotifierProvider(create: (_) => locator<GedDocumentoCabecalhoViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<GedTipoDocumentoViewModel>()),

			  //ct-e
				ChangeNotifierProvider(create: (_) => locator<CteCabecalhoViewModel>()),

			  //inventário
				ChangeNotifierProvider(create: (_) => locator<InventarioContagemCabViewModel>()),
	    ],
      builder: (context, value) {
        return FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3), () async {
            await Sessao.popularObjetosPrincipais(context);
            if (Biblioteca.isDesktop()) {
              await DesktopWindow.setMinWindowSize(const Size(800, 600));
              await DesktopWindow.resetMaxWindowSize();
              await DesktopWindow.toggleFullScreen();
            }
          }),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _materialApp(splash: true);
            } else {
              return _materialApp(splash: false);
            }
          },
        );
      }      
    );
  }
}

Widget _materialApp({bool? splash}) {
  return MaterialApp(
    scrollBehavior: MyCustomScrollBehavior(),
    navigatorKey: Catcher.navigatorKey,
    //********************************************
    // builder: (BuildContext context, Widget widget) {
    //   Catcher.addDefaultErrorWidget(
    //       showStacktrace: true,
    //       title: "Custom error title",
    //       description: "Custom error description",
    //       maxWidthForSmallMode: 15);
    //   return widget;
    // },
    //********************************************    
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('pt', 'PT'),
    ],
    debugShowCheckedModeBanner: false,
    title: Constantes.nomeApp,
    onGenerateRoute: Rotas.definirRotas,
    theme: ThemeData(),
    home: splash == true ? const SplashScreenPage() : HomePage(), // TODO: alterar para Login no momento oportuno 
  );
}