import 'dart:ffi' hide Size;
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:pegasus_pdv/src/database/database.dart';
// ignore: depend_on_referenced_packages
import 'package:sqlite3/open.dart';
import 'package:pegasus_pdv/src/view/shared/page/splash_screen_page.dart';
import 'package:pegasus_pdv/src/view/page/page.dart';

// adicionado para corrigir o problema de navegação da paginatedDataTable na Horizontal
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
  if (Platform.isWindows) {
    open.overrideFor(OperatingSystem.windows, _openOnWindows);
  }
  runApp(const MyApp());
}

DynamicLibrary _openOnWindows() {
  try {
    // final scriptDir = File(Platform.script.toFilePath()).parent;
    // final libraryNextToScript = File('${scriptDir.path}/sqlite3.dll');
    final libraryNextToScript = File('sqlite3.dll');
    return DynamicLibrary.open(libraryNextToScript.path);    
  } catch (e) {
    debugPrint(e.toString());
    throw 'Erro: ${DateTime.now().toIso8601String()} - Exceção: $e';
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider<AppDatabase>(
      create: (context) => AppDatabase(),
      dispose: (context, db) => db.close(),
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
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('pt', 'BR'),
    ],
    debugShowCheckedModeBanner: false,
    title: Constantes.nomeApp,
    onGenerateRoute: Rotas.definirRotas,
    theme: ThemeData(
      useMaterial3: false,
      primarySwatch: Colors.blue
    ), 
    home: splash == true ? const SplashScreenPage() : const CaixaPage(),
  );
}