import 'dart:async';

import 'package:dokan_app/core/config/getit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// this function is responsible for bootstrap all utills that needs to initialize
/// before app main ui start.
Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  // inject dependencies
  configureDependencies();

  runApp(await builder());
}
