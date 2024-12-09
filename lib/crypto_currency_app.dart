import 'package:crypto_currency/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class CryptoCurrencyApp extends StatelessWidget {
  CryptoCurrencyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // final platformBrightness = MediaQuery.of(context).platformBrightness;
    // final isDark = platformBrightness == Brightness.dark;

    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Crypto Currency App',
      routerConfig: _appRouter.config(navigatorObservers: () {
        return [TalkerRouteObserver(GetIt.I.get<Talker>())];
      }),
      theme: lightTheme,
    );
  }
}
