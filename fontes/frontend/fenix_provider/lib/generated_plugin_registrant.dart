//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: depend_on_referenced_packages

import 'package:catcher/catcher_web_plugin.dart';
import 'package:device_info_plus_web/device_info_plus_web.dart';
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:package_info_plus_web/package_info_plus_web.dart';
import 'package:printing/printing_web.dart';
import 'package:sentry_flutter/sentry_flutter_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  CatcherWebPlugin.registerWith(registrar);
  DeviceInfoPlusPlugin.registerWith(registrar);
  FluttertoastWebPlugin.registerWith(registrar);
  PackageInfoPlugin.registerWith(registrar);
  PrintingPlugin.registerWith(registrar);
  SentryFlutterWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
