import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class CryptoCurrencyApp extends StatelessWidget {
  CryptoCurrencyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final platformBrightness = MediaQuery.of(context).platformBrightness;
    final isDark = platformBrightness == Brightness.dark;

    return MaterialApp.router(
        title: 'Crypto Currency App', routerConfig: _appRouter.config());
  }
}
